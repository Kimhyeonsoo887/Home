<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>    
<!DOCTYPE html>
<html lang="en">
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
                        <h2 class="form-title">delete Member</h2>
                        <form action="deleteMemberPro.cust" method="POST" class="register-form" id="register-form" onsubmit="return onRegister();">
                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="member_pw" id="member_pw" placeholder="패스워드" required/>
                            </div>
                         
                       		<div class="form-group form-button">
                                <input type="submit" name="deleteMemberPro" id="deleteMemberPro" class="form-submit" value="delete"/>
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