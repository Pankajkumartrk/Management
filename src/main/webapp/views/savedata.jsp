<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <title>Department Data Saved</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .container {
            margin-top: 50px;
        }
    </style>
</head>
<body class="bg-light">

    <div class="container">
        <h2 class="text-success text-center">Department Data Saved Successfully</h2>
        
      

        <table class="table table-bordered table-striped mt-4">
            <thead class="table-dark">
                <tr>
                    <th>S.No</th>
                    <th>Name</th>
                    <th>File</th>
                    <th>Mobile</th>
                    <th>City</th>
                    <th>Address</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="department" items="${dlst}">
                    <tr>
                        <td>${department.sno}</td>
                        <td>${department.name}</td>
                        <td>${department.file}</td>
                        <td>${department.mobile}</td>
                        <td>${department.city}</td>
                        <td>${department.address}</td>
                        <td>
                            <a href="/edit/${department.sno}" class="btn btn-warning btn-sm">Edit</a>
                            <a href="/delete/${department.sno}" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="text-center mt-4">
            <a href="register-dep" class="btn btn-primary">Register New Department</a>
        </div>
    </div>

    

</body>
</html>
