//===============================2020.03.03 유기복
//셀러인증 체크박스 및 인증분류 선택 예외처리 
function checkcart(){
	var check = document.getElementsByName("check");
	var auth = document.getElementById("auth").value;
	var cnt = 0;
	for(var i=0; i<check.length; i++){
		if(check[i].checked){
			cnt++;
		}
	}
	if(cnt==0){
		alert("선택하기 체크해주세요");
		return false;
	}
	if(auth==""){
		alert("인증분류를 선택해주세요");
		return false;
	}
}
//셀러검색 및 에러처리
function searchPro(){
	var searchInput = document.getElementsByName("searchInput")[0].value;
	if(searchInput==""){
		alert("키워드를 입력하십시오");
		return false;
	}else{
		window.location="admin_approvesellerSearchAuth.all?searchInput="+searchInput
	}
}

//회원상태 검색기능 및 에러처리
function searchPro2(){
	var searchInput2 = document.getElementsByName("searchInput2")[0].value;
	var state2 = document.getElementById("state2").value;
	if(state2==""){
		alert("검색구분을 설정하세요");
		return false;
	}else if(searchInput2==""){
		alert("키워드를 입력하십시오");
		return false;
	}else{
		window.location="admin_administratemembersSearch.all?state2="+state2+ "&searchInput2="+searchInput2;
    }
}
//회원상태 회원구분 에러처리
function statePro(){
	var state = document.getElementsByName("state")[0].value;
	if(state==""){
		alert("회원구분을 설정하세요");
		return false;
	}
}

//불량회원 신고관리 체크박스 및 누적신고횟수 수정 예외처리 
function checkcart3(){
	var check3 = document.getElementsByName("check3");
	var reportModifyCnt = document.getElementById("reportModifyCnt").value;
	var cnt = 0;
	for(var i=0; i<check3.length; i++){
		if(check3[i].checked){
			cnt++;
		}
	}
	if(cnt==0){
		alert("선택하기 체크해주세요");
		return false;
	}
	if(reportModifyCnt==""){
		alert("누적신고횟수를 수정해주세요");
		return false;
	}
}
//불량회원 신고관리 셀러검색 및 에러처리
function searchPro3(){
	var searchInput3 = document.getElementsByName("searchInput3")[0].value;
	if(searchInput3==""){
		alert("키워드를 입력하십시오");
		return false;
	}else{
		window.location="admin_reportSearchModifycnt.all?searchInput3="+searchInput3
	}
}
//===============================2020.03.03 유기복 END