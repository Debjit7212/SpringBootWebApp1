<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Registration Complete - Student Management System</title>
  <link rel="stylesheet" href="css/style.css" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <style>
	body.body_bg {
	  font-family: 'Segoe UI', Tahoma, sans-serif;
	  background: linear-gradient(to right, #f0f4f7, #d9e2ec);
	  margin: 0;
	  padding: 0;
	  color: #333;
	}

	.container {
	  max-width: 800px;
	  margin: 60px auto;
	  background: #ffffff;
	  border-radius: 12px;
	  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
	  padding: 40px 30px;
	}

	.header h1 {
	  text-align: center;
	  color: #2e86de;
	  font-size: 2.2rem;
	}

	.main-content h2 {
	  text-align: center;
	  color: #333;
	  font-size: 1.5rem;
	  margin-top: 20px;
	}

	.student-message,
	.student-quote {
	  text-align: center;
	  font-size: 1.1rem;
	  margin: 15px auto;
	  max-width: 600px;
	  line-height: 1.6;
	}

	.student-quote {
	  font-style: italic;
	  color: #00796b;
	}

	.success-msg {
	  text-align: center;
	  color: #28a745;
	  font-weight: bold;
	  margin-top: 15px;
	}

	.actions {
	  text-align: center;
	  margin-top: 30px;
	}

	.logout-btn {
	  background-color: #e74c3c;
	  color: white;
	  padding: 12px 25px;
	  text-decoration: none;
	  border-radius: 6px;
	  font-weight: bold;
	  transition: background-color 0.3s ease;
	}

	.logout-btn:hover {
	  background-color: #c0392b;
	}

	.footer {
	  text-align: center;
	  margin-top: 40px;
	  font-size: 0.9em;
	  color: #777;
	}
	         



	</style>
</head>
<body class="body_bg">
  <div class="container">
    <header class="header">
      <h1> Registration Successful!</h1>
    </header>

    <main class="main-content">
      <section class="message-section">
        <h2>Welcome to the Student Management System</h2>

        <p class="student-message">
          Your registration is now complete. You are officially part of a journey filled with learning, growth, and success.
        </p>

        <p class="student-quote">
          Student life is not about perfection, it's about progression. Keep pushing forward and make your dreams a reality
        </p>

        <c:if test="${not empty successMsg}">
          <p class="success-msg">${successMsg}</p>
        </c:if>
      </section>

      <div class="actions">
        <a href="/logout" class="logout-btn"><strong>Logout</strong></a>
      </div>
    </main>

    <footer class="footer">
      <p>&copy; 2025 Student Management System | All rights reserved.</p>
    </footer>
  </div>
</body>
</html>
