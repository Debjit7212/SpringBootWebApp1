<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Register | Student Management</title>

  <!-- Bootstrap + Font Awesome -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

  <style>
    body {
      background: #f0f8ff;
      font-family: Arial, sans-serif;
    }

    .top-bar {
      background: #004080;
      color: #fff;
      padding: 5px 1rem;
      font-size: 0.9rem;
    }

    .top-bar a {
      color: #fff;
      margin-right: 15px;
      text-decoration: none;
    }

    .header {
      background: #0066cc;
      color: #fff;
      padding: 1.2rem;
    }

    .header .logo {
      font-size: 1.8rem;
      font-weight: bold;
    }

    .register-panel {
      background: #fff;
      border-radius: 5px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
      padding: 2rem;
    }

    footer {
      background: #004080;
      color: #fff;
      text-align: center;
      padding: 1rem;
      margin-top: 3rem;
    }

    footer a {
      text-decoration: none;
    }

    .btn-icon {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 6px;
    }
  </style>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

  <!-- Top Bar -->
  <div class="top-bar d-flex justify-content-end">
    <a href="/">Home</a>
    <a href="regpage">Register</a>
    <a href="loginPage">Login</a>
    <a href="contact_us.html">Contact Us</a>
  </div>

  <!-- Header -->
  <div class="header d-flex justify-content-between align-items-center">
    <div class="logo">Student Management Portal</div>
  </div>

  <!-- Register Form -->
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="register-panel">
          <h4 class="text-center mb-4 text-primary">Applicant Registration</h4>
          <form action="/regForm" method="post">
            <div class="mb-3">
              <label for="name" class="form-label">Name:</label>
              <input type="text" name="name" class="form-control" required />
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Password:</label>
              <input type="password" name="password" class="form-control" required />
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">Email:</label>
              <input type="email" name="email" id="email" class="form-control" required />
            </div>

            <div class="mb-3 text-end">
              <button type="button" class="btn btn-warning btn-icon" onclick="sendOtp()">
                <i class="fas fa-paper-plane"></i> Send OTP
              </button>
            </div>

            <div class="mb-3">
              <label for="otp" class="form-label">Enter OTP:</label>
              <input type="text" id="otp" class="form-control" />
            </div>

            <div class="mb-3 text-end">
              <button type="button" class="btn btn-info btn-icon" onclick="verifyOtp()">
                <i class="fas fa-check-circle"></i> Verify OTP
              </button>
            </div>

            <div class="text-success mb-3" id="otp-status"></div>

            <div class="mb-3">
              <input type="submit" value="Register" class="btn btn-primary w-100" id="registerBtn" disabled />
            </div>

            <div class="text-danger">${errorMsg}</div>
            <div class="text-success">${successMsg}</div>

            <div class="mt-2 text-center">
              Already registered? <a href="loginPage"><b>Click Here</b></a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <footer>
    <div class="container">
      <p><i class="fas fa-map-marker-alt me-2"></i>Medinipur, West Bengal, 721260</p>
      <p><i class="fas fa-phone me-2"></i>+91 9832677184</p>
      <p><i class="fas fa-envelope me-2"></i>
        <a href="mailto:debjitpaul55555@gmail.com" class="text-white">debjitpaul55555@gmail.com</a>
      </p>
      <p>
        <a href="http://www.linkedin.com/in/debjit-paul-b088a031b" target="_blank" class="text-white me-3">
          <i class="fab fa-linkedin fa-lg"></i> LinkedIn
        </a>
      </p>
      <p class="mt-3 mb-0">&copy; 2025 Student Management System. All rights reserved.</p>
    </div>
  </footer>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

  <!-- OTP Scripts -->
  <script>
    function sendOtp() {
      var email = $("#email").val();
      $.post("/otp/send", { email: email }, function (response) {
        alert(response);
      });
    }

    function verifyOtp() {
      var otp = $("#otp").val();
      $.post("/otp/verify", { otp: otp }, function (response) {
        $("#otp-status").text(response);
        if (response.includes("Successfully")) {
          $("#registerBtn").prop("disabled", false);
        } else {
          $("#registerBtn").prop("disabled", true);
        }
      });
    }
  </script>
</body>
</html>
