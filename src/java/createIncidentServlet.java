import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.ResultSet;

@WebServlet("/createIncidentServlet")
public class createIncidentServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:derby://localhost:1527/userdb";
    private static final String DB_USER = "app";
    private static final String DB_PASSWORD = "app";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("incident-title");
        String description = request.getParameter("incident-description");
        String category = request.getParameter("incident-category");
        String severity = request.getParameter("incident-severity");

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userID");

        if (userId == null) {
            response.sendRedirect("login.html");
            return;
        }

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Insert incident with default admin_id = 2 and status = 'Unsolved'
            String sql = "INSERT INTO Incidents (user_id, title, description, category, severity, admin_id, status) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

            stmt.setInt(1, userId);
            stmt.setString(2, title);
            stmt.setString(3, description);
            stmt.setString(4, category);
            stmt.setString(5, severity);
            stmt.setInt(6, 2); // Assign admin_id = 2
            stmt.setString(7, "Unsolved"); // Default status = 'Unsolved'

            int rowsInserted = stmt.executeUpdate();
            ResultSet generatedKeys = stmt.getGeneratedKeys();

            int incidentID = -1;
            if (generatedKeys.next()) {
                incidentID = generatedKeys.getInt(1); // Get the generated incident ID
            }

            stmt.close();
            conn.close();

            if (rowsInserted > 0) {
                request.setAttribute("incidentID", incidentID);
                request.setAttribute("title", title);
                request.setAttribute("description", description);

                // Forward instead of redirecting to pass data
                request.getRequestDispatcher("incident_success.jsp").forward(request, response);
            } else {
                response.sendRedirect("incident_error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("incident_error.jsp");
        }
    }
}
