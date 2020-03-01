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
				개인회원 탈퇴를 하시면 부동산114의 회원전용 서비스를 더이상 이용하실 수 없습니다.<br>
				탈퇴시 사용하시던 아이디로는 재가입이 불가하오니, 탈퇴를 신중히 고려하시기 바랍니다.
			</p>
			<form name="frmRegOut" id="frmRegOut" action="/?_c=mypage&amp;_m=mypage&amp;_a=withdrawact" method="post" style="margin:0px;padding:0px;" target="_joinActHidden">
				<input type="hidden" name="confirmok" id="confirmok" value=""><!--메일인증여부체크-->
				<input type="hidden" name="hdnSnsGbn" id="hdnSnsGbn" value="">

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
			<!-- //일반계정 일때 -->
			<table class="tbl_type1 type5 mgt3">
				<caption>탈퇴정보 입력</caption>
				<colgroup>
					<col style="width:17%"><col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">부동산114 가입이유</th>
						<td>
							<div class="type_chk_wrap lev1" id="joinReasonDiv"><span class="type_chk"><input type="radio" class="inp_rdo" name="joinRs_cd" id="rdo1_1" value="1" onclick="fn_etcText(0)"><label for="rdo1_1" class="w220"><span class="ico_comm_s rdo"></span>부동산정보를 얻기위해</label></span><span class="type_chk"><input type="radio" class="inp_rdo" name="joinRs_cd" id="rdo1_2" value="2" onclick="fn_etcText(0)"><label for="rdo1_2" class="w220"><span class="ico_comm_s rdo"></span>이벤트에 응모하기위해</label></span><span class="type_chk"><input type="radio" class="inp_rdo" name="joinRs_cd" id="rdo1_3" value="3" onclick="fn_etcText(0)"><label for="rdo1_3" class="w220"><span class="ico_comm_s rdo"></span>동호회 및 커뮤니티 이용을 위해</label></span><span class="type_chk"><input type="radio" class="inp_rdo" name="joinRs_cd" id="rdo1_4" value="4" onclick="fn_etcText(0)"><label for="rdo1_4" class="w220"><span class="ico_comm_s rdo"></span>도서구입 및 유료정보 이용을 위해</label></span><span class="type_chk"><input type="radio" class="inp_rdo" name="joinRs_cd" id="rdo1_5" value="5" onclick="fn_etcText(0)"><label for="rdo1_5" class="w220"><span class="ico_comm_s rdo"></span>무료 세미나 신청을 위해</label></span><span class="type_chk"><input type="radio" class="inp_rdo" name="joinRs_cd" id="rdo1_6" value="6" onclick="fn_etcText(1)"><label for="rdo1_6" class="etc"><span class="ico_comm_s rdo"></span>기타 :</label><input type="text" class="inp_txt" title="기타 연락가능시간 입력" style="width:250px;background-color:#eeeeee" name="joinRs_etc" id="jReasonText" disabled=""></span></div>
						</td>
					</tr>
					<tr>
						<th scope="row">서비스 이용기간</th>
						<td>
							<div class="type_chk_wrap lev2" id="setUseTermsDiv"><span class="type_chk"><input type="radio" class="inp_rdo" name="useperiod_cd" id="rdo2_1" value="1"><label for="rdo2_1" class="w100"><span class="ico_comm_s rdo"></span>1개월 미만</label></span><span class="type_chk"><input type="radio" class="inp_rdo" name="useperiod_cd" id="rdo2_2" value="2"><label for="rdo2_2" class="w100"><span class="ico_comm_s rdo"></span>1~3개월</label></span><span class="type_chk"><input type="radio" class="inp_rdo" name="useperiod_cd" id="rdo2_3" value="3"><label for="rdo2_3" class="w100"><span class="ico_comm_s rdo"></span>3~6개월</label></span><span class="type_chk"><input type="radio" class="inp_rdo" name="useperiod_cd" id="rdo2_4" value="4"><label for="rdo2_4" class="w100"><span class="ico_comm_s rdo"></span>6개월~1년</label></span><span class="type_chk"><input type="radio" class="inp_rdo" name="useperiod_cd" id="rdo2_5" value="5"><label for="rdo2_5" class="w100"><span class="ico_comm_s rdo"></span>1년이상</label></span></div>
						</td>
					</tr>
					<tr>
						<th scope="row">탈퇴 사유</th>
						<td>
							<span class="inp_slt" style="width:100%">
								<select title="탈퇴사유" id="withdrawReasonDiv" name="withdrawRs_cd" style="display: none;">
									
								<option value="">선택해주세요.</option><option value="1">아이디변경을 위해</option><option value="2">정보 이용 속도가 느려서</option><option value="3">유료 정보 서비스가 많아서</option><option value="4">원하는 정보가 부족해서</option><option value="5">포인트나 적립금 등의 회원서비스가 없어서</option><option value="6">서비스이용이 불편하고 복잡해서</option><option value="7">사이트 이용의 필요성이 없어져서</option><option value="8">기타</option></select><span tabindex="0" id="withdrawReasonDiv-button" role="combobox" aria-expanded="false" aria-autocomplete="list" aria-owns="withdrawReasonDiv-menu" aria-haspopup="true" title="탈퇴사유" class="ui-selectmenu-button ui-selectmenu-button-closed ui-corner-all ui-button ui-widget"><span class="ui-selectmenu-icon ui-icon ui-icon-triangle-1-s"></span><span class="ui-selectmenu-text">선택해주세요.</span></span>
							</span>
							<span class="inp_break" style="display:none;"><input type="text" class="inp_txt" name="withdrawRs_etc" id="withdrawRs_etc" title="직접입력" style="width:100%"></span>
						</td>
					</tr>
				</tbody>
			</table>


			<div class="btn_wrap mgt4">
			    <a href="javascript:;" onclick="fn_submit();" class="btn_type6">탈퇴하기</a>
			    <a href="/?_c=mypage&amp;_m=mypage" class="btn_type7">취소</a>
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