import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import com.system.model.IncidentItem;

@WebServlet("/deleteIncidentActionServlet")
public class deleteIncidentActionServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:derby://localhost:1527/userdb";
    private static final String DB_USER = "app";
    private static final String DB_PASSWORD = "app";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String incidentId = request.getParameter("incidentId");

        if (incidentId == null || incidentId.isEmpty()) {
            request.setAttribute("message", "Invalid Incident ID");
            loadIncidents(request, response);
            return;
        }

        try {
            // Load JDBC driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            
            // Establish connection
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            // SQL statement to delete only if status is 'solve'
            String query = "DELETE FROM incidents WHERE incident_id = ? AND status = 'solve'";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, Integer.parseInt(incidentId));

            int rowsDeleted = stmt.executeUpdate();
            stmt.close();
            conn.close();

            if (rowsDeleted > 0) {
                request.setAttribute("message", "Incident deleted successfully.");
            } else {
                request.setAttribute("message", "Incident not found or already removed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error deleting incident.");
        }

        // Reload the incidents list and forward to deleteIncident.jsp
        loadIncidents(request, response);
    }

    private void loadIncidents(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        ArrayList<IncidentItem> incidents = new ArrayList<>();

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String query = "SELECT incident_id, title, description FROM incidents WHERE status = 'solve'";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                IncidentItem incident = new IncidentItem(rs.getInt("incident_id"), rs.getString("title"), rs.getString("description"));
                incidents.add(incident);
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("incidents", incidents);
        RequestDispatcher dispatcher = request.getRequestDispatcher("deleteIncident.jsp");
        dispatcher.forward(request, response);
    }
}
