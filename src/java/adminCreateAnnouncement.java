import java.io.IOException;
import java.io.StringReader;
import java.sql.*;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/adminCreateAnnouncement")
public class adminCreateAnnouncement extends HttpServlet {
    
    private static final String DB_URL = "jdbc:derby://localhost:1527/userdb";
    private static final String DB_USER = "app";
    private static final String DB_PASSWORD = "app";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Integer adminID = (session != null && "admin".equals(session.getAttribute("role"))) 
                            ? (Integer) session.getAttribute("userID") 
                            : null;

        if (adminID == null) {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        String title = request.getParameter("announcement-title");
        String content = request.getParameter("content-description");
        String urgency = request.getParameter("incident-severity");
        LocalDateTime announcementDate = LocalDateTime.now();

        // Convert urgency level to match database constraint ('Low', 'Medium', 'High')
        urgency = Character.toUpperCase(urgency.charAt(0)) + urgency.substring(1).toLowerCase();

        String sql = "INSERT INTO ANNOUNCEMENT (ADMINID, TITLE, CONTENT, ANNOUNCEMENT_DATE, URGENCY_LEVEL) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {

            // Check if admin ID exists
            PreparedStatement checkAdmin = conn.prepareStatement("SELECT COUNT(*) FROM ADMIN WHERE ADMINID = ?");
            checkAdmin.setInt(1, adminID);
            ResultSet rs = checkAdmin.executeQuery();
            if (rs.next() && rs.getInt(1) == 0) {
                request.setAttribute("message", "Error: Admin ID does not exist.");
                request.getRequestDispatcher("adminAnnouncement.jsp").forward(request, response);
                return;
            }
            rs.close();
            checkAdmin.close();

            // Insert announcement
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, adminID);
            stmt.setString(2, title);
            stmt.setCharacterStream(3, new StringReader(content), content.length()); // CLOB handling
            stmt.setTimestamp(4, Timestamp.valueOf(announcementDate));
            stmt.setString(5, urgency);

            int rowsInserted = stmt.executeUpdate();
            stmt.close();

            String message = (rowsInserted > 0) ? "Announcement posted successfully!" : "Failed to post announcement.";
            request.setAttribute("message", message);

        } catch (SQLException e) {
            request.setAttribute("message", "Database error: " + e.getMessage());
        }

        request.getRequestDispatcher("adminAnnouncement.jsp").forward(request, response);
    }
}
