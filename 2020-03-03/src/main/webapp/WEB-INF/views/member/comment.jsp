<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#comment{
	margin-left:600px;
	}
	#commentButton{
	float:right;
	margin-right:-330px;
	}
	
</style>
<title>Insert title here</title>

<!--  댓글 등록하기(Ajax) -->
<script type="text/javascript">
function fn_comment(){
    
    $.ajax({
        type:'POST',
        url : '${pageContext.request.contextPath}/commentwritePro.all',
        data:$("#commentForm").serialize(),
        success : function(data){
           alert("댓글 추가 성공");
            getCommentList();    // 댓글 목록 읽어오기
        },
        error:function(){
            alert("댓글 추가 실패");
       }
        
    });
}

 
 /**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    
    getCommentList();
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
    $.ajax({
        type:'GET',
        url : '${pageContext.request.contextPath}/commentList.all?qna_number=${dto.qna_number}',
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            if(data.length > 0){
               html += "<div><span style = 'font-weight : bold;'>댓글</div>";
               for(i=0; i<data.length; i++){
                  html += "<div class='container-fluid'>";
                  html += "<div class='row tm-content-row'>";
               	  html += "<div class='tm-product-table-container-noscroll col-12'>";
                  html += "<table class='table table-hover tm-table-small tm-product-table' style='width:500px;'>";
                  html += "<thead> <td style='border-bottom: 1px solid #cccccc;' scope='col'><a style='color:black;'>"+ data[i].cmt_writer+"</a>&nbsp;&nbsp;";
                
                  html += "<br/><br/><a style='color:black;'>"+ data[i].cmt_content+"</a></td>";
                  html += "</td></table>";
                  html += "</thead></table></div></div></div>";
                  
                  
               }           
            } else {
                
                html += "<div>";
                html += "<div><table><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html); 
            
        },
        error:function(){
            alert("댓글 불러오기 실패");
       }
        
    });
}
</script>
</head>
<body>
   <form action="commentwritePro.all" method="post" id = "commentForm">
    <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}"> 
	<input type = "hidden" name = "qna_number" value = "${dto.qna_number}"> 
   <div>
      <table>
         <tr>
            <td><hr style="color:white;"></td>
         </tr>
      </table>
   </div>
   <div style="width:1050px; height:200px;">
      <table>
         <tr>
            <td><input id="comment" type="text" name="cmt_content" style="height:50px; width:700px;" placeholder="댓글을 작성해주세요."></td>
            <td><input id="commentButton" type="button" onclick = "fn_comment();" value="작성" style="background-color:#6a7bad; width:50px; height:55px; color:white;"></td>
         </tr>
      </table>
   </div>   
   </form>
                
   <!-- 댓글 리스트 띄울 장소  -->
   <form action="" method="post" id = "commentListForm">
   <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}"> 
   <div id = "commentList" align = "left">
      
   </div>
   </form>
</body>
</html>