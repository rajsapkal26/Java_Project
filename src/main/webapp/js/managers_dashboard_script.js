$("#btn_m").on('click', function(){
    const name = $("#input1").val();
    const mobile = $("#input2").val();
    const designation = $("#input3").val();
    const aadhar = $("#input4").val();

    const searchParams = {};

    if (name.trim() !== "") {
        searchParams.name = name;
    }
    if (designation.trim() !== "") {
        searchParams.designation = designation;
    }
    if (mobile.trim() !== "") {
        searchParams.mobile = mobile;
    }
    if (aadhar.trim() !== "") {
        searchParams.aadhar = aadhar;
    }
    
    
      if ($.isEmptyObject(searchParams)) {
        alert("At least one field is required.");
        return;
    }
    

    $.ajax({
        url: "http://localhost:8080/Employee_Management_System_Project/Manager_emp_search",
        method: "post",
        data: searchParams,
        success: function(data) {
			console.log(searchParams);
            if (data.trim() === "") {
                alert("Employee Not Found.");
                $("#tbody").empty();
            } else {
                $("#tbody").empty().append(data);
            }
        }
    });
});








           
