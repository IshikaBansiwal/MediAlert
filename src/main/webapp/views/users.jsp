<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.univ.bean.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Registered Users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
     .navbar {
            background-color: #003366;
        }
        .navbar .nav-link, .navbar-brand {
            color: white !important;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">MediAlert Admin</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/admin/users">View Registered Users</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin/soshistory">SOS Alert History</a>
                </li>
                <li class="nav-item">
                    <form action="/logout" method="post">
                        <button class="btn btn-danger btn-sm ms-3" type="submit">Logout</button>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <h2 class="text-primary mb-4">Registered Users</h2>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Name</th><th>Email</th><th>Phone</th><th>Blood Group</th><th>Allergies</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="u" items="${users}">
            <tr>
                <td>${u.name}</td>
                <td>${u.email}</td>
                <td>${u.phone}</td>
                <td>${u.bloodGroup}</td>
                <td>${u.allergies}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
