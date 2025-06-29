<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.univ.bean.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("/login");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Profile - MediAlert</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap + Google Font -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: white;
        }
        .navbar {
            background-color: #003366;
        }
        .navbar a {
            color: white !important;
            font-weight: 500;
        }
        .profile-section {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            border: 1px solid #ccc;
            border-radius: 12px;
            background-color: #f9f9f9;
        }
        h2, h3 {
            color: #003366;
        }
        .form-control {
            margin-bottom: 15px;
        }
        .btn {
            margin-top: 10px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="/#hero">MediAlert</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon bg-light rounded"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="/#hero">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/#about">About Us</a></li>
                <li class="nav-item"><a class="nav-link" href="/#contact">Contact</a></li>
                <li class="nav-item"><a class="nav-link active" href="#">Profile</a></li>
                <li class="nav-item">
                    <form action="/logout" method="post" class="d-inline">
                        <button type="submit" class="btn btn-sm btn-danger ms-2">Logout</button>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Profile Info -->
<div class="container profile-section">
    <h2 class="mb-4">👤 User Profile</h2>

    <!-- User Info -->
    <p><strong>Name:</strong> <%= user.getName() %></p>
    <p><strong>Email:</strong> <%= user.getEmail() %></p>

    <!-- Edit Profile -->
    <hr>
    <h3>✏️ Edit Profile</h3>
    <form action="/updateProfile" method="post">
        <input type="text" class="form-control" name="phone" value="<%= user.getPhone() %>" placeholder="Phone">
        <input type="text" class="form-control" name="bloodGroup" value="<%= user.getBloodGroup() %>" placeholder="Blood Group">
        <input type="text" class="form-control" name="allergies" value="<%= user.getAllergies() %>" placeholder="Allergies">
        <button type="submit" class="btn btn-primary">Update Profile</button>
    </form>

    <!-- Change Password -->
    <hr>
    <h3>🔒 Change Password</h3>
    <form action="/changePassword" method="post">
        <input type="password" class="form-control" name="oldPassword" placeholder="Current Password">
        <input type="password" class="form-control" name="newPassword" placeholder="New Password">
        <button type="submit" class="btn btn-warning">Change Password</button>
    </form>

    <!-- Flash Messages -->
    <div class="mt-3">
        <p style="color: green;"><%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %></p>
        <p style="color: red;"><%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %></p>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
