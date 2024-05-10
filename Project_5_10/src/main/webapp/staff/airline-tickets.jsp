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
<title>Quản lý vé máy bay</title>
<jsp:include page="includes-staff/header-staff.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="includes-staff/navbar-staff.jsp"></jsp:include>
	<div class="container d-flex flex-column vh-100 vw-100 mt-5">
		<h2>Quản lý vé máy bay</h2>
		<div class="row-1 mt-5">
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">First</th>
			      <th scope="col">Last</th>
			      <th scope="col">Handle</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row">1</th>
			      <td>Mark</td>
			      <td>Otto</td>
			      <td>@mdo</td>
			    </tr>
			    <tr>
			      <th scope="row">2</th>
			      <td>Jacob</td>
			      <td>Thornton</td>
			      <td>@fat</td>
			    </tr>
			    <tr>
			      <th scope="row">3</th>
			      <td>Larry</td>
			      <td>the Bird</td>
			      <td>@twitter</td>
			    </tr>
			  </tbody>
			</table>
		</div>
	</div>
	<jsp:include page="includes-staff/footer-staff.jsp"></jsp:include>
</body>
</html>