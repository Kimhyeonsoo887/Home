	/* 박찬하 2020.03.06 */
	//번호에 해당하는 글을 가져옵니다.
	function readNotice( ntc_number ){
		console.log( ntc_number );
		//null이 아니라면...
		if( ntc_number != 0 && ntc_number != null ){
			var url = "admin_noticedetail.all?ntc_number="+ntc_number;
			window.open(url,"notice" ,"menubar=no width=500 height=500" );
		}
	}
	
	//새로운 공지사항을 추가합니다.
	function noticeInsert(){
		var url = "admin_noticeInsert.all";
		window.open(url,"new Notice","menubar=no width=500 height=500");
	}
	
	function noticeInsertPro(){
		var ntc_title = document.getElementById("ntc_title").value;		//제목
		var ntc_content = document.getElementById("ntc_content").value;	//내용
		//output
		console.log( "ntc_title : " + ntc_title );
		console.log( "ntc_content : " + ntc_content );

		//call controller GET
		window.location.href = "admin_noticeInsertPro.all?ntc_title="+ntc_title+"&ntc_content="+ntc_content;
		
	}
	
	//공지사항 글을 수정합니다.
	function noticeModify( ntc_number ){
		console.log( ntc_number );
		
		if( ntc_number != 0 && ntc_number != null ){
			//수정 페이지를 요청합니다.
			window.location.href = "admin_noticeModify.all?ntc_number="+ntc_number;
		}
		
	}

	
	//번호에 해당하는 글을 삭제합니다.
	function noticeDelete( ntc_number ){
		console.log( ntc_number );
		
		//null이 아니라면...
		if( ntc_number != 0 && ntc_number != null ){
			//controller에게 삭제요청을 합니다.
			window.location.href = "admin_noticeDelete.all?ntc_number="+ntc_number;
			//부모윈도우를 리프래쉬합니다.
			window.opener.location.reload(false);
			//자기자신 윈도우는 종료합니다.
			self.close();
		}
	}

	/* 박찬하 2020.03.06 */