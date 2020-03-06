<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="seller_setting.jsp" %>
<html>
<body>
<c:if test="${updateCnt == 1 }">
	<script>
		alert("수정 성공");
		window.location="seller_sale_Lookup.sel";
	</script>
</c:if>

<c:if test="${updateCnt != 1 }">
	<script>
		alert("수정 실패");
		window.history.back();
	</script>
</c:if>


</body>
</html>