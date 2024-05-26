<%@page import="model.*"%>
<%@page import="java.util.ArrayList"%>
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

ArrayList<HoaDon> allHoaDon = (ArrayList<HoaDon>)session.getAttribute("allHoaDon");

if (allHoaDon == null) {
    allHoaDon = new ArrayList<HoaDon>(); 
    out.println("<p>Warning: No orders found.</p>");
}

int[] dailyOrders = new int[31]; 
int[] monthlyOrders = new int[12]; 
double[] dailyRevenue = new double[31];
double[] monthlyRevenue = new double[12];

for (HoaDon hd : allHoaDon) {
    java.sql.Date ngayDat = hd.getNgayDat();
    java.util.Calendar cal = java.util.Calendar.getInstance();
    cal.setTime(ngayDat);

    int day = cal.get(java.util.Calendar.DAY_OF_MONTH);
    int month = cal.get(java.util.Calendar.MONTH);

    dailyOrders[day - 1]++;
    monthlyOrders[month]++;
    dailyRevenue[day - 1] += hd.getDonGia();
    monthlyRevenue[month] += hd.getDonGia();
}

String dailyOrdersStr = "";
String monthlyOrdersStr = "";
String dailyRevenueStr = "";
String monthlyRevenueStr = "";

for (int i = 0; i < dailyOrders.length; i++) {
    dailyOrdersStr += dailyOrders[i];
    dailyRevenueStr += dailyRevenue[i];
    if (i < dailyOrders.length - 1) {
        dailyOrdersStr += ",";
        dailyRevenueStr += ",";
    }
}

for (int i = 0; i < monthlyOrders.length; i++) {
    monthlyOrdersStr += monthlyOrders[i];
    monthlyRevenueStr += monthlyRevenue[i];
    if (i < monthlyOrders.length - 1) {
        monthlyOrdersStr += ",";
        monthlyRevenueStr += ",";
    }
}
%>
<title>Thống kế doanh thu</title>
<jsp:include page="includes-staff/header-staff.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="includes-staff/navbar-staff.jsp"></jsp:include>
	<div class="container" style="margin-top: 40px;">
		<h2>Đơn đặt hàng và doanh thu mỗi ngày</h2>
		<canvas id="dailyChart" width="1000" height="600"></canvas>

		<h2> Đơn đặt hàng và doanh thu mỗi tháng</h2>
		<canvas id="monthlyChart" width="1000" height="600"></canvas>

		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
		<script type="text/javascript">
			// Daily Orders and Revenue Chart
			var dailyCtx = document.getElementById('dailyChart').getContext('2d');
			var dailyChart = new Chart(dailyCtx, {
				type: 'line',
				data: {
					labels: Array.from({length: 31}, (v, k) => k + 1),
					datasets: [{
						label: 'Số lượng đơn hàng mỗi ngày',
						data: [<%= dailyOrdersStr %>],
						backgroundColor: 'rgba(54, 162, 235, 0.2)',
						borderColor: 'rgba(54, 162, 235, 1)',
						borderWidth: 1,
						yAxisID: 'orders'
					}, {
						label: 'Tổng doanh thu mỗi ngày',
						data: [<%= dailyRevenueStr %>],
						backgroundColor: 'rgba(75, 192, 192, 0.2)',
						borderColor: 'rgba(75, 192, 192, 1)',
						borderWidth: 1,
						type: 'line',
						yAxisID: 'revenue'
					}]
				},
				options: {
					scales: {
						yAxes: [{
							id: 'orders',
							type: 'linear',
							position: 'left',
							ticks: {
								beginAtZero: true
							}
						}, {
							id: 'revenue',
							type: 'linear',
							position: 'right',
							ticks: {
								beginAtZero: true,
								callback: function(value) {
									return value + ' 000 vnđ';
								}
							}
						}]
					}
				}
			});

			// Monthly Orders and Revenue Chart
			var monthlyCtx = document.getElementById('monthlyChart').getContext('2d');
			var monthlyChart = new Chart(monthlyCtx, {
				type: 'line',
				data: {
					labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
					datasets: [{
						label: 'Số lượng đơn đặt hàng mỗi tháng',
						data: [<%= monthlyOrdersStr %>],
						backgroundColor: 'rgba(255, 99, 132, 0.2)',
						borderColor: 'rgba(255, 99, 132, 1)',
						borderWidth: 1,
						yAxisID: 'orders'
					}, {
						label: 'Tổng doanh thu mỗi tháng',
						data: [<%= monthlyRevenueStr %>],
						backgroundColor: 'rgba(153, 102, 255, 0.2)',
						borderColor: 'rgba(153, 102, 255, 1)',
						borderWidth: 1,
						type: 'line',
						yAxisID: 'revenue'
					}]
				},
				options: {
					scales: {
						yAxes: [{
							id: 'orders',
							type: 'linear',
							position: 'left',
							ticks: {
								beginAtZero: true
							}
						}, {
							id: 'revenue',
							type: 'linear',
							position: 'right',
							ticks: {
								beginAtZero: true,
								callback: function(value) {
									return value + ' 000 vnđ';
								}
							}
						}]
					}
				}
			});
		</script>
	</div>
	<jsp:include page="includes-staff/footer-staff.jsp"></jsp:include>
</body>
</html>