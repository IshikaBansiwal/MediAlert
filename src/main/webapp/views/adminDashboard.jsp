<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - MediAlert</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }
        .navbar {
            background-color: #003366;
        }
        .navbar .nav-link, .navbar-brand {
            color: white !important;
        }
        .map-container {
            width: 100%;
            height: 500px;
            margin-top: 30px;
            border: 2px solid #003366;
            border-radius: 10px;
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
            <li class="nav-item"><a class="nav-link" href="/admin/dashboard">Admin Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="/admin/users">View Registered Users</a></li>
                <li class="nav-item"><a class="nav-link" href="/admin/soshistory">SOS Alert History</a></li>
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/admin/logout" method="post">
                        <button type="submit" class="btn btn-danger btn-sm">Logout</button>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <h2 class="text-center">🚨 Active SOS Alerts Map</h2>
    <div id="map" class="map-container"></div>
</div>

<!-- Leaflet JS -->
<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>

<script>
    const map = L.map('map').setView([22.9734, 78.6569], 5);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '© OpenStreetMap contributors'
    }).addTo(map);

    // Add dynamic SOS alerts
    <c:forEach var="alert" items="${alerts}">
        L.marker([${alert.latitude}, ${alert.longitude}]).addTo(map)
            .bindPopup("<b>${alert.user.name}</b><br>${alert.timestamp}")
            .openPopup();
    </c:forEach>
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
