<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<style>
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	*{
		font-family:Noto Sans KR, sans-serif;
	}
	.check_wrap .detail_price {
	    width: 395px;
	    overflow: hidden;
	    margin-top: 16px;
	    padding: 10px 15px;
	    background: #f8f5e9;
	}
	.op_btn_detail .btn_dtl_04 {
	    background: url(/images/op_btn/op_btn_detail.png) no-repeat 0 -135px;
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
		border-radius: 2px;
	    color: #FFFFFF;
	    background-color: #8799FF;
	    border-color: #FF6754;
	    box-sizing: border-box;
	    border: 2px solid transparent;
	    text-align: center;
	    display: inline-block;
	    width: auto;
	    height: auto;
	    font-family: Nanum Gothic, sans-serif;
	    font-weight: 700;
	    padding:5px 20px;
	    font-size:16px;
	    margin-right:10px;
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
</style>
</head>
<body>
<div class="tab_wrap pos_rel">
	<table width="50%" align="center">

		<colgroup>
			<col style="width:30%;"/>
			<col style="width:15%;"/>
			<col style="width:30%;"/>
			<col style="width:15%;"/>
			<col style="width:10%;"/>
		</colgroup>
		<thead>
			<tr height="50px">
				<td align="center" scope="col">입찰서 제출일</td>
			    <td align="center" scope="col">입찰보증금</td>
			    <td align="center" scope="col">물건정보</td>
			    <td align="center" scope="col">입찰마감일시<br>개찰일시</td>
			    <td align="center" scope="col">진행상태</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${cnt>0}">
				<c:forEach var="dto" items="${dtos}">
					<tr id="top" height="50px">
						<td>
							${number}
							<c:set var="number" value="${number-1}"/>
							<%-- (${dto.ref} / ${dto.ref_step} / ${dto.ref_level}) --%>
						</td>
						<td>
							<!-- 답글인 경우 : 들여쓰기 >1 -->
							<c:if test="${dto.ref_level>1}">
								<c:set var="wid" value="${(dto.ref_level-1) * 10}"/>
								
								<img src="${project}images/level.gif" border="0" width="${wid}" height="15">
							</c:if>
							
							<!-- 답글인 경우 : 들여쓰기 >0 -->
							<c:if test="${dto.ref_level>0}">
								<img src="${project}images/re.gif" border="0" width="20" height="15">
							</c:if>
							
							<!-- hot 이미지 -->
							<c:if test="${dto.readCnt >10}">
								<img src="${project}images/hot.gif" border="0" width="20" height="15">
							</c:if>
							<a href="contentForm.bo?num=${dto.num}&pageNum=${pageNum}&number=${number+1}&boardNum=1">${dto.subject}</a>
							<!-- get방식 공백이나 줄바꿈 no!!! -->
						</td>
						<td>
							${dto.id}
						</td>
						<td>
							${dto.readCnt}
						</td>
						<td>
							<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${dto.reg_date}"/>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<!-- 게시글이 없으면 -->
			<c:if test="${cnt==0 }">
				<tr>
					<td colspan="5" align="center">
						게시글이 없습니다. 글을 작성해주세요.!!
					</td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>
</body>
</html>