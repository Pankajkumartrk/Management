<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <title>Edit Department</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .container {
            max-width: 600px;
            margin-top: 50px;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body class="bg-light">

    <div class="container">
        <h2 class="text-center text-primary">  Department</h2>

        <form action="/searchAll"  method="get"  class="mt-4">
          
            
             <div class="mb-3">
                <label class="form-label">Department Search By City:</label>
              <input type="text" name="filters"   class="form-control"   >
                
            </div>
            
            
            <div class="text-center">
                <button type="submit" class="btn btn-success"> Search</button>
                
            </div>
        </form>
    </div>

    
</body>
</html>
