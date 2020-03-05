<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="all_setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
<script src="/woorizib/resources/javascripts/jquery-3.4.1.min.js"></script>
<script>


 
 
</script>

</head>
<body>
<div>
	<table class="type09">
		
		<!-- <thead>
		<tr><th colspan="2">실시간 경매 현황</th></tr></thead> -->
		<c:forEach var="dto" items="${dtos}">
		<tbody>
		
		<tr><td colspan="2">${dto.mem_id}님이  <br><span text-style-option="fontStyleBold" style="color: rgb(255, 103, 84);"><fmt:formatNumber value="${dto.lac_tender}" pattern="#,###,###,###"/></span> 입찰하였습니다.</td>
		<th><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.lac_registerdate}"/></th></tr></tbody>
		</c:forEach>
		<c:if test="${dtos=null}">
			<tr><td>현재 입찰기록이 없습니다.</td></tr>
		</c:if>
	</table>
</div>
</body>
</html>