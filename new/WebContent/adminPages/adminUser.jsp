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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>friend page</title>
<!-- Bootstrap -->
<meta name="description" content="">
<meta name="author" content="zhyyao">
<!-- Custom fonts for this template-->
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->

<link
	href="<%=path%>/userFriend/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<link href="<%=path%>/userFriend/css/sb-admin-2.min.css"
	rel="stylesheet">
<link href="userFriend/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">



</head>
<body id="page-top" style="background: #f8f9fc; margin-bottom: 10%">
	<script type="text/javascript">
	 	function del(temp)
	 	{
			//alert(temp.parentNode.parentNode);//这个temp.parentNode就是div元素
			$(temp.parentNode.parentNode.parentNode).remove();
	 	} 
	 
	 	function loc(temp)
	 	{
	 		alert("已锁定");
	 		// $($(temp).next("button.unlock")).attr('disabled',"false");
	 		// $(temp).attr('disabled',"true");
	 

	 	};
	 	function unl(temp)
	 	{
	 		alert("解锁");
	 		// $($(temp).sblings("button.lock")).attr('disabled',"false");
	 		// $(temp).attr('disabled',"true");
	 	
	 	};
	 	function top(temp)
	 	{
	 		alert("已置顶");
	 		// $($(temp).sblings("button.untop")).attr('disabled',"false");
	 		// $(temp).attr('disabled',"true");
	 	};
	 	function unt(temp)
	 	{
	 		alert("已取消置顶");
	 		// $($(temp).sblings("button.topp")).attr('disabled',"false");
	 		// $(temp).attr('disabled',"true");
	 	};

	
</script>
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light topbar mb-4 static-top shadow"
					style="background-color:rgba(28,200,138,.5)"> <a
					class=" d-flex align-items-center justify-content-center"
					href="home"> <img src="images/biao_s.png" class="navbar-brand"
					style="padding-right: 0%; width: 50px; height: 50px" />
				</a>
				<h1 class="h3 mb-0 text-gray-800">用户管理</h1>
				<!-- Sidebar Toggle (Topbar) -->
				<button id="sidebarToggleTop"
					class="btn btn-link d-md-none rounded-circle mr-3">
					<i class="fa fa-bars"></i>
				</button>

				<!-- Topbar Search -->
				<form
					class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
					action="UserSearchServlet">
					<div class="input-group">
						<input name="usrId" type="text"
							class="form-control bg-light border-0 small" placeholder="请输入关键字"
							aria-label="Search" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="submit">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>

				<!-- Topbar Navbar -->
				<ul class="navbar-nav ml-auto">

					<!-- Nav Item - Search Dropdown (Visible Only XS) -->
					<li class="nav-item dropdown no-arrow d-sm-none"><a
						class="nav-link dropdown-toggle" href="#" id="searchDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
					</a> <!-- Dropdown - Messages -->
						<div
							class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
							aria-labelledby="searchDropdown">
							<form class="form-inline mr-auto w-100 navbar-search"
								action="UserSearchServlet">
								<div class="input-group">
									<input name="usrId" type="text"
										class="form-control bg-light border-0 small"
										placeholder="请输入关键词" aria-label="Search"
										aria-describedby="basic-addon2">
									<div class="input-group-append">
										<button class="btn btn-primary" type="submit">
											<i class="fas fa-search fa-sm"></i>
										</button>
									</div>
								</div>
							</form>
						</div></li>


					<div class="topbar-divider d-none d-sm-block"></div>

					<!-- Nav Item - User Information -->
					<li class="nav-item dropdown no-arrow"><a
						class="nav-link dropdown-toggle" href="#" id="userDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <span
							class="mr-2 d-none d-lg-inline text-gray-600 small">管理员您好</span>
							<img class="img-profile rounded-circle" src="images/tou.JPG">
					</a> <!-- Dropdown - User Information -->
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
							aria-labelledby="userDropdown">
							<a class="dropdown-item" href="<%=path%>/userManageServlet">
								<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> ·账号管理
							</a> <a class="dropdown-item" href="<%=path%>/questionManageServlet">
								<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> 问答管理
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="<%=path%>/adminLogin.jsp"
								data-toggle="modal" data-target="#logoutModal"> <i
								class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
								退出登陆
							</a>
						</div></li>

				</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">系统用户列表</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">系统当前用户</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>账号(E-mail)</th>
											<th>昵称</th>
											<th>学校</th>
											<th>操作</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>账号(E-mail)</th>
											<th>昵称</th>
											<th>学校</th>
											<th>操作</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach var="U" items="${UserAll }">
											<tr>
												<td>${U.usrId }</td>
												<td>${U.nickname }</td>
												<td>${U.school }</td>
												<td style="padding: 10px;"><a
													href="UserDeleteServlet?usrId=${U.usrId}"
													class="btn btn-danger btn-icon-split" onclick="del(this)">
														<span class="icon text-white-50"> <i
															class="fas fa-trash"></i>
													</span> <span class="text">删除</span>
												</a> <a href="UserLockServlet?usrId=${U.usrId}"
													class="btn btn-warning btn-icon-split" onclick="loc(this)">
														<span class="icon text-white-50"> <i
															class="fas fa-lock"></i>
													</span> <span class="text">锁定</span>
												</a> <a href="UserUnlockServlet?usrId=${U.usrId}"
													class="btn btn-success btn-icon-split" onclick="unl(this)">
														<span class="icon text-white-50"> <i
															class="fas fa-lock-open"></i>
													</span> <span class="text">解锁</span>
												</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer"
				style="background-color:rgba(28,200,138,.5);position:fixed; left:0px; bottom:0px; width:100%;z-index:100">
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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">退出</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">确定退出吗？退出将关闭当前会话</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">取消</button>
					<a class="btn btn-primary" href="<%=path%>/adminLogin.jsp">退出</a>
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

	<!-- Page level plugins -->
	<script src="userFriend/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="userFriend/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="userFriend/js/demo/datatables-demo.js"></script>

</body>
</html>