<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_setting.jsp" %>

<html>

<body>
<h2><center>권한승인 결과알림</center></h2>

<c:if test="${updateCnt_Seller == 0 }">
	<script type="text/javascript">
		alert("셀러 승인에 실패했습니다..!!");
	</script>
</c:if>

<c:if test="${updateCnt_Seller == 1 }">
	<script type="text/javascript">
		alert("셀러 승인되었습니다.!!");
		window.location="admin_approveseller.all"
	</script>
</c:if>

<c:if test="${updateCnt_Email == 0 }">
	<script type="text/javascript">
		alert("이메일 승인에 실패했습니다..!!");
	</script>
</c:if>

<c:if test="${updateCnt_Email == 1 }">
	<script type="text/javascript">
		alert("이메일 승인되었습니다.!!");
		window.location="admin_approveseller.all"
	</script>
</c:if>

</body>
</html>