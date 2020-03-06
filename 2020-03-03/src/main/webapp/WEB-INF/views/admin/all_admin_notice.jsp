<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "admin_setting.jsp" %> 
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>관리자 - 공지사항</title>

  <!-- Custom fonts for this template-->
  <link href="${styles}/4_adminboard/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${styles}/4_adminboard/css/sb-admin-2.min.css" rel="stylesheet">
  
  <!-- import notice.js -->
  <script src="${javascripts}/notice.js"></script>
</head>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <%@include file="util_sidebar.jsp" %>
	<!-------------------------------------------------------------------------------->
	<table>
		<tr>
			<th>글제목</th>
			<th>작성일</th>
		</tr>
		<c:if test="${cnt <= 0}">
			공지사항이없습니다.
		</c:if>
		<c:if test="${cnt >= 1}">
		<c:forEach var = "notice" items = "${notices}">
			<tr>
				<td>
					<div style="float:left; margin-right:250px;">
						<a href="#" onclick="readNotice('${notice.ntc_number}')">${notice.ntc_title}</a>	
					</div>
					<div style="float:right;">
						${notice.ntc_registerdate}
					</div>
				</td>
			</tr>	
   		</c:forEach>
		</c:if>
		<tr>
			<td>
				<!-- 새로운 공지사항을 추가합니다. -->
				<button name = "" id = "" onclick = "noticeInsert();">글작성</button>
			</td>
		</tr>
	</table>
	<!-------------------------------------------------------------------------------->
	<!-- 페이지 컨트롤 -->
	<table style="width:1000px" align="center">
		<tr>
			<th align="center">
				<!-- 게시글이 있는경우 -->
				<c:if test="${cnt > 0}">
					<!-- 처음[◀◀]  /  이전블록 [◀] pageBlock : 3-->
					<c:if test="${startPage > pageBlock}">
						<a href="admin_notice.all">[◀◀] </a>
						<a href="admin_notice.all?pageNum=${startPage - pageBlock}">[◀] </a>
					</c:if>
					<!-- 블록 내의 페이지 번호 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i==currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>	
						<c:if test="${i!=currentPage}">
							<a href="admin_notice.all?pageNum=${i}">[${i}]</a>
						</c:if>	
					</c:forEach>
					
					<!-- 다음블록[▶]  / 마지막 [▶▶] -->
					<c:if test="${pageCount > endPage}">
						<a href="admin_notice.all?pageNum=${startPage + pageBlock}">[▶] </a>
						<a href="admin_notice.all?pageNum=${pageCount}">[▶▶] </a>
					</c:if>
					
				</c:if>
			</th>
		</tr>
	</table>
	<!-------------------------------------------------------------------------------->
      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>

  

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.all">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="${styles}/4_adminboard/vendor/jquery/jquery.min.js"></script>
  <script src="${styles}/4_adminboard/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${styles}/4_adminboard/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${javascript}/sb-admin-2.min.js"></script>

</body>

</html>
