<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "all_setting.jsp" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
}
</script>
<title>자유게시판</title>
</head>
<body>
<div id="body_layout">
	<div class="body_wrap">
	<!-- 타이틀 시작 -->
	<div class="title_wrap">
		<div class="title">
			<h3>자유게시판</h3>
		</div>
		<div class="location">
			<ul>
				<li><a onclick="load('/');">홈</a></li>
				<li><a href="all_qna.all">커뮤니티</a></li>
				<li>자유게시판</li>
			</ul>
		</div>
	</div>
	<!-- 타이틀 끝 -->
	<!-- 컨텐츠 시작 -->
	<div class="contents_wrap">
		<!-- table -->
		<table class="tbl_type1 tbl_expcon mgt0">
			<caption></caption>
			<colgroup>
				<col style="width:7%">
				<col style="width:36%">
				<col style="width:12%;">
				<col style="width:10%;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">등록일</th>
				</tr>
			</thead>
			<tbody id="MainList">
			<!-- 게시글이 있으면 -->
			<c:if test="${cnt > 0}">
			<c:forEach var="dto" items="${dtos}">
				<tr>
					<td class="con_type">${dto.gnd_number}</td>					
					<td class="lf"><a class="question" onclick="load('all_community_contentForm.all?gnd_number=${dto.gnd_number}&pageNum=${pageNum}&number=${number+1}')">${dto.gnd_title}</a></td>
					<td><span class="fc_gray6">${dto.mem_id}</span></td>
					<td><span class="fc_gray6">${dto.gnd_registerdate}</span></td>
				</tr>
			</c:forEach>
			</c:if>	
			</tbody>
		</table>
		<!-- //table -->
		
		<!-- 게시글이 없으면 -->
		<c:if test="${cnt == 0}">
			<tr>
				<td colspan="5">
					게시글이 없습니다. 글을 작성해주세요.
				</td>
			</tr>
		</c:if>
		
		<!-- 검색 -->
		<div class="srch_bbs">
			<span class="inp_slt">
				<select title="검색기준 선택" id="searchType" style="display: none;">
					<option value="1">전체</option>
					<option value="2">제목</option>
					<option value="3">내용</option>
				</select>
				<span tabindex="0" id="searchType-button" role="combobox" aria-expanded="false" aria-autocomplete="list" aria-owns="searchType-menu" aria-haspopup="true" title="검색기준 선택" class="ui-selectmenu-button ui-selectmenu-button-closed ui-corner-all ui-button ui-widget">
					<span class="ui-selectmenu-icon ui-icon ui-icon-triangle-1-s"></span><span class="ui-selectmenu-text">전체</span>
				</span>
			</span>
			<div class="srch_box">
				<input type="text" class="inp_txt" id="searchStr" title="검색어 입력" placeholder="검색어를 입력하세요">
				<a href="#none" id="cmdSearch" class="ico_comm_l btn_srch">검색</a>
			</div>
		</div>
		<!-- //검색 -->
		
		
			<!-- 게시글이 있으면 -->
			<c:if test="${cnt > 0}">
				<!-- 처음[◀◀]/이전블록[◀]-->
				<c:if test="${startPage > pageBlock}">
					<a onclick="load('all_community_List.all')">[◀◀]</a>
					<a onclick="load('all_community_List.all?pageNum=${startPage-pageBlock}')">[◀]</a>
				</c:if>
				
				<!-- 블록내의 페이지 번호 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<span><b>[${i}]</b></span>
					</c:if>
					<c:if test="${i != currentPage}">
						<a onclick="load('all_community_List.all?pageNum=${i}')">[${i}]</a>
					</c:if>
				</c:forEach>
				<!-- 다음블록[▶▶]/마지막[▶]-->
				<c:if test="${pageCount > endPage}">
					<a onclick="load('all_community_List.all?pageNum=${startPage + pageBlock}')">[▶]</a>
					<a onclick="load('all_community_List.all?pageNum=${pageCount}')">[▶▶]</a>
				</c:if>
			</c:if>
		<div class="paging pagingList">
			<a onclick="load('all_community_writeForm.all?pageNum=${pageNum}')">
				<button class='button'><span>글쓰기</span></button>
			</a>
		</div>
	</div>
	<!-- 컨텐츠 끝 -->
	<!-- 컨텐츠 시작 -->
	<!-- <div class="contents_wrap2">
		<div id="container">
			<iframe name="iframeOther" id="iframeOther" src="" frameborder="0" scrolling="no" width="100%" height="7640px">
			</iframe>
		</div>
	</div> -->
	<!-- 컨텐츠 끝 -->
	<!-- 라이트 시작 -->
	<div class="right_wrap" id="divServiceRight">
        <div class="right_wrap">
        	부동산 GO
        	<a href="/?_c=service&amp;_m=p2p&amp;_a=product"><img src="https://image.r114.co.kr/W1/images/sub/banner_p2p.png" alt="P2P 부동산 투자"></a>
        	//부동산 GO
			<div class="bx_gray">
				우리동네, 단지 이야기 BEST
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
				//우리동네, 단지 이야기 BEST
			</div>
			<div class="bx_gray">
				부동산상담 BEST
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
				//부동산상담 BEST
			</div>
        </div>
        <!-- 라이드 끝 -->
	</div>
</div>
</div>
</body>
</html>

