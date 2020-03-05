<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_setting.jsp" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>관리자 - 회원상태</title>
  <!-- Custom fonts for this template-->
  <link href="${styles}/3_adminpage/bootstrap3/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${styles}/3_adminpage/bootstrap3/css/sb-admin-2.min.css" rel="stylesheet">
	<style>
	.list tr {
		border-bottom: 1px black solid;
		text-align: center;
		height: 70;
	}
	</style>
</head>
<script src="${javascripts}/request.js"></script>
<script src="${javascripts}/main2.js"></script>
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
                    }
                }
            }
</script>
<body>

<div id="result">
<div id="wrapper">
<%@include file="util_sidebar.jsp" %>

<div style="width:65%; height: 70px;  margin:0 auto;">
<div style="width: 30%; height:70px; border:1px solid black; float:left;" onclick="load('admin_approveseller.all');">
	<br>
	<a style="margin-left: 30%; font-size: 20px;" >셀러 가입 승인</a>
</div>

<div style="width: 30%; height:70px; border:1px solid black; float:left;" onclick="load('admin_administratemembers.all?state=${state}');">
	<br>
	<a style="margin-left: 30%; font-size: 20px;">회원 상태 확인</a>
</div>

<div style="width: 30%; height:70px; border:1px solid black; float:left;" onclick="load('admin_report.all');">
	<br>
	<a style="margin-left: 30%; font-size: 20px;">신고 관리</a>
</div>
</div>
	<%-- action = "admin_approvesellerSearchAuth.all?${_csrf.parameterName}=${_csrf.token}" --%>
	<br>
	<form action = "admin_approvesellerSearchAuth.all?${_csrf.parameterName}=${_csrf.token}" name ="admin_approvesellerSearchAuth" method="post" onsubmit="return checkcart();">
	<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">		
		<h2 align="center">셀러가입승인(권한승인)</h2>
		<br>
		<table align="center" style="border-collapse: collapse;">
			<tr>
				<c:if test="${cnt != null }">
					<td>사용자수 :</td>
					<td>${cnt}</td>
				</c:if>
				
				<td width=50></td>
				<td>아이디 :</td>
				<td><input type="text" name="searchInput" style="height: 13px;"></td>
				<td><input type="button" value="검색" onclick="return searchPro();"></td>
				<td width=50></td>
				<td>셀러승인 :</td>
				<td><select name="authoriZation" id="auth" size='1'>
						<option value='' selected>인증분류</option>
						<option value='1'>이메일인증(1)</option>
						<option value='2'>셀러인증(2)</option>
				</select></td>
				<td><input type="submit" value="승인"></td>
			</tr>
		</table>
			<br>
		<table class="list" width="1000" align="center"
			style="border-collapse: collapse;">
			<tr>
				<th>선택하기</th>
				<th>아이디</th>
				<th>사용자이름</th>
				<th>사용자이메일</th>
				<th>전화번호</th>
				<th>등록일</th>
				<th>셀러인증여부</th>
				<th>셀러인증코드</th>
				<th>권한</th>
			</tr>
		<c:forEach var = "dto" items="${dtos}">
			<tr>
				<td style="text-align: center;">
					<input type="checkbox" name="check" id="check" value="${dto.sel_id}">
				</td>
				<td>${dto.sel_id}</td>
				<td>${dto.sel_name}</td>
				<td>${dto.sel_email}</td>
				<td>${dto.sel_phone}</td>
				<td>
					<fmt:formatDate type="both" pattern ="yyyy-MM-dd HH:mm" value="${dto.sel_registerdate}"/>
				</td>
				<td>${dto.sel_certification}</td>
				<td>${dto.sel_key}</td>
				<td>${dto.authority}</td>
			</tr>
		</c:forEach>
		</table>
		<br>
		<!-- 페이지컨트롤 -->
    <table style="width:1000px" align="center">
    	<tr align="center">
    		<th align="center">
    			<!-- 게시글이 있으면 -->
    		 <c:if test="${cnt > 0 }">
    			<!-- 처음 [◀◀] /이전블록[◀]   특수문자:ㅁ 한자키 -->
    			<c:if test="${startPage>pageBlock}">
    				<a href="admin_approveseller.all">[◀◀]</a>
    				<a href="admin_approveseller.all?pageNum=${startPage - pageBlock }">[◀]</a>
    			</c:if>
    			<!-- 블록내의 페이지 번호 -->
    			<c:forEach var="i" begin="${startPage}" end="${endPage}">
    				<c:if test="${i == currentPage}">
    					<span align="center"><b align="center">[${i}]</b></span>
    				</c:if>
    				<c:if test="${i != currentPage}">
    					<a href="admin_approveseller.all?pageNum=${i}">[${i}]</a>
    				</c:if>
    			</c:forEach>
    			<!-- 다음블록 [▶] /마지막[▶▶]   특수문자:ㅁ 한자키 -->
    			<c:if test="${pageCount>endPage}">
    				<a href="admin_approveseller.all?pageNum=${startPage + pageBlock }">[▶]</a>
    				<a href="admin_approveseller.all?pageNum=${pageCount}">[▶▶]</a>
    			</c:if>
    	     </c:if> 
    		</th>
   		</tr>
    </table>
	</form>
</div>
</div>
<!-- Bootstrap core JavaScript-->
  <script src="${styles}/3_adminpage/vendor/jquery/jquery.min.js"></script>
  <script src="${styles}/3_adminpage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${styles}/3_adminpage/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${resources}/js/sb-admin-2.min.js"></script>
</body>
</html>