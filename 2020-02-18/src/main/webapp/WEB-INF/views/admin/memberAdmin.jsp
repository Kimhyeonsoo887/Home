<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Border Utilities</title>

  <!-- Custom fonts for this template-->
  <link href="${bootstraps}/bootstrap3/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${bootstraps}/bootstrap3/css/sb-admin-2.min.css" rel="stylesheet">
	<style>
	.list tr {
		border-bottom: 1px black solid;
		text-align: center;
	}
	</style>
</head>
<script src="/bridge/resources/js/request.js"></script>
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
<%@include file="sidebar.jsp" %>

	<div style="width:65%; height: 70px;  margin:0 auto;">
		
		<div style="width: 30%; height:70px; border:1px solid black; float:left;" onclick="load('memberAdmin.all');">
			<br>
			<a style="margin-left: 30%; font-size: 20px;">셀러 가입 승인</a>
		</div>
		
		<div style="width: 30%; height:70px; border:1px solid black; float:left;" onclick="load('memberState.all');">
			<br>
			<a style="margin-left: 30%; font-size: 20px;">회원 상태 관리</a>
		</div>
		
		<div style="width: 30%; height:70px; border:1px solid black; float:left;" onclick="load('memberDecl.all');">
			<br>
			<a style="margin-left: 30%; font-size: 20px;">신고 관리</a>
		</div>
	</div>
	
	<br>
	<form name="write_form_member" method="post">
		<h2 align="center">셀러가입승인(권한승인)</h2>
		<table align="center" style="border-collapse: collapse;">
			<tr>
				<td>사용자수 :</td>
				<td>23</td>
			</tr>
			<tr>
				<td>검색설정 :</td>
				<td><select name='search' size='1'>
						<option value='' selected>아이디</option>
						<option value='1'>사용자이름</option>
						<option value='2'>사용자이메일</option>
						<option value='3'>전화번호</option>
				</select></td>
				<td><input type="text" name="searchInput" style="height: 13px;"></td>
				<td><input type="button" value="검색"></td>
				<td width=50></td>
				<td>권한승인</td>
				<td><select name='search' size='1'>
						<option value='1' selected>권한등급</option>
						<option value='2'>셀러</option>
						<option value='3'>일반회원</option>
				</select></td>
				<td><input type="button" value="등록"></td>
			</tr>
		</table>
		<br>
		<table class="list" height="430" width="900" align="center"
			style="border-collapse: collapse;">
			<tr>
				<th>선택하기</th>
				<th>등록번호</th>
				<th>아이디</th>
				<th>사용자이름</th>
				<th>사용자이메일</th>
				<th>전화번호</th>
				<th>등록일</th>
				<th>권한상태</th>
			</tr>
			<tr>
				<td style="text-align: center;"><input type="checkbox">
				</td>
				<td style="text-align: center;">1</td>
				<td>kdhong</td>
				<td>홍길동</td>
				<td>kdhong@naver.com</td>
				<td>010-111-1111</td>
				<td>2020-02-15</td>
				<td>셀러신청</td>
			</tr>
			<tr>
				<td style="text-align: center;"><input type="checkbox">
				</td>
				<td style="text-align: center;">2</td>
				<td>ksshong</td>
				<td>홍길순</td>
				<td>kssshong@naver.com</td>
				<td>010-222-2222</td>
				<td>2020-02-15</td>
				<td>셀러신청</td>
			</tr>
			<tr>
				<td style="text-align: center;"><input type="checkbox">
				</td>
				<td style="text-align: center;">3</td>
				<td>kshong</td>
				<td>홍길삼</td>
				<td>kshong@naver.com</td>
				<td>010-333-3333</td>
				<td>2020-02-15</td>
				<td>셀러신청</td>
			</tr>
			<tr>
				<td style="text-align: center;"><input type="checkbox">
				</td>
				<td style="text-align: center;">4</td>
				<td>kssshong</td>
				<td>홍길사</td>
				<td>kssshong@naver.com</td>
				<td>010-444-4444</td>
				<td>2020-02-15</td>
				<td>셀러신청</td>
			</tr>
			<tr>
				<td style="text-align: center;"><input type="checkbox">
				</td>
				<td style="text-align: center;">5</td>
				<td>kshong</td>
				<td>홍길오</td>
				<td>kohong@naver.com</td>
				<td>010-555-5555</td>
				<td>2020-02-15</td>
				<td>셀러신청</td>
			</tr>
			<tr>
				<td style="text-align: center;"><input type="checkbox">
				</td>
				<td style="text-align: center;">6</td>
				<td>kshong</td>
				<td>홍길육</td>
				<td>koohong@naver.com</td>
				<td>010-666-6666</td>
				<td>2020-02-15</td>
				<td>셀러신청</td>
			</tr>
			<tr>
				<td style="text-align: center;"><input type="checkbox">
				</td>
				<td style="text-align: center;">7</td>
				<td>kchhong</td>
				<td>홍길칠</td>
				<td>kchong@naver.com</td>
				<td>010-777-7777</td>
				<td>2020-02-15</td>
				<td>셀러신청</td>
			</tr>
		</table>
		<br>
		<div align="center">
			<a href="#">◀◀</a> <a href="#">[1]</a> <a href="#">[2]</a> <a
				href="#">[3]</a> <a href="#">▶▶</a>
		</div>
	</form>
	
</div>


</div>
<!-- Bootstrap core JavaScript-->
  <script src="${bootstraps}/bootstrap3/vendor/jquery/jquery.min.js"></script>
  <script src="${bootstraps}/bootstrap3/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${bootstraps}/bootstrap3/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${resources}/js/sb-admin-2.min.js"></script>
</body>
</html>