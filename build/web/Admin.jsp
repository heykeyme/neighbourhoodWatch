<%-- 
    Document   : Admin
    Created on : Feb 16, 2025, 11:03:44 PM
    Author     : Heykeyme
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
            text-align: center;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.5);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }
 
        header h1 {
            font-size: 2.5rem;
            margin: 0;
            font-weight: bold;
            color: #ffd700;
        }

        header p {
            font-size: 1.2rem;
            margin-top: 5px;
        }

        .logout-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            padding: 10px 20px;
            background-color: #ff4d4d;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .logout-btn:hover {
            background-color: #e60000;
        }

        nav {
            display: flex;
            justify-content: center;
            padding: 15px;
            background-color: rgba(0, 0, 0, 0.5);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        nav a {
            color: #ffd700; 
            text-decoration: none;
            margin: 0 15px;
            font-size: 1.1rem;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        nav a:hover {
            color: #f5f5f5;
        }

        main {
            flex: 1;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
            align-items: center;
            justify-items: center;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.1);
            color: #ffd700; /* Text accent color */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 90%;
            max-width: 400px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.4);
        }

        .card h2 {
            margin: 0;
            font-size: 2rem;
        }

        .card p {
            font-size: 1.1rem;
            margin: 10px 0 0;
        }

        footer {
            text-align: center;
            padding: 15px;
            background-color: rgba(0, 0, 0, 0.5);
            font-size: 14px;
            color: #ffd700; 
        }
    </style>
</head>
<body>
    <!-- Logout Button -->
    <form action="logoutServlet">
        <button class="logout-btn" type="submit">Logout</button>
    </form>

    <!-- Header Section -->
    <header>
        <h1>Admin Dashboard</h1>
        <p>Welcome, Admin! Manage your system effectively.</p>
    </header>

    <!-- Navigation Bar -->
    <nav>
        <a href="adminAnnouncement.jsp">Make Announcement</a>
        <a href="updateIncident.jsp">Update</a>
        <a href="deleteIncident.jsp">Delete Incident</a>
    </nav>

    <!-- Main Content Section -->
    <main>
        <!-- Card: User Summary --> 
        <div class="card" id="users">
            <h2>120</h2>
            <p>Total Registered Users</p>
        </div>

        <!-- Card: Reports Summary -->
        <div class="card" id="reports">
            <h2>45</h2>
            <p>Pending Reports</p>
        </div>

        <!-- Card: Settings -->
        <div class="card" id="settings">
            <h2>Settings</h2>
            <p>Update system configurations</p>
        </div>

        <!-- Card: Analytics -->
        <div class="card" id="analytics">
            <h2>Analytics</h2>
            <p>View detailed system analytics</p>
        </div>
    </main>

    <!-- Footer Section -->
    <footer>
        <p>&copy; 2024 Neighborhood Watch. All rights reserved.</p>
    </footer>

</body>
</html>
