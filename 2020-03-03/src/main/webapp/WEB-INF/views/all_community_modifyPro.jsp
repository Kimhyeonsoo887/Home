<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="all_setting.jsp" %>
<html>
<body>
<c:if test="${updateCnt == 1 }">
	<script type="text/javascript">
		alert("글이 수정되었습니다.");	
		window.location="all_qna.all";	
	</script>
</c:if>
<c:if test="${updateCnt != 1}">
	<script type="text/javascript">
		alert("글 수정에 실패하였습니다. \n확인 후 다시 시도하세요.");
	</script>
</c:if>
</body>
</html>