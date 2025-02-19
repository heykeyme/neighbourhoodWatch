<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Incident</title>
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
            position: relative;
        }

        header h1 {
            font-size: 2.5rem;
            margin: 0;
            color: #ffffff;
        }

        header p {
            font-size: 1rem;
            opacity: 0.8;
            color: #f5f5f5;
        }

        .settings {
            position: absolute;
            top: 20px;
            right: 20px;
            cursor: pointer;
            font-size: 24px;
            color: #f5f5f5;
            transition: transform 0.3s ease, color 0.3s ease;
        }

        .settings:hover {
            transform: rotate(90deg);
            color: #ffd700;
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

        .form-group input, .form-group textarea, .form-group select {
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

        .form-group select {
            background-color: #f9f9f9;
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

        .btn-group .reset-btn {
            order: 1; 
        }

        .btn-group .create-btn {
            order: 2; 
        }
        
        .back-btn {
            display: inline-block;
            text-align: center;
            background-color: #4e73df;
            color: white;
            padding: 12px 25px;
            font-size: 1rem;
            border-radius: 8px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .back-btn:hover {
            background-color: #2a55a3;
        }
    </style>
</head>
<body>
    <header>
        <h1>Create Incident</h1>
        <p>Submit new incident reports</p>
        <!-- Settings Icon -->
        <div class="settings" title="Settings" onclick="location.href='settings.html';">
            ??
        </div>
    </header>

    <div class="container">
        <h2>Create New Incident</h2>
        <form action="createIncidentServlet" method="post">
            <!-- Incident Title Section -->
            <div class="form-group">
                <label for="incident-title">Incident Title</label>
                <input type="text" id="incident-title" name="incident-title" placeholder="Enter incident title" required>
            </div>

            <!-- Incident Description Section -->
            <div class="form-group">
                <label for="incident-description">Incident Description</label>
                <textarea id="incident-description" name="incident-description" placeholder="Describe the incident" required></textarea>
            </div>

            <!-- Incident Category Section -->
            <div class="form-group">
                <label for="incident-category">Category</label>
                <select id="incident-category" name="incident-category">
                    <option value="hardware">Hardware</option>
                    <option value="software">Software</option>
                    <option value="network">Network</option>
                    <option value="security">Security</option>
                    <option value="other">Other</option>
                </select>
            </div>

            <!-- Incident Severity Section -->
            <div class="form-group">
                <label for="incident-severity">Severity</label>
                <select id="incident-severity" name="incident-severity">
                    <option value="low">Low</option>
                    <option value="medium">Medium</option>
                    <option value="high">High</option>
                    <option value="critical">Critical</option>
                </select>
            </div>
         
            <!-- Buttons for submission -->
            <div class="btn-group">
                <a href="User.jsp" class="btn back-btn">Back</a>
                <button type="submit" class="create-btn">Create Incident</button>
            </div>
        </form>
    </div>
</body>
</html>
