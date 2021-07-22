<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="description">
<meta content="" name="keywords">


<!-- CSS here -->
  <link href="/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <link rel="shortcut icon" type="image/x-icon" href="/resources/assets/img/favicon.ico">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
</head>
<style>
body {
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}
footer {
	margin-top: auto;
}
</style>
<header>
	<tiles:insertAttribute name="header" />
</header>
<body>
	<tiles:insertAttribute name="body" />
</body>
<footer>
	<tiles:insertAttribute name="footer" />
</footer>
</html>

