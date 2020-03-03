<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "all_setting.jsp" %>
<html>
<script src="${javascripts}/signup_javascript.js"></script>
<style>
	table, tr, td{
		width: 100%;
		border: 1px dotted gray;
		border-collapse: collapse;
		text-align: center;
	}
	th{
		width: 10%;
	}
	td{
		width: 90%
	}
	p{
		width: 100%;
		text-align: center;
		margin: 10px auto;
	}
</style>
<body>

<c:if test="${findCnt == 0}">
	<script>
		alert("입력하신 이름은 존재하지 않습니다.");
		self.close();
	</script>
</c:if>
<c:if test="${findCnt == 1}">	
	<c:if test="${findPhone == 0}">
		<script>
			alert("입력하신 명의와 일치한 번호가 존재하지 않습니다.");
			self.close();
		</script>
	</c:if>
</c:if>


<table>
	<colgroup>
		<col width="10%">
		<col width="90%">
	</colgroup>
	<tr>
		<th>이름: </th>
		<td>${param.name}</td>
	</tr>
	<tr>
		<th>번호: </th>
		<td>${param.phone}</td>
	</tr>
	<tr>
		<td colspan="2">회원님의 계정은 [<span style="color: blue; font-weight: bold;">${member_id}</span>] 입니다.</td>
	</tr>
</table>


<p>
	<input type = "button" value = "닫기" onclick = "self.close();">
</p>

</body>
</html>