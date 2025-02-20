import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:derby://localhost:1527/userdb";
    private static final String DB_USER = "app";
    private static final String DB_PASSWORD = "app";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Check user login  
            User user = getUser(conn, username, password);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("username", user.username);
                session.setAttribute("userID", user.userID); 
                session.setAttribute("role", "user");
                response.sendRedirect("User.jsp");
                return;
            }

            // Check admin login
            user = getAdmin(conn, username, password);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("admin", user.username);
                session.setAttribute("userID", user.userID);
                session.setAttribute("role", "admin");
                response.sendRedirect("Admin.jsp");
                return;
            }

            response.getWriter().println("<p style='color:red;'>Invalid login. Try again.</p>");
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<p style='color:red;'>Database connection error: " + e.getMessage() + "</p>");
        }
    }

    // Helper method to fetch user credentials
    private User getUser(Connection conn, String username, String password) throws Exception {
        String sql = "SELECT userid, username FROM users WHERE username=? AND password=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();
        User user = rs.next() ? new User(rs.getInt("userid"), rs.getString("username")) : null;
        rs.close();
        pst.close();
        return user;
    }

    // Helper method to fetch admin credentials
    private User getAdmin(Connection conn, String username, String password) throws Exception {
        String sql = "SELECT adminid, \"USERNAME\" FROM admin WHERE \"USERNAME\"=? AND \"PASSWORD\"=?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();
        User user = rs.next() ? new User(rs.getInt("adminid"), rs.getString("USERNAME")) : null;
        rs.close();
        pst.close();
        return user;
    }

    // Helper class to store user details
    private static class User {
        int userID;
        String username;

        User(int userID, String username) {
            this.userID = userID;
            this.username = username;
        }
    }
}
