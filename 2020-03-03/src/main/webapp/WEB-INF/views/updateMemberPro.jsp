<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "all_setting.jsp" %>
<html>
<head>
<body>
<c:if test = "${updateCnt == 0}">
<script type="text/javascript">
	errorAlert(updateError);
</script>
</c:if>

<c:if test = "${updateCnt != 0}">
<script type="text/javascript">
	alert("수정 완료!!");
	window.location = "all_login.all";
</script>
</c:if>
</body>
</html>