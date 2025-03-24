<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Department Data Saved</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .container {
            max-width: 500px;
            margin-top: 100px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
    </style>
</head>
<body class="bg-light">

    <div class="container">
        <h2 class="text-success">Department Data Saved Successfully</h2>
        
     

        <div class="mt-4">
            <a href="register-dep" class="btn btn-primary">Register Another</a>
            <a href="list-dep" class="btn btn-secondary">View Departments</a>
        </div>
    </div>

    

</body>
</html>
