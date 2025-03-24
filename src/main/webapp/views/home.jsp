<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Spring Boot JSP Example</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
			<style>
					body {
							background-color: #f8f9fa;
							}

					.container {
								margin-top: 100px;
								text-align: center;
								}
				</style>
</head>

<body>
	<div class="container">
		<div class="card shadow-lg p-4">
			<h1 class="text-primary">Welcome Management System</h1>

			<a href="/register-dep" class="btn btn-success mt-3">Register</a>
		<!-- 	<a href="/search-dep" class="btn btn-success mt-3">Search Department BY Name /Sno</a>
			<a href="/search-city" class="btn btn-success mt-3">Search Department BY City</a> -->
			<a href="/search-all" class="btn btn-success mt-3">Search Department Any Way</a>
			
		</div>
	</div>
</body>
</html>
