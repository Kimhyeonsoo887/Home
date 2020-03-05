<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "seller_setting.jsp" %>
<html>
<head>
<link href="${styles}/1_mainpage/css/mypage/mypage.css" rel="stylesheet" type="text/css">
<link href="${styles}/1_mainpage/css/mypage/layout1.css" rel="stylesheet" type="text/css">
<link href="${styles}/1_mainpage/css/mypage/layout2.css" rel="stylesheet" type="text/css">

<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="${styles}/1_sellerpage/bootstrap3/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${styles}/1_sellerpage/bootstrap3/css/sb-admin-2.min.css" rel="stylesheet">
  
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

<script type="text/javascript">
	function detailsale(saleNum){
		
		var url = "selectSale.sel?saleNum=" + saleNum;
		window.open(url,"selectId","menubar=no,width=1500 height=800");
	}
</script>


</head>
<body>

<%@ include file="util_sidebar.jsp" %>

<div id="body_layout">
	<div class="body_wrap">
	<!-- 타이틀 시작 -->
	<div class="title_wrap">
		<div class="title">
			<h3>매물조회</h3>
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
					<th>매물번호</th>
					<th>대표이미지</th>
					<th>매물명</th>
					<th>매물유형</th>
					<th>매물거래유형</th>
					<th>가격</th>
					<th>매물종류</th>
					<th>매물등록일</th>
					<th>매물공개여부</th>
				</tr>
				
				<c:if test="${cnt == 0}">
					<tr>
						<td colspan="5">
							게시글이 없습니다. 글을 작성해주세요.
						</td>
					</tr>
				</c:if>
		
		
			<c:forEach var="dto" items="${dtos}">
				
				<tr bgcolor="#ffffff" height="45">
					<td class="center f14">${dto.prp_number}</td>
					<!-- <td class="f14"><a href="all_noticeDetail.all">상가임대 1~2년 단기간만 임대를 원하는데요 가능한가요?</a></td> -->
					<td class="center f14"><img src="${images}/sellerImages/${dto.prp_title}"></td>
					<td class="center f14"><a href="#" onclick="detailsale(${dto.prp_number});">${dto.prp_name}</a></td>
					<td class="center f14">${dto.prp_selltype}</td>
					<td class="center f14">${dto.prp_termtype}</td>
					<td class="center f14">${dto.prp_monthlycost}</td>
					<td class="center f14">${dto.prp_type}</td>
					<td class="center f14">${dto.prp_registerdate}</td>
					<td class="center f14">${dto.prp_accessibility}</td>
				</tr>
			</c:forEach>
	        
	        <tr>
				<th align="center">
					<!--게시글이 있으면  -->
					<c:if test="${cnt>0 }">
						<!-- 처음[◀◀ ]  /이전블럭[◀]  pageBlock:3 특수문자 한글 ㅁ 에 한자키  -->
						<c:if test="${startPage>pageBlock }">
							<a href="seller_sale_Lookup.sel">[◀◀ ]</a>
							<a href="seller_sale_Lookup.sel?pageNum=${startPage-pageBlock}">[◀ ]</a>
						</c:if>
						
						<!-- 블록내의 페이지 번호 -->
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i==currentPage}" >
								<span><b>[${i}]</b></span>
							</c:if>
						
							<c:if test="${i !=currentPage}" >
								<a href="seller_sale_Lookup.sel?pageNum=${i}">[${i}]</a>	
							</c:if>
							
						</c:forEach>
						
							<!-- 다음블럭[▶]  마지막 [▶▶]  특수문자 한글 ㅁ 에 한자키  -->
						<c:if test="${pageCount>endPage}">
							<a href="seller_sale_Lookup.sel?pageNum=${startPage+pageBlock}">[▶ ]</a>
							<a href="seller_sale_Lookup.sel?pageNum=${pageCount}">[▶▶ ]</a>
						</c:if>
						
					</c:if>
				</th>
			</tr>
			</tbody>
		</table>
		<!-- //table -->
		<!-- 검색 -->
	<!-- 	<div class="srch_bbs">
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
		//검색
		paging
		<div class="paging pagingList"><strong><span class="skip">현재페이지</span>1</strong><a href="javascript:goPage(2, 1);">2</a><a href="javascript:goPage(3, 1);">3</a><a href="javascript:goPage(4, 1);">4</a><a href="javascript:goPage(5, 1);">5</a><a href="javascript:goPage(6, 1);">6</a><a href="javascript:goPage(7, 1);">7</a><a href="javascript:goPage(8, 1);">8</a><a href="javascript:goPage(9, 1);">9</a><a href="javascript:goPage(10, 1);">10</a><a href="javascript:next_page(1);"><span class="ico_comm_s next_10">다음 10페이지</span></a></div>
		//paging
	</div> -->
	<!-- 컨텐츠 끝 -->
		</div>
	</div>
</div>				

<!-- Bootstrap core JavaScript-->
  <script src="${styles}/1_sellerpage/bootstrap3/vendor/jquery/jquery.min.js"></script>
  <script src="${styles}/1_sellerpage/bootstrap3/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${styles}/1_sellerpage/bootstrap3/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${styles}/1_sellerpage/bootstrap3/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="${styles}/1_sellerpage/bootstrap3/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${styles}/1_sellerpage/bootstrap3/js/demo/chart-area-demo.js"></script>
  <script src="${styles}/1_sellerpage/bootstrap3/js/demo/chart-pie-demo.js"></script>
  
  
</body>
</html>