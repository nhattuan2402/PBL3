<%@page import="model.NhanVien" %>
<%@page import="model.KhachHang" %>
<%@page import="model.TaiKhoan" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>website bán vé máy bay Baconcuu</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<link rel="stylesheet" href="../assets/style/base.css" />
<link rel="stylesheet" href="../assets/style/main.css" />
<script src="./assets/events/event_index.js"></script>
<script src="./assets/events/formdangky.js"></script>
<script src="./assets/events/formdangnhap.js"></script>
<script src="./assets/events/formhotro.js"></script>
</head>
<body>
	<!-- header-->
	<nav class="navbar">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#abc">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><img
					src="assets/images/logo.jpg" class="img_chania.jpg" alt="LOGO"></a>
			</div>
			
			<div class="collapse navbar-collapse" id="abc">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="#" class="muaVeVaSanPham">Mua vé & Sản phẩm</a></li>
					<li><a href="#" class="hoTro">Hỗ trợ</a></li>
				<%
					Object obj = session.getAttribute("taiKhoan");
					TaiKhoan taiKhoan = null;
					if(obj!=null) {
						taiKhoan = (TaiKhoan) obj;
					}
					Object objkh = session.getAttribute("khachHang");
					Object objnv = session.getAttribute("nhanVien");
					
					NhanVien nhanVien = null;
					KhachHang khachHang = null;
					
					if(taiKhoan!=null) {
						if(objnv != null) {
							nhanVien = (NhanVien) objnv;
						} else if(objkh != null) {
							khachHang = (KhachHang) objkh;
						
						}
					}
				
				if(nhanVien != null) { %>
					<li><a href="#" class="dangnhap"><%=nhanVien.getHoVaTen() %></a></li>
				<%} else if(khachHang != null){ %>
					<li><a href="#" class="dangnhap"> <%="Xin chào "+ khachHang.getHoVaTen() %></a></li>
				<%} else {%>
					<li><a href="#" class="dangnhap">Đăng nhập</a></li>
				<%} %>
					<li class="dangky"><a class="dangky" href="#formEnroll">Đăng Ký</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!--Kết thúc header-->
</body>
</html>