<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="includes/navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - MediAlert</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap + Google Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: white;
        }
        .form-container {
            max-width: 650px;
            margin: 60px auto;
            padding: 30px;
            border-radius: 10px;
            border: 1px solid #ddd;
            box-shadow: 0 0 15px rgba(0,0,0,0.05);
        }
        .form-title {
            text-align: center;
            color: #003366;
            margin-bottom: 25px;
        }
    </style>
</head>
<body>

<div class="container form-container">
    <h2 class="form-title">User Registration</h2>

    <form action="register" method="post">
        <div class="mb-3">
            <label for="name" class="form-label">Full Name</label>
            <input type="text" class="form-control" name="name" id="name" required>
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Email Address</label>
            <input type="email" class="form-control" name="email" id="email" required>
        </div>

        <div class="mb-3">
            <label for="phone" class="form-label">Phone</label>
            <input type="text" class="form-control" name="phone" id="phone" required>
        </div>

        <div class="mb-3">
            <label for="bloodGroup" class="form-label">Blood Group</label>
            <input type="text" class="form-control" name="bloodGroup" id="bloodGroup" required>
        </div>

        <div class="mb-3">
            <label for="allergies" class="form-label">Allergies</label>
            <input type="text" class="form-control" name="allergies" id="allergies">
        </div>

        <div class="mb-3">
            <label for="unm" class="form-label">Username</label>
            <input type="text" class="form-control" name="unm" id="unm" required>
        </div>

        <div class="mb-3">
            <label for="pw" class="form-label">Password</label>
            <input type="password" class="form-control" name="pw" id="pw" required>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-primary px-4">Register</button>
        </div>
    </form>

    <div class="mt-3 text-center">
        <a href="login">Already have an account? Login</a>
    </div>

    <div class="text-success mt-3 text-center">
        ${message}
    </div>
</div>

</body>
</html>
