<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<html>
<body>
<!-- 아이디와 비밀번호가 일치 -->
	<c:if test="${selectCnt==1}">
		<c:if test="${deleteCnt==0 }">
			<script type="text/javascript">
				errorAlert(deleteError);
			</script>
		</c:if>
		
	
		<c:if test="${deleteCnt !=0 }">
			<% 
				request.getSession().invalidate();	//모든 세션 삭제
			%>
				
			<script type="text/javascript">
				setTimeout(function(){
					alert("탈퇴처리되었습니다.");
					window.location="index.all";   //SelectCnt=2
			},1000)
			</script>
		</c:if>	<!-- 삭제 성공 -->
		
	</c:if>	<!-- 아이디와 비밀번호 일치 -->

	<!-- 비밀번호 불일치  -->
	<c:if test="${selectCnt !=1}">
		<script type="text/javascript">
			errorAlert(passwdError);
		</script>
	</c:if>

	
</body>
</html>