package in.sp.main.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import in.sp.main.services.EmailService;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/otp")
public class OTPController {

    @Autowired
    private EmailService emailService;

    @PostMapping("/send")
    public String sendOtp(@RequestParam("email") String email, HttpSession session) {
        String generatedOtp = emailService.generateOTP();
        session.setAttribute("otp", generatedOtp);  // ✅ Store OTP in session
        session.removeAttribute("otp_verified");     // 🚫 Clear previous verification status
        boolean emailSent = emailService.sendOTP(email, generatedOtp);
        return emailSent ? "OTP sent to your email." : "Failed to send OTP.";
    }

    @PostMapping("/verify")
    public String verifyOtp(@RequestParam("otp") String otp, HttpSession session) {
        String sessionOtp = (String) session.getAttribute("otp");
        if (sessionOtp != null && sessionOtp.equals(otp)) {
            session.setAttribute("otp_verified", true);  // ✅ Mark OTP as verified
            return "OTP Verified Successfully!";
        } else {
            return "Invalid OTP!";
        }
    }
}
