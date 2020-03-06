<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="seller_setting.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>seller_auctionRegisterPro</title>
	</head>
	<body>
		<c:if test="${insertCnt == 1}">
			<script>
				alert("경매등록에 성공하였습니다.");
				self.close();
			</script>
		</c:if>
		<c:if test="${insertCnt != 1}">
			<script>
				alert("경매등록에 실패하였습니다.");
				window.history.back();
			</script>
		</c:if>
	</body>
</html>