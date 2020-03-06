<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="all_setting.jsp" %>

<html>
<head>
<link href="${styles}/1_mainpage/css/mypage/layout1.css" rel="stylesheet" type="text/css">
<link href="${styles}/1_mainpage/css/mypage/layout2.css" rel="stylesheet" type="text/css">
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
<style type="text/css">
.btn_wrap2 {
    margin-top: 40px;
    font-size: 0;
    line-height: 0;
    text-align: center;
}
.btn_type6 {
    display: inline-block;
    min-width: 56px;
    padding: 0 24px;
    border-radius: 2px;
    background-color: #0076ff;
    font-size: 16px;
    line-height: 52px;
    color: #fff;
    text-align: center;
    box-sizing: content-box;
}
.btn_type7 {
    display: inline-block;
    min-width: 56px;
    padding: 0 24px;
    border-radius: 2px;
    background-color: #0099ff;
    font-size: 16px;
    line-height: 52px;
    color: #fff;
    text-align: center;
    box-sizing: content-box;
}
</style>
</head>
<body>
<div id="body_layout">
	<div class="body_wrap">
    	<!-- 타이틀 시작 -->
    	<div class="title_wrap">
            <div class="title">
                <h3>게시글</h3>
            </div>
            <div class="location">
                <ul>
                    <li><a href="/">홈</a></li>
					<li><a onclick="load('all_qna.all')">커뮤니티</a></li>
                    <li>게시글</li>
                </ul>
            </div>
        </div>
    	<!-- 타이틀 끝 -->
    	
    	
        <!-- 컨텐츠 시작 -->
        <div class="contents_wrap">
			<form action="all_community_writePro.all?pageNum=${pageNum}" method="post" name="writeform" id="form">
			<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">	
			<input type="hidden" name="num" value="${num}">
			<input type="hidden" name="pageNum" value="${pageNum}">

			<table class="tbl_type1 type5">
				<colgroup>
					<col style="width:24%"><col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">작성자</th>
						<td>${dto.mem_id}</td>
					</tr>
					<tr>
						<th scope="row">제목</th>
						<td>
							${dto.gnd_title}
						</td>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td>
							${dto.gnd_content}
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btn_wrap2">
				<input class="btn_type6" type="button" value="글수정"
					onclick="load('all_community_modifyForm.all?num=${dto.gnd_number}&pageNum=${pageNum}')">
				<input class="btn_type6" type="button" value="글삭제"
					onclick="load('all_community_deleteForm.all?num=${dto.gnd_number}&pageNum=${pageNum}')">
				<input class="btn_type7" type="button" value="목록"
					onclick="load('all_community_List.all?pageNum=${pageNum}')">
			</div>
			</form>
		</div>
        <!-- 컨텐츠 끝 -->
        
		<%-- <div id="wrap">
			<div class="clear"></div><br><br><div>경매뉴스공지</div>
			<div class="board_view_title" style="margin-top:10px;border-top:1px solid #ccc">	
				<ul><li>2018년 01월 08일 광주장흥 1계 경매물건이 같은날 2계로 이관되어 진행합니다.</li></ul>
				<ul><li><span>글쓴이 : 굿옥션주식회사 &nbsp;&nbsp;작성일 : 2018-01-05</span></li></ul>
			</div>
			<div class="board_view_content" style="font-size:12px">
			<table>
			<tbody><tr>
				<td>
				광주지방법원 장흥지원 2계 061-860-1542﻿<br>
			<br>
			<br>
			광주 장흥지원 1월8일(월) 1계 경매물건 2계로 이관	</td>
			</tr>
			</tbody></table>
			</div>
			
			<table class="board_list_tbl" style="margin-top:300px">
			
					<tbody><tr>
						<td><img src="/img/icon/arrow_orange.gif"></td>
						<td class="f14"><b>2018년 01월 08일 광주장흥 1계 경매물건이 같은날 2계로 이관되어 진행합니다.</b></td>
					</tr>
						<tr bgcolor="#f5f5f5">
						<td width="40">다음</td>
						<td class="f14"><a href="auction_news_view.php?idx=8698&amp;start=0&amp;m_name=&amp;schKeyword=">부산서부지원 신청사에서 8월 22일 첫경매진행</a></td>
					</tr>
			</tbody></table>
			<br>
		</div>
		<div class="btn_wrap2">
			<input class="btn_type6" type="button" value="글수정"
				onclick="load('all_community_modifyForm.all?num=${dto.gnd_number}&pageNum=${pageNum}')">
			<input class="btn_type6" type="button" value="글삭제"
				onclick="load('all_community_deleteForm.all?num=${dto.gnd_number}&pageNum=${pageNum}')">
			<input class="btn_type7" type="button" value="목록"
				onclick="load('all_community_List.all?pageNum=${pageNum}')">
		</div>
		<br> --%>
    </div>
</div>
</body>
</html>