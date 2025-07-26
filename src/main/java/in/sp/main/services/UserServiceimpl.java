package in.sp.main.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import in.sp.main.entities.User;
import in.sp.main.repositorys.UserRepository;

import jakarta.mail.internet.MimeMessage;
import java.util.UUID;

@Service
public class UserServiceimpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private JavaMailSender mailSender;

    @Override
    public boolean isEmailAlreadyRegistered(String email) {
        return userRepository.findByEmail(email) != null;
    }

    @Override
    public boolean registerUser(User user) {
        try {
            userRepository.save(user);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public User loginUser(String email, String password) {
        User validUser = userRepository.findByEmail(email);
        if (validUser != null && validUser.getPassword().equals(password)) {
            return validUser;
        }
        return null;
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public void generateResetToken(String email) {
        User user = userRepository.findByEmail(email);
        if (user != null) {
            String token = UUID.randomUUID().toString();
            user.setResetToken(token);
            userRepository.save(user); // Save token to DB

            try {
                MimeMessage message = mailSender.createMimeMessage();
                MimeMessageHelper helper = new MimeMessageHelper(message, true);

                helper.setTo(email);
                helper.setSubject("Password Reset Request");

                String resetLink = "http://localhost:8080/resetPassword?token=" + token;
                String content = "Dear user,\n\nClick the link below to reset your password:\n"
                               + resetLink + "\n\nIf you didn't request this, please ignore this email.";

                helper.setText(content);

                mailSender.send(message);
                System.out.println("✅ Reset link sent to " + email);

            } catch (Exception e) {
                System.out.println("❌ Failed to send reset email");
                e.printStackTrace();
            }
        }
    }

    @Override
    public User getUserByResetToken(String token) {
        return userRepository.findByResetToken(token);
    }

	@Override
	public boolean resetPassword(String token, String password) {
		// TODO Auto-generated method stub
		return false;
	}
} 