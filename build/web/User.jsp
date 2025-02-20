    <%-- 
        Document   : User
        Created on : Feb 16, 2025, 4:06:41 PM
        Author     : Heykeyme
    --%>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%
        HttpSession sessionUser = request.getSession(false);
        String username = (sessionUser != null) ? (String) sessionUser.getAttribute("username") : "Guest";
    %>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Dashboard</title>
        <style>
            /* General Styles */
            body {
                background: linear-gradient(135deg, #36d1dc, #5b86e5);
                font-family: 'Poppins', sans-serif;
                color: white;
                margin: 0;
                padding: 0;
                height: 100vh;
                display: flex;
                flex-direction: column;
            }

            header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 20px 40px;
                background-color: #1e2a3a; 
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            }

            header h1 {
                font-size: 2.5rem;
                margin: 0;
                font-weight: bold;
                color: #fff;
            }

            header p {
                font-size: 1rem;
                margin-top: 5px;
                opacity: 0.8;
            }

            .logout-btn {
                background-color: #FF0000;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .logout-btn:hover {
                background-color: #FF0000;
            }

            nav {
                display: flex;
                justify-content: center;
                padding: 15px;
                background-color: #293142;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            }

            nav a {
                color: white;
                text-decoration: none;
                margin: 0 15px;
                font-size: 1.1rem;
                font-weight: bold;
                transition: color 0.3s ease;
            }

            nav a:hover {
                color: #FF0000; 
            }

            main {
                flex: 1;
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
                padding: 20px 40px;
                justify-content: space-around;
            }

            .card {
                background-color: #ffffff;
                color: #333333;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
                text-align: center;
                width: 300px;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            }

            .card h2 {
                margin: 0;
                font-size: 1.8rem;
                color: #5b86e5; 
            }

            .card p {
                font-size: 1.1rem;
                margin: 10px 0 0;
            }

            .card button {
                margin-top: 10px;
                padding: 10px 15px;
                background-color: #5b86e5;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .card button:hover {
                background-color: #3f67d1; 
            }

            footer {
                text-align: center;
                padding: 15px;
                background-color: #293142;
                font-size: 14px;
                color: white;
            }
        </style>
    </head>
    <body>
        <!-- Header Section -->
        <header>
            <div>
                <h1>User Dashboard</h1>
                <p>Welcome! Access your personal data and services here.</p>
            </div>
            <form action="logoutServlet">
                <button class="logout-btn" type="submit">Logout</button>
            </form>
        </header>

        <!-- Main Content Section -->
        <main>
            <!-- Card: Profile -->
            <div class="card" id="profile">
                <h2><%= username %></h2>
                <p>Your personal information</p>
            </div>

            <!-- Card: Create Incident -->
            <div class="card" id="create-incident">
                <h2>Create Incident</h2>
                <p>Report a new issue</p>
                <a href="CreateIncident.jsp"><button>Create</button></a>

            </div>

            <!-- Card: Update Incident -->
            <div class="card" id="update-incident">
                <h2>Edit Incident</h2>
                <p>Edit description for existing issues</p>
                <a href="editIncident.jsp"><button>Update</button></a>
            </div>

            <!-- Card: Support -->
            <div class="card" id="announcement">
                <h2>Announcement</h2>
                <p>View Announcement</p>
                <a href="announcementServlet"><button>View</button></a>
            </div>
        </main>

        <!-- Footer Section -->
        <footer>
            <p>&copy; 2024 User Dashboard. All rights reserved.</p>
        </footer>


    </body>
    </html>
