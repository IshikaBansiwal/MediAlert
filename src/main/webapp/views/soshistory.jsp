<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>SOS Alert History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f9f9f9;
        }

        /* Navbar */
        .navbar {
            background-color: #003366;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-left {
            font-size: 20px;
            font-weight: bold;
            color: white;
        }

        .navbar-right a {
            color: white;
            margin-left: 25px;
            text-decoration: none;
            font-weight: 500;
        }

        .navbar-right form {
            display: inline;
        }

        .navbar-right button {
            background-color: #dc3545;
            border: none;
            padding: 5px 12px;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            font-weight: bold;
        }

        .container {
            padding: 40px;
        }

        h2 {
            color: #0d6efd;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #003366;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e9ecef;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <div class="navbar-left">MediAlert Admin</div>
    <div class="navbar-right">
        <a href="/admin/users">View Registered Users</a>
        <a href="/admin/soshistory">SOS Alert History</a>
        <form action="/admin/logout" method="post" style="display:inline;">
            <button type="submit">Logout</button>
        </form>
    </div>
</div>

<!-- SOS Alert Table -->
<div class="container">
    <h2>SOS Alert History</h2>

    <table>
        <thead>
            <tr>
                <th>User ID</th>
                <th>Latitude</th>
                <th>Longitude</th>
                <th>Timestamp</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="alert" items="${alerts}">
                <tr>
                    <td>${alert.userId}</td>
                    <td>${alert.latitude}</td>
                    <td>${alert.longitude}</td>
                    <td>${alert.timestamp}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
