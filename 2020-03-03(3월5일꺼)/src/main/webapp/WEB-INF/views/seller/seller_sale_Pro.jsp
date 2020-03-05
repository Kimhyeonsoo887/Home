<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="seller_setting.jsp" %>
<html>
<body>
<c:if test="${insertCnt == 1}">
	<script>
		alert("매물등록에 성공했습니다.");
		window.location="seller_sale.sel";
	</script>
</c:if>

<c:if test="${insertCnt != 1}">
	<script>
		alert("매물등록에 실패했습니다. 다시시도해주세요");
		window.history.back();
	</script>
</c:if>
</body>
</html>