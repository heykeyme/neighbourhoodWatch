import com.system.model.IncidentItem;
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

@WebServlet("/adminDeleteIncidentServlet")
public class adminDeleteIncidentServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:derby://localhost:1527/userdb";
    private static final String DB_USER = "app";
    private static final String DB_PASSWORD = "app";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
