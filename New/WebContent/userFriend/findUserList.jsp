<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>friend page</title>
    <!-- Bootstrap -->
	<meta name="description" content="">
	<meta name="author" content="zhyyao">
 <!-- Custom fonts for this template-->
 <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	
	<link href="<%=path%>/userFriend/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<!-- Custom styles for this template-->
	<link href="<%=path%>/userFriend/css/sb-admin-2.min.css" rel="stylesheet"> 

	
	
</head>
<body id="page-top" style="background:#f8f9fc;margin-bottom:10%">

  <!-- Page Wrapper -->
  <div id="wrapper">


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light topbar mb-4 static-top shadow" style="background-color:rgba(28,200,138,.5)">

 		<a class=" d-flex align-items-center justify-content-center" href="home">
          	 <img src="images/biao_s.png" class="navbar-brand" style="padding-right: 0%;width:50px;height:50px" /> 	        	
      	</a>
          <h1 class="h3 mb-0 text-gray-800">朋友列表</h1>

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
          		action="FindFriendList.do">
            <div class="input-group">
              <input type="text" name="searchFriend"class="form-control bg-light border-0 small" placeholder="查找好友" aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="查找好友" aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle"  href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.uid} </span>
                <img class="img-profile rounded-circle" src="<%=path %>/facePicture${sessionScope.uid }.jpg">
              </a>
              <!-- Dropdown - User Information -->
              <ul class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="ViewFriendList">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  	个人主页
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  	回答管理
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  	我的收藏
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  	退出登陆
                </a>
              </ul>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid" style="width:60%;">

        <!-- /.container-fluid -->
           <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">搜索用户</h1>
          </div>
          <%int i =0; %>
			<c:forEach var="friend" items="${friendList }"
			varStatus="friendCount">
			<%i = i+1; %>
			<c:if test="${friendCount.count%2 eq 1 }">
				<div class="row">
			</c:if>
			<div class="col-lg-6">
              <!-- Basic Card Example -->
              <a href="<%=path %>/FindFriend?friendId=${friend.usrId}">
              <div class="card shadow mb-4">
              	<div class="card-header py-3">              	
                  <h6 class="m-0 font-weight-bold text-primary">
                  	<img style="width:50px;height:50px" class="img-profile rounded-circle" src="<%=path%>/facePicture/${friend.usrId}.jpg">
                  		${friend.nickname }
                  	<a class="btn btn-danger btn-circle btn-sm" href="<%=path%>/DeleteFriend?friendId=${friend.usrId}">
                  	   <i class="fas fa-trash"></i>
                  	</a>
                  </h6>
                </div>
                <div class="card-body">
                  	性别:<c:choose><c:when test="${friend.sex eq 1 }">男</c:when><c:when test="${friend.sex eq 0 }">女</c:when></c:choose> 
                	年龄:${friend.age }
                	学校:${friend.school }
                	简述:${friend.text }
                </div>
              </div>
              </a>
              </div>
              <c:if test="${friendCount.count%2 eq 0 }">
              	</div>
              </c:if>
            </c:forEach>
            <hr>
            <c:forEach var="friend" items="${userList }"
			varStatus="friendCount">
			<%i = i+1; %>
			<c:if test="${friendCount.count%2 eq 1 }">
				<div class="row">
			</c:if>
			<div class="col-lg-6">
              <!-- Basic Card Example -->
              <a href="<%=path %>/FindFriend?friendId=${friend.usrId}">
              <div class="card shadow mb-4">
              	<div class="card-header py-3">              	
                  <h6 class="m-0 font-weight-bold text-primary">
                  	<img style="width:50px;height:50px;" class="img-profile rounded-circle" src="<%=path%>/facePicture/${friend.usrId}.jpg">
                  		${friend.nickname }
                  	<a class="btn btn-success btn-circle btn-sm" href="<%=path%>/AddFriend?friendId=${friend.usrId}">
                  	   <i class="fas fa-plus-circle"></i>
                  	</a>
                  </h6>
                </div>
                <div class="card-body">
                  	性别:<c:choose><c:when test="${friend.sex eq 1 }">男</c:when><c:when test="${friend.sex eq 0 }">女</c:when></c:choose> 
                	年龄:${friend.age }
                	学校:${friend.school }
                	简述:${friend.text }
                </div>
              </div>
              </a>
              </div>
              <c:if test="${friendCount.count%2 eq 0 }">
              	</div>
              </c:if>
            </c:forEach>
            <%if(i%2==1) out.println("</div>");%>
           </div>
          
        </div>
        <!-- /.container-fluid -->
        </div>

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer" style="background-color:rgba(28,200,138,.5);position:fixed; left:0px; bottom:0px; width:100%;">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; IAsk 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">退出</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">确定退出吗？退出将结束会话。</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">取消</button>
          <a class="btn btn-primary" href="<%=path %>UserLogout">退出</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="userFriend/vendor/jquery/jquery.min.js"></script>
  <script src="userFriend/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="userFriend/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="userFriend/js/sb-admin-2.min.js"></script>

</body>
</html>