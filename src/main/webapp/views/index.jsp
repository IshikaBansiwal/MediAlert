<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MediAlert | Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap + Google Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

    <style>
    section {
    padding: 100px 20px;
    min-height: 100vh;
}

#about, #contact {
    scroll-margin-top: 80px;
}

.accordion-button {
    background-color: #e9f5ff;
    font-weight: 500;
}
.accordion-button:focus {
    box-shadow: none;
}
    
        body {
            font-family: 'Poppins', sans-serif;
            background-color: white;
            scroll-behavior: smooth;
        }
        .navbar {
            background-color: #003366;
        }
        .navbar a {
            color: white !important;
            font-weight: 500;
        }
        .sticky-top {
            position: sticky;
            top: 0;
            z-index: 1020;
        }
        .hero {
            padding: 60px 30px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            background-color:  #ffffff;
        }
        .hero-text {
            flex: 1;
            min-width: 300px;
            padding: 20px;
        }
        .hero-text h1 {
            font-size: 42px;
            font-weight: bold;
            color: #003366;
        }
        .hero-text p {
            font-size: 18px;
            color: #333;
            margin-top: 20px;
        }
        .sos-button button {
            font-size: 20px;
            padding: 14px 35px;
            background-color: #dc3545;
            border: none;
            color: white;
            border-radius: 8px;
            transition: 0.3s;
        }
        .sos-button button:hover {
            background-color: #bb2d3b;
        }
        .hero-img {
            flex: 1;
            min-width: 300px;
            text-align: center;
        }
        .hero-img img {
            max-width: 90%;
            height: auto;
        }
        section {
            padding: 60px 20px;
        }
        #about {
            background-color: #ffffff;
        }
        #contact {
            background-color: #f0f8ff;
        }
        footer {
            background-color: #003366;
            color: white;
            padding: 20px 0;
            text-align: center;
            font-size: 14px;
        }
    </style>
</head>
<body>

<!-- 🧭 Sticky Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">MediAlert</a>
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
        </div>
    </div>
</nav>

<!-- 🚑 Hero Section -->
<!-- 🚑 Hero Section -->
<div id="hero" class="hero" style="min-height: 100vh; border-bottom: 8px solid #003366; box-shadow: 0 8px 20px rgba(0,0,0,0.1);">

    <div class="hero-text">
        <h1>Emergency Medical Help at Your Fingertips</h1>
        <p>“The best way to find yourself is to lose yourself in the service of others.” — Mahatma Gandhi</p>
        <div class="sos-button mt-4">
            <form action="sos" method="post">
                <button type="submit">🚨 SOS Emergency</button>
            </form>
        </div>
    </div>
    <div class="hero-img">
        <img src="<c:url value='/img/homepageimg.jpg' />" alt="Medical Help">
    </div>
</div>

<!-- 🏥 About Us Section -->
<section id="about">
    <div class="container">
        <h2 class="text-center mb-4" style="color:#003366;">About Us</h2>
        <p class="lead text-center">
            MediAlert is your personal emergency companion, offering instant SOS communication, location sharing, and real-time alerts to hospitals and loved ones during medical emergencies.
        </p>

        <div class="row mt-5">
            <div class="col-md-6">
                <h4 style="color:#003366;">Our Mission</h4>
                <p>
                    To empower individuals in critical health situations by providing them with a quick, reliable, and intelligent alert system — bridging the gap between patients, family, and emergency responders.
                </p>
                <h4 style="color:#003366;">Key Features</h4>
                <ul>
                    <li>Instant SOS button with location tracking</li>
                    <li>SMS/email notifications to emergency contacts</li>
                    <li>Nearby hospital alerts (coming soon)</li>
                    <li>User profile and medical history management</li>
                </ul>
            </div>

            <!-- FAQs -->
            <div class="col-md-6">
                <h4 style="color:#003366;">Frequently Asked Questions</h4>
                <div class="accordion" id="faqAccordion">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="faq1">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq1Collapse">
                                How does the SOS button work?
                            </button>
                        </h2>
                        <div id="faq1Collapse" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                When you click the SOS button, your location is captured and an alert is sent to your emergency contacts and/or nearby hospital (if enabled).
                            </div>
                        </div>
                    </div>

                    <div class="accordion-item">
                        <h2 class="accordion-header" id="faq2">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2Collapse">
                                Is my location data safe?
                            </button>
                        </h2>
                        <div id="faq2Collapse" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                Yes, we only access your location when the SOS button is pressed. No data is stored without your permission.
                            </div>
                        </div>
                    </div>

                    <div class="accordion-item">
                        <h2 class="accordion-header" id="faq3">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq3Collapse">
                                Who gets notified during an emergency?
                            </button>
                        </h2>
                        <div id="faq3Collapse" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                All contacts you've added to your emergency list — family, friends, or healthcare providers — will receive an email or SMS instantly.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- 📞 Contact Section -->
<section id="contact">
    <div class="container">
        <h2 class="text-center mb-4" style="color:#003366;">Contact Us</h2>
        <div class="row">
            <div class="col-md-6 mb-4">
                <form>
                    <div class="mb-3">
                        <label class="form-label">Your Name</label>
                        <input type="text" class="form-control" placeholder="Enter your name">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Your Email</label>
                        <input type="email" class="form-control" placeholder="Enter your email">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Message</label>
                        <textarea class="form-control" rows="4" placeholder="Type your message..."></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Send Message</button>
                </form>
            </div>

            <div class="col-md-6 text-center">
                <h5>Our Location</h5>
                <div style="width:100%; height:250px; background-color:#ccc; border-radius:8px; display:flex; align-items:center; justify-content:center;">
                    <span>📍 Google Map (Coming Soon)</span>
                </div>
                <p class="mt-3">Email: support@medialert.com<br>Phone: +91-9876543210</p>
            </div>
        </div>
    </div>
</section>


<!-- ⚠️ Footer -->
<footer>
    <div class="container">
        &copy; 2025 MediAlert. All rights reserved.
    </div>
</footer>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
