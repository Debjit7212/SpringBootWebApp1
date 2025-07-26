package in.sp.main.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import in.sp.main.entities.User;
import in.sp.main.services.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyController {

    @Autowired
    private UserService userService;

    @GetMapping("/regpage")
    public String openRegPage(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/regForm")
    public String submitRegForm(@ModelAttribute("user") User user, Model model, HttpSession session) {
        Boolean isOtpVerified = (Boolean) session.getAttribute("otp_verified");

        if (isOtpVerified == null || !isOtpVerified) {
            model.addAttribute("errorMsg", "Please verify your OTP before submitting!");
            return "register";
        }

        if (userService.isEmailAlreadyRegistered(user.getEmail())) {
            model.addAttribute("errorMsg", "Email is already registered. Please use another one.");
            return "register";
        }

        boolean status = userService.registerUser(user);
        if (status) {
            model.addAttribute("successMsg", "User Registered Successfully");
            session.removeAttribute("otp_verified");
        } else {
            model.addAttribute("errorMsg", "User Not Registered Successfully");
        }

        return "register";
    }

    @PostMapping("/newproForm")
    public String submitproForm(@ModelAttribute("user") User user, Model model) {
        boolean status = userService.registerUser(user);
        if (status) {
            model.addAttribute("successMsg", "Student Details Registered Successfully");
        } else {
            model.addAttribute("errorMsg", "User Not Registered Successfully");
        }

        return "newpro";
    }

    @GetMapping("/loginPage")
    public String openLoginpage(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    @PostMapping("/loginForm")
    public String submitLoginForm(@ModelAttribute("user") User user, Model model) {
        User validUser = userService.loginUser(user.getEmail(), user.getPassword());
        if (validUser != null) {
            model.addAttribute("modelName", validUser.getName());
            model.addAttribute("userEmail", validUser.getEmail());
            return "profile";
        } else {
            model.addAttribute("errorMsg", "Email ID & Password did not match");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logOutUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "login";
    }
 

    

}
