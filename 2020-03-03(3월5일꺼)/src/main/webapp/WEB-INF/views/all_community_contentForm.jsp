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
    	
		<div id="wrap">
			<div class="clear"></div>
			<br><br>
			<div>제목 : ${dto.gnd_title}</div>
			<div class="board_view_title" style="margin-top:10px;border-top:1px solid #ccc">	
			<br>
				<ul><li><span>글쓴이 : ${dto.mem_id} &nbsp;&nbsp;작성일 : ${dto.gnd_registerdate}//////${pageNum}</span></li></ul>
			</div>
			<div class="board_view_title" style="margin-top:10px;border-top:1px solid #ccc">
			<div class="board_view_content" style="font-size:12px">
			<br>
			<table>
				<tbody>
					<tr>
						<td>${dto.gnd_content}</td>
					</tr>
				</tbody>
			</table>
			</div>
			
			<table class="board_list_tbl" style="margin-top:300px">
				<tbody>
					<tr bgcolor="#f5f5f5">
						<td width="40"></td>
					</tr>
				</tbody>
			</table>
			<br>
		</div>
		<div class="btn_wrap2">
			<input class="btn_type6" type="button" value="글수정"
				onclick="window.location='all_community_modifyForm.all?gnd_number=${dto.gnd_number}&pageNum=${pageNum}'">
			<input class="btn_type6" type="button" value="글삭제"
				onclick="window.location='all_community_deletePro.all?gnd_number=${dto.gnd_number}'">
			<input class="btn_type7" type="button" value="목록"
				onclick="load('all_community_List.all')">
		</div>
		<br>
    </div>
</div>
</div>
</body>
</html>