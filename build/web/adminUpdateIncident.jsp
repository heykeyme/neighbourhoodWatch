<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Update Incident</title>
    <style>
      body {
        background: linear-gradient(135deg, #4e73df, #1e3c72);
        font-family: "Arial", sans-serif;
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
      .form-group {
        margin-bottom: 20px;
      }
      .form-group label {
        font-size: 1rem;
        display: block;
        margin-bottom: 8px;
        color: #1e3c72;
      }
      .form-group input,
      .form-group textarea,
      .form-group select {
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
      .form-group input:disabled,
      .form-group textarea:disabled {
        background-color: #f4f4f4;
        color: #777;
        cursor: not-allowed;
      }
      .btn-group {
        display: flex;
        justify-content: center;
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
    <header>
      <h1>Admin Update Incident</h1>
      <p>Update User Incident Status</p>
    </header>
    <div class="container">
      <h2>Admin Update the Incident</h2>
      <% if (request.getAttribute("success") != null) { %>
        <p style="color: green;"><%= request.getAttribute("success") %></p>
      <% } %>
      
      <% if (request.getAttribute("error") != null) { %>
        <p style="color: red;"><%= request.getAttribute("error") %></p>
      <% } %>

      <form action="adminUpdateIncidentServlet" method="POST">
        <div class="form-group">
          <label for="incident-id">Incident ID</label>
          <input type="text" id="incident-id" name="incident-id" value="<%= request.getParameter("id") %>" disabled />
          <input type="hidden" name="incident-id" value="<%= request.getParameter("id") %>" />
        </div>
        <div class="form-group">
          <label for="user-description">User Description</label>
          <textarea id="user-description" name="user-description" disabled><%= request.getParameter("description") %></textarea>
        </div>
        <div class="form-group">
          <label for="incident-status">Status</label>
          <select id="incident-status" name="incident-status">
            <option value="solve">Solve</option>
            <option value="unsolve">Unsolve</option>
          </select>
        </div>
        <div class="btn-group">
          <button type="submit" class="update-btn">Update Incident</button>
        </div>
      </form>
    </div>
  </body>
</html>
