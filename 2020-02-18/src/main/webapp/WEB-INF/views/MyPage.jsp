<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#list{
 	width:1400px; 
 	margin-top:100px;
	margin-left:500px;
	}
	
	.list1{
	width:200px;
	margin:80px;
	}
	.list2{
	width:200px;
	margin:80px;
	}
	.list3{
	width:200px;
	margin:80px;
	}
	.list4{
	width:200px;
	margin:80px;
	}
	
</style>
<script src="/bridge/resources/js/request.js"></script>
<script type="text/javascript">
function load(url){
	//서버로 요청해서 통신한 후 응답을 callback 함수로 받겠다.
	//sendRequest(callback, url, method, params)
	//news1.jsp ,news2.jsp ,news3.jsp -> 콜백함수로 리턴
	sendRequest(loadNews_callback,url,"post");
}

//콜백함수
function loadNews_callback(){
	var result = document.getElementById("result"); //div이름
	
	if(httpRequest.readyState == 4){//4: completed => 전체 데이터가 취득완료된 상태
		if(httpRequest.status == 200){ //정상 종료
			result.innerHTML = httpRequest.responseText;
			//응답결과가 html이면 responseText로 받고, XML이면 responseXML로 받는다.
			//result.innerHTML = httpRequest.responseText;
		}else{
			result.innerHTML = "에러발생";
			
		}
	}
	/* else{
		result.innerHTML="상태:" + httpRequest.readyState;
	} */
}


</script>
<title>마이페이지</title>
</head>
<body>
<%@ include file="header.jsp" %>
<br>
<!--일단은 확장자 .all  -->
	<div id="list">
		<a class="list1" onclick="load('updateMember.cust');">회원정보수정</a>
		<a class="list2" onclick="load('deleteMember.cust');">회원탈퇴</a>
		<a class="list3" onclick="load('MyFavorite.all');">관심매물</a>
		<a class="list4" onclick="load('request.all');">의뢰내역</a>
	</div>
	<br>
	<div id="result">
 		
 	</div>
</body>
</html>