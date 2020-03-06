<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="all_setting.jsp" %>    
<html>
<body>
<h2 align="center">글쓰기-처리페이지</h2>
<script src="${javascripts}/request.js"></script>
<script type="text/javascript">
function load(url){
	//서버로 요청해서 통신한 후 응답을 callback 함수로 받겠다.
	//sendRequest(callback, url, method, params)
	//news1.jsp ,news2.jsp ,news3.jsp -> 콜백함수로 리턴
	sendRequest(loadNews_callback,url,"post");
}
</script>
<c:if test="${insertCnt != 0}">
	<script type="text/javascript">
		alert("성공적으로 작성되었습니다.");
		window.location="all_qna.all";
	</script>
	<!-- <a onclick="load('all_community_List.all');"/> -->
</c:if>

<!-- 글쓰기 실패 -->
<c:if test="${insertCnt == 0}">
	<script type="text/javascript">
		alert("글 쓰기에 실패하였습니다. \n확인 후 다시 시도하세요.");
	</script>
</c:if>

</body>
</html>