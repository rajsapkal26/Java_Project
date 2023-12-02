
const stored_username = "admin";
const stored_password = "admin";

const form = document.getElementById("form");

form.addEventListener("submit", function(event) {
    

    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;

    if(username === ""){
		alert("username is Empty");
		   event.preventDefault();
	}else if(password=== ""){
			alert("Password is Empty");
			   event.preventDefault();
	}else if (username !== stored_username || password !== stored_password) {
        alert("Invalid username or password");
           event.preventDefault();
    } else {
       
       
    }
});

		