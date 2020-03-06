<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="member_setting.jsp" %>
<html>
<style type="text/css">


#auctionlist{
	overflow-x: auto;
    overflow-y: auto;
       
} 
</style>
<body>
<%@ include file="../all_header.jsp" %>


<br><br><br><br>
<div id="map" style="width:70%;height:900px; float:left;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b13e944d68b1d05bb35579360727a7a"></script>
<script>
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};

	var map = new kakao.maps.Map(container, options);
</script>

<div style="width:29%; height:900px; border:1px solid black; float:left;">
	<div style="width:100%; height:100px;">
		<h2>이 지역 매물 목록</h2>
	</div>
	
	<div style="width:100%; height:50px;">
		검색 <input type="text" style="width: 200px; height: 30px;">
		<input type="button" value="검색">
	</div>
	
	<div id ="auctionlist" style="width: 100%; height: 700px;">
		<c:forEach var="dto" items="${dtos}">
			<div style="width:100%; height:150px;">
			<a style="float:left;" href="houseDetail.mem?prp_number=${dto.prp_number}">
				<img style="width: 200px; height: 150px;" src="${images}/sellerImages/${dto.prp_title}">
			</a>
			
			<c:if test="${dto.prp_termtype.equals('월세')}">
	      		<h3>${dto.prp_monthlycost}원</h3>
	      	</c:if>
	      	
	      	<c:if test="${dto.prp_termtype.equals('전세')}">
	      		<h3>${dto.prp_leasecost}원</h3>
	      	</c:if>
	      	
	      	<c:if test="${dto.prp_termtype.equals('매매')}">
	      		<h3>${dto.prp_propertycost}원</h3>
	      	</c:if>
			<br>
			<a>${dto.prp_supplyarea}</a> <br>
			<a>${dto.prp_name }</a> <br>
			<a>${dto.prp_detail}</a>
			</div>
	
		</c:forEach>
	</div>
</div>
</body>
</html>