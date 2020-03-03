<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
*{
	font-family:Noto Sans KR, sans-serif;
}
table{
border-collapse:collapse;


}
tr{
	border-bottom: 1px solid #cccccc;
	height:50px;

	
}
#tfoot,#pageControl{
	border-bottom:none;
		
}
tfoot{
	vertical-align:bottom;
}

button{    
	border-radius: 3px;
    color: #FFFFFF;
    background-color: #FF6754;
    border-color: #FF6754;
    box-sizing: border-box;
    border: 2px solid transparent;
    text-align: center;
    display: inline-block;
    width: auto;
    height: auto;
    font-family: Nanum Gothic, sans-serif;
    font-weight: 700;
    padding:10px 20px;
    font-size:16px;
    
    }
 
.writeBtn{float:right; }

input[type="search" ] {
    /* -webkit-appearance: searchfield; */
    box-sizing: border-box;
    padding: 10px 15px;
    float:left;
    margin-right:20px;
    vertical-align:text-bottom;
}
#boardBtn{
	margin-top:20px;
}
caption{font-size:20px}
</style>
<body>
<br><br>
	<div class="op_detail_sch por_rel">
		
		<div id="searchFormDiv" class="finder por_rel" style="">
			<div class="op_box_form02 bt1">
		    	<div class="op_box_form02_in">
			        <table id="collateralSearchTb" align="center" >
			           
			            <colgroup>
			                <col style="width:110px;"> 
			                <col style="width:35%;"> 
			                <col style="width:125px;">
			                <col style="width:*;"> 
			            </colgroup>
			             
			            <tbody>
			            	 <tr>
			                    <th scope="row">처분방식</th>
			                    <td colspan="3">
			                       	<input id="dpslMtd1" name="searchDpslMtdCd" type="radio" value="" checked="checked"><label for="dpslMtd1" class="w80">전체</label>
					   				<input id="dpslMtd2" name="searchDpslMtdCd" type="radio" value="0001"><label for="dpslMtd2" class="w80">매각</label>
					   				<input id="dpslMtd3" name="searchDpslMtdCd" type="radio" value="0002"><label for="dpslMtd3" class="w80">임대(대부)</label>
			                    </td>
			                </tr>
			                <tr>
			                    <th scope="row"><label for="searchCltrNm">물건명</label></th>
			                    <td>
			                    	<input id="searchCltrNm" name="searchCltrNm" style="width:207px;" title="물건명입력" type="text" value="">
			                    </td>
			                    <th scope="row"><div class="th_inner"></div></th>
			                    	
			                </tr>
			               <tr>
			                	<th scope="row"><label for="searchBegnDtm">입찰기간</label></th>
			                    <td>
			                    	<input id="searchBegnDtm" name="searchBegnDtm" class="date hasDatepicker" title="조회시작날짜" style="width:65px;" type="text" value="2020-02-14" aria-required="true"> 
			                    	<a href="#none" id="searchBegnDtmBtn" class="cm_ibtn_cof"><em class="cm_ico_calendar">날짜선택</em></a> ~
			                    	<input id="searchClsDtm" name="searchClsDtm" class="date hasDatepicker" title="조회마지막날짜" style="width:65px;" type="text" value="2020-02-21" aria-required="true"> 
			                    	<a href="#none" id="searchClsDtmBtn" class="cm_ibtn_cof"><em class="cm_ico_calendar">날짜선택</em></a>
			                    </td>
			                    <th scope="row"><label for="searchFromMinBidPrc">최저입찰가</label></th>
			                    <td>
			                    	<select id="searchFromMinBidPrc" name="searchFromMinBidPrc" title="최저입찰가선택">
										<option value="" selected="selected">전체</option>
										<option value="0">5백만원이하</option>
										<option value="5000000">5백만원</option>
										<option value="10000000">1천만원</option>
										<option value="20000000">2천만원</option>
										<option value="30000000">3천만원</option>
										<option value="40000000">4천만원</option>
										<option value="50000000">5천만원</option>
										<option value="100000000">1억원</option>
										<option value="150000000">1억5천만원</option>
										<option value="200000000">2억원</option>
										<option value="250000000">2억5천만원</option>
										<option value="300000000">3억원</option>
										<option value="400000000">4억원</option>
										<option value="500000000">5억원</option>
										<option value="600000000">6억원</option>
										<option value="700000000">7억원</option>
										<option value="800000000">8억원</option>
										<option value="900000000">9억원</option>
										<option value="1000000000">10억원</option>
										<option value="2000000000">20억원</option>
										<option value="2000000001">20억원이상</option>
			                    	</select>
			                        ~
			                        <select id="searchToMinBidPrc" name="searchToMinBidPrc" title="최저입찰가선택">
										<option value="" selected="selected">전체</option>
										<option value="10000000">1천만원</option>
										<option value="20000000">2천만원</option>
										<option value="30000000">3천만원</option>
										<option value="40000000">4천만원</option>
										<option value="50000000">5천만원</option>
										<option value="100000000">1억원</option>
										<option value="150000000">1억5천만원</option>
										<option value="200000000">2억원</option>
										<option value="250000000">2억5천만원</option>
										<option value="300000000">3억원</option>
										<option value="400000000">4억원</option>
										<option value="500000000">5억원</option>
										<option value="600000000">6억원</option>
										<option value="700000000">7억원</option>
										<option value="800000000">8억원</option>
										<option value="900000000">9억원</option>
										<option value="1000000000">10억원</option>
										<option value="2000000000">20억원</option>
			                        </select>
			                    </td>
			                </tr>
									
			                <tr class="bt_dot">
			                    <th scope="row"><label for="a1">용도선택<br> (복수선택가능) </label></th> 
			                    <td colspan="3">
			                    	<ul class="tab_i_01" style="display: none;">
										<li><a href="#none" onclick="fn_changeTab('0002')">자동차/운송장비</a></li>
										<li><a href="#none" onclick="fn_changeTab('0003')">물품(기계)</a></li>
										<li><a href="#none" onclick="fn_changeTab('0004')">물품(기타)</a></li>
										<li><a href="#none" onclick="fn_changeTab('0005')">권리/증권</a></li>
									</ul>
									<div class="over_y_wrap mb10">
				                    	<div class="over_y fl">
				                    		<ul class="check_list" id="firstCtgrList"><li><input type="radio" id="firstCtgrId2" name="firstCtgrId" value="10100"><label for="firstCtgrId2">토지</label></li><li><input type="radio" id="firstCtgrId33" name="firstCtgrId" value="10200"><label for="firstCtgrId33">주거용건물</label></li><li><input type="radio" id="firstCtgrId52" name="firstCtgrId" value="10300"><label for="firstCtgrId52">상가용및업무용건물</label></li><li><input type="radio" id="firstCtgrId76" name="firstCtgrId" value="10400"><label for="firstCtgrId76">산업용및기타특수용건물</label></li><li><input type="radio" id="firstCtgrId83" name="firstCtgrId" value="10500"><label for="firstCtgrId83">용도복합용건물</label></li></ul>
				                    	</div>
				                  
				                    </div>
			                        <div class="cm_box_11 slt_wrap_b cl" style="" id="selectedCtgrSearch">
				                        <span class="cm_txt_dot04 pr10" id="srchSpan_10400"><em>산업용및기타특수용건물</em> &gt; 
				                        <em>전체</em><input type="hidden" name="searchArrayCtgrId" value="10400">
				                         <a href="#" class="btn_scle">삭제</a></span><span class="cm_txt_dot04 pr10" id="srchSpan_10302">
				                         <em>상가용및업무용건물</em> &gt; <em>문화및집회시설</em><input type="hidden" name="searchArrayCtgrId" value="10302"> 
				                         <a href="#" class="btn_scle">삭제</a></span><span class="cm_txt_dot04 pr10" id="srchSpan_10304">
				                         <em>상가용및업무용건물</em> &gt; <em>판매시설</em><input type="hidden" name="searchArrayCtgrId" value="10304"> 
				                         <a href="#" class="btn_scle">삭제</a></span>
			                         </div>
			                    </td>
			                </tr>
			      
			                <tr>
					                
			                    <th scope="row"><label for="searchFromApslAsesAmt">감정평가금액</label></th>
			                    <td>
			                    	<select id="searchFromApslAsesAmt" name="searchFromApslAsesAmt" title="감정평가금액선택">
										<option value="" selected="selected">전체</option>
										<option value="0">5백만원이하</option>
										<option value="5000000">5백만원</option>
										<option value="10000000">1천만원</option>
										<option value="20000000">2천만원</option>
										<option value="30000000">3천만원</option>
										<option value="40000000">4천만원</option>
										<option value="50000000">5천만원</option>
										<option value="100000000">1억원</option>
										<option value="150000000">1억5천만원</option>
										<option value="200000000">2억원</option>
										<option value="250000000">2억5천만원</option>
										<option value="300000000">3억원</option>
										<option value="400000000">4억원</option>
										<option value="500000000">5억원</option>
										<option value="600000000">6억원</option>
										<option value="700000000">7억원</option>
										<option value="800000000">8억원</option>
										<option value="900000000">9억원</option>
										<option value="1000000000">10억원</option>
										<option value="2000000000">20억원</option>
										<option value="2000000001">20억원이상</option>
			                    	</select>
			                        ~
			                        <select id="searchToApslAsesAmt" name="searchToApslAsesAmt" title="감정평가금액선택">
										<option value="" selected="selected">전체</option>
										<option value="10000000">1천만원</option>
										<option value="20000000">2천만원</option>
										<option value="30000000">3천만원</option>
										<option value="40000000">4천만원</option>
										<option value="50000000">5천만원</option>
										<option value="100000000">1억원</option>
										<option value="150000000">1억5천만원</option>
										<option value="200000000">2억원</option>
										<option value="250000000">2억5천만원</option>
										<option value="300000000">3억원</option>
										<option value="400000000">4억원</option>
										<option value="500000000">5억원</option>
										<option value="600000000">6억원</option>
										<option value="700000000">7억원</option>
										<option value="800000000">8억원</option>
										<option value="900000000">9억원</option>
										<option value="1000000000">10억원</option>
										<option value="2000000000">20억원</option>
			                        </select>
				               	</td>
					            <th scope="row"><label for="searchOrgNm"></label></th>
					            <td></td>
				           	</tr>
			                <tr>
			                    <th scope="row">소재지<br>(보관장소)</th>
			                    <td colspan="3">
			                    	<input id="searchCltrAdrsType2" name="searchCltrAdrsType" title="도로명" type="radio" value="road" checked="checked"><label for="searchCltrAdrsType2" class="w50">도로명</label>
			                    	<input id="searchCltrAdrsType1" name="searchCltrAdrsType" title="지번" type="radio" value="zip"><label for="searchCltrAdrsType1" class="w50">지번</label>
			                        <span class="mt5">
			                        	<select id="siDo" name="siDo" title="시도 선택" style="width:100px;"><option value="">전체</option>
							<option value="1100000000" selected="selected">서울특별시</option>
							<option value="2600000000">부산광역시</option><option value="2700000000">대구광역시</option>
							<option value="2800000000">인천광역시</option><option value="2900000000">광주광역시</option>
							<option value="3000000000">대전광역시</option><option value="3100000000">울산광역시</option>
							<option value="3600000000">세종특별자치시</option><option value="4100000000">경기도</option>
							<option value="4200000000">강원도</option><option value="4300000000">충청북도</option>
							<option value="4400000000">충청남도</option><option value="4500000000">전라북도</option>
							<option value="4600000000">전라남도</option><option value="4700000000">경상북도</option>
							<option value="4800000000">경상남도</option><option value="5000000000">제주특별자치도</option>
						</select>
						<select id="siGunGu" name="siGunGu" title="시군구 선택" style="width:100px;">
							<option value="">전체</option><option value="1168000000">강남구</option><option value="1174000000">강동구</option><option value="1130500000">강북구</option>
							<option value="1150000000">강서구</option><option value="1162000000">관악구</option><option value="1121500000">광진구</option><option value="1153000000">구로구</option>
							<option value="1154500000">금천구</option><option value="1135000000">노원구</option><option value="1132000000">도봉구</option><option value="1123000000">동대문구</option>
							<option value="1159000000" selected="selected">동작구</option><option value="1144000000">마포구</option><option value="1141000000">서대문구</option>
							<option value="1165000000">서초구</option><option value="1120000000">성동구</option><option value="1129000000">성북구</option><option value="1171000000">송파구</option>
							<option value="1147000000">양천구</option><option value="1156000000">영등포구</option><option value="1117000000">용산구</option><option value="1138000000">은평구</option>
							<option value="1111000000">종로구</option><option value="1114000000">중구</option><option value="1126000000">중랑구</option></select>
						<select id="emd" name="emd" title="읍면동 선택" style="display: none;width:100px;">
							<option value="">전체</option><option value="1159010100">노량진동</option><option value="1159010800">대방동</option>
							<option value="1159010600">동작동</option>
							<option value="1159010400">본동</option><option value="1159010700">사당동</option><option value="1159010300">상도1동</option>
							<option value="1159010200">상도동</option><option value="1159010900">신대방동</option><option value="1159010500">흑석동</option>
						</select>
							<input id="searchAddrDtl" name="searchAddrDtl" type="text" title="주소상세 입력" class="box_w150" value="상도1동">
			                        </span>
			                       
			                    </td>
			                </tr>
	
			                <tr>
			                    <th scope="row"><label for="searchFromLandSqms">토지면적</label></th>
			                    <td>
			                    	<input id="searchFromLandSqms" name="searchFromLandSqms" class="number" style="width:71px;" title="토지면적 입력" type="text" value=""><em>㎡  ~ </em>
			                    	<input id="searchToLandSqms" name="searchToLandSqms" class="number" style="width:71px;" title="토지면적 입력" type="text" value=""><em>㎡</em>
			                    </td>
			                    <th scope="row"><label for="searchFromBldSqms">건물면적</label></th>
			                    <td>
			                    	<input id="searchFromBldSqms" name="searchFromBldSqms" class="number" style="width:71px;" title="건물면적 입력" type="text" value=""><em>㎡  ~ </em>
			                    	<input id="searchToBldSqms" name="searchToBldSqms" class="number" style="width:71px;" title="건물면적 입력" type="text" value=""><em>㎡</em>
			                    </td>
			                </tr>
							<tr>
			                    <th scope="row"><label for="searchFromUsbdCnt">유찰횟수</label></th>
			                    <td>
			                    	<select id="searchFromUsbdCnt" name="searchFromUsbdCnt" style="width:100px;" title="유찰횟수 선택">
										<option value="" selected="selected">전체</option>
										<option value="0">0 회</option>
										<option value="2">2 회</option>
										<option value="4">4 회</option>
										<option value="6">6 회</option>
										<option value="8">8 회</option>
										<option value="10">10 회</option>
			                        </select>
			                        ~
			                        <select id="searchToUsbdCnt" name="searchToUsbdCnt" title="유찰횟수 선택" style="width:100px;">
										<option value="" selected="selected">전체</option>
										<option value="2">2 회</option>
										<option value="4">4 회</option>
										<option value="6">6 회</option>
										<option value="8">8 회</option>
										<option value="10">10 회</option>
			                        </select>
			                    </td>
							</tr>
							<tr>
								
								<th scope="row">지분물건 여부</th>
			                    <td colspan="3">
			                    	
			                    	<input id="searchShrYn1" name="searchShrYn" title="전체" type="radio" value="" checked="checked"><label for="searchShrYn1" class="w30">전체</label>
			                    	<input id="searchShrYn2" name="searchShrYn" title="지분물건" type="radio" value="Y"><label for="searchShrYn2" class="w60">지분물건</label>
			                    	<input id="searchShrYn3" name="searchShrYn" title="지분물건 제외" type="radio" value="N"><label for="searchShrYn3">지분물건 제외</label>
									<div class="tPopwrap_wrap">
										<a class="tPopwrap" href="#none" title="지분물건 여부 팁 보기">
											<img src="/images/op_btn/op_btn_tip.png" alt="tip" class="ml5">
										</a>
										<div class="tip_popup" style="display: none; width: 280px;">
											<div>
											
												<p class="tip_point">부동산의 공유자 유무에 따른 검색이 가능합니다.<br>
													- 지분 물건 : 공유자가 있는 물건<br>
													- 지분 물건 제외 : 공유자가 없는 물건
												</p>
											</div>
											
										</div>
										
									</div>
			                    </td>
							</tr>
							       	
				        </tbody>
			        </table>
				</div>
			</div>
		</div>

    	<div class="form_btn_R">
    	<!-- <a href="#none" id="saveBtn" class="cm_btn_w_f fl"><span>검색조건 저장</span></a>
    	20150706 :: 버튼 추가 S
    	<a href="#none" onclick="fn_selectSearchCondition()" class="cm_btn_w_f fl ml3"><span>검색조건 저장내역</span></a>
    	20150706 :: 버튼 추가 E -->
        <a href="#none" id="resetBtn" class="cm_btn_w_f"><span>초기화/</span></a>
        <a href="#none" id="searchBtn" class="cm_btn_w_o ml3"><span>검색</span></a>
   	</div>
   	<div class="btn_sch_more" id="moveableAssetsCloseDiv" style="display: none;"><a href="#" class="">검색목록 숨기기</a></div>
    </div>
	
	
	<table width="50%" align="center" >
		<colgroup>
			<col style="width:30%;"/>
			<col style="width:15%;"/>
			<col style="width:30%;"/>
			<col style="width:10%;"/>
			<col style="width:10%;"/>
		</colgroup>
		<thead>
			<tr>
				<td colspan="5">
					<select id="searchOrderBy" name="searchOrderBy" title="리스트 정렬 선택" style="width:120px;">
					    <option value="" selected="selected">정렬선택</option>
					    <option value="01">조회수높은순</option>
					    <option value="02">조회수낮은순</option>
					    <option value="03">입찰금액높은순</option>
					    <option value="04">입찰금액낮은순</option>
					    <option value="05">최저입찰가율높은순</option>
					    <option value="06">최저입찰가율낮은순</option>
					    <option value="07">마감임박순</option>
					    <option value="08">신규등록물건순</option>
					</select>

				    <select id="pageUnit" name="pageUnit" title="리스트 목록 갯수 선택" style="width:120px;">
						<option value="10" selected="selected">
						            10줄씩&nbsp;보기
						</option>
						<option value="20">
						            20줄씩&nbsp;보기
						</option>
						<option value="50">
						            50줄씩&nbsp;보기
						</option>
						<option value="100">
						            100줄씩&nbsp;보기
						</option>
				  </select>
					<a href="javascript:fn_selectList(1);" class="cm_btn_tnt"><span>정렬</span></a>
					<a href="javascript:fn_collateralComparePopup();" class="cm_btn_w_f"><span>물건비교</span></a>
					<a href="#none" onclick="fn_requestInterest()" class="cm_btn_w_f"><span>관심물건등록</span></a>
				</td>
			</tr>
			<tr height="50px">
				<td align="center" scope="col">물건정보</td>
			    <td align="center" scope="col">입찰기간</td>
			    <td align="center" scope="col">최저입찰가(원)<br>감정가-최초예정가(원)<br>최저입찰가율(%)</td>
			    <td align="center" scope="col">물건상태</td>
			    <td align="center" scope="col">조회수</td>
			</tr>
		</thead>

		<tbody >
		<c:if test="${cnt>0}">
			<c:forEach var="dto" items="${dtos}">
				<tr id="top" height="50px">
					<td>
						${number}
						<c:set var="number" value="${number-1}"/>
						<%-- (${dto.ref} / ${dto.ref_step} / ${dto.ref_level}) --%>
					</td>
					<td>
						<!-- 답글인 경우 : 들여쓰기 >1 -->
						<c:if test="${dto.ref_level>1}">
							<c:set var="wid" value="${(dto.ref_level-1) * 10}"/>
							
							<img src="${project}images/level.gif" border="0" width="${wid}" height="15">
						</c:if>
						
						<!-- 답글인 경우 : 들여쓰기 >0 -->
						<c:if test="${dto.ref_level>0}">
							<img src="${project}images/re.gif" border="0" width="20" height="15">
						</c:if>
						
						<!-- hot 이미지 -->
						<c:if test="${dto.readCnt >10}">
							<img src="${project}images/hot.gif" border="0" width="20" height="15">
						</c:if>
						<a href="contentForm.bo?num=${dto.num}&pageNum=${pageNum}&number=${number+1}&boardNum=1">${dto.subject}</a>
						<!-- get방식 공백이나 줄바꿈 no!!! -->
					</td>
					<td>
						${dto.id}
					</td>
					<td>
						${dto.readCnt}
					</td>
					<td>
						<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${dto.reg_date}"/>
					</td>
					
				</tr>
			
			</c:forEach>
		</c:if>
		<!-- 게시글이 없으면 -->
		<c:if test="${cnt==0 }">
			<tr>
				<td colspan="5" align="center">
					게시글이 없습니다. 글을 작성해주세요.!!
				</td>
			</tr>
		</c:if>
			
	      
		</tbody>
	
	</table>
	<!-- 페이지 컨트롤 테이블 -->
	<table style="width:1000px" align="center" >
		<tr id="pageControl">
			<th align="center">
				<!-- 게시글이 있으면 -->
				<c:if test="${cnt>0}">
					<!-- 처음[◀◀] /이전블록[◀]	pageBlock:3, 특수문자:ㅁ+한자키 -->
					<c:if test="${startPage > pageBlock}">
						<a href="boardList.bo?boardNum=1">[◀◀ ]</a>
						<a href="boardList.bo?pageNum=${startPage-pageBlock}&boardNum=1">[◀ ]</a>
					</c:if>
					
					<!-- 블록내의 페이지 번호 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}"><!-- setAttribute로 넘긴 값 -->
						<c:if test="${i == currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i != currentPage}">
							<a href="boardList.bo?pageNum=${i}&boardNum=1">[${i}]</a>
						</c:if>
					</c:forEach>
					<!-- 다음블록[▶]/마지막[▶▶]		특수문자:ㅁ+한자키 -->
					<c:if test="${pageCount > endPage}">
						<a href="boardList.bo?pageNum=${startPage+pageBlock}&boardNum=1">[▶ ]</a>
						<a href="boardList.bo?pageNum=${pageCount}&boardNum=1">[▶▶ ]</a>
					</c:if>
				</c:if>
			</th>
		</tr>
	</table>
		
</body>
</html>