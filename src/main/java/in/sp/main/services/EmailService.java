package in.sp.main.services;



	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.mail.javamail.JavaMailSender;
	import org.springframework.mail.javamail.MimeMessageHelper;
	import org.springframework.stereotype.Service;

	import jakarta.mail.MessagingException;
	import jakarta.mail.internet.MimeMessage;
	import java.util.Random;

	@Service
	public class EmailService {

	    @Autowired
	    private JavaMailSender mailSender;

	    // Generate 6-digit OTP
	    public String generateOTP() {
	        Random random = new Random();
	        int otp = 100000 + random.nextInt(900000); // Ensures a 6-digit OTP
	        return String.valueOf(otp);
	    }

	    // Send OTP Email
	    public boolean sendOTP(String toEmail, String otp) {
	        try {
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true);

	            helper.setTo(toEmail);
	            helper.setSubject("Your OTP Code");
	            helper.setText("Your OTP code is: " + otp);

	            mailSender.send(message);
	            return true;
	        } catch (MessagingException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

		
	}

