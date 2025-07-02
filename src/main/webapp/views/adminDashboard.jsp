<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.univ.bean.User, com.univ.bean.sosAlert" %>
<%
    List<User> users = (List<User>) request.getAttribute("users");
    List<sosAlert> alerts = (List<sosAlert>) request.getAttribute("alerts");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - MediAlert</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8fafc;
            font-family: 'Segoe UI', sans-serif;
        }
        .dashboard {
            max-width: 900px;
            margin: 40px auto;
        }
        h2, h3 {
            color: #003366;
        }
        .section {
            background-color: #fff;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 30px;
            box-shadow: 0 0 8px rgba(0,0,0,0.05);
        }
    </style>
</head>
<body>
    <div class="dashboard container">
        <h2 class="mb-4">👮 Admin Dashboard</h2>
        <form action="/admin/logout" method="post" class="mb-4">
            <button class="btn btn-danger">Logout</button>
        </form>

        <div class="section">
            <h3>📋 Registered Users</h3>
            <ul class="list-group mt-3">
                <% for(User u : users) { %>
                    <li class="list-group-item">
                        <b><%= u.getName() %></b> - <%= u.getEmail() %>
                    </li>
                <% } %>
            </ul>
        </div>

        <div class="section">
            <h3>🚨 SOS Alerts</h3>
            <ul class="list-group mt-3">
                <% for(sosAlert s : alerts) { %>
                    <li class="list-group-item">
                        User ID: <%= s.getUserId() %>,
                        Location: (<%= s.getLatitude() %>, <%= s.getLongitude() %>)
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</body>
</html>
