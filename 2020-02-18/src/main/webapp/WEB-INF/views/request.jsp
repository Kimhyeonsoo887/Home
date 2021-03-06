<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
ul {
	list-style-type: none;
}

nav {
	margin: 10px;
}

nav ul {
	list-style: none;
	text-align: center;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	padding: 10px 0;
}

nav ul li {
	display: inline;
	text-transform: uppercase;
	padding: 0 10px;
	letter-spacing: 10px;
}

nav ul li a {
	text-decoration: none;
	color: black;
}

nav ul li a:hover {
	text-decoration: underline;
}
</style>

<script src="/bridge/resources/js/request.js"></script>
<script type="text/javascript">
	function load(url) {
		//서버로 요청해서 통신한 후 응답을 callback 함수로 받겠다.
		//sendRequest(callback, url, method, params)
		//news1.jsp ,news2.jsp ,news3.jsp -> 콜백함수로 리턴
		sendRequest(loadNews_callback, url, "post");
	}

	//콜백함수
	function loadNews_callback() {
		var result = document.getElementById("result"); //div이름

		if (httpRequest.readyState == 4) {//4: completed => 전체 데이터가 취득완료된 상태
			if (httpRequest.status == 200) { //정상 종료
				result.innerHTML = httpRequest.responseText;
				//응답결과가 html이면 responseText로 받고, XML이면 responseXML로 받는다.
				//result.innerHTML = httpRequest.responseText;

			} else {
				result.innerHTML = "에러발생";

			}
		} else {
			result.innerHTML = "상태:" + httpRequest.readyState;
		}
	}
</script>
<title>의뢰내역</title>
</head>
<body>

	<nav>
		<ul>
			<!-- 	<li><a onclick="load('selling.all')">내놓기</a></li> -->
			<li><a onclick="load('buying.all')">구하기</a></li>
		</ul>
	</nav>

	<div id="result">
	
	</div>
</body>


</html>
