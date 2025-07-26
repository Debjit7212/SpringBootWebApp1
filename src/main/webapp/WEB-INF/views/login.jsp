
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Login - Student Management</title>

  <!-- Bootstrap CSS & Font Awesome -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

  <style>
    body {
      background: #f8f9fa;
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

    .hero-section {
      position: relative;
    }

    .hero-img {
      width: 100%;
      max-height: 300px;
      object-fit: cover;
      filter: brightness(0.75);
    }

    .hero-text {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      color: #fff;
      text-align: center;
    }

    .hero-text h1 {
      font-size: 2.5rem;
      font-weight: bold;
    }

    .login-panel {
      background: #fff;
      border: 1px solid #ccc;
      padding: 1.5rem;
      border-radius: 5px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
    }

    footer {
      background: #004080;
      color: #fff;
      text-align: center;
      padding: 1rem;
      margin-top: 2rem;
    }

    footer a {
      color: #fff;
      text-decoration: none;
    }

    .btn-icon {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 5px;
    }
  </style>
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

  <!-- Hero Section -->
  <div class="hero-section">
    <img class="hero-img" src="https://img.freepik.com/free-photo/group-multiethnic-students-standing-hall_1303-21185.jpg" alt="Student Banner" />
    <div class="hero-text">
      <h1>Welcome </h1>
      <p>Login to your student account below</p>
    </div>
  </div>

  <!-- Login Form Section -->
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="login-panel">
          <h4 class="text-center mb-3">Login to Your Account</h4>

          <!-- Error Message -->
          <c:if test="${not empty errorMsg}">
            <div class="alert alert-danger text-center">${errorMsg}</div>
          </c:if>

          <form action="loginForm" method="post">
            <div class="mb-3">
              <label for="email" class="form-label">Email:</label>
              <input type="email" name="email" class="form-control" required>
            </div>

            <div class="mb-3">
              <label for="password" class="form-label">Password:</label>
              <input type="password" name="password" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-primary w-100 btn-icon">
              <i class="fas fa-sign-in-alt"></i> Login
            </button>

            <hr />
            <a href="${pageContext.request.contextPath}/regpage" class="btn btn-success w-100 mb-2"> Register Now</a>
            <a href="${pageContext.request.contextPath}/forgotPassword" class="btn btn-outline-warning w-100"> Forgot Password?</a>
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
        <a href="mailto:debjitpaul55555@gmail.com">debjitpaul55555@gmail.com</a>
      </p>
      <p>
        <a href="http://www.linkedin.com/in/debjit-paul-b088a031b" target="_blank">
          <i class="fab fa-linkedin fa-lg"></i> LinkedIn
        </a>
      </p>
      <p class="mt-3 mb-0">&copy; 2025 Student Management System. All rights reserved.</p>
    </div>
  </footer>

  <!-- JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
