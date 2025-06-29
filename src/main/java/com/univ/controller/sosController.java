package com.univ.controller;


import com.univ.bean.EmergencyContact;
import com.univ.bean.sosAlert;
import com.univ.repository.EmergencyContactRepository;
import com.univ.repository.sosRepository;
import com.univ.service.EmailService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Controller
public class sosController {

    @Autowired
    private sosRepository repo;
    @Autowired
    private EmergencyContactRepository contactRepo;

    @Autowired
    private EmailService emailService;

    @PostMapping("/sendSOS")
    @ResponseBody
    public String sendSOS(@RequestParam Long userId,
                          @RequestParam double latitude,
                          @RequestParam double longitude) {

        // Save SOS Alert (already working)
        sosAlert sos = new sosAlert();
        sos.setUserId(userId);
        sos.setLatitude(latitude);
        sos.setLongitude(longitude);
        sos.setTimestamp(new Date());
        repo.save(sos);

        // Fetch contacts and send alerts
        List<EmergencyContact> contacts = contactRepo.findByUserId(userId);
        for (EmergencyContact contact : contacts) {
            emailService.sendAlert(contact.getEmail(), latitude, longitude);
        }

        return "🚑 SOS Sent! Contacts have been notified.";
    }

    
}
