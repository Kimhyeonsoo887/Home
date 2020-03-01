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
<style>
	
</style>
<title>MY page 결제 내역</title>
</head>
<body>
<div id="body_layout">
	<div class="body_wrap">
	<!-- 타이틀 시작 -->
	<div class="title_wrap">
		<div class="title">
			<h3>My페이지</h3>
		</div>
		<div class="location">
			<ul>
				<li><a href="/">홈</a></li>
				<li><a href="/?_c=service&amp;_m=Auction">경매</a></li>
				<li><a href="#">My페이지</a></li>
			</ul>
		</div>
	</div>
	<!-- 타이틀 끝 -->
	<!-- 컨텐츠 시작 -->
	<div class="contents_wrap2">
		<div id="container">
			<div id="wrap">
			<div class="tab_menu">
				<ul><li style="float:left"><a href="/member/pay.php">이용및 요금안내</a></li><li class="on" style="float:left"><a href="/member/pay_history.php">결제내역</a></li><li style="float:left"><a href="/member/inter_list.php">관심매물</a></li>
				</ul>
			</div>
			<div class="clear"></div><br><br><div><img src="/img/member/pay_history_title.gif" alt="경매정보 결제내역"></div>
			<div class="pay_type">
				<div class="board_box" style="line-height:22px">
						<p>
						경매란 채권자가 채무자에게 지급받지 못한 자신의 채권을 회수할 목적으로 실시하는게 대부분이며, 채무자가 채무(빚) 
						을 갚을 수 없는 경우에 채권자가 이를 원인으로 법원에 경매를 신청하면 법원이 입찰을 통해 채무자의 물건을 매각한 후, 
						그 매각대금으로 채권자의 채권을 충당하는 것이 법원경매입니다.
						</p><br>		 
						<p>
						굿옥션주식회사는 법원에 신청되어 진행하는 전국의 경매물건을 검색할 수 있도록 정보를 제공하고 있습니다. 본 정보는 
						수정, 보완될 수 있으니 참고만 하시기 바라며, 실제 입찰시에는 법원입찰장에 비치된 관련자료를 반드시 확인하시기 바랍
						니다. 관련자료 미확인으로 발생하는 문제에 대해 당사는 법적 책임을 지지 않습니다. 
						</p><br>		
						<p style="padding-left:300px;color:#444"><b>이용안내 및 결제문의 : 굿옥션주식회사 070-7711-7700</b></p>
					</div>
				
				<table celspacing="0" border="0" class="tbl_sopen" summary="결제내역 리스트">
				<colgroup>
				<!--<col width="37">--><col width="100"><col width="131"><col width="110"><col width="101"><col width="101"><col width="95">
				</colgroup>
				<thead>
				<tr>
				<!--<th><span class="blind">번호</span></th>-->
				<th>지역/법원</th>
				<th>기간(월/일)</th>
				<th>결제금액</th>
				<th>결제일</th>
				<th>만료일</th>
				<th class="last">남은일수</th>
				</tr>
				</thead>
				<tbody>
					</tbody>
				</table>
				<div class="no_result">로그인을 해주세요 <br><br><a href="https://www.r114.com/?_c=Service&amp;_m=Auction&amp;_a=Agree" target="_top"><span class="btn_box_s btn_r114 bold">로그인</span></a></div></div>
			
				<div id="footer_good">
					<ul>
						<li>
							본 페이지는 굿옥션(주) <span>[대표전화: 070-7711-7700]</span>에서 제공하는 서비스입니다.<br>
							부동산<span>114(주)</span>는 본 정보와 관련하여 어떠한 법적인 책임이나 권한이 없음을 알려드립니다.
						</li>
						<li>
							굿옥션(주) &nbsp;&nbsp;<span class="clr_gray">I</span>&nbsp;&nbsp;대구 동구 동대구로 451 (신천동,5층)&nbsp;&nbsp;<span class="clr_gray">I</span>&nbsp;&nbsp; 인터넷 정보처리 장애문의 : <span>070-7711-7700</span> <br>
							공정거래위원회 고시 <span>제2000-1호</span>에 따른 사업자 등록번호 안내 : <span>514-81-62519</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 컨텐츠 끝 -->
	<!-- 라이트 시작 -->
	<div class="right_wrap"></div>
	<!-- 라이트 끝 -->
	</div>
</div>
</body>
</html>