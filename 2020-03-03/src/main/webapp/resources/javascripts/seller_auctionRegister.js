            /* 박찬하 2020.02.21 */
			//input form에 대한 예외처리
            //페이지으로 이동하자마자 경매명을 입력하기위 포커스를 이동합니다.
            function drawHtml(){
                document.getElementById('auc_name').focus();
                
                //
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
