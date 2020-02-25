<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="seller_setting.jsp" %>
<!DOCTYPE html>
<html>

<style type="text/css">
li{
	list-style-type: none;
}
</style>
<head>
	<meta charset="UTF-8">
	<title>공지사항 JSP</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${sellerpage}/css/util.css">
	<link rel="stylesheet" type="text/css" href="${sellerpage}/css/main.css">
	<!--===============================================================================================-->
	<style>
		h3 {
			text-align: center;
			margin-bottom: 150px;
		}

		th{
			text-align: center;
		}

		tr{
		text-align: center;
		}
		a:hover {
			text-decoration: none;
			color: #007bff;
		}
	</style>
</head>

<body>

<div id="result">



<%@ include file="util_sidebar.jsp" %>
<div style="width: 80%; height: 50px;" >
	
	<div style="border: 1px solid black; width: 20%; height: 50px; float:left; margin-left:50px;">
		<a onclick="load('seller_sale.all')">매물등록</a>
	</div>
	
	<div style="border: 1px solid black; width: 20%; height: 50px; float:left;">
		<a onclick="load('seller_modifyView.all')">매물수정/삭제</a>
	</div>
</div>
	

	<div class="limiter">
		
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
					<h3>매물리스트</h3>
					<table>
						<thead>
							<table>

								<!-- <colgroup>
									<col width="10%">
									<col width="90%">
								</colgroup> -->


								<thead>
									<tr class="table100-head">
										<th>선택</th>
										<th>이미지</th>
										<th>제목</th>
										<th>등록일</th>
										<th>비고</th>
									</tr>
								</thead>

								<tr>
									<td><input type="checkbox"></td>
									<td><img style="width: 100px; height: 70px;" src="${sellerpage}/images/캡처.PNG"></td>
									<td><a href="noticeDetail.all">매물1</a></td>
									<td>2020-02-21</td>
									<td style="width: 200px;">
										<input style="width: 70px; height: 40px;" type="button" value="수정">
										<input style="width: 70px; height: 40px;" type="button" value="삭제">
									</td>
								</tr>

								<tr>
									<td><input type="checkbox"></td>
									<td><img style="width: 100px; height: 70px;" src="${sellerpage}/images/캡처.PNG"></td>
									<td><a href="noticeDetail.all">매물1</a></td>
									<td>2020-02-21</td>
									<td>
										<input style="width: 70px; height: 40px;" type="button" value="수정">
										<input style="width: 70px; height: 40px; margin-top:5px;" type="button" value="삭제">
									</td>
								</tr>
								
								<tr>
									<td><input type="checkbox"></td>
									<td><img style="width: 100px; height: 70px;" src="${sellerpage}/images/캡처.PNG"></td>
									<td><a href="noticeDetail.all">매물1</a></td>
									<td>2020-02-21</td>
									<td>
										<input style="width: 70px; height: 40px;" type="button" value="수정">
										<input style="width: 70px; height: 40px; margin-top:5px;" type="button" value="삭제">
									</td>
								</tr>
								
								<tr>
									<td><input type="checkbox"></td>
									<td><img style="width: 100px; height: 70px;" src="${sellerpage}/images/캡처.PNG"></td>
									<td><a href="noticeDetail.all">매물1</a></td>
									<td>2020-02-21</td>
									<td>
										<input style="width: 70px; height: 40px;" type="button" value="수정">
										<input style="width: 70px; height: 40px; margin-top:5px;" type="button" value="삭제">
									</td>
								</tr>
								
								<tr>
									<td><input type="checkbox"></td>
									<td><img style="width: 100px; height: 70px;" src="${sellerpage}/images/캡처.PNG"></td>
									<td><a href="noticeDetail.all">매물1</a></td>
									<td>2020-02-21</td>
									<td>
										<input style="width: 70px; height: 40px;" type="button" value="수정">
										<input style="width: 70px; height: 40px; margin-top:5px;" type="button" value="삭제">
									</td>
								</tr>
								
								<tr>
									<td><input type="checkbox"></td>
									<td><img style="width: 100px; height: 70px;" src="${sellerpage}/images/캡처.PNG"></td>
									<td><a href="noticeDetail.all">매물1</a></td>
									<td>2020-02-21</td>
									<td>
										<input style="width: 70px; height: 40px;" type="button" value="수정">
										<input style="width: 70px; height: 40px; margin-top:5px;" type="button" value="삭제">
									</td>
								</tr>
								
								<tr>
									<td><input type="checkbox"></td>
									<td><img style="width: 100px; height: 70px;" src="${sellerpage}/images/캡처.PNG"></td>
									<td><a href="noticeDetail.all">매물1</a></td>
									<td>2020-02-21</td>
									<td>
										<input style="width: 70px; height: 40px;" type="button" value="수정">
										<input style="width: 70px; height: 40px; margin-top:5px;" type="button" value="삭제">
									</td>
								</tr>
								
								

								</tbody>
							</table>
				</div>
			</div>
		</div>
	</div>

</div>
</body>


<!--===============================================================================================-->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="js/main.js"></script>

</html>