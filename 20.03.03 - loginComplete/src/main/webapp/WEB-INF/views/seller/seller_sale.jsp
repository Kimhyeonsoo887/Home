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
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
  
  
<body>
<div id="result">
<%@include file="util_sidebar.jsp" %>





<div style="width: 80%; height: 50px;" >
	
	<div style="border: 1px solid black; width: 20%; height: 50px; float:left; margin-left:50px;">
		<a onclick="load('seller_sale.all')">매물등록</a>
	</div>
	
	<div style="border: 1px solid black; width: 20%; height: 50px; float:left;">
		<a onclick="load('seller_modifyView.all')">매물수정/삭제</a>
	</div>
</div>


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
        <form action = "seller_sale_Pro.all?${_csrf.parameterName} = ${_csrf.token}" method = "post">
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
                		<input type="text" id="postcode" placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="roadAddress" placeholder="도로명주소">
						<input type="text" id="jibunAddress" placeholder="지번주소">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="detailAddress" placeholder="상세주소">
                	</td>
                </tr>
	          
               
        </table>
    
        
        <div style="border-bottom:1px solid black; width: 70%; height: 30px; margin-left:50px;">
        	<h3>기본정보</h3>
        </div>
        <table style="border-collapse: collapse" align = center>
            
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
         
        </table>
       
        
        <div style="border-bottom:1px solid black; width: 70%; height: 30px; margin-left:50px;">
        	<h3>추가정보</h3>
        </div>
        <br><br>
        
        
         <table style="border-collapse: collapse" align = center>
         
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
                 	매물대표이미지<input type='file' name = "prp_mainimage"/><br>
		                        사진1<input type='file' name = "prp_image1"/><br>
		                        사진2<input type='file' name = "prp_image2"/><br>
		                        사진3<input type='file' name = "prp_image3"/><br>
		                        사진4<input type='file' name = "prp_image4"/><br>
		                        사진5<input type='file' name = "prp_image5"/><br>
                 </td>
             </tr>
             
             <tr>
             	<th>상세설명</th>
             	<td>
             		<textarea rows="10" cols="60" name="prp_detail"></textarea>
             	</td>
             
             </tr>
         </table>
         
          <div style="width:20%; height:100px; margin:0 auto;">
	     	<input style="width: 100px; height: 50px" type="submit" value="등록">
	     	<button style="width: 100px; height: 50px" onclick="window.history.back();">취소</button>
  	      </div>
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