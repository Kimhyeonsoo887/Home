<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Buttons</title>

  <!-- Custom fonts for this template-->
  <link href="${bootstraps}/bootstrap3/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${bootstraps}/bootstrap3/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">

<div id="wrapper">
<%@ include file="sidebar.jsp" %>
	
<form name="write_form_member" method="post">
		<h2 align="center">셀러 입점신청(권한요청)</h2>
		<table height="50" align="center" width="auto"
			style="padding: 5px 0 5px 0;">
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="7"></td>
			</tr>
			<tr>
				<th width="103"></th>
				<th>번호</th>
				<th>중개소명</th>
				<th>시,도</th>
				<th>구,동</th>
				<th>승인상태</th>
				<th width="103"></th>
			</tr>
			<tr>
				<th width="103"></th>
				<th><input type="text" name="mbname" placeholder="자동등록예정"></th>
				<th><input type="text" name="mbname" placeholder="자동등록예정"></th>
				<th><input type="text" name="mbname" placeholder="자동등록예정"></th>
				<th><input type="text" name="mbname" placeholder="자동등록예정"></th>
				<th><input type="text" name="mbname" placeholder="자동등록예정"></th>
				<th width="103"></th>
			</tr>
		</table>

		<table height="550" align="center" width="auto"
			style="padding: 5px 0 5px 0;">
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="7"></td>
			</tr>
			<tr>
				<th style="font-size: 25px;">신청서</th>
			</tr>
			<tr>
				<th height="10"></th>
			</tr>
			<tr>
				<th>신청일:</th>
				<td><input type="text" name="jumin_1" placeholder="자동등록예정">
				</td>
				<th width="170px">시,도 구분:</th>
				<td><input type="text" name="jumin_1"></td>
				<th>구,도 구분:</th>
				<td><input type="text" name="jumin_1"></td>
			</tr>
			<tr>
				<th height="30"></th>
			</tr>
			<tr>
				<th>중개소명:</th>
				<td><input type="text" name="cursor:pointer"></td>
			</tr>
			<tr>
				<th>중개소주소:</th>
				<td><input type="text" name="mbpw"></td>
			</tr>
			<tr>
				<th height="20"></th>
			</tr>
			<tr height="2" bgcolor="#FFC8C3"><td colspan="7"></td></tr>
			<tr>
				<td rowspan="6" colspan="4"></td>
				<th>*(필수)사업자등록증 등록</th>
				<td><input type="file" name="zip_h_1"></td>
			</tr>
			<tr>
				<th>중개소 전화번호</th>
				<td><input type="text" name="cel1"></td>
			</tr>
			<tr>
				<th>핸드폰 번호</th>
				<td><input type="text" name="tel_h1"></td>
			</tr>
			<tr>
				<th>메일/sns 정보 수신</th>
				<td class="s"><input type="radio" name="chk_mail" checked>
					수신 <input type="radio" name="chk_mail" value="4"> 수신거부</td>
			</tr>
			<tr>
				<th>개인정보 수집동의</th>
				<td align="center"><input type='checkbox' name='interest[]'
					value='17'> 개인정보 수집 및 이용에 동의합니다. <br> <input
					type="button" value="개인정보처리방침 자세히보기"></td>

			</tr>
			<tr>
				<th>정보공개여부</th>
				<td><select name='chk_open' size='0'>
						<option value='' selected>선택하세요</option>
						<option value='1'>모두공개</option>
						<option value='2'>비공개</option>
				</select></td>
			</tr>
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="7"></td>
			</tr>
			<tr>
				<th height="30"></th>
			</tr>
			<tr>
				<td colspan="6" align="center"><input type="submit" value="등록">
					<input type="reset" value="취소"></td>
			</tr>
		</table>
		
	</form>
</div>

	
	
	<!-- Bootstrap core JavaScript-->
  <script src="${bootstraps}/bootstrap3/vendor/jquery/jquery.min.js"></script>
  <script src="${bootstraps}/bootstrap3/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${bootstraps}/bootstrap3/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${resources}/js/sb-admin-2.min.js"></script>
</body>
</html>