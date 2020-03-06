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
				<td>글번호</td>
				<td>${notice.ntc_number}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${notice.ntc_title}</td>
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
				<td>${notice.ntc_content}</td>
			</tr>
			<tr>
				<td>
					<button name = "" id = "" onclick="self.close();">닫기</button>
					<button name = "" id = "" onclick="noticeModify('${notice.ntc_number}');">수정</button>
					<button name = "" id = "" onclick="noticeDelete('${notice.ntc_number}')">삭제</button>
				</td>
			</tr>
		</table>
	</body>
</html>