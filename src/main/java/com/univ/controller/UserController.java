package com.univ.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.univ.bean.EmergencyContact;
import com.univ.bean.User;
import com.univ.repository.EmergencyContactRepository;
import com.univ.repository.UserRepository;
import com.univ.service.EmailService;
import com.univ.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    UserService serv;

    @Autowired
    UserRepository userRepo;
    @Autowired
    private EmailService emailService;


    // Home
    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/index")
    public String index1() {
        return "index";
    }

    // Registration page
    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    // Registration logic
    @PostMapping("/register")
    public String reg1(@ModelAttribute("usr") User usr) {
        if (usr.getName() == null || usr.getName().isEmpty()) {
            return "register";
        } else {
            User u = serv.insert(usr);
            if (u != null) {
                return "login";
            } else {
                return "register";
            }
        }
    }

    // Login page
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    // Login logic
    @PostMapping("/login")
    public String login1(@ModelAttribute("usr") User usr, HttpSession session) {
        if (usr.getUnm().isEmpty()) {
            return "login";
        } else {
            User u = serv.checkLogin(usr.getUnm(), usr.getPw());
            if (u != null) {
                session.setAttribute("user", u);

                // ✅ Check if redirected from somewhere
                String redirectUrl = (String) session.getAttribute("redirectAfterLogin");
                if (redirectUrl != null) {
                    session.removeAttribute("redirectAfterLogin");
                    return "redirect:" + redirectUrl;
                }

                return "redirect:/";  // default
            } else {
                return "login";
            }
        }
    }


    // Profile page with session check
    @RequestMapping("/profile")
    public String profile(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login"; // redirect if session not found
        }
        return "profile"; // shows profile.jsp
    }

    // Update profile info
    @PostMapping("/updateProfile")
    public String updateProfile(@ModelAttribute User updatedUser, HttpSession session, HttpServletRequest request) {
        User sessionUser = (User) session.getAttribute("user");
        if (sessionUser != null) {
            sessionUser.setPhone(updatedUser.getPhone());
            sessionUser.setBloodGroup(updatedUser.getBloodGroup());
            sessionUser.setAllergies(updatedUser.getAllergies());

            userRepo.save(sessionUser);
            session.setAttribute("user", sessionUser); // update session
            request.setAttribute("message", "Profile updated successfully.");
        }
        return "profile";
    }

    // Change password logic
    @PostMapping("/changePassword")
    public String changePassword(@RequestParam String oldPassword,
                                 @RequestParam String newPassword,
                                 HttpSession session,
                                 HttpServletRequest request) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            if (user.getPw().equals(oldPassword)) {
                user.setPw(newPassword);
                userRepo.save(user);
                request.setAttribute("message", "Password changed successfully.");
            } else {
                request.setAttribute("error", "Old password is incorrect.");
            }
        }
        return "profile";
    }

    // Logout
    @PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
    @RequestMapping("/sos")
    public String sosPage(HttpSession session, HttpServletRequest request) {
        if (session.getAttribute("user") == null) {
            session.setAttribute("redirectAfterLogin", "/sos");  // Save SOS as target
            return "redirect:/login";
        }
        return "sos";
    }
    @Autowired
    EmergencyContactRepository contactRepo;

    @RequestMapping("/contacts")
    public String contactPage(HttpSession session, HttpServletRequest req) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

       
        List<EmergencyContact> contacts = contactRepo.findByUserId(Long.valueOf(user.getId()));

        req.setAttribute("contacts", contacts);
        return "contacts";
    }

    @PostMapping("/addContact")
    public String addContact(@RequestParam String name,
                             @RequestParam String email,
                             @RequestParam String phone,
                             HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        EmergencyContact c = new EmergencyContact();
        c.setUserId((long) user.getId()); // ✅ cast to Long
        c.setName(name);
        c.setEmail(email);
        c.setPhone(phone);

        contactRepo.save(c);
        return "redirect:/contacts";
    }
    


}
