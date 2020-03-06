<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "all_setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name = "viewport" content = "width=device-width, initial-scale = 1">
<title>footer</title>
</head>
<body>
 	<footer>
        <div></div>
        <div class="shopping_info">
           <p style="font-size: 1.0em;font-weight: bold">SHOPPING INFO</p>
           <br>
            <table>
                <tr>
                    <th colspan = "2" align = "left" style = "color: darkred; font-size: 1.5em;">1600-3910</th>
                </tr>
                <tr>
                    <td colspan = "2" align = "left">OPENING: 10:00 AM - 5:00 PM</td>
                </tr>
                <tr>
                    <td colspan = "2" align = "left">LUNCH: 12:00 PM - 1:00 PM</td>
                </tr>
                <tr>
                    <td style ="color: darkred;">BANK</td>
                    <td>우리 1005-503-377583</td>
                </tr>
                <tr>
                    <td style ="color: darkred;">ACCOUNT</td>
                    <td>국민 194637-04-004264</td>
                </tr>
                <tr>
                    <td style = "font-size : 0.7em;">(주)허드슨엔비올라</td>
                    <td>농협 301-0196-3581-51</td>
                </tr>
            </table>
        </div>
        <div class="menu">
          <p style="font-size: 1.0em;font-weight: bold">SHOPPING INFO</p><br>
            <table>
                <tr>
                    <td><a href = "agreement1.lo">이용약관</a></td>
                </tr>
                <tr>
                    <td><a href = "agreement2.lo" style="font-weight: bold">개인정보취급방침</a></td>
                </tr>
                <tr>
                    <td><a href = "agreement3.lo">이용안내</a></td>
                </tr>
            </table>
        </div>
        <div class="menu">
           <p style="font-size: 1.0em;font-weight: bold">COMMUNITY</p><br> 
               <table>
                <tr>
                    <td><a href = "boardList.lo?kind=notice">공지사항</a></td>
                </tr>
                <tr>
                    <td><a href = "boardList.lo?kind=QnA" >QnA</a></td>
                </tr>
                <tr>
                    <td><a href = "boardList.lo?kind=review">REVIEW</a></td>
                </tr>
            </table>
        </div>
        <div class="company_info">
           <p style="font-size: 1.0em; font-weight: bold">COMPANY INFO</p><br> 
            <pre style="font-size: 0.8em;">
(주)허드슨앤비올라 l 대표 : 이형석 l 고객센터 : 1600-3910 l 이메일 : hudsonviola@naver.com
소재지 : 경기도 고양시 일산동구 장항동 742번지 한라밀라트III A-404
사업자 등록번호 안내 : 561-86-00019 [사업자정보확인] l 통신판매업 신고 : 2015-고양일산동-0256
개인정보관리책임자 : 이형석 (hudsonviola@naver.com)

Copyright © 2010 RUMOURS All rights reserved.
            </pre>
        </div>
        <div class="copyright">
            <ul>
                <li><img src ="${project}images/copyright.gif"></li>
                <li><img src = "${project}images/copyright2.png"></li>
                <li><img src = "${project}images/copyright3.gif"></li>
                <li><img src = "${project}images/copyright4.jpg"></li>
                <li><img src = "${project}images/copyright5.gif"></li>
            </ul>
        </div>
    </footer>
</body>
</html>