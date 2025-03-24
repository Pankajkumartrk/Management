<!DOCTYPE html>
<html lang="en">
<head>
   
    <title>Department Form</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

     <!--<script>
     function checkDuplicate() {
            var name = $("#name").val().trim(); 
            
            if (name.length < 3) {  
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
                    if (response == ${existValue}) {  
                        $("#nameError").html("<span class='text-danger'>Name already exists!</span>");
                        $("#submitBtn").prop("disabled", ${existValue});
                    } else {
                        $("#nameError").html("");
                        $("#submitBtn").prop("disabled", ${NotexistValue});
                    }
                },
                error: function(xhr, status, error) {
                    $("#nameError").html("<span class='text-danger'>Error checking name!</span>");
                    $("#submitBtn").prop("disabled", ${NotexistValue});
                }
            });
        }
        function checkMobile()
        {
        	var mobile=$('#mobile').val().trim();
        	var mobilValid=/^[0-9]{10}$/;
        	 if (mobile.length === 0 || !mobileValid.test(mobile)) 
        		{
        		 $("#nameError").html("<span class='text-danger'>Number should contain 10 digit only !</span>");
        		}
        	else{
        		 $("#nameError").html("");
        	}
        	
        }
        
    </script> -->

    <style>
        .container {
            max-width: 500px;
            margin-top: 50px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body class="bg-light">

    <div class="container">
        <h2 class="text-center text-primary">Department Registration Form</h2>
        <form action="saveDepartment" method="post" enctype="multipart/form-data">

            <!-- Name Field -->
            <div class="mb-3">
                <label class="form-label">Name:</label>
              <!--   <input type="text" class="form-control" id="name" name="name" required onkeyup="checkDuplicate()"> -->
                <input type="text" class="form-control" id="name" name="name" required >
                <!-- <span id="nameError"></span> -->
            </div>

            <!-- File Upload -->
            <div class="mb-3">
                <label class="form-label">Upload File:</label>
                <input type="file" class="form-control" id="file" name="file" accept="application/pdf" required>
            </div>

            <!-- Mobile Number -->
            <div class="mb-3">
                <label class="form-label">Mobile:</label>
              <!--    <input type="text" class="form-control" id="mobile" name="mobile"  maxlength="10" oninput="checkMobile()" required>-->
                <input type="text" class="form-control" id="mobile" name="mobile"  maxlength="10"  required>
           <span id="nameError"></span>
            </div>

            <!-- City Selection -->
            <div class="mb-3">
                <label class="form-label">City:</label>
                <select class="form-select" name="city" required>
                    <option value="">Select</option>
                    <option value="Delhi">Delhi</option>
                    <option value="Noida">Noida</option>
                    <option value="Jaipur">Jaipur</option>
                </select>
            </div>

            <!-- Address -->
            <div class="mb-3">
                <label class="form-label">Address:</label>
                <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
            </div>

            <!-- Submit Button -->
            <div class="text-center">
                <button id="submitBtn" type="submit" class="btn btn-success">Submit</button>
            </div>

        </form>
    </div>

    

</body>
</html>
