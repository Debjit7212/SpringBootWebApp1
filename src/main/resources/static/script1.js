
function validateName(input) {
            let regex = /^[A-Za-z\s]*$/; // Allows only alphabets and spaces
            if (!regex.test(input.value)) {
                input.value = input.value.replace(/[^A-Za-z\s]/g, ''); // Remove non-alphabetic characters
            }
        }
		function validateName(input) {
		            let regex = /^[A-Za-z\s]*$/; // Allows only alphabets and spaces
		            if (!regex.test(input.value)) {
		                input.value = input.value.replace(/[^A-Za-z\s]/g, ''); // Remove non-alphabetic characters
		            }
		        }

		        function validateForm(event) {
					
		            let email = document.getElementById("email").value;
		           
		            let phone = document.getElementById("phoneno").value;

		            let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // Email format
		            let phoneRegex = /^\d{10}$/; // Exactly 10 digits
					            

		            let isValid = true;

		            // Validate Email
		            if (!emailRegex.test(email)) {
		                document.getElementById("email-error").style.display = "block";
		                isValid = false;
		            } else {
		                document.getElementById("email-error").style.display = "none";
		            }

		            

		            // Validate Phone Number
		            if (!phoneRegex.test(phone)) {
		                document.getElementById("phone-error").style.display = "block";
		                isValid = false;
		            } else {
		                document.getElementById("phone-error").style.display = "none";
		            }

		            // Prevent form submission if validation fails
		            if (!isValid) {
		                event.preventDefault();
		            }
		        }
				

				


				function validatePin(input) {
				    const pinPattern = /^[1-9][0-9]{5}$/; // PIN must be 6 digits, first digit non-zero
				    const pinError = document.getElementById("pin-error");

				    if (!pinPattern.test(input.value)) {
				        pinError.style.display = "block"; // Show error message
				    } else {
				        pinError.style.display = "none"; // Hide error message
				    }
				}


									// List of Indian states and their cities
									const stateCityMap = {
									    "Andhra Pradesh": ["Visakhapatnam", "Vijayawada", "Guntur"],
									    "Arunachal Pradesh": ["Itanagar", "Naharlagun"],
									    "Assam": ["Guwahati", "Silchar", "Dibrugarh"],
									    "Bihar": ["Patna", "Gaya", "Bhagalpur"],
									    "Chhattisgarh": ["Raipur", "Bilaspur", "Durg"],
									    "Goa": ["Panaji", "Margao", "Mapusa"],
									    "Gujarat": ["Ahmedabad", "Surat", "Vadodara"],
									    "Haryana": ["Chandigarh", "Gurgaon", "Faridabad"],
									    "Himachal Pradesh": ["Shimla", "Manali", "Dharamshala"],
									    "Jharkhand": ["Ranchi", "Jamshedpur", "Dhanbad"],
									    "Karnataka": ["Bangalore", "Mysore", "Mangalore"],
									    "Kerala": ["Kochi", "Thiruvananthapuram", "Kozhikode"],
									    "Madhya Pradesh": ["Bhopal", "Indore", "Gwalior"],
									    "Maharashtra": ["Mumbai", "Pune", "Nagpur"],
									    "Manipur": ["Imphal"],
									    "Meghalaya": ["Shillong"],
									    "Mizoram": ["Aizawl"],
									    "Nagaland": ["Kohima", "Dimapur"],
									    "Odisha": ["Bhubaneswar", "Cuttack", "Puri"],
									    "Punjab": ["Amritsar", "Ludhiana", "Jalandhar"],
									    "Rajasthan": ["Jaipur", "Udaipur", "Jodhpur"],
									    "Sikkim": ["Gangtok"],
									    "Tamil Nadu": ["Chennai", "Coimbatore", "Madurai"],
									    "Telangana": ["Hyderabad", "Warangal", "Nizamabad"],
									    "Tripura": ["Agartala"],
									    "Uttar Pradesh": ["Lucknow", "Varanasi", "Agra"],
									    "Uttarakhand": ["Dehradun", "Haridwar", "Nainital"],
									    "West Bengal": ["Kolkata", "Darjeeling", "Siliguri"],
									    "Delhi": ["New Delhi"]
									};

									// Populate the state dropdown
									function populateStates() {
									    const stateSelect = document.getElementById("state");
									    Object.keys(stateCityMap).forEach(state => {
									        let option = document.createElement("option");
									        option.value = state;
									        option.textContent = state;
									        stateSelect.appendChild(option);
									    });
									}

									// Populate the city dropdown when a state is selected
									function updateCities() {
									    const stateSelect = document.getElementById("state");
									    const citySelect = document.getElementById("city");
									    const selectedState = stateSelect.value;

									    // Clear previous city options
									    citySelect.innerHTML = '<option selected disabled>Select a City</option>';

									    // If a valid state is selected, populate cities
									    if (stateCityMap[selectedState]) {
									        stateCityMap[selectedState].forEach(city => {
									            let option = document.createElement("option");
									            option.value = city;
									            option.textContent = city;
									            citySelect.appendChild(option);
									        });
									    }
									}

									// Load states when the page loads
									window.onload = populateStates;
									
		