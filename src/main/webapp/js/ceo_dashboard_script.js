$("#btn_m").on('click', function(){
    const name = $("#input1").val();
    const department = $("#input3").val();
 

    const searchParams = {};

    if (name.trim() !== "") {
        searchParams.name = name;
    }
    if (department.trim() !== "") {
        searchParams.department = department;
    }

    
      if ($.isEmptyObject(searchParams)) {
        alert("At least one field is required.");
        return;
    }
    


    $.ajax({
        url: "../Ceo_manager_search",
        method: "post",
        data: searchParams,
        success: function(data) {
			console.log(searchParams);
            if (data.trim() === "") {
                alert("Manager Not Found.");
                $("#tbody").empty();
            } else {
                $("#tbody").empty().append(data);
            }
        }
    });
});



function showButtonClick(m_id){
	
	let input = m_id;
	
	 $.ajax({
        url: "../Show_emps_to_ceo",
        method: "post",
        data: {
			m_id:input,
			main:"success"
		},
        success: function(data) {
			/*console.log(data);*/
			
		$("#t_body").empty().append(data);
            
        }
    });
	
};
	
	
	











           




           
