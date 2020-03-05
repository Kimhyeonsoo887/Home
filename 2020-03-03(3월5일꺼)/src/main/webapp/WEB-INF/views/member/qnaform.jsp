<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../all_setting.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<link href="${styles}/1_mainpage/css/mypage/layout1.css" rel="stylesheet" type="text/css">
<link href="${styles}/1_mainpage/css/mypage/layout2.css" rel="stylesheet" type="text/css">
<style type="text/css">
li{
	list-style-type: none;
}

.btn_wrap2 {
    margin-top: 40px;
    font-size: 0;
    line-height: 0;
    text-align: center;
}
.btn_type6 {
    display: inline-block;;
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
<title>QNA FORM </title>

</head>
<body>
<div id="body_layout">
	<div class="body_wrap">
    	<!-- 타이틀 시작 -->
    	<div class="title_wrap">
            <div class="title">
                <h3>QNA FORM</h3>
            </div>
            <div class="location">
                <ul>
                    <li><a href="/">홈</a></li>
					<li><a onclick="load('all_qna.all')">커뮤니티</a></li>
                    <li>게시글 수정</li>
                </ul>
            </div>
        </div>
    	<!-- 타이틀 끝 -->
        <!-- 컨텐츠 시작 -->
        <div class="contents_wrap">
		<!-- //글쓰기 -->
<form action="qnaPro.cust" method="post" name="writeform">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<input type="hidden" name="qna_number" value="${qna_number}">
<input type="hidden" name="pageNum" value="${pageNum}">

<div style="height:150px;"></div>
<table class="tbl_type1 type5">
				<colgroup>
					<col style="width:24%"><col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">QNA분류</th>
						<td>
							<ul class="expert_choice_list">
							
							<li>
								<input name="qna_type" value="주거용매물" type="radio" >
								<label for="expert19A">주거용매물</label> 
							
							</li>
							
							<li>
								<input name="qna_type" value="재개발/재건축" type="radio" >
								<label for="expert19B">재개발/재건축</label>
							
							</li>
							
							<li>
								<input name="qna_type" value="상가" type="radio">
								<label for="expert19E">상가</label>
							
							</li>
							
							<li>
								<input name="qna_type" value="세무" type="radio" >
								<label for="expert4C">세무</label> 
							
							</li>
							
							<li>
								<input name="qna_type" value="토지" type="radio" >
								<label for="expert15H">토지</label>
							
							</li>
							
							</ul>
						</td>
					</tr>
					
					<tr>
						<th scope="row">공개 여부</th>
						<td>
						<div class="tooltip_wrap consultation_type">
          					<div class="tooltip type_rightblue" style="left:20%; margin-left:-10px;">
          						<span class="type_chk_wrap" id="spnConsultPrice"></span><input name="qna_accessibility" class="inp_rdo Expert0" id="rdo_0" type="radio" checked="" value="공개">
				<label class="Expert0" for="rdo_0"><span class="ico_comm_s rdo"></span>공개 </label>	<input name="qna_accessibility" class="inp_rdo Expert1" id="rdo_1" type="radio" value="비공개"><label class="Expert1" for="rdo_1"><span class="ico_comm_s rdo"></span>비공개 </label>
							</div>
               			 </div>
						
			
					</tr>
					<tr>
						<th scope="row">제목</th>
						
						<td>
							<div class="inp_wrap type2">
								<input title="내용 입력" class="txtarea wrt_cont lengthLimit" name="qna_title" id="counselContent" placeholder="제목입력" style="height:50px" maxlength="1000" required>
							</div>
						</td>
					
					<tr>
						<th scope="row">내용<span class="fc_red">*<span class="blind">필수입력</span></span></th>
						<td>
							<div class="inp_wrap type2">
							<input name="qna_content" title="내용 입력" class="txtarea wrt_cont lengthLimit" id="counselContent" style="height:340px;" maxlength="1000" placeholder="내용을 입력해주세요.">
							<span class="char_cnt"><em class="fc_gray6 lengthLimitCounter">0</em>/1000자</span>
							</div>
					</tr>
				</tbody>
			</table>	
			<div class="btn_wrap2">
				<input type="submit" class="btn_type6" id="counselSave" value="작성완료">
				
			</div>
			
			</form>
		</div>
        <!-- 컨텐츠 끝 -->


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
        </div>
	
	
</div>
</div>


<%@ include file = "../all_footer.jsp" %> 	
</body>
</html>