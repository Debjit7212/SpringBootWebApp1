<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background-color: #f8f9fa;
        }

        .reset-box {
            margin-top: 100px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 reset-box">
            <h4 class="text-center mb-4">Reset Your Password</h4>

            <!-- Success Message -->
            <c:if test="${not empty success}">
                <div class="alert alert-success">${success}</div>
            </c:if>

            <!-- Error Message -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>

            <!-- Reset Password Form -->
            <form action="${pageContext.request.contextPath}/resetPassword" method="post" onsubmit="return validatePasswordMatch()">
                <input type="hidden" name="token" value="${token}" />

                <div class="mb-3">
                    <label for="password" class="form-label">New Password</label>
                    <input type="password" name="password" class="form-control" id="password" required>
                </div>

                <div class="mb-3">
                    <label for="confirmPassword" class="form-label">Confirm New Password</label>
                    <input type="password" name="confirmPassword" class="form-control" id="confirmPassword" required>
                </div>

                <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" id="showPassword" onclick="togglePassword()">
                    <label class="form-check-label" for="showPassword">Show Password</label>
                </div>

                <button type="submit" class="btn btn-success w-100">Update Password</button>
            </form>

            <div class="text-center mt-3">
                <a href="${pageContext.request.contextPath}/loginPage">Back to Login</a>
            </div>
        </div>
    </div>
</div>

<!-- JS Section -->
<script>
    function togglePassword() {
        const pwd = document.getElementById("password");
        const confirm = document.getElementById("confirmPassword");
        pwd.type = pwd.type === "password" ? "text" : "password";
        confirm.type = confirm.type === "password" ? "text" : "password";
    }

    function validatePasswordMatch() {
        const pwd = document.getElementById("password").value;
        const confirm = document.getElementById("confirmPassword").value;
        if (pwd !== confirm) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    }
</script>

</body>
</html>
