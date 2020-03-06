<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_setting.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>시스템관리자 - 로그인</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${styles}/6_adminlogin/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${styles}/6_adminlogin/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${styles}/6_adminlogin/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${styles}/6_adminlogin/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${styles}/6_adminlogin/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${styles}/6_adminlogin/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${styles}/6_adminlogin/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${styles}/6_adminlogin/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${styles}/6_adminlogin/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${styles}/6_adminlogin/css/util.css">
	<link rel="stylesheet" type="text/css" href="${styles}/6_adminlogin/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="admin_loginPro.adm">
					<span class="login100-form-title p-b-48">
						<img src="${allImage}/myhome_black.png" width="40%">
					</span>
					<span class="login100-form-title p-b-26">
						관리자 로그인
					</span>
					<span class="login100-form-title p-b-48">
					</span>
					
					<div class="wrap-input100 validate-input" data-validate = "">
						<input class="input100" type="text" name="adm_id">
						<span class="focus-input100" data-placeholder="아이디"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<input class="input100" type="password" name="adm_pw">
						<span class="focus-input100" data-placeholder="비밀번호"></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								로그인
							</button>
						</div>
					</div>

					<div class="text-center p-t-115">
						<span class="txt1">
							관리자가 아니세요?
						</span>

						<a class="txt2" href="all_index.all">
							홈으로
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="${styles}/6_adminlogin/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${styles}/6_adminlogin/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${styles}/6_adminlogin/vendor/bootstrap/js/popper.js"></script>
	<script src="${styles}/6_adminlogin/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${styles}/6_adminlogin/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${styles}/6_adminlogin/vendor/daterangepicker/moment.min.js"></script>
	<script src="${styles}/6_adminlogin/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="${styles}/6_adminlogin/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="${styles}/6_adminlogin/js/main.js"></script>

</body>
</html>