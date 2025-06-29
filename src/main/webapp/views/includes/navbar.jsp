<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #003366;">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">MediAlert</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon bg-light rounded"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
    <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
    <li class="nav-item"><a class="nav-link" href="#about">About Us</a></li>
    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>

    <c:choose>
        <c:when test="${not empty sessionScope.user}">
            <li class="nav-item"><a class="nav-link" href="profile">View Profile</a></li>
            <li class="nav-item"><a class="nav-link" href="contacts">Emergency Contacts</a></li>
        </c:when>
        <c:otherwise>
            <li class="nav-item"><a class="nav-link" href="register">Register</a></li>
            <li class="nav-item"><a class="nav-link" href="login">Login</a></li>
        </c:otherwise>
    </c:choose>
</ul>
            
            
                
                
            </ul>
        </div>
    </div>
</nav>
