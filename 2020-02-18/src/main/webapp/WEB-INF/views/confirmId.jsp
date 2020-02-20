<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<html>
<body>
<form action = "confirmId.lo" method = "post" name = "confirmform">
<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
<c:if test = "${selectCnt == 1}">
	<table class = "confirm">
		<tr>
			<th colspan = "2">
				<span>${member_code}</span>는 사용할 수 없습니다.
			</th>
		</tr>
		
		<tr>
			<th>아이디 : </th>
			<td>
				<input type = "text" name = "member_code" maxlength ="30"
					style = "width :150px" autofocus required>
			</td>
		</tr>
		
		<tr>
			<th colspan = "2">
				<input class = "inputButton" type ="submit" value = "확인">
				<input class = "inputButton" type = "reset" value = "취소" onclick = "self.close();">
			</th>
		</tr>
	</table>
</c:if>

<c:if test = "${selectCnt == 0}">
	<table class = "confirm">
		<tr>
			<td align = "center">
				<span>${member_code}</span>는 사용할 수 있습니다.
			</td>
		</tr>
		
		<tr>
			<th>
				<input class = "inputButton" type = "button" value ="확인" onclick="setId('${member_code}');">
			</th>
		</tr>
	</table>
</c:if>
</form>
</body>
</html>