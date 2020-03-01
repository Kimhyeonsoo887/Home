<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<html>
 <meta charset="utf-8" name = "viewport" content = "width=device-width, initial-scale = 1">
<title>header</title>
<body>
<!-- Navigation -->
  <nav class="navbar navbar-light bg-light static-top">
    <div class="" style="width: 100%;">
    
      <a style="float:left; margin-left:20px;" class="" href="index.all">
     	 <img src="${resources}/images/logo.png" style="height:40px;" >
      </a>
      
      
      
      <div style="float: left; margin-left:8px; margin-top:15px; width:20px; height:20px; border-left: 1px solid #DDDDDD;">
      
      </div>
      <!-- 세션설정에 따른 출력 값 -->
      <c:if test="${empty sessionScope.memID}">
     	<a href="hoLogin" style="float: left; margin-top: 15px; color:#888888;">관리자 로그인</a>
     	<a style="float:right; margin-top:7px; margin-right:20px;" class="btn btn-primary" href="signup.all">회원가입</a>
      	<a style="float:right; margin-top:7px; margin-right:20px;" class="btn btn-primary" href="login.all">로그인</a>
      	
      </c:if>
       <c:if test="${not empty sessionScope.memID}">
     	 <p style="float:left;  margin-top:15px;">${sessionScope.memID} 님 안녕하세요!</p>
     	 <a style="float:right; margin-top:10px; margin-right:20px;" class="btn btn-primary" href="logout.all">로그아웃</a>
     	 <a style="float:right; margin-top:15px; margin-right:30px; color:#222222; text-decoration: none; " href="MyPage.all">마이페이지</a>
     	 <a style="float:right; margin-top:15px; margin-right:30px; color:#222222; text-decoration: none;" href="#">커뮤니티</a>
     	 <a style="float:right; margin-top:15px; margin-right:30px; color:#222222; text-decoration: none;" href="acmain">경매관리</a>
     	 <a style="float:right; margin-top:15px; margin-right:30px; color:#222222; text-decoration: none;" href="saleMain">매물관리</a>
      </c:if>
    </div>
  </nav>
  
  
  <!-- Masthead -->
  
</body>
</html>