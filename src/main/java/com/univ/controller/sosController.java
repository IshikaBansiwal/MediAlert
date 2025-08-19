package com.univ.controller;


import com.univ.bean.EmergencyContact;
import com.univ.bean.User;
import com.univ.bean.SosAlert;
import com.univ.repository.EmergencyContactRepository;
import com.univ.repository.sosRepository;
import com.univ.service.EmailService;
import com.univ.service.SosAlertService;


import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public String sendSOS(@RequestParam double latitude,
                          @RequestParam double longitude,
                          HttpSession session) {

        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "User not logged in!";
        }
     // Save SOS Alert
        sosAlertService.saveSosAlert(user, latitude, longitude);

        // Fetch user's emergency contacts
        List<EmergencyContact> contacts = contactRepo.findByUserId((long) user.getId());

        // Extract email list
        List<String> emails = contacts.stream()
                                      .map(EmergencyContact::getEmail)
                                      .toList();

        // Send alerts
        emailService.sendAlertToContacts(emails, latitude, longitude, user.getName());


        return "🚨 SOS alert sent to all emergency contacts!";
    }
    @PostMapping("/deleteContact")
    public String deleteContact(@RequestParam Long id, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        EmergencyContact contact = contactRepo.findById(id).orElse(null);
        if (contact != null && user.getId() != null && contact.getUserId().equals(user.getId())) {
            contactRepo.delete(contact);
            System.out.println(">> Contact deleted!");
        } else {
            System.out.println(">> User ID mismatch. Contact owner: " + contact.getUserId() + ", Logged in: " + user.getId());
        }

        return "redirect:/contacts";
    }

    @Autowired
    private SosAlertService sosAlertService;

    @GetMapping("/admin/soshistory")
    public String showSosHistory(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        List<SosAlert> alerts = sosAlertService.getAlertsByUser(user.getId());
        model.addAttribute("sosHistory", alerts);

        return "soshistory"; // soshistory.jsp
    }


    
}
    

    

