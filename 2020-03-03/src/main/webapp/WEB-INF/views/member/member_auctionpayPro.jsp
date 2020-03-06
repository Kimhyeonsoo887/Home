<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
*{
	font-family:Noto Sans KR, sans-serif;
}
table{
border-collapse:collapse;


}
tr{
	border-bottom: 1px solid #cccccc;
	height:50px;

	
}
#tfoot,#pageControl{
	border-bottom:none;
		
}
tfoot{
	vertical-align:bottom;
}

button{    
	border-radius: 3px;
    color: #FFFFFF;
    background-color: #FF6754;
    border-color: #FF6754;
    box-sizing: border-box;
    border: 2px solid transparent;
    text-align: center;
    display: inline-block;
    width: auto;
    height: auto;
    font-family: Nanum Gothic, sans-serif;
    font-weight: 700;
    padding:10px 20px;
    font-size:16px;
    
    }
 
.writeBtn{float:right; }

input[type="search" ] {
    /* -webkit-appearance: searchfield; */
    box-sizing: border-box;
    padding: 10px 15px;
    float:left;
    margin-right:20px;
    vertical-align:text-bottom;
}
#boardBtn{
	margin-top:20px;
}
caption{font-size:20px}
div.editorDetail {
    overflow-y: auto;
    padding: 0px;
    display: inline-block!important;
    width: 100%;
    height: 200px;
    font-size: 13px;
    line-height: 1.6;
}
.ar {
    text-align: right !important;
}
#Contents {
    float: right;
    width: 750px;
    min-height: 611px;
}
.cm_box_04 {
    padding: 7px 10px;
    background: #f4f4f4;
    word-break: break-all;
}
.cm_btn_b_o, .cm_btn_b_o *,.cm_btn_b_f {
    cursor: pointer;
    background-color: #8799FF;
    color: #fff;
    font-size: 14px;
    font-weight: bold;
    line-height: 14px;
    vertical-align: middle;
    text-align: center;
    padding:10px 10px;
}
#payment{
	width:50%;
	margin:0 auto;
}
</style>

<body>
	
	<c:if test="${insertCnt==0}">
		<script type="text/javascript">
			alert("입찰 실패-현재최고가보다 낮은 금액입니다.")
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${insertCnt!=0 }">
		<script type="text/javascript">
			alert("입찰에 성공하였습니다.")
			self.close();	
			
		</script>
	</c:if>

			
</body>
</html>