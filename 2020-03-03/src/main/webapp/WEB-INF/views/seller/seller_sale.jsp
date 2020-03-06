<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="seller_setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
li{
	list-style-type: none;
}
</style>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="${styles}/1_sellerpage/bootstrap3/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${styles}/1_sellerpage/bootstrap3/css/sb-admin-2.min.css" rel="stylesheet">
    
</head>

<script src="${javascripts}/request.js"></script>
<script type="text/javascript">
	function load(url) {
		//서버로 요청해서 통신한 후 응답을 callback 함수로 받겠다.
		//sendRequest(callback, url, method, params)
		//news1.jsp ,news2.jsp ,news3.jsp -> 콜백함수로 리턴
		sendRequest(loadNews_callback, url, "post");
	}

	//콜백함수
	function loadNews_callback() {
		var result = document.getElementById("result"); //div이름

		if (httpRequest.readyState == 4) {//4: completed => 전체 데이터가 취득완료된 상태
			if (httpRequest.status == 200) { //정상 종료
				result.innerHTML = httpRequest.responseText;
				//응답결과가 html이면 responseText로 받고, XML이면 responseXML로 받는다.
				//result.innerHTML = httpRequest.responseText;

			} else {
				result.innerHTML = "에러발생";

			}
		}
	}
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function addressSearch(){
	new daum.Postcode({
	    oncomplete: function(data) {
	    	
	    	 var addr = ''; // 주소 변수
             var extraAddr = ''; // 참고항목 변수

             //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                 addr = data.roadAddress;
             } else { // 사용자가 지번 주소를 선택했을 경우(J)
                 addr = data.jibunAddress;
             }

             // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
             if(data.userSelectedType === 'R'){
                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                     extraAddr += data.bname;
                 }
                 // 건물명이 있고, 공동주택일 경우 추가한다.
                 if(data.buildingName !== '' && data.apartment === 'Y'){
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                 if(extraAddr !== ''){
                     extraAddr = ' (' + extraAddr + ')';
                 }
            
             } 
            
             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById('postcode').value = data.zonecode;
             document.getElementById("roadAddress").value = addr;
             // 커서를 상세주소 필드로 이동한다.
             //document.getElementById("jibunAddress").focus();

	    }
	}).open();
}
</script>
  
  
<body>
<div id="result">
<%@include file="util_sidebar.jsp" %>


<!-- <div style="width: 80%; height: 50px;" >
	
	<div style="border: 1px solid black; width: 20%; height: 50px; float:left; margin-left:50px;">
		<a onclick="load('seller_sale.all')">매물등록</a>
	</div>
	
	<div style="border: 1px solid black; width: 20%; height: 50px; float:left;">
		<a onclick="load('seller_modifyView.all')">매물수정/삭제</a>
	</div>
</div> -->


<br><br>



<div style="border-bottom:1px solid black; width: 70%; height: 60px; margin-left:50px;">
	<h1>매물등록</h1>
</div>

<br><br><br>
<div style="border-bottom:1px solid black; width: 70%; height: 30px; margin-left:50px;">
	<h3>매물정보 입력</h3>
</div>


