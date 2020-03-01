<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "all_setting.jsp" %>		
<!DOCTYPE html>
<html>
<head>
<link href="${styles}/1_mainpage/css/mypage/mypage.css" rel="stylesheet" type="text/css">
<link href="${styles}/1_mainpage/css/mypage/layout1.css" rel="stylesheet" type="text/css">
<link href="${styles}/1_mainpage/css/mypage/layout2.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<style>
li{
	list-style-type: none;
}
</style>

<script src="${javascripts}/request.js"></script>
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
<div id="body_layout">
	<div class="body_wrap">
    	<!-- 타이틀 시작 -->
    	<div class="title_wrap type2">
            <div class="title">
                <h3>의뢰내역</h3>
            </div>
			<p class="txt_s">의뢰하신 내용에 대해 진행현황을 확인하시거나 수정, 삭제 등 관리하실 수 있습니다<br> <span class="fc_blue txt_star">거래전담 중개사무소가 선택된 이후에는 수정하실 수 없습니다.</span></p>
            <div class="location">
                <ul>
                   <li><a onclick="load('/')">홈</a></li>
	               <li><a onclick="load('all_mypage.all')">마이페이지</a></li>
	               <li>의뢰내역</li>
                </ul>
            </div>
        </div>
    	<!-- 타이틀 끝 -->
        <!-- 컨텐츠 시작 -->
		<div class="contents_wrap2">
			<div class="clearfix">
				<span class="sort_wrap" id="statusGubun">
	        		<a href="#none" class="selected">전체</a>
	        		<a href="#none">의뢰중</a>
	        		<a href="#none">진행중</a>
	        		<a href="#none">완료/종료</a>
	        	</span>
				<span class="fc_gray9 fr">총 <em class="fc_black" id="totalCount">0</em>개</span>
			</div>

			<ul class="list_sell"><li class="result_nodata">의뢰내역이 없습니다.</li></ul>

			<div class="paging"></div>

        </div>
        <!-- 컨텐츠 끝 -->
    </div>
</div>
<div id="result">

</div>
</body>
</html>
