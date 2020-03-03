<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>actionModify</title>
	</head>
	<body>
	
    <h2>경매 매물 정보 수정</h2>
        
    <div class="article">
        <form action = "" method = "">
            <table style="border-collapse: collapse" align = center>
                <tr>
                    <td colspan="10">
                        위치정보 
                        <span style="font-size: 2px; text-align:right;">*등기부등본 상의 주소를 입력해 주세요.</span>
                    </td>
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
                        <div>
                            <p>
                                <span>도로명 : </span>
                                도로명은 여기에 들어가요
                            </p>
                            <p>
                                <span>지번 : </span>
                                지번번호는 여기로 들어가요
                            </p>
                        </div>
                    </td>               
                </tr>
                <tr>
                    <td colspan="10">
                        <input type = "" placeholder="예)101동"><span style="font-size: 10px; padding:3px; border:gray solid 1px;">동</span>
                        <input type = "" placeholder="예)201호"><span style="font-size: 10px; padding:3px; border:gray solid 1px;">호</span>
                        <br><input type = "checkbox" id = "not_infoDong"><label for = "not_infoDong">등복에 동장보가 없는 경우 선택해 주세요</label>
                    </td>               
                </tr>
        </table>
    
        <br>
        <br>
        <br>
        
        <table style="border-collapse: collapse" align = center>
            <tr>
                <td colspan="2">
                    기본 정보
                </td>
            </tr>
            <tr>
                <td rowspan="2">
                    건물 크기<br>
                    (1P = 3.3058㎡)
                </td>
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
                <td rowspan="2">
                    건물 층수
                </td>
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
                <td>
                    난방 종류
                </td>
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
        
        <br>
        <br>
        <br>
        
        <table style="border-collapse: collapse" align = center>
            <tr>
                <td colspan="2">
                    추가정보
                </td>
            </tr>
            <tr>
                <td rowspan="2">
                    관리비
                </td>
                <td>
                    <input type = "text">만원
                    <input type = "checkbox"> 관리비 없음
                    <div class="styled__Text-sc-1u6ustj-11 gJfWiJ">
                        <svg width="18" height="18" viewBox="0 0 18 18">
                            <g fill="none" fill-rule="evenodd">
                                <circle cx="9" cy="9" r="9" fill="#E6E7EA"></circle>
                                    <path fill="#9C9EA3" d="M8.997 13.5a.75.75 0 1 1 0-1.5.75.75 0 0 1 0 1.5zm.01-2.499c-.634 0-.75-5.449-.75-6.001 0-.552.336-1 .75-1s.75.448.75 1-.116 6.001-.75 6.001z">
                                </path>
                            </g>
                        </svg>
                            <p style="font-size: 2px;">협의가능 선택 시, 숫자 뒤에 (협의가능) 문구가 표시됩니다.
                                협의가능 옵션은 금액을 입력해야만 선택 가능합니다.
                            </p>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="styled__TitleBox-sc-1u6ustj-7 jgJBkW">
                        <p>관리비항목</p>
                        <p>(다중선택가능)</p>
                    </div>
                    <label class="styled__CheckboxBtn-j1kyvo-1 styled__Option-sc-1u6ustj-8 jkgSHl">     <input type="checkbox" name="maintenance_items">
                        <p>
                            인터넷
                        </p>
                    </label>
                    <label class="styled__CheckboxBtn-j1kyvo-1 styled__Option-sc-1u6ustj-8 jkgSHl">     <input type="checkbox" name="maintenance_items">
                        <p>
                            유선TV
                        </p>
                    </label>
                    <label class="styled__CheckboxBtn-j1kyvo-1 styled__Option-sc-1u6ustj-8 jkgSHl">     <input type="checkbox" name="maintenance_items">
                        <p>
                            청소비
                        </p>
                    </label>
                    <label class="styled__CheckboxBtn-j1kyvo-1 styled__Option-sc-1u6ustj-8 jkgSHl">     <input type="checkbox" name="maintenance_items">
                        <p>
                            수도세
                        </p>
                    </label>
                    <label class="styled__CheckboxBtn-j1kyvo-1 styled__Option-sc-1u6ustj-8 jkgSHl">     <input type="checkbox" name="maintenance_items">
                        <p>
                            도시가스
                        </p>
                    </label>
                    <label class="styled__CheckboxBtn-j1kyvo-1 styled__Option-sc-1u6ustj-8 jkgSHl">     <input type="checkbox" name="maintenance_items">
                        <p>
                            전기세
                        </p>
                    </label>
                    <label class="styled__CheckboxBtn-j1kyvo-1 styled__Option-sc-1u6ustj-8 jkgSHl">     <input type="checkbox" name="maintenance_items">
                        <p>
                            기타
                        </p>
                    </label>   
                </td>
            </tr>
            <tr>
                <td>
                    주차여부
                </td>
                <td>
                    <label class="styled__RadioBtn-j1kyvo-0 styled__Radio-sc-1u6ustj-3 eerkYk"><input type="radio" name="parking" checked="">
                        <p>불가능</p>
                    </label>
                    <label class="styled__RadioBtn-j1kyvo-0 styled__Radio-sc-1u6ustj-3 eerkYk"><input type="radio" name="parking">
                        <p>가능</p>
                    </label>
                </td>
            </tr>    
            <tr>
                <td>
                    반려동물                
                </td>
                <td>
                    <label class="styled__RadioBtn-j1kyvo-0 styled__Radio-sc-1u6ustj-3 eerkYk"><input type="radio" name="animal" checked=""><p>불가능</p></label>
                    <label class="styled__RadioBtn-j1kyvo-0 styled__Radio-sc-1u6ustj-3 eerkYk"><input type="radio" name="animal" checked=""><p>가능</p></label>
                </td>                
            </tr>
            <tr>
                <td>
                    엘리베이터                
                </td>
                <td>
                    <label class="styled__RadioBtn-j1kyvo-0 styled__Radio-sc-1u6ustj-3 eerkYk"><input type="radio" name="animal" checked=""><p>없음</p></label>
                    <label class="styled__RadioBtn-j1kyvo-0 styled__Radio-sc-1u6ustj-3 eerkYk"><input type="radio" name="animal" checked=""><p>있음</p></label>
                </td> 
            </tr>
            <tr>
                <td>
                    전세자금대출
                </td>
                <td>
                    <label class="styled__RadioBtn-j1kyvo-0 styled__Radio-sc-1u6ustj-3 eerkYk"><input type="radio" name="animal" checked=""><p>불가능</p></label>
                    <label class="styled__RadioBtn-j1kyvo-0 styled__Radio-sc-1u6ustj-3 eerkYk"><input type="radio" name="animal" checked=""><p>가능</p></label>                
                </td>
            </tr>
            <tr>
                <td>
                    옵션항목
                </td>
                <td>
                    <label class="styled__CheckboxBtn-j1kyvo-1 styled__Option-sc-1u6ustj-8 jkgSHl">     <input type="checkbox" name="maintenance_items">
                        <p>
                            에어컨
                        </p>
                    </label>
                    <label class="styled__CheckboxBtn-j1kyvo-1 styled__Option-sc-1u6ustj-8 jkgSHl">     <input type="checkbox" name="maintenance_items">
                        <p>
                            세탁기
                        </p>
                    </label>
                    <label class="styled__CheckboxBtn-j1kyvo-1 styled__Option-sc-1u6ustj-8 jkgSHl">     <input type="checkbox" name="maintenance_items">
                        <p>
                            침대
                        </p>
                    </label> 
                </td>
            </tr>
        </table>
        
            <br>
            <br>
            <br>
        
            <table style="border-collapse: collapse" align = center>
                <tr>
                    <td colspan="2">
                        상세 설명
                    </td>
                </tr>
                <tr>
                    <td>
                        제목
                    </td>
                    <td>
                        <input type = "text" name = "" placeholder="예)신논현역 보도 4분거리, 혼자 살기 좋은 아파트 입니다.">
                    </td>
                </tr>
                <tr>
                    <td rowspan="7">
                        상세 설명
                    </td>
                    <td>
    <textarea name="memo" placeholder="상세설명 작성 주의사항

    - 방 정보와 관련없는 홍보성 정보는 입력하실 수 없습니다. (홈페이지 주소, 블로그, SNS, 메신저ID, 전화번호, 이메일 등)
    - 중개수수료를 언급한 내용은 입력할 수 없습니다. (중개수수료 무료, 꽁짜, 반값 등)

    * 주의사항 위반시 허위매물로 간주되어 매물 삭제 및 이용의 제한이 있을 수 있습니다.
    * 다방의 매물등록 규정에 위반되는 금칙어는 등록이 불가합니다." class="Textarea-sc-6jro6l-0 styled__Memo-sc-1tnvlzf-2 cHRaGb" style="width:650px;"></textarea>
                    </td>
                </tr>
            </table>

            <br>
            <br>
            <br>   
        
            <table style="border-collapse: collapse" align = center>
                <tr>
                    <td colspan="2">
                        사진 등록
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>
                            사진 등록 주의 사항
                        </p>
                        <p>
                            사진은 최대 4장까지 업로드 가능
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        사진1<input type='file' name = "pic1"/><br>
                        사진2<input type='file' name = "pic2"/><br>
                        사진3<input type='file' name = "pic3"/><br>
                        사진4<input type='file' name = "pic4"/><br>
                    </td>
                </tr>
            </table>
        </form>
        <button name = "" onclick="">등록</button>
        <button name = "" onclick="window.history.back();">취소</button>
    </div> 
	</body>
</html>