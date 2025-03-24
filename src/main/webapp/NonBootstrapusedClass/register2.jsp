<!DOCTYPE html>
<html>
<head>
<title>Department Form</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

function checkDuplicate() {
    var name = $("#name").val().trim();  // Remove extra spaces
    
    if (name.length <3) {  // Avoid unnecessary API calls for short names
        $("#nameError").html("");
        $("#submitBtn").prop("disabled", false);
        return;
    }

    $.ajax({
        url: "/checkExistName",  
        type: "POST",
        data: { name: name },
        contentType: "application/x-www-form-urlencoded", // Needed for @RequestParam

        success: function(response) {
        	 
            if (response==true) {  
                $("#nameError").html("<span style='color:red;'>Name already exists!</span>");
                $("#submitBtn").prop("disabled", true);
            } else {
                $("#nameError").html("");
                $("#submitBtn").prop("disabled", false);
            }
        },
        error: function(xhr, status, error) {
            
            $("#nameError").html("<span style='color:red;'>Error checking name!</span>");
            $("#submitBtn").prop("disabled", false);
        }
    });
}
</script>

</head>
<body>
	<h2>Department Registration Form</h2>
	<form action="saveDepartment" method="post"
		enctype="multipart/form-data">

		<label>Name:</label> <input type="text" id="name" name="name" required
			onkeyup="checkDuplicate()"><br> <br> <span
			id="nameError"></span><br> <br> <label>Upload File:</label>
		<input type="file" id="file" name="file" accept="application/pdf"
			required><br> <br> <label>Mobile:</label> <input
			type="number" id="mobile" name="mobile" required><br> <br>

		<select name="city" required>
			<option value="">Select</option>
			<option value="Delhi">Delhi</option>
			<option value="Noida">Noida</option>
			<option value="Jaipur">Jaipur</option>
		</select> 
		<br> <br> <label>Address:</label>
		<textarea id="address" name="address" required></textarea>
		<br> <br>

		<button id="submitBtn" type="submit">submit</button>
	</form>


</body>
</html>
