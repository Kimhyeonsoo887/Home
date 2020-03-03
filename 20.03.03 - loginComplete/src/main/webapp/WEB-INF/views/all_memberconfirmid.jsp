<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "all_setting.jsp" %>
<html>
<script src="${javascripts}/signup_javascript.js"></script>
<body>
<form action = "all_memberconfirmid.all" method = "post" name="confirmform">
<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
<c:if test = "${checkCnt == 1}">
	<table class = "confirm">
		<tr>
			<th colspan = "2">
				<span style="color: red;">${id}</span>는 사용할 수 없습니다.
			</th>
		</tr>
			
		<tr>
			<th>아이디 : </th>
			<td>
				<input type = "text" name = "id" maxlength ="30"
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

<c:if test = "${checkCnt == 0}">
	<table class = "confirm">
		<tr>
			<td align = "center">
				<span style="color:blue;">${id}</span>는 사용할 수 있습니다.
			</td>
		</tr>
		
		<tr>
			<th>
				<input class = "inputButton" type = "button" value ="확인" onclick="setIdMember('${id}');">
			</th>
		</tr>
	</table>
</c:if>
</form>
</body>
</html>