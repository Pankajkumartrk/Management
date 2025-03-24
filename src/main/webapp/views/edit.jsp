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
        <h2 class="text-center text-primary"> Edit Department</h2>

        <form action="/update" method="post" enctype="multipart/form-data" class="mt-4">
            
            <div class="mb-3">
                <label class="form-label">S.No:</label>
                <input type="text" class="form-control" value="${department.sno}" name="sno" readonly>
            </div>

            <div class="mb-3">
                <label class="form-label">Name:</label>
                <input type="text" class="form-control" value="${department.name}" name="name" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Upload File:</label>
                <input type="file" class="form-control" id="file"  value="${department.file}" name="file" accept="application/pdf" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Mobile:</label>
                <input type="number" class="form-control" id="mobile" name="mobile" value="${department.mobile}"  maxlength="10" required>
            </div>

            <div class="mb-3">
                <label class="form-label">City:</label>
                <input type="text" class="form-control" id="city" name="city" value="${department.city}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Address:</label>
                <textarea class="form-control" id="address" name="address" required>${department.address}</textarea>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-success"> Update</button>
                <a href="/list-dep" class="btn btn-secondary"> Cancel</a>
            </div>
        </form>
    </div>

    
</body>
</html>
