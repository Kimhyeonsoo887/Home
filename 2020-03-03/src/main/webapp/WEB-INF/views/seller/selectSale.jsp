<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="seller_setting.jsp" %>
<html>
<head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
*{
   font-family:Noto Sans KR, sans-serif;
}
.check_wrap .detail_price {
    width: 395px;
    overflow: hidden;
    margin-top: 16px;
    padding: 10px 15px;
    background: #f8f5e9;
}
.op_btn_detail .btn_dtl_04 {
    background: url(/images/op_btn/op_btn_detail.png) no-repeat 0 -135px;
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
#property{}
#auctionlist{float:right;} 
</style>

<style>
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


<!-- <script src="/woorizib/resources/javascripts/jquery-3.4.1.min.js"></script>
<script>
function fn_bidGo(num){
   //id값 미입력시
   /* if(!document.signInform.id.value){
      alert(msg_id);
      document.signInform.id.focus();
      return false;
   } */
   var url = "auctionPayment?auc_number="+num;   //get방식 doGet() 호출
   window.open(url, "confirm", "menubar=no, width=900, height=600");
}
$(document).ready(function(){
   getAuctionList(); //페이지 로딩시 댓글 목록 출력 
});
setInterval("getAuctionList()",100000);  
//setInterval("getAuctionList()",3000);
function getAuctionList(){
   
   var keyword = '${dto.auc_number}';   //입력한 키워드
   
   /* if(keyword.length==0){   //글자수가 0인 경우
      $('#commentList').css("visibility","hidden");   //숨김
   } else{
      $('#commentList').css("visibility","visible");   //표시
        */
      /* result -> 컨트롤러/search_next.jsp(서비스,DAO,매퍼), search_next.jsp-> data -> 콜백함수 ->display */
      $.ajax({
         url: '${pageContext.request.contextPath}/auctionLive.all',   //{컨트롤러}/이동페이지
         type:'GET',
         data:'keyword='+keyword,
         success:function(data){   //콜백함수
               $('#auctionlist').html(data);   //결과출력
         },
         error:function(){
            alert('오류');
         }
      });
   /* } */ 
}
/* $(function(){
   
   var keyword = '${dto.auc_number}';   //입력한 키워드
   alert(keyword);
   /* if(keyword.length==0){   //글자수가 0인 경우
      $('#commentList').css("visibility","hidden");   //숨김
   } else{
      $('#commentList').css("visibility","visible");   //표시
        */
      /* result -> 컨트롤러/search_next.jsp(서비스,DAO,매퍼), search_next.jsp-> data -> 콜백함수 ->display 
      $.ajax({
         url: '${pageContext.request.contextPath}/auctionLive.all',   //{컨트롤러}/이동페이지
         type:'POST',
         data:'keyword='+keyword,
         success:function(data){   //콜백함수
               $('#auctionlist').html(data);   //결과출력
         },
         error:function(){
            alert('오류');
         }
      });
    } 

}); */
</script> -->
</head>
<body>

<br><br>
  <div class="check_wrap fr">
      <table class="op_tbl_type10_1" style="width:55%" align="center">
          <colgroup>
             <col style="width:40%;">
                <col style="width:30%;">
                <col style="width:30%;">
            </colgroup>
           
          <tbody>
             <tr><td rowspan="5"><img style="width: 200px; height: 300px;" src="${images}/sellerImages/${vo.prp_title}"></td>
                <td>매물명</td><td>${vo.prp_name}</td>
             </tr>
            <tr>
            	<td>가격</td>
            	<c:if test="${vo.prp_termtype.equals('월세')}">
            		<td>${vo.prp_monthlycost}</td>
            	</c:if>
            	
            	<c:if test="${vo.prp_termtype.equals('전세')}">
            		<td>${vo.prp_leasecost}</td>
            	</c:if>
            	
            	<c:if test="${vo.prp_termtype.equals('매매')}">
            		<td>${vo.prp_propertycost}</td>
            	</c:if>
            </tr>
          </tbody>
      </table>
	</div>
   
   <div id="property" style="width:500px; margin:0 auto;">
   <table class="type09">
   <thead>
      <tr><th colspan="2">매물정보</th></tr>
   </thead>
	   <tbody>
	      <tr><th>매물명</th><td>${vo.prp_name }</td></tr>
	      <tr><th>주소</th><td>${vo.prp_address}</td></tr>
	      <tr><th>면적(전용/공급)</th><td>${vo.prp_dedicatedarea}/${vo.prp_supplyarea}</td></tr>
	      <tr><th>층</th><td>${vo.prp_floor}/${vo.prp_maxfloor}</td></tr>
	      <tr><th>구조</th><td>${vo.prp_type}</td></tr>
	      <tr><th>엘리베이터</th><td>${vo.prp_elevator}</td></tr>
	      <tr><th>주차</th><td>${vo.prp_parking}</td></tr>
	      <tr><th>옵션</th><td>${vo.prp_moreoption}</td></tr>
	      <tr><th>입주가능일</th><td>${vo.prp_availabledate}</td></tr>
	      <tr><th>관리비</th><td>${vo.prp_maintenancecost}</td></tr>
	      <tr><th>상세설명</th><td>${vo.prp_detail}</td></tr>
	      <tr><td colspan="2"><input type="button" value="확인" onclick="self.close();"></td></tr>
	      <c:if test="${vo.prp_selltype.equals('경매') }"> 
	      	<tr><td><input type="button" value="경매등록" onclick="window.location='seller_auctionRegister.sel?prp_number=${vo.prp_number}'"></td></tr>
	      </c:if>
	   </tbody>
	</table>
   </div> 
   
  
</body>
</html>