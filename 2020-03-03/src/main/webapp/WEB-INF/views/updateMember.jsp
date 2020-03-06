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
<script type="text/javascript">0
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
		}
	}
</script>
<title>회원수정</title>
</head>
<body>
<div id="result">
<div id="body_layout">
	<div class="body_wrap">
    	<!-- 타이틀 시작 -->
        <div class="title_wrap type1">
            <div class="title">
                <h3>회원정보 수정</h3>
            </div>
            <div class="location">
                <ul>
                    <li><a onclick="load('/')">홈</a></li>
	               <li><a href="all_myPage.all">마이페이지</a></li>
                    <li>회원정보 수정</li>
                </ul>
            </div>
        </div>
        <!-- 타이틀 끝 -->
        <!-- 컨텐츠 시작 -->
        <div class="contents_wrap2">
			<h4 class="h4_type4 mgt0">기본정보 입력</h4><!-- 2017.10.31 추가 -->
			<div class="join_cont">
				<form action="updateMemberPro.cust" method="post" id="frmRegister" style="margin:0px;padding:0px;">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
				<!-- <input type="hidden" name="localpost" value="06993">우편번호
				<input type="hidden" name="useraddr1" value="서울특별시">시,도 (자택주소1)
				<input type="hidden" name="useraddr2" value="동작구">시군구 (자택주소2)
				<input type="hidden" name="useraddr3" value="동작동">	읍면동 (자택주소3)
				<input type="hidden" name="addr_detail" value="403호">주소상세 (자택주소4)
				<input type="hidden" name="addr_dorocode" id="addr_dorocode" value="115904157154">도로명코드
				<input type="hidden" name="addr_doroname" id="addr_doroname" value="동작대로39길">도로명
				<input type="hidden" name="addr_doronum1" id="addr_doronum1" value="22">도로주소본번
				<input type="hidden" name="addr_doronum2" id="addr_doronum2" value="">도로주소부번
				<input type="hidden" name="addr_dorogunname" id="addr_dorogunname" value="이수힐스테이트">건축물명
				<input type="hidden" name="sns_gbn" id="sns_gbn" value="">
				<input type="hidden" name="sns_id" id="sns_id" value="">

				20131223 도로명주소 RoadAddrCall : S
				<input type="hidden" name="roadchk_useraddr1" id="roadchk_useraddr1" value="">
				<input type="hidden" name="roadchk_useraddr2" id="roadchk_useraddr2" value="">
				<input type="hidden" name="roadchk_useraddr3" id="roadchk_useraddr3" value="">
				20131223 도로명주소 RoadAddrCall : E

				일반회원 필수 변경값 확인용 
				<input type="hidden" name="isChangePw" id="isChangePw" value="">비밀번호 변경여부
				<input type="hidden" name="confirmok" id="confirmok" value="">메일인증여부체크
				<input type="hidden" name="confirmnick" id="confirmnick" value="">닉네임 중복 여부체크

				<input type="hidden" name="textID" id="textID" value="jyh1355">
				<input type="hidden" name="oldPassWord" id="oldPassWord" value="">
				<input type="hidden" name="oldEmail" id="oldEmail" value="jyh1355@naver.com">
				<input type="hidden" name="oldNickname" id="oldNickname" value="jyh1355"> -->

				<table class="tbl_type1 type2">
					<caption>회원정보입력</caption>
					<colgroup>
						<col style="width:20%"><col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">아이디</th>
							<td> ${vo.mem_id }</td>
						</tr>
						<!-- 회원정보 수정 시 -->
						<tr style="display:">
							<th scope="row" rowspan="2"><label for="pws">비밀번호 </label></th>
							<td>
								<input type="password" class="inp_txt" id="pws" name="textPassword1" placeholder="변경할 비밀번호" style="width:250px" onkeyup="fn_defaultValue( 'pw' )">
								<p class="txt_dot type1">변경하실 비밀번호를 10~20자의 영문(소/대), 숫자, 특수기호중 2종류 이상 조합으로 입력하세요.</p>
							</td>
						</tr>
						<tr style="display:">
							<td>
								<input type="password" class="inp_txt" name="textPassword2" title="변경할 비밀번호확인" placeholder="변경할 비밀번호확인" style="width:250px">
								<!-- alert --><p class="txt_warning" style="display:none" id="pw_warning"><span class="ico_comm_s warning"></span>비밀번호가 일치하지 않습니다.</p><!-- //alert -->
							</td>
						</tr>
						
						<tr style="display:">
							<th scope="row" rowspan="2"><label for="pws">전화번호</label></th>
							<td>
								<input type="text" class="inp_txt" name="textphone" title="변경할 전화번호" placeholder="변경할 전화번호" style="width:250px" value="${vo.mem_phone}">
							</td>
						</tr>

						
						<!-- 2017.10.31 추가 -->
					</tbody>
				</table>
				
				<div class="btn_wrap">
				<input type="submit" class="btn_type6" value="회원정보 수정">
				<input type="reset" class="btn_type6" value="초기화">
				<!-- <button type="button" onclick="fn_modifyInfo()" class="btn_type6">회원정보 수정</button> -->
				<!-- <button type="button" onclick="document.frmRegister.reset();" class="btn_type7">취소</button> -->
				</div>
			
			
				</form>
			</div>
			
			
			</div>
			
        </div>
        <!-- 컨텐츠 끝 -->
    </div>
</div>


</div>
</body>
</html>