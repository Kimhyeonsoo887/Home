<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ JSP</title>
<link href="${styles}/1_mainpage/css/mypage/mypage.css" rel="stylesheet" type="text/css">
<link href="${styles}/1_mainpage/css/mypage/layout1.css" rel="stylesheet" type="text/css">
<link href="${styles}/1_mainpage/css/mypage/layout2.css" rel="stylesheet" type="text/css">
<style>
.lunchbox {
   display:none;
}

a[href]{
	text-decoration:none;
	color:black;
}

#faq{
	text-align:center;
}

.faqlist{
	margin-left:500px;
	margin-top:90px;
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
</head>
<body>
<div id="body_layout">
	<div class="body_wrap">
	<!-- 타이틀 시작 -->
	<div class="title_wrap">
		<div class="title">
			<h3>자주묻는 질문</h3>
		</div>
		<div class="location">
			<ul>
				<li><a onclick="load('/');">홈</a></li>
				<li><a onclick="load('/');">커뮤니티</a></li>
				<li><a href="all_qna.all">공지사항</a></li>
			</ul>
		</div>
	</div>
	<!-- 타이틀 끝 -->
	<!-- 컨텐츠 시작 -->
	<div class="contents_wrap">
		<!-- table -->
		<form name="mainList" method="post">
		<input type="hidden" name="sortType" id="sortType" value="">
		</form>
		<table class="tbl_type1 tbl_expcon mgt0">
			
			<tbody id="MainList">
	        	<tr>
					<th>번호</th>
					<th>질문내용</th>
					<th>등록일</th>
				</tr>
				<tr bgcolor="#ffffff" height="45">
					<td class="center f14">2534</td>
					<td class="f14"><a href="real_qna_view.php?idx=4562&amp;start=0&amp;schKeyword=">지상권 인수라는데 존속기간이 지났는데 지상권자가 어떤 효력을 주장 할 수 있나요?</a></td>
					<td class="center f14">2016.08.10</td>
				</tr>
				<tr bgcolor="#ffffff" height="45">
					<td class="center f14">2533</td>
					<td class="f14"><a href="real_qna_view.php?idx=4561&amp;start=0&amp;schKeyword=">보증금없는 선불월세를 지급한 임차인의 배당여부</a></td>
					<td class="center f14">2016.08.04</td>
				</tr>
				<tr bgcolor="#ffffff" height="45">
					<td class="center f14">2532</td>
					<td class="f14"><a href="real_qna_view.php?idx=4560&amp;start=0&amp;schKeyword=">담보가등기 공유자중 1인이 경매신청한 경우 나머지 공유자들도 담보가등기권자 인가...</a></td>
					<td class="center f14">2016.07.25</td>
				</tr>
				<tr bgcolor="#ffffff" height="45">
					<td class="center f14">2531</td>
					<td class="f14"><a href="real_qna_view.php?idx=4559&amp;start=0&amp;schKeyword=">유치권에 의한 경매를 낙찰받을 경우 유치권자의 배당금액은 어떻게 되나요?</a></td>
					<td class="center f14">2016.07.20</td>
				</tr>
			</tbody>
		</table>
		<!-- //table -->
		<!-- 검색 -->
		<div class="srch_bbs">
			<span class="inp_slt">
				<select title="검색기준 선택" id="searchType" style="display: none;">
					<option value="1">전체</option>
					<option value="2">제목</option>
					<option value="3">내용</option>
				</select><span tabindex="0" id="searchType-button" role="combobox" aria-expanded="false" aria-autocomplete="list" aria-owns="searchType-menu" aria-haspopup="true" title="검색기준 선택" class="ui-selectmenu-button ui-selectmenu-button-closed ui-corner-all ui-button ui-widget"><span class="ui-selectmenu-icon ui-icon ui-icon-triangle-1-s"></span><span class="ui-selectmenu-text">전체</span></span>
			</span>
			<div class="srch_box">
				<input type="text" class="inp_txt" id="searchStr" title="검색어 입력" placeholder="검색어를 입력하세요">
				<a href="#none" id="cmdSearch" class="ico_comm_l btn_srch">검색</a>
			</div>
		</div>
		<!-- //검색 -->
		<!-- paging -->
		<div class="paging pagingList"><strong><span class="skip">현재페이지</span>1</strong><a href="javascript:goPage(2, 1);">2</a><a href="javascript:goPage(3, 1);">3</a><a href="javascript:goPage(4, 1);">4</a><a href="javascript:goPage(5, 1);">5</a><a href="javascript:goPage(6, 1);">6</a><a href="javascript:goPage(7, 1);">7</a><a href="javascript:goPage(8, 1);">8</a><a href="javascript:goPage(9, 1);">9</a><a href="javascript:goPage(10, 1);">10</a><a href="javascript:next_page(1);"><span class="ico_comm_s next_10">다음 10페이지</span></a></div>
		<!-- //paging -->
	</div>
	<!-- 컨텐츠 끝 -->
	<!-- 라이트 시작 -->
	<div class="right_wrap" id="divServiceRight">		<!-- 라이드 시작 -->
        <div class="right_wrap">
        	<!-- 부동산 GO -->
        	<a href="/?_c=service&amp;_m=p2p&amp;_a=product"><img src="https://image.r114.co.kr/W1/images/sub/banner_p2p.png" alt="P2P 부동산 투자"></a>
        	<!-- //부동산 GO -->
			<div class="bx_gray">
				<!-- 우리동네, 단지 이야기 BEST -->
				<div class="inner weekly">
					<h4 class="h4_type2">우리동네 이야기 BEST</h4>
					<ol class="list_num_type1" id="listCommunityBest">
						
						<li><a href="javascript:goCommunityDetailPage(1852);">서울시에서 저평가된 1236세대 역세권, 숲세권 동부골든아파트</a></li>
						
						<li><a href="javascript:goCommunityDetailPage(1834);">구로역개발시 최고의 아파트로 거급난다</a></li>
						
						<li><a href="javascript:goCommunityDetailPage(1838);">이것 저것 따져봐도 별 나무날데가 없는 단지 인 것같아요   나중에 애들 키우기도 좋음</a></li>
						
						<li><a href="javascript:goCommunityDetailPage(1833);">수도권에서 신분당성 역세권 + 광교산 숲세권으로써 이만한 천혜의 입지는 찾아보기 힘듬.</a></li>
						
						<li><a href="javascript:goCommunityDetailPage(1846);">오래되어서 더 가치있는 아파트 중계동 학원가의 소형 평형 투자가치</a></li>
						
					</ol>
					<a href="/?_c=service&amp;_s=community" class="more_type1">더보기 <span class="ico_comm_s more1"></span></a>
				</div>
				<!-- //우리동네, 단지 이야기 BEST -->
			</div>
			<div class="bx_gray">
				<!-- 부동산상담 BEST -->
				<div class="inner weekly">
					<h4 class="h4_type2">부동산상담 BEST</h4>
					<ol class="list_num_type1" id="listCounselBest">
						
						<li><a href="javascript:goCounselDetailPage('expert', 5650);">고가주택외 1주택을  더 구입할지</a></li>
						
						<li><a href="javascript:goCounselDetailPage('expert', 5663);">아파트 구매상담</a></li>
						
						<li><a href="javascript:goCounselDetailPage('expert', 5674);">양도소득세 문의 드립니다</a></li>
						
						<li><a href="javascript:goCounselDetailPage('expert', 5683);">중개수수료에 대한 문의 드립니다.</a></li>
						
						<li><a href="javascript:goCounselDetailPage('expert', 5691);">평촌구축아파트매도시기</a></li>
						
					</ol>
					<a href="/?_c=service&amp;_m=counsel" class="more_type1">더보기 <span class="ico_comm_s more1"></span></a>
				</div>
				<!-- //부동산상담 BEST -->
			</div>
        </div>
        <!-- 라이드 끝 -->
	</div>
	<!-- 라이트 끝 -->
	</div>
</div>				
</body>
</html>