<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="seller_setting.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>경매 매물 수정페이지</title>
		<!--css-->
        <link href="${styles}/1_sellerpage/css/seller_auctionRegister.css" rel="stylesheet" type="text/css">
        <!--javascript-->
        <script src="${javascripts}/seller_auctionModify.js"></script>
	</head>
	<body>
    <body onload="drawHtml('${dto.auc_state}','${dto.auc_paymethod}');">
<!--         
		<nav>
            <ul>
                <li><a onclick="load('auctionMain');">경매매물 정보등록</a></li>
                <li><a onclick="load('auctionResult');">경매매물 정보수정</a></li>
                <li><a onclick="">경매 조회</a></li> 
            </ul>
        </nav> 
-->
        <h2>경매 매물 수정페이지</h2>
        
        <div class="article">
<!------------------------------------------------------------------------------------------------------------>  
        <form action = "seller_auctionModifyPro.sel?${_csrf.parameterName}=${_csrf.token}" method = "post"> 
	        	<input type="hidden" name="prp_number" value="${dto.prp_number}"/>
	            <table style="border-collapse: collapse" align = center>
	                <tr>
	                    <td>
							경매명 
	                    </td>
	                    <td>
	                        <input type = "text" value = "${dto.auc_name}" id = "auc_name" name = "auc_name" maxlength="20" required />
	                    </td>
	                </tr>
	                <tr>
	                    <td>
							경매상태
	                    </td>
	                    <td>
	                        <select name = "auc_state" id = "auc_state">
	                            <option value = "경매">	경매</option>
	                            <option value = "종료"> 	종료</option>
	                        </select>
	                    </td>
	                </tr>
	                <tr>                 
	                    <td>
	                        	최저입찰가
	                    </td>
	                    <td>    
	                        <input type = "number" name = "auc_minbid" id = "auc_minbid" value = "${dto.auc_minbid}" >원
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                        	개찰일
	                    </td>
	                    <td>
	                    	기존개찰일 : ${dto.auc_opendate}<br>
	                        <input type = "datetime-local" value = "${dto.auc_opendate}" name = "auc_opendate" id = "auc_opendate" required>
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                        	대금납부방식
	                    </td>
	                    <td>
	                        <select name = "auc_paymethod" id = "auc_paymethod" value = "${dto.auc_paymethod}" >
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
	                    	기존납부기간  : ${dto.auc_paydate}<br>
	                        <input type = "date" name = "auc_paydate" id = "auc_paydate" required>
	                    </td>
	                </tr> 
	                <tr>
	                    <td>
	                        	입찰시작시간
	                    </td>
	                    <td>
	                    	기존 입찰시작시간 : ${dto.auc_starttime}<br>
	                        <input type = "datetime-local" name = "auc_starttime" id = "auc_starttime" required>
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                        	입찰마감시간
	                    </td>
	                    <td>
	                    	기존 입찰마김시간 : ${dto.auc_endtime}<br>
	                        <input type = "datetime-local" name = "auc_endtime" id = "auc_endtime" required >
	                    </td>
	                </tr>
	            </table>
	            <input type = "submit" name = "" value = "수정하기">
		</form>
<!------------------------------------------------------------------------------------------------------------>        
        </div>
	</body>
</html>