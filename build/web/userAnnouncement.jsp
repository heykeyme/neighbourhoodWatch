<%-- 
    Document   : userAnnouncement
    Created on : Feb 18, 2025, 12:05:22 AM
    Author     : Heykeyme
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Announcements</title>
    <style>
        body {
            background: linear-gradient(135deg, #2b5876, #4e4376);
            font-family: 'Arial', sans-serif;
            color: white;
            margin: 0;
            padding: 0;
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
            font-size: 1rem;
            margin-top: 5px;
            color: #f5f5f5;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 30px;
            color: #ffd700;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        }

        .announcement {
            margin-bottom: 20px;
            padding: 20px;
            border: 1px solid #ffd700;
            border-radius: 8px;
            background-color: rgba(255, 255, 255, 0.1);
        }

        .announcement h2 {
            color: #ffd700;
        }

        .announcement p {
            color: #f5f5f5;
            font-size: 1rem;
        }
    </style>
</head>
<body>
    <header>
        <h1>Announcements</h1>
        <p>Latest announcements from the admin</p>
    </header>

    <div class="container">
        <!-- Event Announcement Example -->
        <div class="announcement">
            <h2>Hari Raya Celebration Event</h2>
            <p>Join us for a grand Hari Raya celebration! Date: April 22nd, 2025 at the Community Hall. Don't miss the exciting performances, food stalls, and family-friendly activities!</p>
        </div>

        <!-- Road Issue Announcement Example -->
        <div class="announcement">
            <h2>Road Maintenance Notice</h2>
            <p>Please be advised that the main road near the town center has a large pothole. The road will be closed for repairs from February 18th to 20th. Please plan your route accordingly.</p>
        </div>

        <!-- General Announcement Example -->
        <div class="announcement">
            <h2>Water Supply Interruption</h2>
            <p>Due to scheduled maintenance, there will be an interruption in water supply on February 19th, 2025, from 9 AM to 12 PM. Please store enough water in advance for your needs.</p>
        </div>
    </div>
</body>
</html>

