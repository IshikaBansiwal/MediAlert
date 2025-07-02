package com.univ.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendAlertToContacts(List<String> emails, double latitude, double longitude, String senderName) {
        String subject = "🚨 Emergency Alert from " + senderName;
        String locationLink = "https://www.google.com/maps?q=" + latitude + "," + longitude;
        
        String message = "An SOS alert has been triggered by **" + senderName + "**!\n\n" +
                         "📍 Location: " + locationLink + "\n\n" +
                         "Please respond immediately and ensure their safety.";

        for (String toEmail : emails) {
            SimpleMailMessage email = new SimpleMailMessage();
            email.setTo(toEmail);
            email.setSubject(subject);
            email.setText(message);
            mailSender.send(email);
        }
    }

}
