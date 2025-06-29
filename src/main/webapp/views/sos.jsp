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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SOS - MediAlert</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap + Google Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: white;
        }
        .container {
            max-width: 700px;
            margin-top: 50px;
            text-align: center;
        }
        h2 {
            color: #003366;
        }
        .sos-btn {
            font-size: 22px;
            padding: 16px 40px;
            background-color: #dc3545;
            border: none;
            color: white;
            border-radius: 10px;
            margin-top: 30px;
            transition: 0.3s ease-in-out;
        }
        .sos-btn:hover {
            background-color: #bb2d3b;
        }
        #status {
            margin-top: 25px;
            font-weight: bold;
            color: green;
        }
    </style>
</head>
<body>

<!-- Include Navbar -->
<jsp:include page="includes/navbar.jsp" />

<!-- SOS Section -->
<div class="container">
    <h2>🚨 Send Emergency SOS</h2>
    <p class="text-muted">Click the button below to send your current location to emergency contacts and nearby services.</p>

    <button class="sos-btn" onclick="sendSOS()">SEND SOS</button>

    <p id="status"></p>
</div>

<!-- JS -->
<script>
    function sendSOS() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var lat = position.coords.latitude;
                var lon = position.coords.longitude;

                fetch('/sendSOS', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: 'userId=<%= user.getId() %>&latitude=' + lat + '&longitude=' + lon
                })
                .then(response => response.text())
                .then(data => {
                    document.getElementById("status").innerText = data;
                });
            }, function(error) {
                document.getElementById("status").innerText = "⚠️ Location access denied.";
            });
        } else {
            document.getElementById("status").innerText = "❌ Geolocation not supported.";
        }
    }
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
