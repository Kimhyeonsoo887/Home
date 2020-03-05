<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${updateCnt!=0}">
	 <script type="text/javascript">
		alert("글이 수정되었습니다.");
		window.location='all_qna.all?pageNum=${pageNum}';
	</script> 

</c:if>




</body>
</html>