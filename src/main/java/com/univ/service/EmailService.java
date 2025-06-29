package com.univ.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    JavaMailSender mailSender;

    public void sendAlert(String to, double lat, double lon) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject("🚨 SOS Alert from MediAlert");
        message.setText("Your contact triggered an SOS alert.\n\n" +
                "Location: https://www.google.com/maps?q=" + lat + "," + lon + "\n\n" +
                "Please reach out immediately.");

        mailSender.send(message);
    }
}
