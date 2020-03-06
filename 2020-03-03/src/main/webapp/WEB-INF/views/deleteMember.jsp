<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "all_setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<link href="${styles}/1_mainpage/css/mypage/request.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<style>
li{
	list-style-type: none;
}
</style>

<script src="${javascripts}/request.js"></script>
<script type="text/javascript">
	function load(url) {
		//서버로 요청해서 통신한 후 응답을 callback 함수로 받겠다.
		//sendRequest(callback, url, method, params)
		//news1.jsp ,news2.jsp ,news3.jsp -> 콜백함수로 리턴
		sendRequest(loadNews_callback, url, "post");
	}

	//콜백함수
	function loadNews_callback() {
		var result = document.getElementById("result"); //div이름

		if (httpRequest.readyState == 4) {//4: completed => 전체 데이터가 취득완료된 상태
			if (httpRequest.status == 200) { //정상 종료
				result.innerHTML = httpRequest.responseText;
				//응답결과가 html이면 responseText로 받고, XML이면 responseXML로 받는다.
				//result.innerHTML = httpRequest.responseText;

			} else {
				result.innerHTML = "에러발생";

			}
		} else {
			result.innerHTML = "상태:" + httpRequest.readyState;
		}
	}
</script>
<title>회원탈퇴</title>
</head>
<body>
<div id="body_layout">
	<div class="body_wrap">
    	<!-- 타이틀 시작 -->
    	<div class="title_wrap type1">
            <div class="title">
                <h3>회원탈퇴</h3>
            </div>
            <div class="location">
                <ul>
                   <li><a onclick="load('/')">홈</a></li>
	               <li><a onclick="load('all_mypage.all')">마이페이지</a></li>
                    <li>회원탈퇴</li>
                </ul>
            </div>
        </div>
    	<!-- 타이틀 끝 -->

        <!-- 컨텐츠 시작 -->
        <div class="contents_wrap2">
			<h4 class="h4_type4">회원탈퇴 안내</h4>
			<p class="bx_guide1 fc_gray3">
				개인회원 탈퇴를 하시면 우리집의 회원전용 서비스를 더이상 이용하실 수 없습니다.<br>
				탈퇴시 사용하시던 아이디로는 재가입이 불가하오니, 탈퇴를 신중히 고려하시기 바랍니다.
			</p>
			<form name="frmRegOut" id="frmRegOut" action="deleteMemberPro.cust" method="post" style="margin:0px;padding:0px;" >
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >

			<!-- 일반계정 일때 -->
			<table class="tbl_type1 type5 mgt3" style="display:">
				<caption>비밀번호 확인</caption>
				<colgroup>
					<col style="width:17%"><col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">비밀번호 확인</th>
						<td><input type="password" class="inp_txt" name="user_pwd" id="user_pwd" value="" title="비밀번호" style="width:250px;"></td>
					</tr>
				</tbody>
			</table>


			<div class="btn_wrap mgt4">
				<input type="submit" value="탈퇴하기" class="btn_type6">
				<input type="reset" value="초기화" class="btn_type6">
			    <!-- <a href="javascript:;" onclick="fn_submit();" class="btn_type6">탈퇴하기</a>
			    <a href="/?_c=mypage&amp;_m=mypage" class="btn_type7">취소</a> -->
			</div>
		</form>
        </div>
        <!-- 컨텐츠 끝 -->
    </div>
</div>
<div id="result">

</div>
</body>
</html>