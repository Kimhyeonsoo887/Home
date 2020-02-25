<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="seller_setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<body>

<%@ include file="../all_header.jsp" %>

<br><br><br><br>



<div style="width: 80%; height: 50px;" >
	
	<div style="border: 1px solid black; width: 20%; height: 50px; float:left; margin-left:50px;">
		<a onclick="load('seller_main.all')">매물등록</a>
	</div>
	
	<div style="border: 1px solid black; width: 20%; height: 50px; float:left;">
		<a onclick="load('seller_main.all')">매물수정</a>
	</div>
	
	<div style="border: 1px solid black; width: 20%; height: 50px; float:left;">
		<a>삭제</a>
	</div>
</div>


<br><br>

<div style="border-bottom:1px solid black; width: 70%; height: 60px; margin-left:50px;">
	<h1>매물수정</h1>
</div>

<br><br><br>
<div style="border-bottom:1px solid black; width: 70%; height: 30px; margin-left:50px;">
	<h3>매물정보 입력</h3>
</div>


<div> 



<div class="article">
        <form action = "" method = "">
            <table style="border-collapse: collapse" align = center>
            	
            	<tr>
            		<th>매물 공개여부</td>
            		<td>
            			<input type="checkbox" value="o"> o
            			<input type="checkbox" value="x"> x
            		</td>
            	</tr>
            	<tr>
            		<th>매물명</th>
            		<td>
            			<input type="text" placeholder="매물명">
            		</td>
            	</tr>
            	
            	
            	<tr>
            		<th>매물유형</th>
            		<td>
            			<input type="checkbox"> 경매
            			<input type="checkbox"> 일반
            		</td>
            	</tr>
            	
            	<tr>
            		<th>매물거래 유형</th>
            		<td>
            			<input type="checkbox"> 전세
            			<input type="checkbox"> 월세
            			<input type="checkbox"> 매매
            		</td>
            	</tr>
            	
            	
                <tr>
                    <th colspan="10">
                        	위치정보 
                        <span style="font-size: 2px; text-align:right;">*등기부등본 상의 주소를 입력해 주세요.</span>
                    </th>
                </tr>
                <tr>
                    <td colspan="10">
                       	 도로명, 건물명, 지번에 대해 통합검색이 가능합니다.
                    </td>               
                </tr>
                <tr>
                    <td colspan="10">
                        <input type = "text" id = "">
                        <input type="button" onclick="sample4_execDaumPostcode()" value="주소찾기">
                    </td>               
                </tr>
                <tr>
                    <td colspan="10">
                        <input type="text">
                    </td>               
                </tr>
                
                <tr>
                    <td colspan="10">
                        <input type="text">
                    </td>               
                </tr>
                
                <tr>
                    <td colspan="10">
                        <input type="text" placeholder="상세주소">
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
            		<select>
            			<option>원룸</option>
            			<option>투룸</option>
            			<option>아파트</option>
            			<option>오피스텔</option>
            		</select>
            	</td>
            </tr>
            <tr>
            	<th>월세 보증금</th>
            	<td><input type="text" placeholder="월세 보증금"></td>
            </tr>
            
            <tr>
            	<th>월세가격</th>
            	<td><input type="text" placeholder="월세가격"></td>
            </tr>
            
            <tr>
            	<th>전세가격</th>
            	<td><input type="text" placeholder="전세가격"></td>
            </tr>
            
            <tr>
            	<th>매매가격</th>
            	<td><input type="text" placeholder="매매가격"></td>
            </tr>
            
            <tr>
            	<th>입주가능일</th>
            	<td><input type="date"></td>
            </tr>
            
            <tr>
            	<th>관리비</th>
            	<td>
            		<input type="text">
            	</td>
            </tr>
            <tr>
                <th rowspan="2">
                 	   건물 크기<br>
                    (1P = 3.3058㎡)
                </th>
                <td>
                   	 공급 면적
                    <input input = "text" name = "">평
                    <input input = "text" name = "">㎡
                </td>
            </tr>
            <tr>
                <td>
                   	 전역 면적
                    <input input = "text" name = "">평
                    <input input = "text" name = "">㎡
                </td>
            </tr>
            <tr>
                <th rowspan="2">
                    	건물 층수
                </th>
                <td>
                    	건물 층수
                    <select name = "" >
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
                    <select name = "" >
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
            <tr>
                <th>
                    	난방 종류
                </th>
                <td>
                    <select name = "" >
                        <option value = "" selected>난방 종류 선택</option>
                        <option value = "" >중앙 난방</option>
                        <option value = "" >지역 난방</option>
                        <option value = "" >개별 난방</option>
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
         		<th>매물 엘리베이터 여부</th>
         		<td>
         			<input type="checkbox" value="o"> o
         			<input type="checkbox" value="x"> x
         		</td>
         	</tr>
         
         
        	 <tr>
         		<th>매물 주차 여부</th>
         		<td>
         			<input type="checkbox" value="o"> o
         			<input type="checkbox" value="x"> x
         		</td>
         	</tr>
         	
         	
         	
             <tr>
                 <th >
                   	  사진 등록
                 </th>
                 
                 <td>
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
             		<textarea rows="10" cols="60"></textarea>
             	</td>
             
             </tr>
         </table>
     </form>
     
     <br><br>
     
     
     <div style="width:20%; height:100px; margin:0 auto;">
     	<input style="width: 100px; height: 50px" type="submit" value="수정">
     	<button style="width: 100px; height: 50px" onclick="window.history.back();">취소</button>
     </div>
     
    </div> 

</div>

 <div id="result">
</div>
</body>
</html>