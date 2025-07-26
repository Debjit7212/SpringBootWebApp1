

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    
    
<style type="text/css">
    /* Green background for Register and Login buttons */
.custom-bg {
    background-color: green !important;
    color: white !important;
    padding: 8px 15px;
    border-radius: 5px;
    text-align: center;
    display: inline-block;
}
.body_bg
{
	background-color: aqua;
}
 

/* Change the MENU button background to Navy Blue */
.navbar .nav-item.dropdown .nav-link {
    background-color: #000080 !important; /* Navy Blue */
    color: white !important;
    padding: 8px 15px;
/* Ensure dropdown menu has a matching Navy Blue background */
.navbar .dropdown-menu {
    background-color: #000080 !important; /* Navy Blue */
    border: none;
}

/* Dropdown items styling */
.navbar .dropdown-menu .dropdown-item {
    color: white !important;
}

/* Change dropdown item hover effect */
.navbar .dropdown-menu .dropdown-item:hover {
    background-color: #001F5B !important; /* Darker Navy Blue */
}

/* Change the dropdown menu background color to saffron */
.navbar .dropdown-menu {
    background-color: #FF9933 !important; /* Saffron Color */
    border: none; /* Remove default border */
}

/* Change dropdown menu text color for better visibility */
.navbar .dropdown-menu .dropdown-item {
    color: white !important; /* White text */
}

/* Change dropdown item hover effect */
.navbar .dropdown-menu .dropdown-item:hover {
    background-color: darkorange !important; /* Darker saffron on hover */
}




    </style>
</head>
<body class="body_bg">
    <!-- Navbar -->
    
               <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Student Management</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                
                <li class="nav-item">
                    <a class="nav-link custom-bg" href="regpage">Applicant Registration</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link custom-bg" href="loginPage">Login</a>
                </li>
                
                <!-- Dropdown Menu -->
                <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        MENU
    </a>
    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
        <li><a class="dropdown-item" href="#">Home</a></li>
        <li><a class="dropdown-item" href="contact_us.html">Contact Us</a></li>
    </ul>
</li>
                
            </ul>
        </div>
    </div>
</nav>
               
    
    <!-- Main Content -->
   <!-- Main Content -->
<div class="container container-custom mt-4">
    
	<h4>Register Here</h4>

	    <c:if test="${not empty successMsg}">
	        <h4 style="color:green">${successMsg}</h4>
	    </c:if>
	    <c:if test="${not empty errorMsg}">
	        <h4 style="color:red">${errorMsg}</h4>
	    </c:if>

	    <form action="regForm" method="post" onsubmit="validateForm(event)">
	        <!-- Name Validation -->
	        Name: <input type="text" name="name" id="name" oninput="validateName(this)" required />
	        <br/><br/>

	        <!-- Email Validation -->
	        Email: <input type="text" name="email" id="email" required />
	        <p id="email-error" style="color: red; display: none;">Enter a valid email format!</p>
			
	        <br/><br/>
			


	        <!-- Password Validation -->
	        Password: <input type="password" name="password" id="password" required />
	        <p id="password-error" style="color: red; display: none;">Password must be at least 6 characters long!</p>
	        <br/><br/>

	        <!-- Phone Number Validation -->
	        Phone No: <input type="text" name="phoneno" id="phoneno" required maxlength="10" />
	        <p id="phone-error" style="color: red; display: none;">Phone number must be exactly 10 digits!</p>
	        <br/><br/>

	        <input type="submit" value="Register" />
	    </form>
		<br/><br/>
		   If already registered...? <a href="loginPage"><b>Click Here</b></a>
</div>

   
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="script.js"></script>
</body>
</html>


