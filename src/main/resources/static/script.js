let otpVerified = false; // Track OTP status

function validateName(input) {
    const regex = /^[A-Za-z\s]*$/;
    if (!regex.test(input.value)) {
        input.value = input.value.replace(/[^A-Za-z\s]/g, '');
    }
}

function validateForm(event) {
    let email = document.getElementById("email").value.trim();
    let password = document.getElementById("password").value;
    let phone = document.getElementById("phoneno").value.trim();

    let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    let phoneRegex = /^\d{10}$/;
    let isValid = true;

    if (!emailRegex.test(email)) {
        document.getElementById("email-error").style.display = "block";
        isValid = false;
    } else {
        document.getElementById("email-error").style.display = "none";
    }

    if (password.length < 6) {
        document.getElementById("password-error").style.display = "block";
        isValid = false;
    } else {
        document.getElementById("password-error").style.display = "none";
    }

    if (!phoneRegex.test(phone)) {
        document.getElementById("phone-error").style.display = "block";
        isValid = false;
    } else {
        document.getElementById("phone-error").style.display = "none";
    }

    if (!otpVerified) {
        alert("Please verify your OTP before submitting.");
        isValid = false;
    }

    if (!isValid) {
        event.preventDefault();
    }
}

function sendOtp() {
    const email = document.getElementById('email').value.trim();
    if (email === "") {
        alert("Please enter your email to get OTP.");
        return;
    }

    fetch('/otp/send?email=' + encodeURIComponent(email), {
        method: 'POST'
    })
    .then(res => res.text())
    .then(msg => {
        alert(msg);
        document.getElementById('otp-section').style.display = 'block';
    })
    .catch(err => {
        alert("Failed to send OTP.");
        console.error(err);
    });
}

function verifyOtp() {
    const otp = document.getElementById('otp').value.trim();
    if (otp === "") {
        alert("Please enter the OTP");
        return;
    }

    fetch('/otp/verify?otp=' + otp, {
        method: 'POST'
    })
    .then(res => res.text())
    .then(msg => {
        alert(msg);
        if (msg.toLowerCase().includes("success")) {
            otpVerified = true;

            const registerBtn = document.getElementById("register-btn");
            registerBtn.disabled = false;
            registerBtn.style.backgroundColor = "#4CAF50"; // Green when ready
        } else {
            otpVerified = false;
        }
    })
    .catch(error => {
        alert("Error verifying OTP.");
        console.error(error);
    });
}
