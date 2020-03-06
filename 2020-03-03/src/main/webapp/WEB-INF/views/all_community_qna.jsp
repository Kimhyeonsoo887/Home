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
				<li><a href="all_qna.all">커뮤니티</a></li>
				<li>QnA</li>
			</ul>
		</div>
	</div>
	<!-- 타이틀 끝 -->
	<!-- 컨텐츠 시작 -->
	<div class="contents_wrap">
	
		
		<!-- table -->
		
		<form action="qnaform.cust" method="post" name="mainList">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden" name="qna_number" value="${qna_number}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="submit" id="button" value="부동산 상담 신청">
		<input type="hidden" name="sortType" id="sortType" value="">
		
		<table class="tbl_type1 tbl_expcon mgt0">
			<caption></caption>
			<colgroup>
				<col style="width:11%"><col style="width:20%"><col><col style="width:12%;"><col style="width:20%;"><col style="width:9%;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">공개여부</th>
					<th scope="col">상담구분</th>					
					<th scope="col">제목</th>
					<th scope="col">질문자</th>
					<th scope="col">등록일</th>
					<th scope="col">조회</th>
				</tr>
			</thead>
			<tbody id="MainList">
	        	<!-- 게시글이 있으면 -->
				<c:if test="${cnt> 0}">	
				<c:forEach var="dto" items="${dtos}">
				<tr>
					<td>${dto.qna_accessibility}</td>
					<td class="con_type">${dto.qna_type}</td>					
					<td class="lf"><em class="fc_blue"><a href="qnacontent.cust?pageNum=${pageNum}&qna_number=${dto.qna_number}&number=${number+1}">Q.${dto.qna_title}</a></em></td></a>
					<td><span class="fc_gray6">${dto.mem_id}</span></td>
					<td><span class="fc_gray6"><fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${dto.qna_registerdate}"/> </span></td>
					<td><span class="fc_gray6">${dto.qna_readcnt}</span></td>
				</tr>
				</c:forEach>
			</c:if>	
			
			<!-- 게시글이 없으면 -->
			<c:if test="${cnt== 0}">
				<tr>
					<td colspan="6" align="center">
					게시글이 없습니다.글을 작성해주세요
					</td>
				</tr>
			</c:if>
			
		</table>
		
		<!--페이지 컨트롤  -->
		
		<table style="width:1000px" align="center">
			<tr>
				<th align="center">
					<!--게시글이 있으면  -->
					<c:if test="${cnt>0 }">
						<!-- 처음[◀◀ ]  /이전블럭[◀]  pageBlock:3 특수문자 한글 ㅁ 에 한자키  -->
						<c:if test="${startPage>pageBlock }">
							<a href="all_qna.all">[◀◀ ]</a>
							<a href="all_qna.all?pageNum=${startPage-pageBlock}">[◀ ]</a>
						</c:if>
						
						<!-- 블록내의 페이지 번호 -->
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i==currentPage}" >
								<span><b>[${i}]</b></span>
							</c:if>
						
							<c:if test="${i !=currentPage}" >
								<a href="all_qna.all?pageNum=${i}">[${i}]</a>	
							</c:if>
							
						</c:forEach>
						
							<!-- 다음블럭[▶]  마지막 [▶▶]  특수문자 한글 ㅁ 에 한자키  -->
						<c:if test="${pageCount>endPage}">
							<a href="all_qna.all?pageNum=${startPage+pageBlock}">[▶ ]</a>
							<a href="all_qna.all?pageNum=${pageCount}">[▶▶ ]</a>
						</c:if>
						
					</c:if>
				</th>
			</tr>
		</tbody>
		</table>
		</form>
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
		<!-- <div class="paging pagingList"><strong><span class="skip">현재페이지</span>1</strong><a href="javascript:goPage(2, 1);">2</a><a href="javascript:goPage(3, 1);">3</a><a href="javascript:goPage(4, 1);">4</a><a href="javascript:goPage(5, 1);">5</a><a href="javascript:goPage(6, 1);">6</a><a href="javascript:goPage(7, 1);">7</a><a href="javascript:goPage(8, 1);">8</a><a href="javascript:goPage(9, 1);">9</a><a href="javascript:goPage(10, 1);">10</a><a href="javascript:next_page(1);"><span class="ico_comm_s next_10">다음 10페이지</span></a></div> -->
		<!-- //paging -->
	</div>
	<!-- 컨텐츠 끝 -->
	
	</div>
	</div>
</div>
</div>
<%@ include file = "all_footer.jsp" %> 	
</body>
</html>

