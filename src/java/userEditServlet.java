import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/userEditServlet")
public class userEditServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:derby://localhost:1527/userdb";
    private static final String DB_USER = "app";
    private static final String DB_PASSWORD = "app";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String incidentId = request.getParameter("incident-id");
        String newDescription = request.getParameter("update-description");

        if (incidentId == null || newDescription == null || incidentId.trim().isEmpty() || newDescription.trim().isEmpty()) {
            request.setAttribute("message", "Error: All fields are required!");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("userEditIncident.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String updateQuery = "UPDATE incidents SET description = ? WHERE incident_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(updateQuery)) {
                stmt.setString(1, newDescription);
                stmt.setInt(2, Integer.parseInt(incidentId));

                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    request.setAttribute("message", "Incident updated successfully!");
                    request.setAttribute("messageType", "success");
                } else {
                    request.setAttribute("message", "Error: No incident found with the given ID.");
                    request.setAttribute("messageType", "error");
                }
            }
        } catch (Exception e) {
            request.setAttribute("message", "Database error: " + e.getMessage());
            request.setAttribute("messageType", "error");
        }

        // Forward back to userEditIncident.jsp with a message
        request.getRequestDispatcher("userEditIncident.jsp").forward(request, response);
    }
}
