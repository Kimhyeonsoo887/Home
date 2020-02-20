<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>    
<html lang="en">
<script type="text/javascript">
/* 	function onRegister(){
		var pw = document.getElementById('member_pw').value;
		var repw = document.getElementById('member_repw').value;
		
		if(pw != repw){
			alert("비밀번호가 일치하지 않습니다.");
		}
		
	} */
</script>
	<!-- Font Icon -->
    <link rel="stylesheet" href="${bootstraps}/bootstrap1/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="${bootstraps}/bootstrap1/css/style.css">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="/bridge/resources/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="${bootstraps}/bootstrap1/css/style.css">
</head>
<body>

    <div class="main">

            <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Update Member</h2>
                        <form action="updateMemberPro.cust" method="POST" class="register-form" id="register-form" onsubmit="return onRegister();">
                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
               
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="member_id" id="member_id" value="${vo.mem_id}" placeholder="아이디" readonly required/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="member_pw" id="member_pw" placeholder="패스워드" required/>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="member_repw" id="member_repw" placeholder="패스워드 재입력" required/>
                            </div>
                            
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="text" name="member_name" id="member_name" placeholder="이름" value="${vo.mem_name}" readonly required/>
                            </div>
                            
                               <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="text" name="member_email" id="member_email" value="${vo.mem_email}" readonly required/>
                            </div>
                            
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="text" name="member_hp" id="member_hp" placeholder="핸드폰번호" required/>
                            </div>
                        
                            <div class="form-group form-button">
                                <input type="submit" name="updateMemberPro" id="updateMemberPro" class="form-submit" value="update"/>
                            </div>
                        </form>
                    </div>
                
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="/bridge/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/bridge/resources/js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>