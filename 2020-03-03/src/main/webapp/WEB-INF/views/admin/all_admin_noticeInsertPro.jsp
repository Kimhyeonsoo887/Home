<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "admin_setting.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>all_admin_noticeInsertPro</title>
	</head>
	<body>
		<c:if test="${insertCnt == 1}">
			<script>
				alert( "공지사항이 추가되었습니다.");
				//부모윈도우를 리프래쉬합니다.
				window.opener.location.reload(false);
				//자기자신 윈도우는 종료합니다.
				self.close();
			</script>
		</c:if>
		<c:if test="${insertCnt != 1}">
			<script>
				alert( "공지사항 추가에 실패하였습니다.");
				window.history.back();
			</script>
		</c:if>
	</body>
</html>