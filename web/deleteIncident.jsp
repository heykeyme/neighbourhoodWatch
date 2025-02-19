<%-- 
    Document   : deleteIncident
    Created on : Feb 17, 2025, 11:43:09 AM
    Author     : Heykeyme
--%>

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
            color: #ffd700; /* Accent color */
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
            background-color: white; /* White background for content */
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

    
        nav {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            padding: 20px 40px;
            background-color: rgba(0, 0, 0, 0.7);
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

        .logout-btn {
            padding: 10px 20px;
            background-color: #ff4d4d;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }

        .logout-btn:hover {
            background-color: #e60000;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav>
        <a href="admin-dashboard.html">Admin Dashboard</a>
        <a href="settings">Settings</a>
        <button class="logout-btn">Logout</button> <!-- Logout button -->
    </nav>

    <!-- Header Section -->
    <header>
        <h1>Delete Incident</h1>
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
                    <tr>
                        <td>1</td>
                        <td>System Crash</td>
                        <td>Unexpected shutdown</td>
                        <td><button>Delete</button></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Login Issue</td>
                        <td>User unable to login</td>
                        <td><button>Delete</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>

