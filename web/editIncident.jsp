<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    // Ensure user is logged in
//    HttpSession userSession = request.getSession(false);
//    if (userSession == null || userSession.getAttribute("userId") == null) {
//        System.out.println("Redirect to login page...");
//        response.sendRedirect("login.html");
//        return;
//    }

    // Convert session attribute safely
//    int userId = Integer.parseInt(userSession.getAttribute("userId").toString());
    int userId = 1;

    // Database connection
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:1527/userdb", "app", "app");

        // Fetch only incidents created by the logged-in user
        String query = "SELECT incident_id, title, description FROM incidents WHERE user_id = ?";
        stmt = conn.prepareStatement(query);
        stmt.setInt(1, userId);
        rs = stmt.executeQuery();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Incident</title>
    <style>
        body {
            background: linear-gradient(135deg, #2b5876, #4e4376);
            font-family: 'Arial', sans-serif;
            color: white;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }
        header {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 15px 0;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }
        header h1 {
            font-size: 2rem;
            color: #ffd700;
            margin: 0;
            font-weight: bold;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex: 1;
        }
        .content {
            width: 80%;
            max-width: 1200px;
            background-color: white;
            color: #4a4a4a;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table th, table td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: left;
        }
        table th {
            background-color: #f4f4f4;
            color: #333;
        }
        table td {
            color: #555;
        }
        .edit-btn {
            padding: 8px 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
        }
        .edit-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <!-- Header Section -->
    <header>
        <h1>Edit Incident</h1>
    </header>

    <!-- Main Content Section -->
    <div class="container">
        <div class="content">
            <h2>Incident List</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
<%
                // Display incidents dynamically
                while (rs.next()) {
                    int incidentId = rs.getInt("incident_id");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
%>
                    <tr>
                        <td><%= incidentId %></td>
                        <td><%= title %></td>
                        <td><%= description %></td>
                        <td>
                            <a href="updateIncident.jsp?id=<%= incidentId %>&title=<%= title %>&description=<%= description %>" class="edit-btn">Edit</a>
                        </td>
                    </tr>
<%
                }
%>
                </t]body>
            </table>
        </div>
    </div>

</body>
</html>

<%
    } catch (Exception e) {
        e.printStackTrace();
%>
        <p style="color: red; text-align: center;">Error: <%= e.getMessage() %></p>
<%
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
