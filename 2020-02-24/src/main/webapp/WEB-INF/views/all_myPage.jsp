<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "all_setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<link href="${styles}/1_mainpage/css/mypage/mypage.css" rel="stylesheet" type="text/css">
<link href="${styles}/1_mainpage/css/mypage/layout1.css" rel="stylesheet" type="text/css">
<link href="${styles}/1_mainpage/css/mypage/layout2.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<style type="text/css">
li{
	list-style-type: none;
}

.mypage_visual img{
	opacity: 0.5;
	/* overflow: hidden; */
	height: 177px;
	 width: 100%;
}
</style>
<script src="${javascripts}/request.js"></script>
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

<%@ include file="all_header.jsp" %>

<div id="container">
	<ul id="top-menu">
		<li><a class="current" onclick="load('all_updateMember.all');">회원정보수정</a></li>
		<li><a class="current" onclick="load('all_deleteMember.all');">회원탈퇴</a></li>
		<li><a class="current" onclick="load('all_myFavorite.all');">관심매물</a></li>
		<li><a class="current" onclick="load('all_request.all');">의뢰내역</a></li>
	</ul>
</div>
<div id="result">
<div id="body_layout">

	<!-- 메인 상단 -->
	<div class="mypage_visual">
		<img src="${styles}/1_mainpage/img/white room.jpg">
		<div class="login clearfix">
			<div class="left">
			    <p class="clearfix">
                    <span class="txt1"><em>이름</em>님의 의뢰내역 입니다.</span>
                    <span class="txt2">(의뢰 수정 및 취소는 의뢰내역 상세페이지에서 변경하실 수 있습니다.)</span>
                </p>
			</div>
			<div class="right">
				<ul>
					<li><a onclick="">0</a><span>의뢰중/선택대기</span></li>
					<li><a onclick="">1</a><span>진행중</span></li>
					<li><a onclick="">0</a><span>거래완료/거래중단</span></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- //메인 상단-->

	<div class="body_wrap">
		<!-- 로그인-3 -->
		<div class="mypage_cont1 clearfix">
			<!-- 나의활동  -->
			<div class="fl">
				<div class="h4_wrap">
					<h4 class="h4_type4">나의활동</h4>
					<span>나의 최근 활동 내역에 대해 확인 하실 수 있습니다.</span>
				</div>
				<table class="tbl_type1 type8">
					<caption>나의활동</caption>
					<colgroup>
						<col style="width:90px"><col>
					</colgroup>
					<tbody id="tblMyTraceLog">
<tr>
	<th scope="row"><span class="fc_gray3">매물/시세</span><span>매물상세</span></th>
	<td>
		<a onclick="">
			<span class="info_wrap2"><span class="fc_gray3">LH강남브리즈힐</span><span>아파트</span><span>매매</span><span>매매가: <em class="fc_blue">110,000</em> 만원</span></span>
			<p><span class="ico_comm_s location4">위치</span>서울특별시&nbsp;강남구&nbsp;자곡동</p>
		</a>
	</td>
</tr>
<tr>
	<th scope="row"><span class="fc_gray3">매물/시세</span><span>단지소식</span></th>
	<td>
		<a onclick="">
			<span class="info_wrap2"><span class="fc_gray3">가람</span><span>아파트</span><span>매매</span></span>
			<p><span class="ico_comm_s location4">위치</span>서울특별시&nbsp;강남구&nbsp;일원동</p>
		</a>
	</td>
</tr>
		</tbody>
				</table>
				<a onclick="" class="more"><span class="ico_comm_l arrow1">나의활동 더보기</span></a>
			</div>
			<!-- //나의활동  -->
			<!-- 나의관심  -->
			<div class="fr">
				<div class="h4_wrap">
					<h4 class="h4_type4">나의관심</h4>
				</div>
				<table class="tbl_type1 type8">
					<caption>나의관심</caption>
					<colgroup>
						<col style="width:90px"><col>
					</colgroup>
					<tbody id="tblMyConcern">
<tr>
	<th scope="row"><span class="fc_gray3">매물/시세</span><span>단지소식</span></th>
	<td>
		<a onclick="">
			<span class="info_wrap2"><span>아파트</span><span>매매</span></span>
			<p><span class="ico_comm_s location4">위치</span>서울특별시&nbsp;강남구&nbsp;일원동</p>
		</a>
	</td>
</tr>

<tr>
	<th scope="row"><span class="fc_gray3">매물/시세</span><span>매물</span></th>
	<td>
		<a onclick="">
			<span class="info_wrap2"><span>아파트</span><span>매매</span></span>
			<p><span class="ico_comm_s location4">위치</span>서울특별시&nbsp;강남구&nbsp;자곡동</p>
		</a>
	</td>
</tr>

<tr>
	<th scope="row"><span class="fc_gray3">매물/시세</span><span>매물</span></th>
	<td>
		<a onclick="">
			<span class="info_wrap2"><span>아파트</span><span>월세</span></span>
			<p><span class="ico_comm_s location4">위치</span>경기도&nbsp;파주시&nbsp;동패동</p>
		</a>
	</td>
</tr>
		</tbody>
				</table>
				<a onclick="" class="more"><span class="ico_comm_l arrow1">나의관심 더보기</span></a>
			</div>
			<!-- //나의관심  -->
		</div>
	</div>
</div>
</div>
<%@ include file = "all_footer.jsp" %>
</body>
</html>