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
<style type="text/css">
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
<title>매물 JSP</title>
</head>
<body>
<div id="body_layout">
	<div class="body_wrap">
	  	<!-- 타이틀 시작 -->
	  	<div class="title_wrap type1">
	       <div class="title">
	           <h3>나의관심</h3>
	       </div>
			<p class="txt_s">스크랩 했던 내용들을 확인하실 수 있습니다.</p>
	       <div class="location">
	           <ul>
	               <li><a onclick="load('/')">홈</a></li>
	               <li><a onclick="load('all_mypage.all')">마이페이지</a></li>
	               <li>나의관심</li>
	           </ul>
	       </div>
	    </div>
	   	<!-- 타이틀 끝 -->
       <!-- 컨텐츠 시작 -->
	<div class="contents_wrap2">
		<ul class="list_tab type3">
			<li class="on"><a onclick="load('all_myFavorite.all')">지역/단지</a></li>
			<li><a onclick="load('all_building.all')">매물</a></li>
		</ul>

		<div class="clearfix">
			<span class="info_wrap2 mypage1">
				<span><input type="checkbox" class="ico_comm_s inp_chk spnDel" id="chk_all" data-type="allchoice"><label for="chk_all"><span class="ico_comm_s chk"></span>전체선택</label></span>
				<span class="spnDel" data-type="choice"><a href="#">선택삭제</a></span>
			</span>
			<span class="info_wrap2 fr">
				<span class="spnSearchGbn"><a href="#" class="selected">전체</a></span>
				<span class="spnSearchGbn"><a href="#">거래중</a></span>
				<span class="spnSearchGbn"><a href="#">거래완료</a></span>
				<span class="fc_gray9">총 <em class="fc_black" id="idTotalCount">2</em>개</span>
			</span>
		</div>

		<ul class="list_article mypage" id="idMyForSaleList">
			<li>
				<span class="my_chk"><input type="checkbox" class="ico_comm_s inp_chk" name="chkNum" id="chk00F9F9EE36AB28" value="00F9F9EE36AB28"><label for="chk00F9F9EE36AB28"><span class="ico_comm_s chk"></span><span class="blind">선택</span></label></span>
				<a href="/?_c=memul&amp;_m=HouseDetail&amp;mulcode=00F9F9EE36AB28" class="cont" target="_blank">
					<strong class="tit_a"><span>LH강남브리즈힐</span><em><span class="tag_comm2 m">매매</span>110,000 만원</em></strong>
					<span class="tag_comm3 type4">일반매물<em>20.01.17</em></span>
					<div class="thumb">
						
					</div>
					<span class="txt">
						<strong>아파트</strong><span class="info_memul">방3개 116.58/84.29㎡ 고층/총8층 </span><!--405동-->
						<em>빠른입주가능 매우조용 대모산뷰 초중고인접 관리잘된집</em>
						<p><span class="ico_comm_s location4">위치</span>서울특별시&nbsp;강남구&nbsp;자곡동</p>
					</span>
				</a>
				<em class="tel">
					<div>
						<p class="name"><i class="ico_class c">C</i>태양부동산공인중개사사무소</p>
						<span><i class="ico_comm_s tel">전화번호</i>02)575-8899</span>
						<a href="javascript:;" class="btn_type1 small btnComment" data-info="00F9F9EE36AB28^F20190312150136^태양부동산공인중개사사무소" data-title="매매^아파트^LH강남브리즈힐^서울특별시">1:1문의</a>
						<a href="javascript:;" onclick="fnGoJunHome('F20190312150136')" class="btn_type1 small">홈페이지</a>
						<a href="javascript:;" onclick="fnGoJunHomeMemul('F20190312150136')" class="btn_type1 small">매물보기</a>
					</div>
				</em>
				<span class="info_wrap2">2020.02.16</span>
			</li>
			
			<li>
				<span class="my_chk"><input type="checkbox" class="ico_comm_s inp_chk" name="chkNum" id="chk09247F7498EF2C" value="09247F7498EF2C"><label for="chk09247F7498EF2C"><span class="ico_comm_s chk"></span><span class="blind">선택</span></label></span>
				<a href="/?_c=memul&amp;_m=HouseDetail&amp;mulcode=09247F7498EF2C" class="cont" target="_blank">
					<strong class="tit_a"><span>책향기마을10단지동문굿모닝힐</span><em><span class="tag_comm2 w">월세</span>2,000/90 만원</em></strong>
					<span class="tag_comm3 type1">알짜매물<em>20.02.06</em></span>
					<div class="thumb">
						
					</div>
					<span class="txt">
						<strong>아파트</strong><span class="info_memul">방3개 106.24/84.88㎡ 7층/총15층 </span><!--1010동-->
						<em>빠른입주가능한 깨끗한집</em>
						<p><span class="ico_comm_s location4">위치</span>경기도&nbsp;파주시&nbsp;동패동</p>
					</span>
				</a>
				<em class="tel">
					<div>
						<p class="name"><i class="ico_class r">R</i>청석공인</p>
						<span><i class="ico_comm_s tel">전화번호</i>031)957-1800</span>
						<a href="javascript:;" class="btn_type1 small btnComment" data-info="09247F7498EF2C^F20081103095405^청석공인" data-title="월세^아파트^책향기마을10단지동문굿모닝힐^경기도">1:1문의</a>
						<a href="javascript:;" onclick="fnGoJunHome('F20081103095405')" class="btn_type1 small">홈페이지</a>
						<a href="javascript:;" onclick="fnGoJunHomeMemul('F20081103095405')" class="btn_type1 small">매물보기</a>
					</div>
				</em>
				<span class="info_wrap2">2020.02.16</span>
			</li>
			
		</ul>
		<div class="paging"><strong><span class="skip">현재페이지</span>1</strong></div>

       </div>
       <!-- 컨텐츠 끝 -->
   </div>
</div>   
<div id="result">

</div>
</body>
</html>