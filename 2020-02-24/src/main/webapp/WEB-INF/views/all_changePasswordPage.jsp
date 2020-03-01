<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="all_setting.jsp" %>
<html>
<body>
<form action="all_changePasswordPagePro.all" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<input type="hidden" name="member_id" value="${member_id}">
		<table>
		
			<tr>
				<th>변경할 비밀번호</th>
				<td><input type="text" name="member_pw"></td>
			</tr>
			<tr>
				<th>비밀번호 재입력</th>
				<td><input type="text" name="pwd2"></td>
			</tr>

		<tr align="center"> 
			<td><input type="submit" value="변경">
			<input onclick="self.close();" type="button" value="취소"></td>
		</tr>
	</table>
</form>
</body>
</html>