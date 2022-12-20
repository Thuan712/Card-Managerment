<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.jpg" type="image/x-icon" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'
	rel='stylesheet'>
<title>Access denied</title>
</head>
<body>
	<div class="grid access-denied">
		<img class="access-denied-img" alt="access-denied" src="${pageContext.request.contextPath}/resources/img/access-denied.jpg">
		<h3>We are Sorry...</h3>
		<p>The page you're trying to access has restricted access</p>
		<a href="${pageContext.request.contextPath}/">Back to home</a>
	</div>
</body>
</html>