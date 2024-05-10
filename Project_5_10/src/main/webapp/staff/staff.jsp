<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
NhanVien nhanVien = (NhanVien)session.getAttribute("nhanVien");

if (nhanVien != null) {
	request.setAttribute("nhanvien", nhanVien);
} else {
    response.sendRedirect(url + "/index.jsp");
}

%>
<title>Staff Page</title>
<jsp:include page="includes-staff/header-staff.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="includes-staff/navbar-staff.jsp"></jsp:include>
	<div class="container d-flex justify-content-between align-items-center vw-100 vh-100" >
		<h1>Chào mừng đến trang Nhân viên!</h1>
		<img src="assets/images/backgroud-home.jpg" alt="">
	</div>
	<jsp:include page="includes-staff/footer-staff.jsp"></jsp:include>
</body>
</html>