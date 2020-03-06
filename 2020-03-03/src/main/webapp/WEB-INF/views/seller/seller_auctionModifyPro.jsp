<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="seller_setting.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>seller_auctionModifyPro</title>
	</head>
	<body>
		<c:if test="${updateCnt == 1}">
			<script>
				alert("경매정보수정이 완료되었습니다.");
				self.close();
				window.location.href = "seller_modifyView.sel";
			</script>
		</c:if>
		<c:if test="${updateCnt != 1}">
			<script>
				alert("경매정보수정이 완료되지못하였습니다. \n 다시시도하십시오.");
				window.history.back();
			</script>
		</c:if>
	</body>
</html>