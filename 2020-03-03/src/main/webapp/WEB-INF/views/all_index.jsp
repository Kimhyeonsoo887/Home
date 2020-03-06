<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "all_setting.jsp" %>    
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>우리집에 오신것을 환영합니다.</title>

  <!-- Bootstrap core CSS -->
  <link href="${styles}/1_mainpage/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="${styles}/1_mainpage/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="${styles}/1_mainpage/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
  <%-- <link href="${styles}/1_mainpage/https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css"> --%>

  <!-- Custom styles for this template -->
  <link href="${styles}/1_mainpage/css/landing-page.min.css" rel="stylesheet">

</head>

<script type="text/javascript">
	function selectHouse(){
		var selectHouse = document.getElementById("selectInput").value;
		
		window.location="selectHouse.mem?selectHouse=" + selectHouse;
	}
</script>
<body>
<%@ include file="all_header.jsp" %>

<header class="masthead text-white text-center">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <h1 class="mb-5">지금 살고싶은 그 곳,<br>어딘지 알려주시겠어요?<br> </h1>
        </div>
        <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
          <form action="selectHouse.member" method="post" >
          	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <div class="form-row">
              <div class="col-12 col-md-9 mb-2 mb-md-0">
                <input type="text" class="form-control form-control-lg" id="selectInput">
              </div>
              <div class="col-12 col-md-3">
                <button type="button" onclick="selectHouse();"class="btn btn-block btn-lg btn-primary">지금 찾기</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </header>
 
 
	
  <!-- Footer -->
  <footer class="footer bg-light">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 h-100 text-center text-lg-left my-auto">
          <ul class="list-inline mb-2">
            <li class="list-inline-item">
              <a href="#">About</a>
            </li>
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="#">Contact</a>
            </li>
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="#">Terms of Use</a>
            </li>
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="#">Privacy Policy</a>
            </li>
          </ul>
          <p class="text-muted small mb-4 mb-lg-0">&copy; Your Website 2019. All Rights Reserved.</p>
        </div>
        <div class="col-lg-6 h-100 text-center text-lg-right my-auto">
          <ul class="list-inline mb-0">
            <li class="list-inline-item mr-3">
              <a href="#">
                <i class="fab fa-facebook fa-2x fa-fw"></i>
              </a>
            </li>
            <li class="list-inline-item mr-3">
              <a href="#">
                <i class="fab fa-twitter-square fa-2x fa-fw"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <i class="fab fa-instagram fa-2x fa-fw"></i>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="${styles}/1_mainpage/vendor/jquery/jquery.min.js"></script>
  <script src="${styles}/1_mainpage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
