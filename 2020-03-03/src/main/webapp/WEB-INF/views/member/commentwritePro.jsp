<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="member_setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 글쓰기 실패 -->
<c:if test="${insertCnt== 0}">
	<script type="text/javascript">
	errorAlert(insertError);
	</script>
</c:if>

<c:if test="${insertCnt!= 0}">
	<script type="text/javascript">
		alert("댓글이 작성되었습니다.");
		window.history.back();		
	</script> 
</c:if>
</body>
</html>