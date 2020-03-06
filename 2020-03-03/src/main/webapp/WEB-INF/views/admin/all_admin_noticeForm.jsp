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
		<table>
			<tr>
				<td>제목</td>
				<td><input type = "text" name = "ntc_title" id = "ntc_title" maxlength="30" placeholder="30글자 내외"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="50" cols="50" maxlength="1000" id = "ntc_content" placeholder="1000글자내외"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<button name = "" id = "" onclick="self.close();">닫기</button>
					<button name = "" id = "" onclick="noticeInsertPro();">추가</button>
				</td>
			</tr>
		</table>
	</body>
</html>