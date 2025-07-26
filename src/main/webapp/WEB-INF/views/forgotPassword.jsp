
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Forgot Password</title>

    <!-- Bootstrap & Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

    <style>
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
        }

        .top-bar {
            background: #004080;
            color: #fff;
            padding: 8px 1rem;
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
            padding: 1rem 1.5rem;
            font-size: 1.5rem;
            font-weight: bold;
        }

        .forgot-password-box {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-top: 50px;
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

        .logo {
            font-size: 1.7rem;
        }
    </style>
</head>
<body>

<!-- Top Nav -->
<div class="top-bar d-flex justify-content-end">
    <a href="/">Home</a>
    <a href="regpage">Register</a>
    <a href="loginPage">Login</a>
    <a href="contact_us.html">Contact Us</a>
</div>

<!-- Header -->
<div class="header">
    Student Management Portal
</div>

<!-- Forgot Password Form -->
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 forgot-password-box">

            <h4 class="text-center mb-4"> Forgot Password</h4>

            <!-- Success Message -->
            <c:if test="${not empty success}">
                <div class="alert alert-success" role="alert">
                    ${success}
                </div>
            </c:if>

            <!-- Error Message -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger" role="alert">
                    ${error}
                </div>
            </c:if>

            <!-- Form -->
            <form action="${pageContext.request.contextPath}/forgotPassword" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Enter Your Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="${param.email}" required>
                </div>
                <button type="submit" class="btn btn-primary w-100"> Send Reset Link</button>
            </form>

            <div class="text-center mt-3">
                <a href="${pageContext.request.contextPath}/loginPage"> Back to Login</a>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
