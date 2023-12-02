
document.getElementById('myForm').addEventListener('submit', function(event) {
  var inputs = ['input1', 'input2', 'radio', 'input3', 'input6', 'input7', 'input8', 'input9'];
  var formIsValid = true;
   var validationMessage = '';
   
 // state and city validation -------------------------------------  
   
   var selectInput1 = document.getElementById('stateSelect');
  var selectInput2 = document.getElementById('citySelect');
  
  
    if (!selectInput2.value) {
    formIsValid = false;
    selectInput2.classList.add('error-input');
    validationMessage = 'Please select city';
  }else{
	 selectInput2.classList.remove('error-input'); 
  }
  
  
   if (!selectInput1.value) {
    formIsValid = false;
    selectInput1.classList.add('error-input');
    validationMessage = 'Please select State';
  } else{
	selectInput1.classList.remove('error-input');  
  }
  
 //  --------------------------------------------
   
   
 
 // mobile and aadhar number validation -------------------------------  
   
   var numberInput1 = document.getElementById('input4');
  var numberInput2 = document.getElementById('input5');
  
  
  if (numberInput2.value.length !== 12) {
    formIsValid = false;
    numberInput2.classList.add('error-input');
    validationMessage = 'Aadhar Number must be 12 digits.';
  } else {
    numberInput2.classList.remove('error-input');
  }
  
  
  if (numberInput1.value.length !== 10) {
    formIsValid = false;
    numberInput1.classList.add('error-input');
    validationMessage = 'Mobile Number must be 10 digits.';
  } else {
    numberInput1.classList.remove('error-input');
  }
  
 //-------------------------------------------
 
 
 
 // gender validation -----------------------
   
   
   var genderRadio = document.querySelectorAll('input[name="gender"]');
  var isGenderSelected = Array.from(genderRadio).some(function(radio) {
    return radio.checked;
  });

  if (!isGenderSelected) {
    formIsValid = false;
    validationMessage = 'Please choose gender.';
  }
  
  // ----------------------------------------------
  
  
  
  
  // all inputs validaiton -------------------------------

inputs.forEach(function(inputId) {
    var inputElement = document.getElementById(inputId);
    
    if (!inputElement.value) {
      formIsValid = false;
      inputElement.classList.add('error-input');
      validationMessage = 'Please fill in all required fields.';
    } else {
      inputElement.classList.remove('error-input');
    }
  });

//  -----------------------------------------------


  if (!formIsValid) {
    event.preventDefault();
    alert(validationMessage);
  }
});

// ------------------------------------------





// state logic ----------------------------------

$("#stateSelect").focus(function(){
	
	$.ajax({
		method: "post",
		url: "http://localhost:8080/Employee_Management_System_Project/State_city",
		data:{
			main:"success"
		},
		success: function(data){
			//console.log(data);
			//alert(data);
			
			if($("#stateSelect").empty()){
			
			$("#stateSelect").append(data);
			
			}
		}
		
	})
	
})

// ---------------------------------------------



// city logic  ---------


$("#citySelect").focus(function(){
	
	var select = $("#stateSelect").val();
	
	$.ajax({
		
		url: "../City",
		method: "post",
		data:{
			main:select
		},
		success: function(data){
		//	console.log(data);
		//	alert(data);
		
		if($("#citySelect").empty())
			$("#citySelect").append(data);
		}
		
	})
	
})

// ----------------------------------------------


// Department Logic -----------------------------------


$("#department").on('focus' , function(){
	
	
$.ajax({
	
method: "post",
url: "../Departnemt",

data: {
	
	select: "success"
},
success: function(data){
	/*alert(data);*/
	if($("#department").empty()){
		$("#department").append(data);
	}
	
}
	
})		
	
})


// -------------------------------------------------

//   age logic --------------------------------------

function calculateAge() {
  const dobInput = document.getElementById("input2");
  const ageInput = document.getElementById("age");

  const dobValue = new Date(dobInput.value);
  const today = new Date();

  let age = today.getFullYear() - dobValue.getFullYear();

  const dobMonth = dobValue.getMonth();
  const dobDay = dobValue.getDate();
  const currentMonth = today.getMonth();
  const currentDay = today.getDate();

  if (
    currentMonth < dobMonth ||
    (currentMonth === dobMonth && currentDay < dobDay)
  ) {
    age--;
  }

  ageInput.value = age;
}

// -----------------------------------------------------