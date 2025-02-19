<%-- 
    Document   : registerUser
    Created on : Feb 16, 2025, 8:34:02 PM
    Author     : Heykeyme
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Page</title>
    <style>
        body {
            background: linear-gradient(135deg, #2b5876, #4e4376);
            font-family: 'Arial', sans-serif;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .back-btn {
            position: absolute;
            top: 20px;
            left: 20px;
            background-color: #ffd700;
            color: #4e4376;
            border: none;
            border-radius: 5px;
            padding: 10px 15px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            z-index: 10;
        }

        .back-btn:hover {
            background-color: #ffc107;
            transform: scale(1.05);
        }

        .settings {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 24px;
            color: #ffd700;
            cursor: pointer;
            transition: transform 0.3s ease, color 0.3s ease;
        }

        .settings:hover {
            transform: rotate(90deg);
            color: #f5f5f5;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.1); /* Transparent card */
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
            padding: 40px;
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        .form-container h1 {
            margin-bottom: 20px;
            font-size: 2rem;
            color: #ffd700;
        }

        .form-container input, .form-container textarea {
            margin: 10px 0;
            padding: 12px;
            width: 100%;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            box-sizing: border-box;
            transition: border 0.3s ease;
        }

        .form-container input:focus, .form-container textarea:focus {
            border: 1px solid #ffd700;
            outline: none;
        }

        .form-container button {
            background-color: #ffd700;
            color: #4e4376;
            border: none;
            padding: 14px;
            width: 100%;
            border-radius: 8px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .form-container button:hover {
            background-color: #ffc107;
            transform: scale(1.05);
        }

        .form-container a {
            color: #ffd700;
            text-decoration: none;
            font-size: 14px;
            display: block;
            margin-top: 10px;
        }

        .message {
            color: #ffd700;
            font-size: 16px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <!-- Back Button -->
    <a href="login.html"><button class="back-btn">&larr; Back</button></a>

    <!-- Settings Icon -->
    <div class="settings" title="Settings">⚙</div>

    <!-- Registration Form -->
    <div class="form-container">
        <h1>Register Account</h1>
        
        <% String message = (String) request.getAttribute("message"); %>
        <% if (message != null) { %>
            <p class="message"><%= message %></p>
        <% } %>
        
        <form id="register-form" action="registerUserServlet" method="post">
            <input type="text" name="username" placeholder="Username" required><br>
            <input type="email" name="email" placeholder="Email" required><br>
            <input type="text" name="phone" placeholder="Phone Number" required><br>
            <textarea name="address" placeholder="Address" rows="3" required></textarea><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <input type="password" name="confirm_password" placeholder="Confirm Password" required><br>
            <button type="submit">Create Account</button>
            <a href="index.html">Already have an account? Login here.</a>
        </form>
    </div>
</body>
</html>
