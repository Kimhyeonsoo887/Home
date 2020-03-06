<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="all_setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ JSP</title>
<link href="${styles}/1_mainpage/css/mypage/mypage.css" rel="stylesheet" type="text/css">
<link href="${styles}/1_mainpage/css/mypage/layout1.css" rel="stylesheet" type="text/css">
<link href="${styles}/1_mainpage/css/mypage/layout2.css" rel="stylesheet" type="text/css"> 

<style>
.lunchbox {
   display:none;
}

a[href]{
   text-decoration:none;
   color:black;
}

#faq{
   text-align:center;
   align : center;
}

.faqlist{
   margin-left:450px;
   margin-top:90px;
}
</style>

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
</head>
<body>

<div id="faq">
<br>
<h2 style="width:1000px; border-bottom:2px solid #DDDDDD; font-weight: bold; height:70px; display:inline-block;">자주 묻는 질문</h2>
<br><br><br>
<pre><h4 style="width:1000px; border-bottom:2px solid #DDDDDD; height:100px; display:inline-block;">우리집 사용자의 편의를 위해 <span style="color: #0000FF; font-weight: bold;">자주묻는 질문과 답변</span>을 모아 놓았습니다.
원하시는 질문을 찾아보세요!!</h4></pre>
</div>

<div class="faqlist">
   <div id="clasp_1" style="height:50px; width:1000px; border-bottom:2px solid #DDDDDD; text-align:left;"><a href="javascript:lunchboxOpen('1');">Q.우리집은 어떤 서비스인가요?</a></div>
   <div id="lunch_1" class="lunchbox" style="width:1000px; border-bottom:2px solid #DDDDDD;">
<pre>
A. 오픈형 부동산 플랫폼 ‘우리집’에서 살고 싶은 집을 만나보세요.  

[누구집? 우리집!!]  

▶ 대한민국 모든 집! 다 있다.  
원룸, 투∙쓰리룸, 오피스텔, 아파트는 물론! 이제는 분양정보까지!! 월세, 전세, 매매, 분양까지 다~있는 우리집에서 다양한 집 정보를 확인하세요.

▶ 집에 대한 모든 정보 
매물, 교통, 편의시설 뿐만 아니라 우리아이가 입학하게 될 학군 정보 까지! 집 선택에 필요한 모든 정보를 우리집에서 한눈에 확인 할 수 있어요.  

▶ 꼼꼼해진 우리집 맞춤검색 
내가 원하는 조건의 방만 쏙쏙 확인할 수 있도록! 맞춤검색 필터가 더욱 세분화 되었습니다.  

▶ 다방면스코어 
우리집의 매물 빅데이터를 기반으로 한 지역 평균 대비 가성비 분석! 교통, 편의시설, 옵션, 관리비, 가격까지 다방면으로 비교하고 선택하세요.    

▶ 부동산 리뷰 보기 
직접 상담, 방문한 사용자가 작성한 생생한 부동산 리뷰! 허위 매물, 불친절한 부동산을 상담 전, 방문 전에 확인 할 수 있습니다.</pre></div>

<br>
<div id="clasp_2" style="height:50px; width:1000px; border-bottom:2px solid #DDDDDD;"><a href="javascript:lunchboxOpen('2');">Q.허위매물은 어떻게 관리 하나요?</a></div>
<div id="lunch_2" class="lunchbox" style="width:1000px; border-bottom:2px solid #DDDDDD;">
<pre>
A. 허위매물 전담팀이 수시로 매물을 살펴보고 허위매물을 필터링하고 있습니다.

▶ 지역구별 평균 시세를 파악해 시세에 비해 확연히 저렴한 매물이나 실사진이 아닌 사진이 포함된 경우 직접 연락을 취해 정보 수정을 요청합니다.

▶ 광고 기간이 30일이 지난 매물의 경우 자동으로 비공개 처리하여 계약이 완료된 매물의 노출 가능성을 줄였고,

▶ 사용자가 직접 허위매물을 신고할 수 있도록 관련 제도를 마련하여 다방면에서 허위매물 ZERO를 위한 노력을 기울이고 있습니다.
</pre></div>

<br>
<div id="clasp_3" style="height:50px; width:1000px; border-bottom:2px solid #DDDDDD;"><a href="javascript:lunchboxOpen('3');">Q.매물개수 제한이 있나요?</a></div>
<div id="lunch_3" class="lunchbox" style="width:1000px; border-bottom:2px solid #DDDDDD;">
<pre>
A. 매물의 경우 1개 계정 당 10개 매물 업로드를 기준으로 합니다. 

무분별한 매물 업로드를 통한 허위 정보의 발생을 막기 위해 허위매물 전담팀이 계속해서 직접 매물 정보를 확인하게 됩니다.
</pre></div>

<br>
<div id="clasp_4" style="height:50px; width:1000px; border-bottom:2px solid #DDDDDD;"><a href="javascript:lunchboxOpen('4');">Q.등록된 방은 믿을 수 있나요?</a></div>
<div id="lunch_4" class="lunchbox" style="width:1000px; border-bottom:2px solid #DDDDDD;">
<pre>
A. 우리집은 사용자 분들에게 믿을 수 있는 정보를 제공하는 것을 최우선으로 합니다.

