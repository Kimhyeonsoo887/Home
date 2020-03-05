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
div.editorDetail {
    overflow-y: auto;
    padding: 0px;
    display: inline-block!important;
    width: 100%;
    height: 200px;
    font-size: 13px;
    line-height: 1.6;
}
.ar {
    text-align: right !important;
}
#Contents {
    float: right;
    width: 750px;
    min-height: 611px;
}
.cm_box_04 {
    padding: 7px 10px;
    background: #f4f4f4;
    word-break: break-all;
}
.cm_btn_b_o, .cm_btn_b_o *,.cm_btn_b_f {
    cursor: pointer;
    background-color: #8799FF;
    color: #fff;
    font-size: 14px;
    font-weight: bold;
    line-height: 14px;
    vertical-align: middle;
    text-align: center;
    padding:10px 10px;
}
#payment{
	width:50%;
	margin:0 auto;
}
</style>
<script>
function fn_cancel(){
	
	self.close();
}

function calculationtest(){

	bidprice = parseInt(test.bidprice.value);
 			
 			
 	test.total1.value = bidprice*0.1;
 			
}
function checkPrice(nPrice){
	
	if(document.auctionform.lac_tender.value<=nPrice){
		alert("현재최고가보다 높은 금액으로 입찰에 참가해주세요");
		return false;
	}
}

</script>
<body>
	
	<div class="op_bid_twrap">
		<form name="auctionform" action="member_auctionpayPro.mem" onsubmit="return checkPrice('${nowPrice}');">
			<input type = "hidden" name = "auc_number" value = "${auc_number}">	
			<input type = "hidden" name = "nowPrice" value = "${nowPrice}">	
			<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}">
			
				<table class="op_tbl_type13" align="center" style="width:50%">
				    <caption>입찰금액 및 보증금 납부 방식 선택 </caption>
				    <colgroup>
		                <col style="width:130px;">
		                <col style="width:*;">
		            </colgroup>
					<tbody>
						<tr id="commonBid_2">
								<th scope="row">입찰방법</th>
								<td>
									<p>
										<input type="checkbox" id="bddr1DvsnCd1_1" name="bddr1DvsnCd1_1" class="" value="0009" checked="checked">
										<label for="bddr1DvsnCd1_1" class="w80">본인입찰</label>

									</p>
								</td>
							</tr>

						<tr>
							<th scope="row">
	                    			현재최고가
							</th>
		                    <td>
		                    	${nowPrice}
		                    </td>
						</tr>
						
						<tr>
							<th scope="row">
										입찰금액
							</th>
							<td>
								<p>
									<input type="text" name="lac_tender" title="입찰금액을 입력해 주시기 바랍니다." style="width:140px;" value="" maxlength="19">
									<span class="">원</span>
									
								 </p>
								
							</td>
						</tr>
					<!-- 	<tr>
							<th scope="row" class="bg_color02">보증금액</th>
							<td class="bg_color02">
								<p class="cm_txt_dot03">
								<span class="tpoint_06" id="tdpsRtCalMsg">
														'입찰금액X입찰보증금율(입찰금액의 10%)'
								</span>
								로 계산됩니다. <br>
								보증금액은   <input type='text' name='total1' size='7'  readonly>원
								</p>
								
							</td>
						</tr> -->
					
						<tr id="idGrtMonyPymtMtdCd">
							<th scope="row">입찰금 납부방식</th>
							<td>
							<p class="fl">
								<input type="radio" id="grtMonyPymtMtdCd1" name="grtMonyPymtMtdCd" class="" value="0001" checked="checked">
								<label for="grtMonyPymtMtdCd1" class="w80">현금</label>
								<input type="radio" id="grtMonyPymtMtdCd2" name="grtMonyPymtMtdCd" value="0002">
								<label for="grtMonyPymtMtdCd2" class="w80">카카오페이</label>
							</p>
							<!-- <div class="fr al">
      							
								<select title="보증금 납부방식 선택" id="guarantee" name="guarantee" class="ml_2" style="width:362px;" disabled="disabled">
									<option value="">선택</option>
									
								</select>
								<br>
								<p id="guarantee_area"></p>
							</div> -->
							</td>
						</tr>
					
						<tr id="rfdAcntNoView_area">
							<th scope="row"><div class="th_inner">환불계좌
								
							</div></th>
							<td>
								<div id="rfdAcnt_area">
									<select name="bank">
										<option value="shinhan">신한은행</option>
										<option value="">국민은행</option>
									</select>
									<input type="text" name="rfdAcnt" placeholder="계좌번호">
								</div>

								
							</td>
						</tr>
						
					</tbody>
					<tfoot>
					<tr><td colspan="2" align="center"><button>결제완료</button></td></tr>
					
				</table>
			
				
			</form>
			</div>
			
</body>
</html>