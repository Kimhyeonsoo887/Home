<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../all_setting.jsp" %>
<html>
<head>
<link href="${styles}/1_mainpage/css/mypage/layout1.css" rel="stylesheet" type="text/css">
<link href="${styles}/1_mainpage/css/mypage/layout2.css" rel="stylesheet" type="text/css">
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
</style>
<div id="body_layout">
	<div class="body_wrap">
    	<!-- 타이틀 시작 -->
    	<div class="title_wrap">
            <div class="title">
                <h3>게시글 수정하기</h3>
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
          <form action="qnamodifyPro.cust" method="post" name="modifyform">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	
			<input type="hidden" name="qna_number" value="${param.qna_number}">
			<input type="hidden" name="pageNum" value="${param.pageNum}">
			

			<table class="tbl_type1 type5">
				<colgroup>
					<col style="width:24%"><col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">작성자</th>
						<td>${dto.mem_id}</td>
					</tr>
					<tr>
						<th scope="row">제목</th>
						<td>
							<input type="text" class="inp_txt" title="제목 입력" name="qna_title" id="counselTitle" 
							placeholder="50자 이내로 적어주세요." style="width:532px;" maxlength="50" value="${dto.qna_title}">
						</td>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td>
							<div class="inp_wrap type2">
								<textarea title="내용 입력" class="txtarea wrt_cont lengthLimit" name="qna_content" id="counselContent" placeholder="내용을 입력해주세요." style="height:340px" maxlength="1000" required>
								${dto.qna_content}</textarea>
							</div>
							
						</td>
					</tr>
				</tbody>
			</table>
			
			<div class="btn_wrap2">
				<input type="submit" class="btn_type6" id="counselSave" value="수정">
				
			</div>
			</form>
		</div>
        <!-- 컨텐츠 끝 -->
        
        
        <!-- 라이트 시작 -->
		<div class="right_wrap" id="divServiceRight">		
		<!-- 라이드 시작 -->
        <div class="right_wrap">
        	<!-- 부동산 GO -->
        	<a href="/?_c=service&amp;_m=p2p&amp;_a=product">
        	<img src="https://image.r114.co.kr/W1/images/sub/banner_p2p.png" alt="P2P 부동산 투자"></a>
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
        <!-- 라이드 끝 -->
 		</div>
		<!-- 라이트 끝 -->
        
		
		
		
			


</body>
</html>