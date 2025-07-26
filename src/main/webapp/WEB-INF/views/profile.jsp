<!DOCTYPE html>
	<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Student Registration</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		    <link rel="stylesheet" href="css/profile.css"/>
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
	
	    <!-- Navbar -->
		<body class="body_bg">
				    
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
	        <li><a class="dropdown-item" href="index.html">Home</a></li>
	        <li><a class="dropdown-item" href="contact_us.html">Contact Us</a></li>
	    </ul>
	</li>
	                
	            </ul>
	        </div>
	    </div>
	</nav>
	               

    
    <form action="newproForm" method="post" onsubmit="validateForm(event)">
		<a>Welcome ${modelName}</a><br/>
		<div style="background-color: green; color: white; text-align: center; padding: 10px; font-weight: bold;">
		    Student Details
		</div>

        <!-- Name Validation -->
        First Name: <input type="text" name="firstName" id="firstName" oninput="validateName(this)" required />
        Last Name: <input type="text" name="lastName" id="lastName" oninput="validateName(this)" required />
        <br/>
		
		        <!-- Name Validation -->
		       Father's Name: <input type="text" name="FathersName" id="FathersName" oninput="validateName(this)" required />
		        <br/>
        
				
				                Email:
								<input type="email"  value="${userEmail}" readonly required>

				            <br/>
							
        
        Phone No: <input type="text" name="phoneno" id="phoneno" oninput="validatePhone(this)" required maxlength="10" />
        <p id="phone-error" style="color: red; display: none;">Phone number must be exactly 10 digits!</p>
        <br/>
		Pin No: <input type="text" name="PinNo" id="PinNo" oninput="validatePin(this)" required maxlength="6" />
		<p id="pin-error" style="color: red; display: none;">PIN number must be exactly 6 digits!</p>
		<br/>


        <!-- State Dropdown -->
        <label for="state">Select State:</label>
        <select id="state" name="state" class="form-select" onchange="updateCities()">
            <option selected disabled>Select a State</option>
        </select>

        <!-- City Dropdown -->
        <label for="city">Select City:</label>
        <select id="city" name="city" class="form-select">
            <option selected disabled>Select a City</option>
        </select>
        <br/>
		<div>
					<label for="Gender">Gender:</label>
					<select  id="Gender" name="Gender"class="form-select" aria-label="Default select example">
					 
					  <option value="Male">Male</option>
					  <option value="Female">Female</option>
					  <option value="Others">Others</option>
					</select>
					</div> <br/>

		
        <!-- Terms and Conditions -->
        <div class="col-12 checkbox-container">
            <input class="form-check-input" type="checkbox" id="invalidCheck" required> 
            <label class="form-check-label" for="invalidCheck">
				Agree to terms and conditions  
            </label>
            
        </div>
        <br/>
		<div>
			

        <!-- Submit Button -->
        <button class="btn btn-primary" type="submit">Submit form</button>
    </form>

    <br/>
    <a href="/logout"><b>Logout</b></a>

    <!-- Link JavaScript File -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="script1.js"></script>
</body>
</html>
