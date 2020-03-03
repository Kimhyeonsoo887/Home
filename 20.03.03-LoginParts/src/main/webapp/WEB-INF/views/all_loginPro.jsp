<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "all_setting.jsp" %>
<html>
<body>


<c:if test = "${selectCnt == 0}">
<script type="text/javascript">
	alert("아이디가 존재하지 않습니다.");
	window.history.back();
</script>
</c:if>

<c:if test = "${selectCnt == -1}">
<script type="text/javascript">
	alert("비밀번호가 일치하지 않습니다.");
	window.history.back();
</script>
</c:if>

<c:if test = "${selectCnt== 1}">
	
	
	<c:if test="${logintype =='[ROLE_SELLER]'}">
		<script type="text/javascript">
			alert("로그인 하였습니다.!!");
			window.location = "seller_main.sel"
		</script>	
	</c:if>


	<c:if test="${logintype =='[ROLE_MEMBER]'}">
		<script type="text/javascript">
			alert("로그인 하였습니다.!!");
			window.location = "all_index.all"
		</script>	
	</c:if>
	
	<c:if test="${logintype =='[ROLE_ADMIN]'}">
		<script type="text/javascript">
			alert("로그인 하였습니다.!!");
			window.location = "admin_index.all"
		</script>	
	</c:if>
</c:if>

<c:if test = "${selectCnt== 3}">
<script type="text/javascript">
	alert("이메일 인증하고 오세요.");
	window.history.back();
</script>
</c:if>
</body>
</html>