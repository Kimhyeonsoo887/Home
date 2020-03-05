<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "all_setting.jsp" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="${styles}/1_mainpage/css/mypage/mypage.css" rel="stylesheet" type="text/css">
<link href="${styles}/1_mainpage/css/mypage/layout1.css" rel="stylesheet" type="text/css">
<link href="${styles}/1_mainpage/css/mypage/layout2.css" rel="stylesheet" type="text/css">
<style type="text/css">
li{
	list-style-type: none;
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

 
  function goCommunityDetailPage(g){

	var formData = {"page": 1, "Metro": "", "County": "", "Town": "", "complexCd": "", "sortTag": "", "sortTag2": "", "tabGubun": "1", "searchGubun": "", "searchText": "", "viewId": g};
	createHisFrm(formData, "/?_c=service&_s=community&_m=communityview&_a=townview");
			
}

function goCounselDetailPage(tabGubun, g){

	//var formData = {"page": 1, "Metro": "", "County": "", "Town": "", "complexCd": "", "sortTag": "", "sortTag2": "", "tabGubun": "2", "searchGubun": "", "searchText": "", "viewId": g};
	window.location.href = "/?_c=service&_s=counsel&_m=counselview&consultgubun=" + tabGubun + "&idx=" + g;
			
}

function goDirectDealDetailPage(g) {

	window.location.href = "/?_c=service&_s=directdeal&_m=directdealdetailPersonal&seq=" + g;

}
</script>
<title>QnA</title>
</head>
<body>
<%@ include file = "all_header.jsp" %> 
<div id="container">
	<ul id="top-menu">
		<li><a class="current" href="all_qna.all">QnA</a></li>
		<li><a class="current" onclick="load('all_notice.all');">공지사항</a></li>
		<li><a class="current" onclick="load('all_paylist.all');">결제내역</a></li>
		<li><a class="current" onclick="load('all_faq.all');">자주묻는 질문</a></li>
		<li><a class="current" onclick="load('all_community_List.all');">자유게시판</a></li>
	</ul>
</div>

<div id="result">
<div id="body_layout">
	<div class="body_wrap">
	<!-- 타이틀 시작 -->
	<div class="title_wrap">
		<div class="title">
			<h3>부동산 상담</h3>
		</div>
		<div class="location">
			<ul>
				<li><a onclick="load('/');">홈</a></li>
				<li><a onclick="load('/');">커뮤니티</a></li>
				<li><a href="all_qna.all">QnA</a></li>
			</ul>
		</div>
	</div>
	<!-- 타이틀 끝 -->
	<!-- 컨텐츠 시작 -->
	<div class="contents_wrap">
		<!-- 글쓰기 -->
		<div class="info_smr bm" style="background-image:url(https://image.r114.co.kr/W1/images/sub/bg_info_expert.jpg);">
			<div class="inner">
				<strong>부동산 때문에 더 이상 고민하지 마세요!</strong>
				<p>꼼꼼 상담소에서 국내 최대 부동산DB를 바탕으로 <br>고객님의 전략적인 선택에 도움을 드립니다.</p>
				<div class="mgt2">
					<a href="#none" onclick="fnExpertGuide();" class="btn_type15">전문가 소개</a>
					<a href="#none" onclick="fnCounselSave();" class="btn_type15">상담하기</a>
				</div>
			</div>
		</div>
		<!-- //글쓰기 -->
		
		<!-- table -->
		<form name="mainList" method="post">
		<input type="hidden" name="sortType" id="sortType" value="">
		</form>
		<table class="tbl_type1 tbl_expcon mgt0">
			<caption></caption>
			<colgroup>
				<col style="width:11%"><col style="width:16%"><col><col style="width:12%;"><col style="width:12%;"><col style="width:9%;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col" rowspan="2">공개여부</th>
					<th scope="col">상담구분</th>					
					<th scope="col" rowspan="2">제목</th>
					<th scope="col">질문자</th>
					<th scope="col" rowspan="2">등록일</th>
					<th scope="col" rowspan="2">조회</th>
				</tr>
				<tr>
					<th scope="col">소분류</th>
					<th scope="col">답변자</th>
				</tr>
			</thead>
			<tbody id="MainList">
	        		
				<tr>
					<td rowspan="2">공개</td>
					<td class="con_type">전문가상담</td>					
					<td class="lf"><a href="javascript:;" onclick="fnCounselView('expert','5691')" class="question"><em class="fc_blue">Q.</em> 평촌구축아파트매도시기</a></td>
					<td><span class="fc_gray6">hsksyj65</span></td>
					<td><span class="fc_gray6">2020.02.19</span></td>
					<td rowspan="2"><span class="fc_gray6">57</span></td>
				</tr>
				<tr class="bd_type">
					<td><span class="subclass"></span>주거용매물</td>
					<td class="lf">
						
						<a href="javascript:;" onclick="fnCounselView('expert','5691')" class="answer"><em class="fc_red">A.</em>의견드립니다</a>
					</td>
					<td class="smr_expert">
						<a href="javascript:;">김인만</a>
						<!-- 전문가 소개 -->
						<div class="tooltip type_rightblue"> <strong>김인만 ( 주거용매물전문 )</strong><ul><li>-김인만 부동산경제연구소 소장 </li><li>-TV조선 "이사야사" 고정패널 </li><li>-YTN "생생경제" 고정패널</li><li>-Queen "생활 속 부동산" 연재</li><li>-조선일보 등 칼럼기고</li></ul><div class=""><a href="/?_c=service&amp;_m=counselexpertguide" class="btn_type8">소개 더보기</a> <a href="javascript:;" onclick="fnLoginCheckPage('/?_c=mypage&amp;_m=counselsave&amp;expertgubun=3')" class="btn_type8">상담신청</a> </div></div><div class="tooltip type_rightblue"> <strong>김인만 ( 재개발/재건축전문 )</strong><ul><li>-김인만 부동산경제연구소 소장 </li><li>-TV조선 "이사야사" 고정패널 </li><li>-YTN "생생경제" 고정패널</li><li>-Queen "생활 속 부동산" 연재</li><li>-조선일보 등 칼럼기고</li></ul><div class=""><a href="/?_c=service&amp;_m=counselexpertguide" class="btn_type8">소개 더보기</a> <a href="javascript:;" onclick="fnLoginCheckPage('/?_c=mypage&amp;_m=counselsave&amp;expertgubun=2')" class="btn_type8">상담신청</a> </div></div><div class="tooltip type_rightblue"> <strong>김인만 ( 상가전문 )</strong><ul><li>-김인만 부동산경제연구소 소장 </li><li>-TV조선 "이사야사" 고정패널 </li><li>-YTN "생생경제" 고정패널</li><li>-Queen "생활 속 부동산" 연재</li><li>-조선일보 등 칼럼기고</li></ul><div class=""><a href="/?_c=service&amp;_m=counselexpertguide" class="btn_type8">소개 더보기</a> <a href="javascript:;" onclick="fnLoginCheckPage('/?_c=mypage&amp;_m=counselsave&amp;expertgubun=2')" class="btn_type8">상담신청</a> </div></div>
						<!-- //전문가 소개 -->
					</td>
					<td><span class="fc_gray6">2020.02.20</span></td>
				</tr>
	        		

				<tr>
					<td rowspan="2">비공개</td>
					<td class="con_type">전문가상담</td>					
					<td class="lf"><a href="javascript:;" onclick="alert('비공개 상담은 열람이 불가합니다.')" class="question"><em class="fc_blue">Q.</em> 문의 드립니다.</a></td>
					<td><span class="fc_gray6">rotation</span></td>
					<td><span class="fc_gray6">2020.02.16</span></td>
					<td rowspan="2"><span class="fc_gray6">4</span></td>
				</tr>
				<tr class="bd_type">
					<td><span class="subclass"></span>주거용매물</td>
					<td class="lf">
						
						<a href="javascript:;" onclick="alert('비공개 상담은 열람이 불가합니다.')" class="answer"><em class="fc_red">A.</em>답변 드립니다</a>
					</td>
					<td class="smr_expert">
						<a href="javascript:;">김인만</a>
						<!-- 전문가 소개 -->
						<div class="tooltip type_rightblue"> <strong>김인만 ( 주거용매물전문 )</strong><ul><li>-김인만 부동산경제연구소 소장 </li><li>-TV조선 "이사야사" 고정패널 </li><li>-YTN "생생경제" 고정패널</li><li>-Queen "생활 속 부동산" 연재</li><li>-조선일보 등 칼럼기고</li></ul><div class=""><a href="/?_c=service&amp;_m=counselexpertguide" class="btn_type8">소개 더보기</a> <a href="javascript:;" onclick="fnLoginCheckPage('/?_c=mypage&amp;_m=counselsave&amp;expertgubun=3')" class="btn_type8">상담신청</a> </div></div><div class="tooltip type_rightblue"> <strong>김인만 ( 재개발/재건축전문 )</strong><ul><li>-김인만 부동산경제연구소 소장 </li><li>-TV조선 "이사야사" 고정패널 </li><li>-YTN "생생경제" 고정패널</li><li>-Queen "생활 속 부동산" 연재</li><li>-조선일보 등 칼럼기고</li></ul><div class=""><a href="/?_c=service&amp;_m=counselexpertguide" class="btn_type8">소개 더보기</a> <a href="javascript:;" onclick="fnLoginCheckPage('/?_c=mypage&amp;_m=counselsave&amp;expertgubun=2')" class="btn_type8">상담신청</a> </div></div><div class="tooltip type_rightblue"> <strong>김인만 ( 상가전문 )</strong><ul><li>-김인만 부동산경제연구소 소장 </li><li>-TV조선 "이사야사" 고정패널 </li><li>-YTN "생생경제" 고정패널</li><li>-Queen "생활 속 부동산" 연재</li><li>-조선일보 등 칼럼기고</li></ul><div class=""><a href="/?_c=service&amp;_m=counselexpertguide" class="btn_type8">소개 더보기</a> <a href="javascript:;" onclick="fnLoginCheckPage('/?_c=mypage&amp;_m=counselsave&amp;expertgubun=2')" class="btn_type8">상담신청</a> </div></div>
						<!-- //전문가 소개 -->
					</td>
					<td><span class="fc_gray6">2020.02.17</span></td>
				</tr>
	        		

				<tr>
					<td rowspan="2">비공개</td>
					<td class="con_type">전문가상담</td>					
					<td class="lf"><a href="javascript:;" onclick="alert('비공개 상담은 열람이 불가합니다.')" class="question"><em class="fc_blue">Q.</em> 경남밀양시가곡동34평신축빌라급매처리좀하고싶습니다</a></td>
					<td><span class="fc_gray6">hsvision04***</span></td>
					<td><span class="fc_gray6">2020.02.11</span></td>
					<td rowspan="2"><span class="fc_gray6">2</span></td>
				</tr>
				<tr class="bd_type">
					<td><span class="subclass"></span>주거용매물</td>
					<td class="lf">
						
						<a href="javascript:;" onclick="alert('비공개 상담은 열람이 불가합니다.')" class="answer"><em class="fc_red">A.</em>답변 드립니다</a>
					</td>
					<td class="smr_expert">
						<a href="javascript:;">김인만</a>
						<!-- 전문가 소개 -->
						<div class="tooltip type_rightblue"> <strong>김인만 ( 주거용매물전문 )</strong><ul><li>-김인만 부동산경제연구소 소장 </li><li>-TV조선 "이사야사" 고정패널 </li><li>-YTN "생생경제" 고정패널</li><li>-Queen "생활 속 부동산" 연재</li><li>-조선일보 등 칼럼기고</li></ul><div class=""><a href="/?_c=service&amp;_m=counselexpertguide" class="btn_type8">소개 더보기</a> <a href="javascript:;" onclick="fnLoginCheckPage('/?_c=mypage&amp;_m=counselsave&amp;expertgubun=3')" class="btn_type8">상담신청</a> </div></div><div class="tooltip type_rightblue"> <strong>김인만 ( 재개발/재건축전문 )</strong><ul><li>-김인만 부동산경제연구소 소장 </li><li>-TV조선 "이사야사" 고정패널 </li><li>-YTN "생생경제" 고정패널</li><li>-Queen "생활 속 부동산" 연재</li><li>-조선일보 등 칼럼기고</li></ul><div class=""><a href="/?_c=service&amp;_m=counselexpertguide" class="btn_type8">소개 더보기</a> <a href="javascript:;" onclick="fnLoginCheckPage('/?_c=mypage&amp;_m=counselsave&amp;expertgubun=2')" class="btn_type8">상담신청</a> </div></div><div class="tooltip type_rightblue"> <strong>김인만 ( 상가전문 )</strong><ul><li>-김인만 부동산경제연구소 소장 </li><li>-TV조선 "이사야사" 고정패널 </li><li>-YTN "생생경제" 고정패널</li><li>-Queen "생활 속 부동산" 연재</li><li>-조선일보 등 칼럼기고</li></ul><div class=""><a href="/?_c=service&amp;_m=counselexpertguide" class="btn_type8">소개 더보기</a> <a href="javascript:;" onclick="fnLoginCheckPage('/?_c=mypage&amp;_m=counselsave&amp;expertgubun=2')" class="btn_type8">상담신청</a> </div></div>
						<!-- //전문가 소개 -->
					</td>
					<td><span class="fc_gray6">2020.02.17</span></td>
				</tr>
	        		

				<tr>
					<td rowspan="2">공개</td>
					<td class="con_type">전문가상담</td>					
					<td class="lf"><a href="javascript:;" onclick="fnCounselView('expert','5683')" class="question"><em class="fc_blue">Q.</em> 중개수수료에 대한 문의 드립니다.</a></td>
					<td><span class="fc_gray6">수호신</span></td>
					<td><span class="fc_gray6">2020.02.09</span></td>
					<td rowspan="2"><span class="fc_gray6">225</span></td>
				</tr>
				<tr class="bd_type">
					<td><span class="subclass"></span>주거용매물</td>
					<td class="lf">
						
						<a href="javascript:;" onclick="fnCounselView('expert','5683')" class="answer"><em class="fc_red">A.</em>답변 드립니다</a>
					</td>
					<td class="smr_expert">
						<a href="javascript:;">김인만</a>
						<!-- 전문가 소개 -->
						<div class="tooltip type_rightblue"> <strong>김인만 ( 주거용매물전문 )</strong><ul><li>-김인만 부동산경제연구소 소장 </li><li>-TV조선 "이사야사" 고정패널 </li><li>-YTN "생생경제" 고정패널</li><li>-Queen "생활 속 부동산" 연재</li><li>-조선일보 등 칼럼기고</li></ul><div class=""><a href="/?_c=service&amp;_m=counselexpertguide" class="btn_type8">소개 더보기</a> <a href="javascript:;" onclick="fnLoginCheckPage('/?_c=mypage&amp;_m=counselsave&amp;expertgubun=3')" class="btn_type8">상담신청</a> </div></div><div class="tooltip type_rightblue"> <strong>김인만 ( 재개발/재건축전문 )</strong><ul><li>-김인만 부동산경제연구소 소장 </li><li>-TV조선 "이사야사" 고정패널 </li><li>-YTN "생생경제" 고정패널</li><li>-Queen "생활 속 부동산" 연재</li><li>-조선일보 등 칼럼기고</li></ul><div class=""><a href="/?_c=service&amp;_m=counselexpertguide" class="btn_type8">소개 더보기</a> <a href="javascript:;" onclick="fnLoginCheckPage('/?_c=mypage&amp;_m=counselsave&amp;expertgubun=2')" class="btn_type8">상담신청</a> </div></div><div class="tooltip type_rightblue"> <strong>김인만 ( 상가전문 )</strong><ul><li>-김인만 부동산경제연구소 소장 </li><li>-TV조선 "이사야사" 고정패널 </li><li>-YTN "생생경제" 고정패널</li><li>-Queen "생활 속 부동산" 연재</li><li>-조선일보 등 칼럼기고</li></ul><div class=""><a href="/?_c=service&amp;_m=counselexpertguide" class="btn_type8">소개 더보기</a> <a href="javascript:;" onclick="fnLoginCheckPage('/?_c=mypage&amp;_m=counselsave&amp;expertgubun=2')" class="btn_type8">상담신청</a> </div></div>
						<!-- //전문가 소개 -->
					</td>
					<td><span class="fc_gray6">2020.02.10</span></td>
				</tr>
	        		

				<tr>
					<td rowspan="2">비공개</td>
					<td class="con_type">전문가상담</td>					
					<td class="lf"><a href="javascript:;" onclick="alert('비공개 상담은 열람이 불가합니다.')" class="question"><em class="fc_blue">Q.</em> 세금문의드립니다.</a></td>
					<td><span class="fc_gray6">clover01</span></td>
					<td><span class="fc_gray6">2020.02.04</span></td>
					<td rowspan="2"><span class="fc_gray6">13</span></td>
				</tr>
				<tr class="bd_type">
					<td><span class="subclass"></span>세무</td>
					<td class="lf">
						
						<a href="javascript:;" onclick="alert('비공개 상담은 열람이 불가합니다.')" class="answer"><em class="fc_red">A.</em>질문에 대한 답변을 드립니다</a>
					</td>
					<td class="smr_expert">
						<a href="javascript:;">김종필</a>
						<!-- 전문가 소개 -->
						<div class="tooltip type_rightblue"> <strong>김종필 ( 세무전문 )</strong><ul><li>- 김종필 세무사사무소 대표 세무사</li><li>- 중앙일보 조인스랜드 자문위원</li><li>- 한국 금융교육 연구회 회원(금융연수원)</li><li>- 파이어 포럼 회원(금융, 보험, 부동산 관련)</li><li>- 매일경제TV(MBN)부동산뉴스 세무상담</li></ul><div class=""><a href="/?_c=service&amp;_m=counselexpertguide" class="btn_type8">소개 더보기</a> <a href="javascript:;" onclick="fnLoginCheckPage('/?_c=mypage&amp;_m=counselsave&amp;expertgubun=1')" class="btn_type8">상담신청</a> </div></div>
						<!-- //전문가 소개 -->
					</td>
					<td><span class="fc_gray6">2020.02.11</span></td>
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
	</div>
</div>
</div>
<%@ include file = "all_footer.jsp" %> 	
</body>
</html>

