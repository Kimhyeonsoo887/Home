<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="all_setting.jsp" %>
<!DOCTYPE HTML>
<html lang="zxx">

<head>
	<title>우리집 로그인</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
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
	<link href="${styles}/2_loginpage/css/font-awesome.min.css" rel="stylesheet">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //css files -->

	<!-- web-fonts -->
	<link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext"
	 rel="stylesheet">
	<!-- //web-fonts -->

	<script src="${javascripts}/jquery-3.4.1.min.js"></script>
	
	<script>

		$(document).ready(function() { 
			$("#sellersignupArticle").hide();
		});

		function mtoschange(){
			$("#sellersignupArticle").hide();
			$("#membersignupArticle").show();
		}
		function stomchange(){
			$("#membersignupArticle").hide();
			$("#sellersignupArticle").show();
		}

	
		
	</script>


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
		<h1><a href="all_index.all"><img src="${allImage}/myhome_white.png" width="14%"></a></h1>
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
								<span class="fa fa-user-circle-o" aria-hidden="true"></span>
								<input type="text" placeholder="아이디를 입력해주세요." name="id" required autofocus/>
							</div>
							<div class="input">
								<span class="fa fa-key" aria-hidden="true"></span>
								<input type="password" placeholder="비밀번호를 입력해주세요." name="pw" required />
							</div>
								<p style="text-align: center;">
								<input type="radio" id="member" name="logintype" value="member" checked>
								<label class="membertype" for="member" style="all: unset;">일반회원</label>
								<input type="radio" id="seller" name="logintype" value="seller" >
								<label class="membertype" for="seller" style="all: unset;">셀러</label>
								<input type="radio" id="administrator" name="logintype" value="administrator">
								<label class="membertype" for="administrator" style="all: unset;">관리자</label>
								</p>
							<button type="submit" class="btn submit">로그인 하기</button>
							<a href="all_index.all" class="bottom-text-w3ls">홈으로</a>
						</form>
					</article>
				</div>
				<div id="section2" class="section-w3ls">
					<input type="radio" name="sections" id="option2">
					<label for="option2" class="icon-left-w3pvt"><span class="fa fa-pencil-square" aria-hidden="true"></span>회원가입</label>

					<!-- 일반 회원가입 -->
					<article id="membersignupArticle">
						<form action="all_signup_pro.all" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<h3 class="legend">일반회원 회원가입</h3>
							<div class="input">
								<span class="fa fa-user-circle-o" aria-hidden="true"></span>
								<input type="text" placeholder="아이디" name="id" required/>
								<button style="width: 20%; background-color: none;">중복확인</button>
							</div>
							<div class="input">
								<span class="fa fa-key" aria-hidden="true"></span>
								<input type="password" placeholder="비밀번호" name="pw" required />

								<span class="fa fa-key" aria-hidden="true"></span>
								<input type="password" placeholder="비밀번호 확인" name="repw" required />
							</div>
							<div class="input">
								<span class="fa fa-id-badge" aria-hidden="true"></span>
								<input type="text" placeholder="이름" name="name" required />
							</div>
							<div class="input">
								<span class="fa fa-envelope-o" aria-hidden="true"></span>
								<input type="email" placeholder="이메일" name="email" required />
							</div>
							<div class="input">
								<span class="fa fa-mobile" aria-hidden="true"></span>
								<input type="text" placeholder="휴대폰 번호" name="phone" maxlength="11" required />
							</div>
							<button type="submit" class="btn submit">회원가입 하기</button>
							<a href='javascript:void(0);' onclick="stomchange()" class="bottom-text-w3ls">[셀러] 회원가입 하러가기</a>
						</form>
							
					</article>
					<!-- 일반 회원가입 -->

					<!-- 셀러 회원가입 -->
					<article id="sellersignupArticle">
						<form action="seller_signup_pro.all?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
							<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
							<h3 class="legend">셀러 회원가입</h3>
							<div class="input">
								<span class="fa fa-user-circle-o" aria-hidden="true"></span>
								<input type="text" placeholder="아이디" name="id" required/>
								<button style="width: 20%; background-color: none;">중복확인</button>
							</div>
							<div class="input">
								<span class="fa fa-key" aria-hidden="true"></span>
								<input type="password" placeholder="비밀번호" name="pw" required />

								<span class="fa fa-key" aria-hidden="true"></span>
								<input type="password" placeholder="비밀번호 확인" name="repw" required />
							</div>
							
							<div style="display: inline-flex; width: 100%;">
								<div class="input" style="width:100%;">
									<span class="fa fa-mobile" aria-hidden="true"></span>
									<input type="text" placeholder="휴대폰 번호" name="phone" maxlength="11" required />
								</div>
							</div>

							<div class="input">
								<span class="fa fa-id-card-o" aria-hidden="true"></span>
								<input type="text" placeholder="사업자 등록증" readonly/>
								<input style="float: right;" type="file" placeholder="사업자 등록증" name="license" required/>
							</div>

							<div style="display: inline-flex; width: 100%;">
								<div class="input" style="width:50%;">
									<span class="fa fa-id-badge" aria-hidden="true"></span>
									<input type="text" placeholder="이름" name="name" required maxlength="15" />
								</div>
								<div style="width: 3%;"></div>
								<div class="input" style="width:50%;">
									<span class="fa fa-envelope-o" aria-hidden="true"></span>
									<input type="email" placeholder="이메일" name="email" required maxlength="50" />
								</div>
							</div>
							
							<button type="submit" class="btn submit">회원가입 하기</button>
							<a href='javascript:void(0);' onclick="mtoschange()" class="bottom-text-w3ls">[일반회원] 회원가입 하러가기</a>
							
						</form>
						
						
					</article>
					<!-- 셀러 회원가입 -->

					
				</div>

				<div id="section3" class="section-w3ls">
					<input type="radio" name="sections" id="option3">
					<label for="option3" class="icon-left-w3pvt"><span class="fa fa-lock" aria-hidden="true"></span>아이디/비밀번호 찾기</label>
					<article>
						<form action="#" method="post">
							<h3 class="legend last">아이디 찾기</h3>
							<p class="para-style">이름과 휴대폰번호로 아이디를 찾을 수 있습니다.</p>
							<!-- <p class="para-style-2"><strong>Need Help?</strong> Learn more about how to <a href="#">retrieve an existing
									account.</a></p> -->
							<div class="input">
								<span class="fa fa-id-badge" aria-hidden="true"></span>
								<input type="text" placeholder="이름" name="name" required />
								<span class="fa fa-mobile" aria-hidden="true"></span>
								<input type="text" placeholder="휴대폰번호" name="phone" required />
							</div>
							<button type="submit" class="btn submit last-btn">찾기</button>
							<br>
							<h3 class="legend last">비밀번호 변경</h3>
							<p class="para-style">아이디를 입력하시면 등록된 이메일로 링크가 전송됩니다.</p>
							<!-- <p class="para-style-2"><strong>Need Help?</strong> Learn more about how to <a href="#">retrieve an existing
									account.</a></p> -->
							<div class="input">
								<span class="fa fa-user-circle-o" aria-hidden="true"></span>
								<input type="text" placeholder="아이디" name="id" required />
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