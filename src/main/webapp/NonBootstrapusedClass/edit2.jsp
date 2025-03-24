<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit Department</title>
</head>
<body>
    <h2>Department Registration Form</h2>
    <form action="/update" method="post" enctype="multipart/form-data">
        
        <label>S.No:</label>
        <input type="text" value="${department.sno}" name="sno" readonly><br><br>
        
        <label>Name:</label>
        <input type="text" value="${department.name}" name="name" required><br><br>
        
        <label>Upload File:</label>
        <input type="file" id="file" name="file" accept="application/pdf"><br><br>
        
        <label>Mobile:</label>
        <input type="number" id="mobile" name="mobile" value="${department.mobile}" required><br><br>
        
        <label>City:</label>
        <input type="text" id="city" name="city" value="${department.city}" required><br><br>
        
        <label>Address:</label>
        <textarea id="address" name="address" required>${department.address}</textarea><br><br>
        
        <button type="submit">update</button>
    </form>
</body>
</html>
