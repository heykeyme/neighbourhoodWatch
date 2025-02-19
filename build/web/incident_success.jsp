<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Incident Created</title>
    <style>
        body {
            background: linear-gradient(135deg, #4e73df, #1e3c72);
            font-family: 'Arial', sans-serif;
            color: white;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            color: #333;
            text-align: center;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #1e3c72;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.1rem;
            margin: 10px 0;
        }

        .success {
            color: #28a745;
            font-weight: bold;
        }

        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4e73df;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .btn:hover {
            background-color: #2a55a3;
        }
        
    </style>
</head>
<body>
    <div class="container">
        <h2>Incident Successfully Created!</h2>
        <p class="success">Your incident has been recorded.</p>
        <p><strong>Incident ID:</strong> <%= request.getAttribute("incidentID") %></p>
        <p><strong>Title:</strong> <%= request.getAttribute("title") %></p>
        <p><strong>Description:</strong> <%= request.getAttribute("description") %></p>
        
        <a href="User.jsp" class="btn">Back to Dashboard</a>
    </div>
</body>
</html>
