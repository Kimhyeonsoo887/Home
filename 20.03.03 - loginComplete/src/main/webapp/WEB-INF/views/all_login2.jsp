<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="all_setting.jsp" %>
<!DOCTYPE HTML>
<html lang="zxx">

<head>
	<title>Triple Forms Responsive Widget Template :: w3layouts</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" ="Triple Forms Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!-- Meta tag Keywords -->

	<!-- css files -->
	<link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+Condensed|Noto+Sans+KR&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${styles}/2_loginpage/css/style.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<!-- <link href="css/font-awesome.min.css" rel="stylesheet"> -->
	<link href="${styles}/2_loginpage/fonts/font-awesome.min.css" rel="stylesheet">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //css files -->

	<!-- web-fonts -->
	<link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext"
	 rel="stylesheet">
	<!-- //web-fonts -->
</head>

<body>
<c:if test="${findCnt == 1}">
	<c:if test="${findPhone == 1}">
		<script>
			alert("아이디는: ${member_id} 입니다.");
		</script>
	</c:if>
	
	<c:if test="${findPhone == 0}">
		<script>
			alert("입력하신 명의와 일치한 번호가 존재하지 않습니다.");
		</script>
	</c:if>
</c:if>

<c:if test="${findCnt == 0}">
	<script>
		alert("입력하신 이름은 존재하지 않습니다.");
	</script>
</c:if>


<c:if test="${checkCnt == 1}">
	<script>
		alert("등록하신 이메일로 전송되었습니다.");
	</script>
</c:if>
<c:if test="${checkCnt == 0}">
	<script>
		alert("아이디가 존재하지 않습니다.");
	</script>
</c:if>

	<div class="main-bg">
		<!-- title -->
		<h1><img src="${allImage}/myhome_white.png" width="14%"></h1>
		<!-- //title -->
		<div class="sub-main-w3">
			<div class="image-style">

			</div>
			<!-- vertical tabs -->
			<div class="vertical-tab">
				<div id="section1" class="section-w3ls">
					<input type="radio" name="sections" id="option1" checked>
					<label for="option1" class="icon-left-w3pvt"><span class="fa fa-user-circle" aria-hidden="true"></span>로그인</label>
					<article>
						<form action="all_loginPro.all" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<h3 class="legend">로그인</h3>
							<div class="input">
								<span class="fa fa-envelope-o" aria-hidden="true"></span>
								<input type="text" placeholder="아이디를 입력해주세요." name="member_id" required autofocus/>
							</div>
							<div class="input">
								<span class="fa fa-key" aria-hidden="true"></span>
								<input type="password" placeholder="비밀번호를 입력해주세요." name="member_pw" required />
							</div>
							<button type="submit" class="btn submit">로그인 하기</button>
							<a href="#" class="bottom-text-w3ls">비밀번호를 잊으셨나요?</a>
							<a href="all_index.all" class="bottom-text-w3ls">홈으로</a>
							
						</form>
					</article>
				</div>
				<div id="section2" class="section-w3ls">
					<input type="radio" name="sections" id="option2">
					<label for="option2" class="icon-left-w3pvt"><span class="fa fa-pencil-square" aria-hidden="true"></span>회원가입</label>
					<article>
						<form action="all_signup_pro.all" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<h3 class="legend">회원가입</h3>
							<div class="input">
								<span class="fa fa-user-o" aria-hidden="true"></span>
								<input type="text" placeholder="아이디" name="member_id" required/>
							</div>
							<div class="input">
								<span class="fa fa-key" aria-hidden="true"></span>
								<input type="password" placeholder="비밀번호" name="member_pw" required />

								<span class="fa fa-key" aria-hidden="true"></span>
								<input type="password" placeholder="비밀번호 확인" name="password" required />
							</div>
							<div class="input">
								<span class="fa fa-id-badge" aria-hidden="true"></span>
								<input type="text" placeholder="이름" name="member_name" required />
							</div>
							<div class="input">
								<span class="fa fa-envelope-o" aria-hidden="true"></span>
								<input type="email" placeholder="이메일" name="member_email" required />
							</div>
							<div class="input">
								<span class="fa fa-mobile" aria-hidden="true"></span>
								<input type="text" placeholder="휴대폰 번호" name="member_hp" required />
							</div>
							<button type="submit" class="btn submit">회원가입 하기</button>
						</form>
					</article>
				</div>
				<div id="section3" class="section-w3ls">
					<input type="radio" name="sections" id="option3">
					<label for="option3" class="icon-left-w3pvt"><span class="fa fa-lock" aria-hidden="true"></span>아이디/비밀번호 찾기</label>
					<article>
						<form action="all_find_account.all" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<h3 class="legend last">아이디 찾기</h3>
							<p class="para-style">이름과 휴대폰번호로 아이디를 찾을 수 있습니다.</p>
							<!-- <p class="para-style-2"><strong>Need Help?</strong> Learn more about how to <a href="#">retrieve an existing
									account.</a></p> -->
							<div class="input">
								<span class="fa fa-user-o" aria-hidden="true"></span>
								<input type="text" placeholder="이름" name="member_name" required />
								<span class="fa fa-mobile" aria-hidden="true"></span>
								<input type="text" placeholder="휴대폰번호" name="member_hp" required />
							</div>
							<button type="submit" class="btn submit last-btn">찾기</button>
							<br>
						</form>
						
						<form action="all_change_password.all" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<h3 class="legend last">비밀번호 변경</h3>
							<p class="para-style">아이디를 입력하시면 등록된 이메일로 링크가 전송됩니다.</p>
							<!-- <p class="para-style-2"><strong>Need Help?</strong> Learn more about how to <a href="#">retrieve an existing
									account.</a></p> -->
							<div class="input">
								<span class="fa fa-user-o" aria-hidden="true"></span>
								<input type="text" placeholder="아이디" name="member_id" required />
							</div>
							<button type="submit" class="btn submit last-btn">보내기</button>
						</form>
						
					</article>
				</div>
			</div>
			<!-- //vertical tabs -->
			<div class="clear"></div>
		</div>
		<!-- copyright -->
		<footer>
		<div class="copyright">
			<h2>&copy; Copyright 2020. Bridge. All Rights Reserved. | Design by
				<a href="http://w3layouts.com" target="_blank">W3layouts</a>
			</h2>
		</div>
		</footer>
		<!-- //copyright -->
	</div>

</body>

</html>