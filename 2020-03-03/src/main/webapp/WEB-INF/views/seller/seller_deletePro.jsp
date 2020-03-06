<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "seller_setting.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<c:if test ="${deleteCnt == 1}">
			<script>
				var count = ${deleteCnt};
				alert("경매" + count + "건이 삭제되었습니다.");					
				window.location.href = "seller_modifyView.sel";
			</script>
		</c:if>
		<c:if test ="${deleteCnt != 1}">
			<script>
				alert( "경매 삭제에 실패하였습니다." );
				window.history.back();				
			</script>
		</c:if>
	</body>
</html>