import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/announcementServlet")
public class announcementServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:derby://localhost:1527/userdb";
    private static final String DB_USER = "app";
    private static final String DB_PASSWORD = "app";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<AnnouncementItem> announcements = new ArrayList<>();

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "SELECT TITLE, CONTENT FROM ANNOUNCEMENT ORDER BY ANNOUNCEMENT_DATE DESC";

            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                String title = rs.getString("TITLE");
                String content = rs.getString("CONTENT");
                announcements.add(new AnnouncementItem(title, content));

                // Debugging output
                System.out.println("Fetched from DB - Title: " + title + ", Content: " + content);
            }

            rs.close();
            pst.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("Total Announcements Fetched: " + announcements.size()); // Debugging

        request.setAttribute("announcements", announcements);
        request.getRequestDispatcher("userAnnouncement.jsp").forward(request, response);
    }
}

