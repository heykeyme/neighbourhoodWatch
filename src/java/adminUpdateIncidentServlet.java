import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminUpdateIncidentServlet")
public class adminUpdateIncidentServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:derby://localhost:1527/userdb";
    private static final String DB_USER = "app";
    private static final String DB_PASSWORD = "app";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String incidentId = request.getParameter("incident-id");
        String status = request.getParameter("incident-status");

        if (incidentId == null || status == null || incidentId.isEmpty() || status.isEmpty()) {
            request.setAttribute("error", "Invalid input");
            request.getRequestDispatcher("adminUpdateIncident.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            String updateQuery = "UPDATE incidents SET status = ? WHERE incident_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(updateQuery)) {
                stmt.setString(1, status);
                stmt.setInt(2, Integer.parseInt(incidentId));
                int rowsUpdated = stmt.executeUpdate();
                if (rowsUpdated > 0) {
                    request.setAttribute("success", "Incident updated successfully");
                } else {
                    request.setAttribute("error", "Incident not found");
                }
                request.getRequestDispatcher("adminUpdateIncident.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error");
            request.getRequestDispatcher("adminUpdateIncident.jsp").forward(request, response);
        }
    }
}
