<%-- 
    Document   : adminAnnouncement
    Created on : Feb 17, 2025, 11:38:52 PM
    Author     : Heykeyme
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Announcement</title>
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

        .container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #ffd700;
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
            color: #ffd700;
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
            justify-content: center;
            gap: 10px;
        }

        .btn-group button {
            background-color: #ff4d4d;
            color: white;
            padding: 12px 25px;
            font-size: 1rem;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-group button:hover {
            background-color: #e60000;
        }
    </style>
</head>
<body>
    <header>
        <h1>Create Announcement</h1>
        <p>Post new announcements for users</p>
    </header>

    <div class="container">
        <h2>Create New Announcement</h2>
        <form>
            <!-- Announcement Title Section -->
            <div class="form-group">
                <label for="announcement-title">Title</label>
                <input type="text" id="announcement-title" name="announcement-title" placeholder="Enter announcement title" required>
            </div>

            <!-- Announcement Description Section -->
            <div class="form-group">
                <label for="announcement-description">Description</label>
                <textarea id="announcement-description" name="announcement-description" placeholder="Write the announcement details here" required></textarea>
            </div>

            <!-- Buttons for submitting -->
            <div class="btn-group">
                <button type="reset">Reset</button>
                <button type="submit">Post Announcement</button>
            </div>
        </form>
    </div>
</body>
</html>

