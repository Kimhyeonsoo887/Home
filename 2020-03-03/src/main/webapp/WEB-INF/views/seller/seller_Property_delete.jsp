<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="seller_setting.jsp" %>
<html>
<body>
<c:if test="${deleteCnt == 1 }">
	<script>
		alert("삭제가 완료되었습니다.");
		window.location="seller_modifyView.sel";
	</script>
</c:if>

<c:if test="${deleteCnt != 1 }">
	<script>
		alert("삭제가 실패되었습니다. 다시시도해주세요");
		window.history.back();
	</script>
</c:if>
</body>
</html>