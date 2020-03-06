<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "all_setting.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<link href="${styles}/1_mainpage/css/mypage/mypage.css" rel="stylesheet" type="text/css">
<link href="${styles}/1_mainpage/css/mypage/layout1.css" rel="stylesheet" type="text/css">
<link href="${styles}/1_mainpage/css/mypage/layout2.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<style type="text/css">

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
<title>나의 관심</title>
</head>
<body>
<div id="result">
<div id="body_layout">
	<div class="body_wrap">
    	<!-- 타이틀 시작 -->
    	<div class="title_wrap type1">
            <div class="title">
                <h3>나의관심</h3>
            </div>
			<p class="txt_s">스크랩 했던 내용들을 확인하실 수 있습니다.</p>
           <div class="location">
	           <ul>
	               <li><a onclick="load('/')">홈</a></li>
	               <li><a onclick="load('all_mypage.all')">마이페이지</a></li>
	               <li>나의관심</li>
	           </ul>
	       </div>
        </div>
    	<!-- 타이틀 끝 -->
        <!-- 컨텐츠 시작 -->
		<div class="contents_wrap2">

			<ul class="list_tab type3">
				<li class="on"><a onclick="load('all_myFavorite.all')">지역/단지</a></li>
				<li><a onclick="load('all_building.all')">매물</a></li>
			</ul>

			<div class="clearfix">
				<span class="info_wrap2 mypage1">
					<span><input type="checkbox" class="ico_comm_s inp_chk spnDel" id="chk_all" data-type="allchoice"><label for="chk_all"><span class="ico_comm_s chk"></span>전체선택</label></span>
					<span class="spnDel" data-type="choice"><a href="#">선택삭제</a></span>
				</span>
				<span class="info_wrap2 fr">
					<span class="spnSearchGbn"><a href="#" class="selected">전체</a></span>
					<span class="spnSearchGbn"><a href="#">지역</a></span>
					<span class="spnSearchGbn"><a href="#">단지</a></span>
					<span class="fc_gray9">총 <em class="fc_black" id="idTotalCount">1</em>개</span>
				</span>
			</div>

			<table class="tbl_type1 type8 mgt1">
				<caption>My히스토리</caption>
				<colgroup>
					<col style="width:13%"><col style="width:12%"><col><col style="width:15%">
				</colgroup>
				<tbody id="tblMyConcernList">
		
		<tr>
			<td class="lf pdl0"><span class="chk_blue1"><input type="checkbox" class="ico_comm_s inp_chk" name="chkNum" value="24639" id="chk24639"><label class="fc_blue" for="chk24639"><span class="ico_comm_s chk"></span>매물시세</label></span></td>
			<td>단지소식</td>
			<td class="lf">
				<a href="/?_c=memul&amp;_m=p10&amp;addr1=서울특별시&amp;addr2=강남구&amp;addr3=일원동&amp;cortarNo=1168011400&amp;fCode=A&amp;memulStyle=1&amp;complexCd=A01011352390003&amp;tabGbn=3" class="mypg_link1" target="_blank">
					<span class="info_wrap2 fc_gray3"><span>가람</span><span>아파트</span><span>매매</span></span>
					<span class="fc_gray6">서울특별시&nbsp;강남구&nbsp;일원동</span>
				</a>
			</td>
			<td><span class="fc_gray3">2020.02.16</span></td>
		</tr>
		
	
</tbody>
			</table>
			<div class="paging"><strong><span class="skip">현재페이지</span>1</strong></div>

        </div>
        <!-- 컨텐츠 끝 -->
    </div>
</div>


</div>
</body>
</html>