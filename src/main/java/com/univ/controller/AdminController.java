package com.univ.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.univ.bean.Admin;
import com.univ.bean.User;
import com.univ.bean.sosAlert;
import com.univ.repository.AdminRepository;
import com.univ.repository.UserRepository;
import com.univ.repository.sosRepository;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    AdminRepository adminRepo;

    @Autowired
    UserRepository userRepo;

    @Autowired
    sosRepository sosAlertRepo;

    @GetMapping("/admin/login")
    public String adminLogin() {
        return "adminLogin";
    }

    @PostMapping("/admin/login")
    public String adminLogin(@RequestParam String username,
                             @RequestParam String password,
                             HttpSession session,
                             Model model) {

        // Hardcoded credentials for now
        if ("admin".equals(username) && "admin123".equals(password)) {
            session.setAttribute("admin", true);
            return "redirect:/admin/dashboard";
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "adminLogin";
        }
    }


    @GetMapping("/admin/dashboard")
    public String dashboard(HttpSession session, HttpServletRequest req) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }

        List<User> users = userRepo.findAll();
        List<sosAlert> sosAlerts = sosAlertRepo.findAll();

        req.setAttribute("users", users);
        req.setAttribute("alerts", sosAlerts);
        return "adminDashboard";
    }

    @PostMapping("/admin/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin/login";
    }
}

