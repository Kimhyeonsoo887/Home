<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${bootstraps}/adminbootstrap/css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="${bootstraps}/adminbootstrap/css/bootstrap.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="${bootstraps}/adminbootstrap/css/all.css" type="text/css" media="all" />
</head>
<body>

  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">Login</h5>
            <form class="form-signin">
              <div class="form-label-group">
                <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                <label for="inputEmail">아이디</label>
              </div>

              <div class="form-label-group">
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
                <label for="inputPassword">비밀번호</label>
              </div>

              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">로그인</button>
              <hr class="my-4">
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <script src="${bootstraps}/adminbootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${bootstraps}/adminbootstrap/js/jquery.slim.min.js"></script>
    
    
</body>

</html>