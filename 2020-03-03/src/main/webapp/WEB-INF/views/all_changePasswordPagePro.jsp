<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="all_setting.jsp" %>
<html>
<body>
<c:if test="${changeCnt == 1 }">
	<script>
		alert("비밀번호가 수정되었습니다");	
		window.location="all_login.all";
	</script>
</c:if>

<c:if test="${changeCnt == 0 }">
	<script>
		alert("비밀번호가 수정실패했습니다 다시시도해주세요.");	
		window.location="all_login.all";
	</script>
</c:if>
</body>
</html>