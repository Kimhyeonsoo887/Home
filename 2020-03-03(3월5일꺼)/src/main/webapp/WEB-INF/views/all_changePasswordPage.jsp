<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="all_setting.jsp" %>
<html>
<body>
<script>
	
	function checkPw(){
		if(document.getElementById('pw').value != document.getElementById('repw').value){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
	}
	
</script>
<form action="all_changePasswordPagePro.all" method="post" onsubmit="return checkPw();">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
<input type="hidden" name="id" value="${param.id}">
		<table>
		
			<tr>
				<th>변경할 비밀번호</th>
				<td><input type="text" name="pw" id="pw" ></td>
			</tr>
			<tr>
				<th>비밀번호 재입력</th>
				<td><input type="text" name="repw" id="repw" ></td>
			</tr>

		<tr align="center"> 
			<td><input type="submit" value="변경">
			<input onclick="self.close();" type="button" value="취소"></td>
		</tr>
	</table>
</form>
</body>
</html>