▶ 매물의 정확한 위치를 지도 위에 표시하고, 매물 근처의 편의시설 등을 한 눈에 볼 수 있도록 하여 발품을 팔지 않고도 주변 환경까지 확인하실 수 있도록 했습니다.

▶ 또한 지속적인 허위매물 관리를 통해 사용자 분들이 허위정보로 인한 불편함을 느끼지 않도록 노력하고 있습니다.
</pre></div>

<br>
<div id="clasp_5" style="height:50px; width:1000px; border-bottom:2px solid #DDDDDD;"><a href="javascript:lunchboxOpen('5');">Q.회원가입을 하면 어떤 점이 좋나요?</a></div>
<div id="lunch_5" class="lunchbox" style="width:1000px; border-bottom:2px solid #DDDDDD;">

<pre>
A. 우리집에 회원가입 후 로그인을 하시면

▶ ‘관심목록'의 내용을 안전하게 저장!
원룸∙투룸∙오피스텔 등 다양한 전∙월세 매물을 살펴보는 과정에서 매물을 조회하고 찜한 내역이 쌓이는 ‘관심목록'의 내용을 PC와 모바일에서 동일하게 확인할 수 있습니다. 또한 앱 업데이트 시에도 그 내용이 그대로 유지됩니다.

▶ 단지 찜하기!
아파트 단지 찜하기는 회원님이 찜하신 매물 조건에 따라 신규 매물 등록 알림을 보내드리기 때문에 로그인 한 회원에게만 제공 가능합니다. 마음에 드는 아파트에 거래가능한 방이 없을지라도 해당 단지를 찜해두시면 신규매물일 등록되었을때 당일 알림을 보내드립니다. 누구보다 빠르게 원하는 방을 찾아보세요!
</pre></div>

<br>
<div id="clasp_6" style="height:50px; width:1000px; border-bottom:2px solid #DDDDDD;"><a href="javascript:lunchboxOpen('6');">Q.회원탈퇴는 어떻게 하나요?</a></div>
<div id="lunch_6" class="lunchbox" style="width:1000px; border-bottom:2px solid #DDDDDD;">

<pre>
A. 우리집 서비스 회원탈퇴를 원하실 경우

▶ 우리집 메뉴에서 ‘정보수정’으로 이동 후 화면 하단에 '회원탈퇴'를 탭하시면 탈퇴가 가능합니다.

▶  우리집앱과 PC애서 모두 회원탈퇴가 가능하며, 우리집의 개선점에 대한 건의 사항은 hello@woorizib.com 으로 보내주시면 서비스 개선에 큰 도움이 됩니다.
</pre></div>

<br>
<div id="clasp_7" style="height:50px; width:1000px; border-bottom:2px solid #DDDDDD;"><a href="javascript:lunchboxOpen('7');">Q.회원정보는 어디에서 수정하나요?</a></div>
<div id="lunch_7" class="lunchbox" style="width:1000px; border-bottom:2px solid #DDDDDD;">
<pre>
A. 우리집 서비스 회원정보는 수정을 원할 경우

▶ 로그인 하신 후 메뉴에서 '마이페이지'를 클릭하시면 '회원정보수정' 메뉴가 있습니다.

▶ 회원정보수정 메뉴를 클릭해서 회원정보를 수정하시면 됩니다.
</pre></div>

<br>
<div id="clasp_8" style="height:50px; width:1000px; border-bottom:2px solid #DDDDDD;"><a href="javascript:lunchboxOpen('8');">Q.상가점포 임대차계약종료시 확인해야 될 사항은?</a></div>
<div id="lunch_8" class="lunchbox" style="width:1000px; border-bottom:2px solid #DDDDDD;">
<pre>
A. 임대차계약 종료시 꼭 확인할 사항
상가 임대차 계약이 완료된 후에도 꼭 살펴봐야 할 사항이 있습니다. 보증금 및 권리금의 회수와 관련하여 법의 보호를 받기 위해서는 표준 계약서에에 약정된 내용과 주의해야 할 점들을 알아둘 필요가 있습니다.

▶ 보증금액 변경시 확정일자 날인
   계약기간 중 보증금을 증액하거나, 재계약을 하면서 보증금을 증액한 경우에는 증액된 보증금액에 대한 우선변제권을 확보하기 위하여 반드시 다시 확정일자를 받아야 합니다.

▶ 임차권등기명령 신청
   임대차가 종료된 후에도 보증금이 반환되지 아니한 경우 임차인은 임대인의 동의 없이 임차건물 소재지 관할 법원에서 임차권등기명령을 받아, 등기부에 등재된 것을 확인하고 이사해야 우선변제 순위를 유지할 수 있습니다. 이때, 임차인은 임차권등기명령 관련 비용을 임대인에게 청구할 수 있습니다.
</pre></div>
<br><br><br><br><br>
</div>
</body>

</html>