<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
TaiKhoan admin = (TaiKhoan)session.getAttribute("admin");

if (admin != null) {
	request.setAttribute("admin", admin);
} else {
    response.sendRedirect(url + "/index.jsp");
}

%>
<title>Admin Page</title>
<jsp:include page="includes-admin/header-admin.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="includes-admin/navbar-admin.jsp"></jsp:include>
	<div class="container d-flex justify-content-between align-items-center vw-100 vh-100" >
		<h1>Chào mừng đến trang Admin!</h1>
		<img src="assets/images/backgroud-home.jpg" alt="">
	</div>
	<jsp:include page="includes-admin/footer-staff.jsp"></jsp:include>
</body>
</html>