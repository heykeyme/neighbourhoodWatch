import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class registerUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database Connection Details
    private static final String DB_URL = "jdbc:derby://localhost:1527/userdb";
    private static final String DB_USER = "app";
    private static final String DB_PASSWORD = "app";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form parameters
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        // Default role
        String role = "user"; // Automatically assign "user" role

        // Validate passwords
        if (!password.equals(confirmPassword)) {
            request.setAttribute("message", "Passwords do not match!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Insert into database
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver"); // Use Derby JDBC driver
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "INSERT INTO users (username, email, phoneNumber, address, password, role) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, address);
            stmt.setString(5, password); // Ideally, hash password before storing
            stmt.setString(6, role); // Set role as "user"

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                request.setAttribute("message", "User registered successfully!");
            } else {
                request.setAttribute("message", "Error registering user!");
            }

            // Close resources
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Database Error: " + e.getMessage());
        }

        // Forward back to register.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("registerUser.jsp");
        dispatcher.forward(request, response);
    }
}
