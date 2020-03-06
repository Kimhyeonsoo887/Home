<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="member_setting.jsp" %>
<html>
<head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
*{
	font-family:Noto Sans KR, sans-serif;
}
.check_wrap .detail_price {
    width: 30%; 
    overflow: hidden;
    /* margin-top: 16px; */
    padding: 10px 15px;
    background: #f8f5e9;
}

table{
border-collapse:collapse;


}
tr{
	border-bottom: 1px solid #cccccc;
	height:50px;

	
}
#tfoot,#pageControl,.bottom{
	border-bottom:none;
		
}
tfoot{
	vertical-align:bottom;
}

button{    
	border-radius: 2px;
    color: #FFFFFF;
    background-color: #007bff;
    border-color: #FF6754;
    box-sizing: border-box;
    border: 2px solid transparent;
    text-align: center;
    display: inline-block;
    width: auto;
    height: auto;
    font-family: Nanum Gothic, sans-serif;
    /* font-weight: 700; */
    padding:5px 20px;
    font-size:16px;
    margin-right:10px;
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

/* #auctionlist{
	overflow-x: auto;
        overflow-y: auto;
       
}  */
#slide{
     /*  position:relative; */
      width: 100%;
      height:100%;
    }

    #slide li{
      /* position:absolute; */
      top:0;
      left:0;
      display:none;
      -webkit-display:block;
      list-style:none;
    }

    #slide img{
      width:400px;
      /* height: 300px; */
    }
    
    table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
<script src="/woorizib/resources/javascripts/jquery-3.4.1.min.js"></script>
<script>
/* function fn_bidGo(num){

	var url = "member_auctionPayment.mem?auc_number="+num;	//get방식 doGet() 호출
	window.open(url, "confirm", "menubar=no, width=900, height=600");
}
function fn_addInt(){
	var url = ""
}
$(document).ready(function(){
	getAuctionList(); //페이지 로딩시 댓글 목록 출력 
	getNowPrice();
});
setInterval("getAuctionList()",2000);  
setInterval("getNowPrice()",2000);
function getAuctionList(){
	
	var auc_num = '${dto.auc_number}';	
		$.ajax({
			url: '${pageContext.request.contextPath}/all_auctionLive.all',	//{컨트롤러}/이동페이지
			type:'GET',
			data:'auc_num='+auc_num,
			success:function(data){	//콜백함수
					$('#auctionlist').html(data);	//결과출력
			},
			error:function(){
				alert('오류');
			}
		});

}
function getNowPrice(){
	
	var auc_num = '${dto.auc_number}';	
	
		$.ajax({
			url: '${pageContext.request.contextPath}/all_auctionNowPrice.all',	//{컨트롤러}/이동페이지
			type:'GET',
			data:'auc_num='+auc_num,
			success:function(data){	//콜백함수
					$('#nPrice').html(data);	//결과출력
			},
			error:function(){
				alert('오류');
			}
		});
	
} */


/* imgslide(); */ //페이지가 로딩될때 함수를 실행합니다

/* function imgslide(){
  $val = $("#slide").attr("val"); //현재 이미지 번호를 가져옵니다
  $mx = $("#slide").attr("mx"); //총 이미지 개수를 가져옵니다
	$("#img"+$val).hide(); //현재 이미지를 사라지게 합니다.
	if( $val == $mx ){ $val = 1; } //현재이미지가 마지막 번호라면 1번으로 되돌립니다.
	else{ $val++; } //마지막 번호가 아니라면 카운트를 증가시켜줍니다
	$("#img"+$val).fadeIn(500); //변경된 번호의 이미지영역을 나타나게 합니다.괄호 안에 숫자는 페이드인 되는 시간을 나타냅니다.
	$("#slide").attr('val',$val); //변경된 이미지영역의 번호를 부여합니다.
	setTimeout('imgslide()',3000); //1초 뒤에 다시 함수를 호출합니다.(숫자값 1000당 1초)
} */


</script>
</head>
<body>

<%@ include file="../all_header.jsp" %>
<br><br><br><br>
	<div class="check_wrap fr">
		<table class="op_tbl_type10_1" style="width:55%" align="center">
		    <colgroup>
		    	<col style="width:40%;">
                <col style="width:30%;">
                <col style="width:30%;">
            </colgroup>
            <thead>
            	<tr><td>매물번호 : ${vo.prp_number}</td>
            		<td colspan="2">매물명 : ${vo.prp_name}</td></tr>
            	
            </thead>
		    <tbody>
		    	<tr><td rowspan="5">
				 <div>
					<img src="${images}/sellerImages/${vo.prp_title}"/>
				</div>
				
		    	</td>
		    		<td>매물번호 : ${vo.prp_number}</td><td></td>
		    	</tr>
		    	
		    	
		    	<tr>
		    		<td>주소 : ${vo.prp_address}</td><td></td>
		    	</tr>
		    	<tr>
		    		<td>매물거래유형 : ${vo.prp_termtype }</td><td></td>
		    	</tr>
		    	<tr>
		    		<td>
		    			가격:
		    			<c:if test="${vo.prp_termtype.equals('월세')}">
	            			${vo.prp_monthlycost}
		            	</c:if>
		            	
		            	<c:if test="${vo.prp_termtype.equals('전세')}">
		            		${vo.prp_leasecost}
		            	</c:if>
		            	
		            	<c:if test="${vo.prp_termtype.equals('매매')}">
		            		${vo.prp_propertycost}
		            	</c:if>
		    		</td>
		    		
		    		<td></td>
		    	</tr>
		    	<tr>
		    		<td>월세보증금: ${vo.prp_deposit }</td><td></td>
		    	</tr>
		    </tbody>
	
           
           	<tr class="bottom"><td></td><td></td>
	    	<td align="right"><Button onclick=""><span>관심물건등록 </span></Button>
			<Button onclick=""><span>구매</span></Button></td></tr>
       </table>
	</div>
	<div style="width:1050px;margin:0 auto;" >
		<div id="property" style="width:1000px;float:left;">
			<table class="type09">
				<thead>
					<tr><th colspan="2">매물정보</th></tr>
				</thead>
				<tbody>
					<tr><th>면적(전용/공급)</th><td>${vo.prp_supplyarea}</td></tr>
					<tr>
						<th>층</th>
						<td>${vo.prp_floor}</td>
					</tr>
					<tr><th>엘리베이터 여부</th><td>${vo.prp_elevator}</td></tr>
					<tr><th>주차 여부</th><td>${vo.prp_parking}</td></tr>
					<tr><th>옵션</th><td>${vo.prp_moreoption}</td></tr> 
					<tr><th>입주가능일</th><td>${vo.prp_availabledate}</td></tr>
					<tr><th>관리비</th><td>${vo.prp_maintenancecost}</td></tr>
					<tr><th>상세설명</th><td>${vo.prp_detail}</td></tr>
				</tbody>
			</table>
		</div> 
	</div>
	<br>
	<div style="width:450px; height:440px; border:1px solid black; margin-left:1000px;">	
		<%-- <img src="${images}/sellerImages/${vo.prp_title}"> --%>
		
	</div> 
</body>
</html>