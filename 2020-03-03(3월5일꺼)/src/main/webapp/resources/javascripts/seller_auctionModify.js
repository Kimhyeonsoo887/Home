            /* 박찬하 2020.02.21 */
			//input form에 대한 예외처리
            //페이지으로 이동하자마자 경매명을 입력하기위 포커스를 이동합니다.
            function drawHtml(auc_state,auc_paymethod){
                document.getElementById('auc_name').focus();
                
                /* 박찬하 2020.02.25*/
                document.getElementById("auc_state").value = auc_state;
                document.getElementById("auc_paymethod").value = auc_paymethod;
            }
            
            //날짜를 변경할 경우 changePaydate()함수가 호출되며, 그 뒤 60일을 계산한다. 
            function changePaydate(){
                                
                var currDay = 24 * 60 * 60 * 1000;      // 시 * 분 * 초 * 밀리세컨
                
                var date_min = document.getElementById("auc_paydate").min;
                var selectDate = document.getElementById("auc_paydate").value;
                
                var arr1 = date_min.split("-");
                var arr2 = selectDate.split("-");
                
                var dat1 = new Date(arr1[0], arr1[1], arr1[2]); 
                var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
                
                var diff = dat2 - dat1;
                
                if( diff > 60 ){
                    alert( "대금지급기간은 최장 60일 입니다." );
                    return false;
                }
            }      
            
            function confirmProperty(){

                //감정평가액 NUMBER 12자리
                if( document.getElementById("auc_appraisal").value > 999999999999 ){
                    alert( "금액이 너무 많습니다." );
                    document.getElementById("auc_appraisal").focus();
                    return false;
                }else if(document.getElementById("auc_appraisal").value < 0){
                    alert( "금액이 너무 적습니다." );
                    document.getElementById("auc_appraisal").focus();
                    return false;
                }
                
                //최저입찰가 NUMBER 12자리 
                else if(document.getElementById("auc_minbid").value > 999999999999 ){
                    alert( "금액이 너무 많습니다." );
                    document.getElementById("auc_minbid").focus();
                    return false;
                }else if(document.getElementById("auc_minbid").value < 0){
                    alert( "금액이 너무 적습니다." );
                    document.getElementById("auc_minbid").focus();
                    return false;
                } 
                                        
                //최종입찰가 NUMBER 12자리
                else if(document.getElementById("auc_finalbid").value > 999999999999){
                    alert( "금액이 너무 많습니다." );
                    document.getElementById("auc_finalbid").focus();
                    return false;  
                }else if(document.getElementById("auc_finalbid").value < 0){
                    alert( "금액이 너무 적습니다." );
                    document.getElementById("auc_finalbid").focus();
                    return false;
                }        
                            
                changePaydate();
                
                
                //모든 속성 입력상태에는 문제가 없습니다.
                return true;
            }
            
            /* 2020.03.05 */
        	//경매 정수 수정 
        function auctionModify( auc_number ){
        	if( auc_number != 0 || auc_number != "" ){
        		//새로운 browser를 생성합니다.
        		var url = "seller_auctionModify.sel?auc_number="+auc_number;
        		window.open(url,"auctionModify.jsp"," width:600 height:800");
        	}
        }
        	//경매 삭제
		function auctionDelete( auc_number ){
        	if( auc_number != 0 || auc_number != "" ){
        		window.location.href = "seller_delete.sel?auc_number="+auc_number;
        	}
		}
        /* 2020.03.05 */
        
