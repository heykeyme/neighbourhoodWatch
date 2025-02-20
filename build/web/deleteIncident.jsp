<%-- 
    Document   : deleteIncident
    Created on : Feb 17, 2025, 11:43:09 AM
    Author     : Heykeyme
--%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.system.model.IncidentItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Incident</title>
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
        button {
            padding: 10px 15px;
            background-color: #ff4d4d;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #e60000;
        }
    </style>
</head>
<body>

<header>
    <h1>Delete Incident</h1>
</header>

<div class="container">
    <div class="content">
        <h2>Incident List</h2>
        <% String message = (String) request.getAttribute("message");
        if (message != null) { %>
            <p style="color: green; font-weight: bold;"><%= message %></p>
<% } %>

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
                    ArrayList<IncidentItem> incidents = (ArrayList<IncidentItem>) request.getAttribute("incidents");
                    if (incidents != null && !incidents.isEmpty()) {
                        for (IncidentItem incident : incidents) { 
                %>
                    <tr>
                        <td><%= incident.getIncidentId() %></td>
                        <td><%= incident.getTitle() %></td>
                        <td><%= incident.getDescription() %></td>
                        <td>
                            <form action="deleteIncidentActionServlet" method="post">
                                <input type="hidden" name="incidentId" value="<%= incident.getIncidentId() %>">
                                <button type="submit">Delete</button>
                            </form>
                        </td>
                    </tr>
                <% 
                        } 
                    } else {
                %>
                    <tr>
                        <td colspan="4" style="text-align: center; color: red;">No solved incidents available</td>
                    </tr>
                <% 
                    } 
                %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>

