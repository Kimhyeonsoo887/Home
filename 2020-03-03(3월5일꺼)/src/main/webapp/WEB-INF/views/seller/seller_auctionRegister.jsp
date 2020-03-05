<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="seller_setting.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>경매 매물 등록페이지</title>
		<!--css-->
        <link href="${styles}/1_sellerpage/css/seller_auctionRegister.css" rel="stylesheet" type="text/css">
        <!--javascript-->
        <script src="${javascripts}/seller_auctionRegister.js"></script>
	</head>
    <body onload="drawHtml();">
        <h2>경매 매물 정보 등록</h2>
    	<div class="article">
	        <form action 	= "seller_auctionRegisterPro.sel?${_csrf.parameterName}=${_csrf.token}" 
	              method 	= "post" 
	              onsubmit	= "" >
	        	 <input type="hidden" name="prp_number" value="${prp_number}"/>
<!---------------------------------------------------------------------------------------------------------------------------------->
	           <table style="border-collapse: collapse" align = center>
	                <tr>
	                    <td>
	                        	경매등록이름 
	                    </td>
	                    <td>
	                        <input type = "text" id = "auc_name" name = "auc_name" maxlength="20" required />
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                       	 경매상태
	                    </td>
	                    <td>
	                    	<!-- 낙찰 / 유찰  / 낙찰  -->
	                        <select name = "auc_state" id = "auc_state">
	                            <option value = "경매" selected>	경매</option>
	                            <option value = "종료">			종료</option>
	                        </select>
	                    </td>
	                </tr>
	                <tr>                 
	                    <td>
	                        	최저입찰가
	                    </td>
	                    <td>    
	                                                            <!-- NUMBER(12) -->
	                                                            <!-- min, max으로는 체크가 제대로 되지않아요!-->
	                                                            <!-- submit할때 체크합니다.-->
	                        <input type = "number" name = "auc_minbid" id = "auc_minbid" value = "1" >원
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                        	개찰일
	                    </td>
	                    <td>
	                        <input type = "datetime-local" name = "auc_opendate" id = "auc_opendate">
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                        	대금납부방식
	                    </td>
	                    <td>
	                        <select name = "auc_paymethod" id = "auc_paymethod" >
	                            <option value = "cash" selected>    현금</option>
	                            <option value = "account_transfer"> 계좌이체</option>
	                            <option value = "credit_card">      카드결제</option>
	                            <option value = "cashiers_check">   자기앞수표</option>
	                        </select>
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                        	대금납부기간
	                    </td>
	                    <td>
	                        <!-- TIMESTAMP 최소 입찰마감시간 오늘 하루 이후부터 최대 60일 까지 납부하도록 설정 -->
	                        <!-- min 속성은 경매가 종료된 날짜으로 설정한다. -->
	                        <!-- submit버튼을 클릭할 경우, min날짜로부터 60일이 초과하는지 체크합니다.-->
	                        <input type = "date" name = "auc_paydate" id = "auc_paydate" min="2020-01-01" max = "">
	                    </td>
	                </tr> 
	                <tr>
	                    <td>
	                        	입찰시작시간
	                    </td>
	                    <td>
	                        <input type = "datetime-local" name = "auc_starttime" id = "auc_starttime">
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                        	입찰마감시간
	                    </td>
	                    <td>
	                        <input type = "datetime-local" name = "auc_endtime" id = "auc_endtime" min="" max = "">
	                    </td>
	                </tr>
	            </table>
				<input type = "submit" name = "" value = "등록">
<!---------------------------------------------------------------------------------------------------------------------------------->
    		</form>
		</div>
	</body>
</html>