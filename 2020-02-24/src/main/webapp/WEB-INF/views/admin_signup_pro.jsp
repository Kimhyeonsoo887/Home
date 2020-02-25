<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "all_setting.jsp" %>    
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">
	function onRegister(){
		var pw = document.getElementById('adm_pw').value;
		var repw = document.getElementById('adm_repw').value;
		
		if(pw != repw){
			alert("비밀번호가 일치하지 않습니다.");
		}
		
	}
</script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원가입</title>
	
	<c:if test="${signupCnt != 0}">
		<script>
			alert("회원가입에 성공하였습니다.");
			window.location = 'admin_index.all';
		</script>
	</c:if>
	
	<c:if test="${signupCnt == 0}">
		<script>
			alert("회원가입에 실패하였습니다.");
			window.history.back();
		</script>
	</c:if>
    
</html>