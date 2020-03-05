<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../all_setting.jsp" %>

<html>
<head>
<link href="${styles}/1_mainpage/css/mypage/layout1.css" rel="stylesheet" type="text/css">
<link href="${styles}/1_mainpage/css/mypage/layout2.css" rel="stylesheet" type="text/css">
<script src='{% static "js/jquery-1.11.3.min.js" %}'></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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

ul{
list-style:none;
}
</style>
</head>
<body>
<div id="body_layout">
	<div class="body_wrap">
    	<!-- 타이틀 시작 -->
    	<div class="title_wrap">
            <div class="title">
                <h3>QNA CONTENT</h3>
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
    	
<div style="height:100px;"></div>
<form>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<table class="tbl_type1 tbl_expcon mgt0" style="margin-top:300px">
		<tbody>	
		<tr bgcolor="#f5f5f5">
			<th style="width:130px;">QNA번호</th>
			<td class="f14" align="center">${dto.qna_number}</td>
		</tr>
		
		<tr bgcolor="#f5f5f5">	
			<th style="width:130px;">QNA분류</th>
			<td align="center">${dto.qna_type}</td>
		</tr>
		
		<tr bgcolor="#f5f5f5">	
			<th style="width:130px;">작성자</th>
			<td align="center">${dto.mem_id}</td>
		</tr>
		
		<tr bgcolor="#f5f5f5">
			<th style="width:130px;">QNA제목</th>
			<td align="center">${dto.qna_title}</td>
		</tr>
			
		<tr bgcolor="#f5f5f5">
			<th style="width:130px;">QNA내용</th>
			<td style="height:200px;">${dto.qna_content}</td>
		</tr>
	</table>
	
	</form>
	
	
<c:if test="${sessionScope.memID==dto.mem_id}">
<div class="btn_wrap2">

	<input class="btn_type6" type="button" value="글 수정" onclick="window.location='qnamodifyView.cust?qna_number=${param.qna_number}&pageNum=${pageNum}'">
	<input class="btn_type6" type="button" value="글 삭제" onclick="window.location='qnadeletePro.cust?qna_number=${param.qna_number}&pageNum=${pageNum}'">
</div>
</c:if>
</div>
</div>
<%@ include file="comment.jsp" %>

<%@ include file = "../all_footer.jsp" %> 	


</body>
</html>