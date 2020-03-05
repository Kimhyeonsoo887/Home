
var msg_id = "아이디를 입력해주세요.";
var msg_confirmID = "아이디 중복확인을 해주세요.";



/* 20.02.25 - 문성혁, 회원가입 스크립트 */

//일반회원가입 - 중복확인 클릭
function confirmMemberid(){
	if(!document.membersignupform.id.value){
		alert(msg_id);
		document.membersignupform.id.focus();
		return false;
	}
	var url = "all_memberconfirmid.all?id="+ document.membersignupform.id.value;
	window.open(url, "confirm", "menubar=no, width=400, height=200");
}

//일반회원가입 - 중복확인창 입력한 아이디 설정
function setIdMember(id){
	opener.document.membersignupform.id.value = id;
	opener.document.membersignupform.hiddenidM.value = 1;
	self.close();
}
//일반회원가입 - 중복확인 클릭 여부
function signupCheckMember(){
	if (document.membersignupform.hiddenidM.value == "0") {
		alert(msg_confirmID);
		document.membersignupform.confirmM.focus();
		return false;
	}
}



//셀러회원가입 - 중복확인 클릭
function confirmSellerid(){
	if(!document.sellersignupform.id.value){
		alert(msg_id);
		document.sellersignupform.id.focus();
		return false;
	}
	var url = "all_sellerconfirmid.all?id="+ document.sellersignupform.id.value;
	window.open(url, "confirm", "menubar=no, width=400, height=200");
}

//셀러회원가입 - 중복확인창 입력한 아이디 설정	
function setIdSeller(id){
	opener.document.sellersignupform.id.value = id;
	opener.document.sellersignupform.hiddenidS.value = 1;
	self.close();
}
//셀러회원가입 - 중복확인 클릭 여부
function signupCheckSeller(){
	if (document.sellersignupform.hiddenidS.value == "0") {
		alert(msg_confirmID);
		document.sellersignupform.confirmS.focus();
		return false;
	}
}


/* 20.02.25 - 문성혁, 회원가입 스크립트 */

//아이디 찾기
function find_account(){

	var url = "all_find_account.all?name="+document.findaccountform.name.value+"&phone="+document.findaccountform.phone.value+"&findtype="+document.findaccountform.findtype.value;
	window.open(url, "confirm", "menubar=no, width=500, height=180");
	
}