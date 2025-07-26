package in.sp.main.controllers;

import in.sp.main.entities.User;
import in.sp.main.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ForgotPasswordController {

    @Autowired
    private UserService userService;

    // Show forgot password page
    @GetMapping("/forgotPassword")
    public String showForgotPasswordPage() {
        return "forgotPassword";  // forgotPassword.jsp
    }

    // Handle forgot password form submission
    @PostMapping("/forgotPassword")
    public String handleForgotPassword(@RequestParam("email") String email, Model model) {
        User user = userService.findByEmail(email);
        if (user != null) {
            userService.generateResetToken(email);
            model.addAttribute("success", "Reset link has been sent to your email.");
        } else {
            model.addAttribute("error", "No account found with this email.");
        }
        return "forgotPassword";
    }

    // Show reset password form via token link
    @GetMapping("/resetPassword")
    public String showResetPasswordForm(@RequestParam("token") String token, Model model) {
        User user = userService.getUserByResetToken(token);
        if (user == null) {
            model.addAttribute("error", "Invalid or expired token.");
            return "forgotPassword";  // Redirect back to forgot password if token is bad
        }
        model.addAttribute("token", token);
        return "reset_password"; // ✅ Should match reset_password.jsp
    }

    // Process new password submission
    @PostMapping("/resetPassword")
    public String processResetPassword(@RequestParam("token") String token,
                                       @RequestParam("password") String password,
                                       @RequestParam("confirmPassword") String confirmPassword,
                                       Model model) {
        User user = userService.getUserByResetToken(token);
        if (user == null) {
            model.addAttribute("error", "Invalid or expired token.");
            return "reset_password";
        }

        // Optional: Check if passwords match (you already have client-side validation)
        if (!password.equals(confirmPassword)) {
            model.addAttribute("error", "Passwords do not match.");
            model.addAttribute("token", token);
            return "reset_password";
        }

        user.setPassword(password); // ⚠️ In production, hash the password
        user.setResetToken(null);   // Clear the reset token
        userService.registerUser(user); // Save updated user

        model.addAttribute("success", "Password reset successfully. You can now log in.");
        return "login";  // login.jsp
    }
    @GetMapping("/test")
    public String testPage() {
        return "reset_password";  // Just render the JSP without any token logic
    }

} 