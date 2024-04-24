<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
	integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
	crossorigin="anonymous"></script>
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>
<link href="<%=url%>/css/signin.css" rel="stylesheet">
<style>
	.red {
		color : red;
	}
</style>

</head>
<body>
	<main class="form-signin w-100 m-auto">
	
	
	
		<form class="text-center" action="<%=url%>/khach-hang-controller" method="post">
		<input type = "hidden" name ="hanhDong" value = "dang-nhap"/>
		
			<img class="mb-4" src="img/logo/NTUAN.png" alt="" width="200">
			<h1 class="h3 mb-3 fw-normal">ĐĂNG NHẬP</h1>

			<%
			String baoLoi = request.getAttribute("baoLoi") + "";
			if (baoLoi.equals("null")) {
				baoLoi = "";
			}
			%>

			<div class="text-center">
				<span class="red"><%=baoLoi%></span>
				<div class="form-floating">
					<input type="text" class="form-control" id="tenDangNhap"
						placeholder="Tên đăng nhập" name = "tenDangNhap"> <label for="tenDangNhap">Tên
						đăng nhập</label>
				</div>
				<div class="form-floating">
					<input type="password" class="form-control" id="matKhau"
						placeholder="Mật khẩu" name = "matKhau"> <label for="matKhau">Mật
						khẩu</label>
				</div>

				<div class="form-check text-start my-3">
					<input class="form-check-input" type="checkbox" value="ghiNho"
						id="ghiNho"> <label class="form-check-label" for="ghiNho">
						Ghi nhớ </label>
				</div>
				<button class="btn btn-primary w-100 py-2" type="submit">Đăng
					nhập</button>
				<a href="dangky.jsp">Đăng ký tài khoản mới</a>
				<p class="mt-5 mb-3 text-body-secondary">&copy; 2023</p>
			</div>
		</form>
	</main>
</body>
</html>