<div>


 
<div class="article">
        <form action = "sellerSalePro.sel?${_csrf.parameterName}=${_csrf.token}" method = "post" enctype="multipart/form-data">
        <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
            <table style="border-collapse: collapse" align = center>
            	<tr>
            		<th>매물 공개여부</th>
            		<td>
            			<input type="checkbox" name="prp_accessibility" value="o"> o
            			<input type="checkbox" name="prp_accessibility" value="x"> x
            		</td>
            	</tr>
            	<tr>
            		<th>매물명</th>
            		<td>
            			<input type="text" name="prp_name" placeholder="매물명">
            		</td>
            	</tr>
            	
            	
            	<tr>
            		<th>매물유형</th>
            		<td>
            			<input type="checkbox" name="prp_selltype" value="경매"> 경매
            			<input type="checkbox" name="prp_selltype" value="일반"> 일반
            		</td>      
            	</tr>
            	
            	<tr>
            		<th>매물거래 유형</th>
            		<td>
            			<input type="checkbox" name="prp_termtype" value="전세"> 전세
            			<input type="checkbox" name="prp_termtype" value="월세"> 월세
            			<input type="checkbox" name="prp_termtype" value="매매"> 매매
            		</td>
            	</tr>
            	
            	
                <tr>
                    <th>
                        	위치정보 
                        <span style="font-size: 2px; text-align:right;">*등기부등본 상의 주소를 입력해 주세요.</span>
                    </th>
                </tr>
                <tr>
                    <td>
                       	 도로명, 건물명, 지번에 대해 통합검색이 가능합니다.
                    </td>               
                </tr>
                
                <tr>
                	<td>
                		<input type="text" name="postcode" id="postcode" placeholder="우편번호">
						<input type="button" onclick="addressSearch()" value="우편번호 찾기"><br>
						<input type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소">
						<!-- <input type="text" id="jibunAddress" placeholder="지번주소"> -->
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
                	</td>
                </tr>
	          
               
    
        
      <!--   <div style="border-bottom:1px solid black; width: 70%; height: 30px; margin-left:50px;">
        	<h3>기본정보</h3>
        </div> -->
            
            <tr>
            	<th>매물종류</th>
            	<td>
            		<select name="prp_type">
            			<option value="원룸">원룸</option>
            			<option value="투룸">투룸</option>
            			<option value="아파트">아파트</option>
            			<option value="오피스텔">오피스텔</option>
            		</select>
            	</td>
            </tr>
            <tr>
            	<th>월세 보증금</th>
            	<td><input type="text" name="prp_deposit" placeholder="월세 보증금"></td>
            </tr>
            
            <tr>
            	<th>월세가격</th>
            	<td><input type="text" name="prp_monthlycost" placeholder="월세가격"></td>
            </tr>
            
            <tr>
            	<th>전세가격</th>
            	<td><input type="text" name="prp_leasecost" placeholder="전세가격"></td>
            </tr>
            
            <tr>
            	<th>매매가격</th>
            	<td><input type="text" name="prp_propertycost" placeholder="매매가격"></td>
            </tr>
            
            <tr>
            	<th>입주가능일</th>
            	<td><input type="date" name="prp_availabledate"></td>
            </tr>
            
            <tr>
            	<th>관리비</th>
            	<td>
            		<input type="text" name="prp_maintenancecost">
            	</td>
            </tr>
            <tr>
                <th rowspan="2">
                 	   건물 크기<br>
                    (1P = 3.3058㎡)
                </th>
                <td>
                   	 공급 면적
                    <input input = "text" name = "prp_supplyarea1">평
                    <input input = "text" name = "prp_supplyarea2">㎡
                </td>
            </tr>
            <tr>
                <td>
                   	 전역 면적
                    <input input = "text" name = "prp_dedicatedarea1">평
                    <input input = "text" name = "prp_dedicatedarea2">㎡
                </td>
            </tr>
            <tr>
                <th rowspan="2">
                    	건물 층수
                </th>
                <td>
                    	건물 층수
                    <select name = "prp_maxfloor" >
                        <option value = "select" selected>건물 층수 선택</option>
                        <option value = "1층">1층</option>
                        <option value = "2층">2층</option>
                        <option value = "3층">3층</option>
                        <option value = "4층">4층</option>
                        <option value = "5층">5층</option>
                        <option value = "6층">6층</option>
                        <option value = "7층">7층</option>
                        <option value = "8층">8층</option>
                        <option value = "9층">9층</option>
                        <option value = "10층">10층</option>
                        <option value = "other">other</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    	해당 층수
                    <select name = "prp_floor" >
                        <option value = "select" selected>건물 층수 선택</option>
                        <option value = "반지하" >반지하</option>
                        <option value = "옥탑" >옥탑</option>
                        <option value = "1층">1층</option>
                        <option value = "2층">2층</option>
                        <option value = "3층">3층</option>
                        <option value = "4층">4층</option>
                        <option value = "5층">5층</option>
                        <option value = "6층">6층</option>
                        <option value = "7층">7층</option>
                        <option value = "8층">8층</option>
                        <option value = "9층">9층</option>
                        <option value = "10층">10층</option>
                        <option value = "other">other</option>
                    </select>
                </td>
            </tr>
         
       
        
       <!--  <div style="border-bottom:1px solid black; width: 70%; height: 30px; margin-left:50px;">
        	<h3>추가정보</h3>
        </div>
        <br><br> -->
        
        
         
         	<tr>
         		<th>매물 추가 옵션</th>
         		<td><input type="text" name="prp_moreoption" placeholder="매물추가옵션"></td>
         	</tr>
         	<tr>
         		<th>매물 엘리베이터 여부</th>
         		<td>
         			<input type="checkbox" name="prp_elevator" value="o"> o
         			<input type="checkbox" name="prp_elevator" value="x"> x
         		</td>
         	</tr>
         
         
        	 <tr>
         		<th>매물 주차 여부</th>
         		<td>
         			<input type="checkbox" name="prp_parking" value="o"> o
         			<input type="checkbox" name="prp_parking" value="x"> x
         		</td>
         	</tr>
         	
         	
         	
             <tr>
                 <th>
                   	  사진 등록
                 </th>
                 
                 <td>
                 	매물대표이미지<input type='file' name = "picTitle"/><br>
		                        사진1<input type='file' name = "pic1"/><br>
		                        사진2<input type='file' name = "pic2"/><br>
		                        사진3<input type='file' name = "pic3"/><br>
		                        사진4<input type='file' name = "pic4"/><br>
		                        사진5<input type='file' name = "pic5"/><br>
                 </td>
             </tr>
             
             <tr>
             	<th>상세설명</th>
             	<td>
             		<textarea rows="10" cols="60" name="prp_detail"></textarea>
             	</td>
             
             </tr>
         
         <tr>
         	<td colspan="2">
         	 <div style="width:20%; height:100px; margin:0 auto;">
	     	<input style="width: 100px; height: 50px" type="submit" value="등록">
	     	<button style="width: 100px; height: 50px" onclick="window.history.back();">취소</button>
  	     	 </div>
  	     	 </td>
         </tr>
         
  	      
        </table>
     </form>
     
     <br><br>
     
     
    
     
    </div> 

</div>



</div>


<!-- Bootstrap core JavaScript-->
  <script src="${styles}/1_sellerpage/bootstrap3/vendor/jquery/jquery.min.js"></script>
  <script src="${styles}/1_sellerpage/bootstrap3/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${styles}/1_sellerpage/bootstrap3/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${styles}/1_sellerpage/bootstrap3/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="${styles}/1_sellerpage/bootstrap3/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${styles}/1_sellerpage/bootstrap3/js/demo/chart-area-demo.js"></script>
  <script src="${styles}/1_sellerpage/bootstrap3/js/demo/chart-pie-demo.js"></script>
  
  
</body>
</html>