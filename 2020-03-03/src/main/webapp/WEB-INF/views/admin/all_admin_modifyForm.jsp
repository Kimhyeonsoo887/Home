<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "admin_setting.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		  <!-- import notice.js -->
		  <script src="${javascripts}/notice.js"></script>
	</head>
	<body>
		<form action = "admin_noticeModifyPro.all" method = "GET">
			<input type = "hidden" name = "ntc_number" 	value = "${notice.ntc_number}">
			<input type = "hidden" name = "adm_id" 		value = "${notice.adm_id}">
			<table>
				<tr>
					<td>글번호</td>
					<td>${notice.ntc_number}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type = "text" name = "ntc_title" id = "" value = "${notice.ntc_title}" maxlength="30"></td>
				</tr>
				<tr>
					<td>등록일</td>
					<td>${notice.ntc_registerdate}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${notice.adm_id}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea rows="50" cols="50" maxlength="1000" id = "ntc_content" name = "ntc_content">${notice.ntc_content}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						<button name = "" id = "" onclick="self.close();">취소</button>
						<input type = "submit" name = "" id = "" value = "수정"></input>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>