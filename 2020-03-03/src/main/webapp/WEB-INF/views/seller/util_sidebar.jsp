<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Border Utilities</title>

  <!-- Custom fonts for this template-->
  <link href="${styles}/3_adminpage/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${styles}/3_adminpage/css/sb-admin-2.min.css" rel="stylesheet">
<body>
   <ul style="float:left;" class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

     <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="seller_main.sel">
      	<img style="width: 130px; height: 60px;" src="${resources}/images/allpage/myhome_white.png">
        <!-- <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div> -->
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

     

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
       	 메뉴
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>마이페이지</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">마이페이지</h6>
            <a class="collapse-item" href="">회원정보 수정</a>
            <a class="collapse-item" href="">회원 탈퇴</a>
            <a class="collapse-item" href="">결제 관리</a>
          </div>
        </div>
      </li>

	   <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>매물관리</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">매물관리</h6>
            <a class="collapse-item" href="seller_sale_Lookup.sel">매물 조회</a>
            <a class="collapse-item" href="seller_sale.sel">매물 등록</a>
            <a class="collapse-item" href="seller_modifyView.sel">매물 수정/삭제</a>
            <a class="collapse-item" href="seller_auctionModifyView.sel">경매 수정/삭제</a>
            <a class="collapse-item" href="">경매 결제방식</a>
          </div>
        </div>
      </li>



      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>커뮤니티</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">커뮤니티</h6>
            <a class="collapse-item" href="">부동산뉴스</a>
            <a class="collapse-item" href="">자유 게시판</a>
            <a class="collapse-item" href="">QnA</a>
            <a class="collapse-item" href="">FAQ</a>
          </div>
        </div>
      </li>
    </ul> 
    <!-- End of Sidebar -->




   <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
			<a style="float:right; margin-top:10px; margin-right:20px; position: absolute; right: 0; top: 10;" class="btn btn-primary" href="all_logout.all">로그아웃</a>
          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>


          <!-- Topbar Navbar -->
          <!-- <ul class="navbar-nav ml-auto">


          </ul> -->

        </nav>
        <!-- End of Topbar -->
</body>
</html>