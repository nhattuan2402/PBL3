<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
+ request.getContextPath();
%>
<meta charset="UTF-8">

</head>
<style>
.navbar {
	margin-top: 1rem;
	background-color: var(--white-color);
	width: 100%;
	z-index: 1;
	border: 0;
	margin-bottom: 0;
}
	
.navbar button {
	cursor: pointer;
}
.nav>li>a:focus, .nav>li>a:hover {
    text-decoration: none;
    background-color: var(--brand-color);
    border-radius: 0.5rem;
    color: var(--white-color);
}
@media ( min-width : 768px) {
	.hidden-btn {
		display: none;
	}
}

</style>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container" >
			<div class="navbar-header">
				
				<button class="navbar-toggler hidden-btn" type="button" data-toggle="collapse"
					data-target="#abc">
					<span class="navbar-toggler-icon"></span>
				</button>
				<a class="navbar-brand" href="<%=url%>/admin-controller?hanhDong=trang-chu"">
				<img src="staff/assets/images/logo.png" alt="logo" style="width: 100px; height: 45px;">
				</a>
            </div>
			<div class="collapse navbar-collapse" id="abc">
				<ul class="nav navbar-nav navbar-right ml-auto">
					<li class="nav-item active"><a class="nav-link" href="<%=url%>/admin-controller?hanhDong=trang-chu">Trang chủ</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=url%>/admin-controller?hanhDong=ql-tuyen-bay">Tuyến bay</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=url%>/admin-controller?hanhDong=ql-lich-bay">Lịch bay</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=url%>/admin-controller?hanhDong=ql-may-bay">Loại máy bay</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=url%>/admin-controller?hanhDong=ql-nhan-vien">Nhân viên</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=url%>/admin-controller?hanhDong=ql-khach-hang">Khách hàng</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=url%>/admin-controller?hanhDong=thong-ke-doanh-thu">Thống kê doanh thu</a></li>
					<li class="nav-item"><a class="nav-link" href=""><span style="color: red; font-weight: BOLD;">${admin.getMaTaiKhoan()}</span></a></li>
					<li class="nav-item"><a class="nav-link" href="<%=url%>/admin-controller?hanhDong=dang-xuat">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>