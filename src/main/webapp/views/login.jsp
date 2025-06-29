<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="includes/navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login - MediAlert</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap & Font -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: white;
        }
        .form-container {
            max-width: 500px;
            margin: 60px auto;
            padding: 30px;
            border-radius: 10px;
            border: 1px solid #ddd;
            box-shadow: 0 0 15px rgba(0,0,0,0.05);
        }
        .form-title {
            text-align: center;
            color: #003366;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container form-container">
    <h2 class="form-title">Login</h2>
    <form action="login" method="post">
        <div class="mb-3">
            <label for="unm" class="form-label">Username</label>
            <input type="text" class="form-control" id="unm" name="unm" required>
        </div>
        <div class="mb-3">
            <label for="pw" class="form-label">Password</label>
            <input type="password" class="form-control" id="pw" name="pw" required>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary px-5">Login</button>
        </div>
    </form>
</div>

</body>
</html>
