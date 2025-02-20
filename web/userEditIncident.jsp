<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Incident</title>
    <style>
        body {
            background: linear-gradient(135deg, #4e73df, #1e3c72); 
            font-family: 'Arial', sans-serif;
            color: white;
            margin: 0;
            padding: 0;
        }

        header {
            text-align: center;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.6);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        header h1 {
            font-size: 2.5rem;
            margin: 0;
            color: #ffffff;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            color: #333;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        .container h2 {
            text-align: center;
            color: #1e3c72;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-size: 1rem;
            display: block;
            margin-bottom: 8px;
            color: #1e3c72;
        }

        .form-group input, .form-group textarea {
            width: 100%;
            padding: 12px;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-sizing: border-box;
        }

        .form-group textarea {
            resize: vertical;
            height: 120px;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        .btn-group button {
            background-color: #4e73df;
            color: white;
            padding: 12px 25px;
            font-size: 1rem;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-group button:hover {
            background-color: #2a55a3;
        }
    </style>
</head>
<body>

    <%
        // Retrieve incident details from URL parameters
        String incidentId = request.getParameter("id");
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        // Decode URL-encoded parameters (important for special characters)
        if (title != null) {
            title = URLDecoder.decode(title, "UTF-8");
        }
        if (description != null) {
            description = URLDecoder.decode(description, "UTF-8");
        }
    %>

    <header>
        <h1>Edit the Current Incident</h1>
        <p>Rewrite the issue</p>
    </header>

    <div class="container">
        <h2>Edit Incident Details</h2>
        <% String message = (String) request.getAttribute("message"); 
            String messageType = (String) request.getAttribute("messageType"); 
            if (message != null) { 
        %>
        
            <div style="padding: 10px; margin-bottom: 15px; text-align: center; 
                color: white; border-radius: 5px;
                background-color: 
        <%= "success".equals(messageType) ? "#28a745" : "#dc3545" %>;">
        <%= message %>
    </div>
<% } %>

        <form action="userEditServlet" method="post">
            
            <!-- Incident ID (Read-Only) -->
            <div class="form-group">
                <label for="incident-id">Incident ID</label>
                <input type="text" id="incident-id" name="incident-id" value="<%= incidentId %>" readonly>
            </div>

            <!-- Incident Title (Read-Only or Editable) -->
            <div class="form-group">
                <label for="incident-title">Title</label>
                <input type="text" id="incident-title" name="incident-title" value="<%= title %>" readonly>
            </div>

            <!-- Incident Description -->
            <div class="form-group">
                <label for="update-description">Update Description</label>
                <textarea id="update-description" name="update-description" required><%= description %></textarea>
            </div>

            <!-- Buttons for submission -->
            <div class="btn-group">
                <button type="submit" class="update-btn">Edit Incident</button>
            </div>

        </form>
    </div>

</body>
</html>
