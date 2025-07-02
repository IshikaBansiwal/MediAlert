<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.univ.bean.EmergencyContact" %>
<%@ page import="com.univ.bean.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("/login");
        return;
    }
    List<EmergencyContact> contacts = (List<EmergencyContact>) request.getAttribute("contacts");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Emergency Contacts - MediAlert</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap + Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #ffffff;
        }
        .container {
            max-width: 800px;
            margin-top: 50px;
        }
        h2 {
            color: #003366;
            margin-bottom: 30px;
        }
        .contact-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
        }
        .form-control {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<!-- NavBar Include -->
<jsp:include page="includes/navbar.jsp" />

<div class="container">
    <h2 class="text-center">📇 Emergency Contacts</h2>

    <!-- Contact Form -->
    <form action="/addContact" method="post" class="mb-4">
        <input type="hidden" name="userId" value="<%= user.getId() %>">
        <input type="text" name="name" class="form-control" placeholder="Contact Name" required>
        <input type="email" name="email" class="form-control" placeholder="Email Address" required>
        <input type="text" name="phone" class="form-control" placeholder="Phone Number" required>
        <button type="submit" class="btn btn-primary">➕ Add Contact</button>
    </form>

    <hr>
<!-- Contact List -->
<% if (contacts != null && !contacts.isEmpty()) {
    for (EmergencyContact contact : contacts) {
%>
    <div class="card mb-3">
        <div class="card-body">
            <h5 class="card-title"><%= contact.getName() %></h5>
            <p class="card-text">
                <strong>Email:</strong> <%= contact.getEmail() %><br>
                <strong>Phone:</strong> <%= contact.getPhone() %>
            </p>

            <!-- 🗑️ Delete Button -->
            <form action="/deleteContact" method="post" onsubmit="return confirm('Are you sure you want to delete this contact?')" style="display: inline;">
                <input type="hidden" name="id" value="<%= contact.getId() %>" />
                <button type="submit" class="btn btn-danger btn-sm">🗑️ Delete</button>
            </form>
        </div>
    </div>
<% }} else { %>
    <p class="text-muted">No emergency contacts added yet.</p>
<% } %>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
