<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
     <title>Department Error</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .container {
            max-width: 500px;
            margin-top: 100px;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
    </style>
</head>
<body class="bg-light">

    <div class="container">
        <h2 class="text-danger">Department Error</h2>
        <p class="text-muted">${error}</p>

        <div class="mt-4">
            <a href="register-dep" class="btn btn-primary"> Try Again</a>
        </div>
    </div>

  
</body>
</html>
