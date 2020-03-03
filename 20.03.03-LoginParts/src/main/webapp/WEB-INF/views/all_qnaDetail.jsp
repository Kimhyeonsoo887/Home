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

slide_type6_load();

 $(document).ready(function() {

	$(".report_step_vertical").each(function()
	{
		$(this).children().last().addClass("step_tip");
		$(this).children().last().find(".emnum").remove();
	});
	
});
     
function goCommunityDetailPage(g){

	var formData = {"page": 1, "Metro": "", "County": "", "Town": "", "complexCd": "", "sortTag": "", "sortTag2": "", "tabGubun": "1", "searchGubun": "", "searchText": "", "viewId": g};
	createHisFrm(formData, "/?_c=service&_s=community&_m=communityview&_a=townview");
			
}

function goCounselDetailPage(tabGubun, g){

	//var formData = {"page": 1, "Metro": "", "County": "", "Town": "", "complexCd": "", "sortTag": "", "sortTag2": "", "tabGubun": "2", "searchGubun": "", "searchText": "", "viewId": g};
	window.location.href = "/?_c=service&_s=counsel&_m=counselview&consultgubun=" + tabGubun + "&idx=" + g;
			
}

function goDirectDealDetailPage(g) {

	window.location.href = "/?_c=service&_s=directdeal&_m=directdealdetailPersonal&seq=" + g;

}
</script>	
<title>공지사항 디테일</title>
</head>
<body>
<div id="body_layout">
	<div class="body_wrap">
    	<!-- 타이틀 시작 -->
    	<div class="title_wrap">
            <div class="title">
                <h3>부동산 상담</h3>
            </div>
            <div class="location">
                <ul>
                    <li><a href="/">홈</a></li>
					<li><a href="/?_c=service&amp;_m=counsel">커뮤니티</a></li>
                    <li>부동산 상담</li>
                </ul>
            </div>
        </div>
    	<!-- 타이틀 끝 -->
        <!-- 컨텐츠 시작 -->
        <div class="contents_wrap printArea1">

			<div class="view_wrap">
				<!-- 상세 타이틀영역 -->
				<div class="report_title_wrap">
				    <div class="header">
    					<span class="tag_set">
							<span class="tag_comm type2">전문가상담</span>
							<span class="tag_comm type2">주거용매물</span>
						</span>
					</div>
					<div class="headline">
						<h4 class="h4_type4">Q. 투자</h4>
						<div class="view_info clearfix">
							<span class="info_wrap1">
								<span><span class="ico_comm_s writer">작성자</span>건강한 내일님</span>
								<span>2020.02.22</span>
								<span>조회 16</span>
							</span>
							<span class="fr">
								<a href="javascript:" onclick="printGo();"><span class="ico_comm_l print">출력하기</span></a>
								<button type="button" onclick="fn_snsShare()"><span class="ico_comm_l share">공유하기</span></button>
								<!-- <button type="button"><span class="ico_comm_l fs" onclick="zoom();">글자크기 확대/축소</span></button> -->
							</span>
						</div>
					</div>
				</div>
				<!-- // 타이틀영역 -->
				<!-- 상세 본문 -->
				<div class="cont">
					1  노원 상계역 푸르지오 일반분양 17 8 4 아직 등기안됨<br>    여유자금 전세금 3억 투자하고싶음  공무원 퇴직7년남았음<br>2  용인거주  원삼토지  역삼지구 조합아파트 센텀스카이투자  역북지구아파트<br>   전세끼고매매 기흥역아파트 전세끼고매매  구성역인근아파트 전세끼고매매<br>    이들중 어디가 좋을까요 <br>3  상기지역아닌 투자유망지역이 있을까요 <br>4 노원 실거주2년해야하구 1가구2주택이 되면 재산세 종부세 양도세도 생각해<br>  야하니 머리가아프네요 아니면 적은금액이지만 토지투자를 해야되는건지<br>  궁금합니다 가능하면 토지도 추천부탁드려요<br>5  결론적으로 용인 거주하여 용인에 한정돼 보구있는데 지역 관계없이 투자 <br>    매리트지역 아파트및 토지 추천 부탁 드립니다    <br>6  퇴직이 얼마안남아 마음만 급해지네요<br>    코로나 예방 잘하시구요 당사의 발전을 기원합니다
				</div>
				<!-- //상세 본문 -->
			</div>
			<!-- //view_wrap -->
			<!-- 답변 -->
			<!-- 전문가 답변 -->
			<div class="answer_exp_wrap">
					<!-- LOOP START TMP_reply_1 -->
				<div class="smr_head">A.답변 드립니다</div>
					<!-- LOOP END TMP_reply_1 -->
				<div class="ae_cont">
					<div class="info_wrap2 rt mgt1">
						<span><span class="ico_comm_s writer">작성자</span>김인만</span><span>2020.02.23</span>
					</div>
					<!-- LOOP START TMP_reply_2 -->
					<div class="txt">
						<p><font size="2">반갑습니다. 김인만 부동산경제연구소 소장입니다.</font></p><p><font size="2"><br>노원 상계역 푸르지오 분양권 가지고 계시고 여유자금 3억으로 투자하시고 싶다는 말씀이시죠?<br>원삼 토지, 역삼지구 조합 센템스카이, 역북아파트, 기흥역, 구성역 아파트 등에 관심있다고 하셨습니다.</font></p><p><br></p><p><br>퇴직까지 7년 남았으면 아직 수익형부동산을 미리 준비하실 필요는 없을 것 같습니다.<br>투자를 하시는 것은 좋은데 토지와 아파트는 다릅니다.<br>토지는 적어도 10년 이상 장기적인 관점에서 묻어두는 개념으로 접근하시는 것이 맞겠고<br>개별성이 강해서 각 토지별 발품 손품 많이 파셔서 조사를 꼼꼼하게 하시면서 타당성 있는 토지 찾으셔야 합니다.<br>아파트처럼 알아본다고 바로 답이 나올 문제는 아닙니다.<br>노원 상계 푸르지오 아파트 분양권이 있으시다면 토지투자 관심가져보셔도 좋기는 합니다.<br>다만 지금 퇴직이 7년 남았다고 하셨는데 퇴직후 연금을 비롯해 노후준비가 어느정도 되어계시는지에 따라 차이가 있을 것 같습니다.<br>자칫 토지는 자금이 묶이는 결과가 될 수 있어서 퇴직 후 팔고 수익형부동산에 투자해야하는데 제때 팔리지 않아 곤란한 상황이 될 가능성도 배제할 수 없기 때문입니다.</p><p><br>말씀하신 아파트들 중 역삼 조합아파트는 제가 직접 조사를 해보지 않았지만 변동성이 많아서 그리 추천드리고 싶지 않습니다.<br>조합아파트 중에 사업이 잘 되는 경우도 있지만 예상처럼 되지 않아 마음고생하는 분들도 제법 많이 있어서 운이 더 크게 작용됩니다.<br>단기투자면 보정2차e편한세상(2005년, 133세대, 용적률93%)보다는 힐스테이트기흥(2018년, 976세대, 용적률517%)이 더 좋을 것 같습니다.<br>보정2차는 입주연도와 세대수 모두 어중간 합니다.<br>용적률이 93%로 낮은 것은 좋지만 2005년 입주한 아파트를 감안하면 용적률 큰 의미 없습니다.<br>힐스테이트기흥은 새아파트로 당분간 새 아파트 프리미엄 존재할 것이며 역세권 메리트 있습니다.</p><p><br>다만 선생님께서 정확히 어떤 상황인지 모르겠습니다만<br>서울도 그렇고 용인도 상당히 어느정도 오른 상황이어서 지금 갭 투자하셔서 얼마나 더 큰 이익을 볼지는 생각해볼 필요있습니다.<br>물론 풍선효과와 분위기상 조금 더 오를 수는 있습니다만<br>조정대상지역 2주택이면 양도세 +10%p 중과되며<br>노원 상계 푸르지오 입주하고 힐스테이트 기흥하면 아마 종부세 대상이 될 것 같습니다.</p><p><br>토지투자는 좋은 물건 있는지 시간 투입해서 물건 조사는 해보시는 것이 좋습니다.<br>토지 한번 본다고 금방 결론이 나지도 않고 좋은지 안 좋은지 판단하기도 어려우실 거에요<br>경험이 필요한 만큼 발품파시면서 토지 알아보면서 경험을 해보시는 것은 좋습니다.</p><p><br>아파트 투자는 꼭 용인만 고집할 필요 없습니다.<br>단기투자 원하신다면 풍선효과 고려해서 <br>노원 상계동 상계주공 아파트들이나 도봉구 창동역 주변도 괜찮고<br>상계 푸르지오 분양권 있으시다고 하셨으니 <br>최근 움직이는 산본, 남양주, 김포 등도 단타라면 관심가져볼만하고<br>광명 하안주공도 괜찮구요<br>답을 못 찾겠으면 상계 분양권있고 3억원이 전세금이고 아직 퇴직까지 시간이 있으니 너무 무리할 필요는 없을 것 같습니다.</p><p><br>퇴직이 7년 남으셨다고 하셨는데 너무 불안해하실 필요 없습니다.<br>길지도 않는 인생 어떻게든 다 살아갑니다.<br>내가 얼마나 만족하고 행복하게 사느냐가 중요한 만큼 남은 시간 차분하게 준비하시면 됩니다.<br>평생 직장이 7년 남아서 노후가 불안하신 것은 당연한 마음이시겠지만<br>7년이면 충분한 시간이고 아파트 하나 더 투자한다고 그 불안한 마음이 해결되지 않습니다.<br>투자와 별개로 7년후 내가 무슨 일을 할지 일에 대한 고민이 더 필요한 시점이라 생각합니다.<br>퇴직후 가장 중요한 것은 내가 무슨 일을 하느냐 입니다.<br>제2의 직업에서 얻는 수익이 현재 수입보다 더 늘어나기는 어렵기에 연금과 수익형부동산으로 커버하는 것입니다.<br>요즘 시대흐름상 퇴직하더라도 10-20년은 더 할 수 있는 내가 좋아하고 잘 할 수 있는 일을 찾고 준비하시기 바랍니다.<br>그리고 최대한 많은 사람들 만나보고 여러 경험들 많이 해보시는 것이 좋습니다.</p><p><br></p><p>오픈된 공개상담주셔서 제 연락처 남겨드릴 수는 없네요</p><p>추가 궁금하신점 있으시면 부동산114에 문의하시면 제 연락처 알려드릴 거에요</p><p>연락주시면 추가의견 드리도록 하겠습니다.<br></p>
					</div>
					<!-- LOOP END TMP_reply_2 -->
					
					<div class="expert_info"><img src="http://image.r114.co.kr/imgdata/crm/kim_profile.jpg" alt="" class="thumb" style="width:120px; height:120px;"><div class="info_txt"><em>김인만전문가</em><ul class="fc_gray9"><li>-김인만 부동산경제연구소 소장 </li><li>-TV조선 "이사야사" 고정패널 </li><li>-YTN "생생경제" 고정패널</li><li>-Queen "생활 속 부동산" 연재</li><li>-조선일보 등 칼럼기고</li></ul></div></div>
					
				</div>
				<!-- //전문가 답변 -->
				<!-- 버튼영역 -->
				<div class="btn_wrap">
					<a href="#none" onclick="fnCounselList();" class="btn_type1 fl">목록으로</a>
					
				</div>
				<!-- //버튼영역 -->

				<div style="margin-top:40px">
				<h4 class="h4_type4">뷰어 다운받기</h4>
				<div class="link_file">
					<a href="http://www.hancom.com/downLoad.downPU.do?mcd=002" target="_blank">
						<span class="ico_comm_l hangeul"></span><span>한글</span>
					</a>
					<a href="http://ardownload.adobe.com/pub/adobe/reader/win/7x/7.0/kor/AdbeRdr70_kor.exe" target="_blank" class="w2">
						<span class="ico_comm_l pdf"></span><span>Adobe Reader</span>
					</a>
				</div>
				</div>
			</div>
			<!-- //답변 -->

			<!-- 댓글 -->

			
        </div>
        <!-- 컨텐츠 끝 -->
        <!-- 라이트 시작 -->
		<div class="right_wrap" id="divServiceRight">		<!-- 라이드 시작 -->
        <div class="right_wrap">
        	<!-- 부동산 GO -->
        	<a href="/?_c=service&amp;_m=p2p&amp;_a=product"><img src="https://image.r114.co.kr/W1/images/sub/banner_p2p.png" alt="P2P 부동산 투자"></a>
        	<!-- //부동산 GO -->
			<div class="bx_gray">
				<!-- 우리동네, 단지 이야기 BEST -->
				<div class="inner weekly">
					<h4 class="h4_type2">우리동네 이야기 BEST</h4>
					<ol class="list_num_type1" id="listCommunityBest">
						
						<li><a href="javascript:goCommunityDetailPage(1852);">서울시에서 저평가된 1236세대 역세권, 숲세권 동부골든아파트</a></li>
						
						<li><a href="javascript:goCommunityDetailPage(1834);">구로역개발시 최고의 아파트로 거급난다</a></li>
						
						<li><a href="javascript:goCommunityDetailPage(1838);">이것 저것 따져봐도 별 나무날데가 없는 단지 인 것같아요   나중에 애들 키우기도 좋음</a></li>
						
						<li><a href="javascript:goCommunityDetailPage(1833);">수도권에서 신분당성 역세권 + 광교산 숲세권으로써 이만한 천혜의 입지는 찾아보기 힘듬.</a></li>
						
						<li><a href="javascript:goCommunityDetailPage(1846);">오래되어서 더 가치있는 아파트 중계동 학원가의 소형 평형 투자가치</a></li>
						
					</ol>
					<a href="/?_c=service&amp;_s=community" class="more_type1">더보기 <span class="ico_comm_s more1"></span></a>
				</div>
				<!-- //우리동네, 단지 이야기 BEST -->
			</div>
			<div class="bx_gray">
				<!-- 부동산상담 BEST -->
				<div class="inner weekly">
					<h4 class="h4_type2">부동산상담 BEST</h4>
					<ol class="list_num_type1" id="listCounselBest">
						
						<li><a href="javascript:goCounselDetailPage('expert', 5650);">고가주택외 1주택을  더 구입할지</a></li>
						
						<li><a href="javascript:goCounselDetailPage('expert', 5663);">아파트 구매상담</a></li>
						
						<li><a href="javascript:goCounselDetailPage('expert', 5674);">양도소득세 문의 드립니다</a></li>
						
						<li><a href="javascript:goCounselDetailPage('expert', 5683);">중개수수료에 대한 문의 드립니다.</a></li>
						
						<li><a href="javascript:goCounselDetailPage('expert', 5691);">평촌구축아파트매도시기</a></li>
						
					</ol>
					<a href="/?_c=service&amp;_m=counsel" class="more_type1">더보기 <span class="ico_comm_s more1"></span></a>
				</div>
				<!-- //부동산상담 BEST -->
			</div>
			<div class="bx_gray">
				<!-- 직거래 팝니다 -->
				<div class="inner weekly">
					<h4 class="h4_type2">직거래 매물</h4>
					<ul class="list_txt_type1">
						
					</ul>
					<a href="/?_c=service&amp;_s=directdeal&amp;_m=directdeallistPersonal" class="more_type1">더보기<span class="ico_comm_s more1"></span></a>
				</div>
				<!-- //직거래 팝니다 -->
			</div>
			<div class="bx_gray">
				<!-- 부동산114dml 솔루션 -->
				<div class="slide_type6 type2">
					<div class="bx-wrapper" style="max-width: 100%;"><div class="bx-viewport" aria-live="polite" style="width: 100%; overflow: hidden; position: relative; height: 120px;"><ul style="width: 2215%; position: relative; transition-duration: 0s; transform: translate3d(-456px, 0px, 0px);"><li style="float: left; list-style: none; position: relative; width: 228px;" class="bx-clone" aria-hidden="true">
							<a href="/?_c=solution&amp;_m=solutiondefault&amp;_a=katlas">
								<span class="thumb"><img src="https://image.r114.co.kr/W1/images/sub/banner_sol_katlas.jpg" alt="지역기반 데이터 융합 분석 서비스 K-atlas"></span>
							</a>
						</li>
						<li style="float: left; list-style: none; position: relative; width: 228px;" aria-hidden="true">
							<a href="/?_c=solution&amp;_m=solutiondefault&amp;_a=reps">
								<span class="thumb"><img src="https://image.r114.co.kr/W1/images/sub/banner_sol_reps.jpg" alt="부동산 통계분석 솔루션 REPS"></span>
							</a>
						</li>
						<li style="float: left; list-style: none; position: relative; width: 228px;" aria-hidden="false">
							<a href="/?_c=solution&amp;_m=solutiondefault&amp;_a=katlas">
								<span class="thumb"><img src="https://image.r114.co.kr/W1/images/sub/banner_sol_katlas.jpg" alt="지역기반 데이터 융합 분석 서비스 K-atlas"></span>
							</a>
						</li>
					<li style="float: left; list-style: none; position: relative; width: 228px;" class="bx-clone" aria-hidden="true">
							<a href="/?_c=solution&amp;_m=solutiondefault&amp;_a=reps">
								<span class="thumb"><img src="https://image.r114.co.kr/W1/images/sub/banner_sol_reps.jpg" alt="부동산 통계분석 솔루션 REPS"></span>
							</a>
						</li></ul></div><div class="bx-controls bx-has-pager"><div class="bx-pager bx-default-pager"><div class="bx-pager-item"><a href="" data-slide-index="0" class="bx-pager-link">1</a></div><div class="bx-pager-item"><a href="" data-slide-index="1" class="bx-pager-link active">2</a></div></div></div></div>
				</div>
				<!-- //부동산114dml 솔루션 -->
			</div>
			<div class="bx_gray">
				<!-- 부동산거래 단계별 가이드 -->
				<div class="inner news_r">
					<h4 class="h4_type2">부동산거래 단계별가이드</h4><!--2017-09-26 해당요소를 단계별 가이드로 수정-->
					<div class="tab_a tab_ui" style="margin:5px 0 10px 0">
						<a href="javascript:;" class="on">매매</a>
						<a href="javascript:;">전월세</a>
						<a href="javascript:;">분양</a>
					</div>
					<ul class="tab_cont">
						<li class="on">
							<!--매매-->
							<ul class="report_step_vertical">
								<li><a href="/?_c=Research&amp;_m=ReportNews&amp;_a=StepGuide&amp;deal=매매&amp;dealNum=1"><em class="emnum">01.</em>사전준비</a></li><li><a href="/?_c=Research&amp;_m=ReportNews&amp;_a=StepGuide&amp;deal=매매&amp;dealNum=2"><em class="emnum">02.</em>정보수집</a></li><li><a href="/?_c=Research&amp;_m=ReportNews&amp;_a=StepGuide&amp;deal=매매&amp;dealNum=3"><em class="emnum">03.</em>계약단계</a></li><li><a href="/?_c=Research&amp;_m=ReportNews&amp;_a=StepGuide&amp;deal=매매&amp;dealNum=4"><em class="emnum">04.</em>등기/이사</a></li><li><a href="/?_c=Research&amp;_m=ReportNews&amp;_a=StepGuide&amp;deal=매매&amp;dealNum=5"><em class="emnum">05.</em>거주</a></li><li class="step_tip"><a href="/?_c=Research&amp;_m=ReportNews&amp;_a=StepGuide&amp;deal=매매&amp;dealNum=6">매도팁</a></li>
							</ul>
						</li>
						<li>
							<!--전월세-->
							<ul class="report_step_vertical">
								<li><a href="/?_c=Research&amp;_m=ReportNews&amp;_a=StepGuide&amp;deal=전월세&amp;dealNum=7"><em class="emnum">01.</em>사전준비</a></li><li><a href="/?_c=Research&amp;_m=ReportNews&amp;_a=StepGuide&amp;deal=전월세&amp;dealNum=8"><em class="emnum">02.</em>정보수집</a></li><li><a href="/?_c=Research&amp;_m=ReportNews&amp;_a=StepGuide&amp;deal=전월세&amp;dealNum=9"><em class="emnum">03.</em>계약단계</a></li><li><a href="/?_c=Research&amp;_m=ReportNews&amp;_a=StepGuide&amp;deal=전월세&amp;dealNum=10"><em class="emnum">04.</em>이사/확정일자</a></li><li><a href="/?_c=Research&amp;_m=ReportNews&amp;_a=StepGuide&amp;deal=전월세&amp;dealNum=11"><em class="emnum">05.</em>거주/재계약/퇴거</a></li><li class="step_tip"><a href="/?_c=Research&amp;_m=ReportNews&amp;_a=StepGuide&amp;deal=전월세&amp;dealNum=13">임대팁</a></li>
							</ul>
			
						</li>
						<li>
							<!--분양권-->
							<ul class="report_step_vertical">
								<li><a href="/?_c=Research&amp;_m=ReportNews&amp;_a=StepGuide&amp;deal=분양&amp;dealNum=14"><em class="emnum">01.</em>청약통장 가입</a></li><li><a href="/?_c=Research&amp;_m=ReportNews&amp;_a=StepGuide&amp;deal=분양&amp;dealNum=15"><em class="emnum">02.</em>분양정보 확인</a></li><li><a href="/?_c=Research&amp;_m=ReportNews&amp;_a=StepGuide&amp;deal=분양&amp;dealNum=16"><em class="emnum">03.</em>청약신청</a></li><li><a href="/?_c=Research&amp;_m=ReportNews&amp;_a=StepGuide&amp;deal=분양&amp;dealNum=17"><em class="emnum">04.</em>입주단계</a></li><li><a href="/?_c=Research&amp;_m=ReportNews&amp;_a=StepGuide&amp;deal=분양&amp;dealNum=18"><em class="emnum">05.</em>입주 후</a></li><li class="step_tip"><a href="/?_c=Research&amp;_m=ReportNews&amp;_a=StepGuide&amp;deal=분양&amp;dealNum=19">분양권 거래</a></li>
							</ul>
						</li>
					</ul>
				</div>				
				<!-- //부동산거래 단계별 가이드 -->

				<!-- Google 광고 -->
				<div></div>
				<!-- //Google 광고 -->
			</div>
        </div>
        <!-- 라이드 끝 -->

		</div>
		<!-- 라이트 끝 -->
    </div>
</div>
</body>
</html>