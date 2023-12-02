$(document).ready(function() {
    
  
	   
	   let employeeid = $("#employeeid").val();
	   let workid = $("#workid").val();
	   let message = $("#message").val();
	   let managerid = $("#managerid").val();
	   
	   $.ajax({
		method: "post",
		url: "../Manager_messages_entry",
		data: {
			employeeid :employeeid,
			workid:workid,
			message:message,
			managerid:managerid
		},
		success: function(data){
			
			console.log(data);
			
			$("#m_message").append(data);
		}
		
	})
	
});




$(document).ready(function() {
	
	
	 let employeeid = $("#employeeid").val();
	   let workid = $("#workid").val();
	   let message = $("#message").val();
	   let managerid = $("#managerid").val();
    
    $.ajax({
		method: "post",
		url: "../Show_emp_messages",
		data: {
			employeeid :employeeid,
			workid:workid,
			message:message,
			managerid:managerid
		},
		success: function(data){
		
			console.log(data);
			
			$("#e_message").append(data);
		}
		
	})
 
});