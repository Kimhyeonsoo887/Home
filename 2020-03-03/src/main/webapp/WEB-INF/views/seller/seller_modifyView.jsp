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
	
	<!-- Custom fonts for this template-->
  <link href="${styles}/1_sellerpage/bootstrap3/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${styles}/1_sellerpage/bootstrap3/css/sb-admin-2.min.css" rel="stylesheet">
  
  
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

<script type="text/javascript">
	function modifysale(saleNum){
		
		var url = "seller_modify.sel?saleNum=" + saleNum;
		window.open(url,"selectId","menubar=no,width=1500 height=800");
	}
	
	
</script>


<body>

<div id="result">


</div>
<%@ include file="util_sidebar.jsp" %>
<!-- <div style="width: 80%; height: 50px;" >
	
	<div style="border: 1px solid black; width: 20%; height: 50px; float:left; margin-left:50px;">
		<a onclick="load('seller_sale.all')">매물등록</a>
	</div>
	
	<div style="border: 1px solid black; width: 20%; height: 50px; float:left;">
		<a onclick="load('seller_modifyView.all')">매물수정/삭제</a>
	</div>
</div>
	 -->

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
										<th>가격</th>
										<th>비고</th>
									</tr>
								</thead>

								<c:forEach var="dto" items="${dtos}">
									<tr>
										<td><input type="checkbox"></td>
										<td><img style="width: 100px; height: 70px;" src="${images}/sellerImages/${dto.prp_title}"></td>
										<td><a href="noticeDetail.all">${dto.prp_name }</a></td>
										<td>${dto.prp_registerdate}</td>
										<td>
											<c:if test="${dto.prp_termtype.equals('월세') }">
												${dto.prp_monthlycost}
											</c:if>
											
											<c:if test="${dto.prp_termtype.equals('전세') }">
												${dto.prp_leasecost}
											</c:if>
											
											<c:if test="${dto.prp_termtype.equals('매매') }">
												${dto.prp_propertycost}
											</c:if>
										</td>
										<td style="width: 200px;">
											<input style="width: 70px; height: 40px;" type="button" value="수정" onclick="modifysale(${dto.prp_number})">
											<input style="width: 70px; height: 40px;" type="button" value="삭제" onclick="window.location='seller_Property_delete.sel?saleNum=${dto.prp_number}'">
										</td>
									</tr>
								</c:forEach>
								
								

								</tbody>
							</table>
				</div>
			</div>
		</div>
	</div>

</div>
</body>

<!-- Bootstrap core JavaScript-->
  <script src="${styles}/1_sellerpage/bootstrap3/vendor/jquery/jquery.min.js"></script>
  <script src="${styles}/1_sellerpage/bootstrap3/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${styles}/1_sellerpage/bootstrap3/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${styles}/1_sellerpage/bootstrap3/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="${styles}/1_sellerpage/bootstrap3/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${styles}/1_sellerpage/bootstrap3/js/demo/chart-area-demo.js"></script>
  <script src="${styles}/1_sellerpage/bootstrap3/js/demo/chart-pie-demo.js"></script>
  
  
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