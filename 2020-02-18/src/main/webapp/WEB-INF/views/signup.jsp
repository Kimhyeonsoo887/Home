<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>    
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">
	function onRegister(){
		var pw = document.getElementById('member_pw').value;
		var repw = document.getElementById('member_repw').value;
		
		if(!pw.equals(repw)){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		
	}
	
</script>
	<!-- Font Icon -->
    <link rel="stylesheet" href="${bootstraps}/bootstrap1/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="${bootstraps}/bootstrap1/css/style.css">
<body>

    <div class="main">

            <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <form action="signup_pro.all" method="POST" class="register-form" id="register-form" onsubmit="return onRegister();">
                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="member_id" id="member_pw" placeholder="Your Account" required/>
                            </div>
          
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="member_pw" id="member_pw" placeholder="Password" required/>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="member_repw" id="member_repw" placeholder="Repeat your password" required/>
                            </div>
                            
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="text" name="member_name" id="member_name" placeholder="name" required/>
                            </div>
                           
 						<!-- 핸드폰 모르겠다~~~ -->
                          <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
									 <input class="input" type="text" name="hp1" maxlength="3"
												 onkeyup="nextHp1();">-
									 <input class="input" type="text" name="hp2" maxlength="4"
												 onkeyup="nextHp2();">-
									 <input class="input" type="text" name="hp3" maxlength="4"
												 onkeyup="nextHp3();">
                          </div> 
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="${bootstraps}/bootstrap1/images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="login.all" class="signup-image-link">I am already member</a>
                    </div>
                </div>
            </div>
        </section>

    </div>

<!-- JS -->
<script src="${bootstraps}/bootstrap1/vendor/jquery/jquery.min.js"></script>
<script src="${resources}/js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>