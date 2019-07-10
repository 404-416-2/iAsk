<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>UsrAnswerList</title>
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

<style type="text/css">
input {
	border: 0px;
	background: none;
}

input:focus {
	color: green;
}

.submit-button { /* 按钮美化 */
	width: 100px; /* 宽度 */
	height: 40px; /* 高度 */
	border-width: 0px; /* 边框宽度 */
	border-radius: 3px; /* 边框半径 */
	background: #8CFBE5; /* 背景颜色 */
	cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
	outline: none; /* 不显示轮廓线 */
	font-family: Microsoft YaHei; /* 设置字体 */
	color: white; /* 字体颜色 */
	font-size: 17px; /* 字体大小 */
}

.submit-button:hover { /* 鼠标移入按钮范围时改变颜色 */
	background: #08E7BA;
}
</style>


</head>
<body id="page-top" style="background: #f8f9fc; margin-bottom: 10%">

	<!-- Page Wrapper -->
	<div id="wrapper">


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light topbar mb-4 static-top shadow"
					style="background-color: rgba(28, 200, 138, .5)">
					<a class=" d-flex align-items-center justify-content-center"
						href="home"> <img src="images/biao_s.png" class="navbar-brand"
						style="padding-right: 0%; width: 50px; height: 50px" />
					</a>
					<h1 class="h3 mb-0 text-gray-800">回答更新</h1>

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>



					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">


						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.uid}
							</span> <img class="img-profile rounded-circle"
								src="userFriend/img/head.jpg">
						</a> <!-- Dropdown - User Information -->
							<ul
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
							<a class="dropdown-item" href="ViewFriendList"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 个人主页
								</a>
								<a class="dropdown-item" href="<%=path%>/ViewUsrQues"> <i
									class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 问题管理
								</a>
								
								<a class="dropdown-item" href="<%=path%>/ViewUsrAnswer"> <i
									class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 回答管理
								</a>
								
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									退出登录
								</a>
							</ul></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid" style="width: 60%;">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between b-4">
						<img class="img-profile rounded-circle"
							src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
						<h1 class="h3 mb-0 text-gray-800" style="text-align: center">${userInfo.nickname }</h1>
					</div>

					<div></div>

					<!-- /.container-fluid -->
					<!-- Page Heading -->

					<form class="form" action="/New/UpdateAnswer" method="post"
						accept-charset="utf-8" onsubmit="document.charset='utf-8';">

						<div class="card shadow mb-4">
							<div class="card-body">
								<div class="row">
									<div class="col-lg-3">问题ID：</div>
									<div class="col-lg-9">
										<input type="text" name="q_id"
											value=<%=request.getParameter("q_id")%> readonly="readonly">
									</div>
								</div>

								<br> <br>
								<div class="row">
									<div class="col-lg-3">用户ID：</div>
									<div class="col-lg-9">
										<input type="text" name="u_id"
											value=<%=request.getParameter("u_id")%> readonly="readonly">
									</div>
								</div>
								<br> <br>
								<div class="row">
									<div class="col-lg-3">提交修改的内容</div>
									<div>
										<input type="text" name="update_text"
											value=<%=request.getParameter("a_tx")%>
											style="width: 500px; height: 150px;">
									</div>
								</div>
							</div>
						</div>
						<br>
						<button class="submit-button" type="submit">提交修改</button>
						<a href="<%=path%>/ViewUsrAnswer">
							<button class="submit-button" type="button"
								onclick="UserAnswerList()">取消</button>
						</a>
				</div>
				</form>

			</div>
		</div>
	</div>

	<!-- /.container-fluid -->
	<!-- End of Main Content -->

	<!-- Footer -->
	<footer class="sticky-footer"
		style="background-color: rgba(28, 200, 138, .5); position: fixed; left: 0px; bottom: 0px; width: 100%;">
		<div class="container my-auto">
			<div class="copyright text-center my-auto">
				<span>Copyright &copy; Your Website 2019</span>
			</div>
		</div>
	</footer>
	<!-- End of Footer -->
	<!-- End of Content Wrapper -->

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
				<div class="modal-body">确定退出吗？退出将结束会话。</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">取消</button>
					<a class="btn btn-primary" href="<%=path %>/UserLogout">退出</a>
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

