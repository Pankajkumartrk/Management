<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Department Data Saved</title>
</head>
<body>
	<h2>Department Data Saved Successfully</h2>
	<h2>${error}</h2>
	<table border="1">
		<tr>
			<th>S.No</th>
			<th>Name</th>
			<th>File</th>
			<th>Mobile</th>
			<th>City</th>
			<th>Address</th>
			<th>Action</th>
		</tr>
		<c:forEach var="department" items="${dlst}">
			<tr>

				<td>${department.sno}</td>
				<td>${department.name}</td>
				<td>${department.file}</td>
				<td>${department.mobile}</td>
				<td>${department.city}</td>
				<td>${department.address}</td>
				<td><a href="/edit/${department.sno}">Edit</a></td>
				<td><a href="/delete/${department.sno}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>

	<br>
	<a href="register-dep"> Register</a>
</body>
</html>
