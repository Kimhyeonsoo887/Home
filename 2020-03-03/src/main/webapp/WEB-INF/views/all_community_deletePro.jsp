<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="all_setting.jsp" %>    
<html>
<body>
<h2><center>글삭제</center></h2>
<c:if test="${deleteCnt == 0}">
	<script type="text/javascript">
		alert("글 삭제에 실패하였습니다.\n 확인 후 다시 시도하세요.");
	</script>
</c:if>

<c:if test="${deleteCnt != 0}">
	<script type="text/javascript">
		alert("글이 삭제되었습니다.");
		window.location="all_qna.all";
	</script>
</c:if>
</body>
</html>