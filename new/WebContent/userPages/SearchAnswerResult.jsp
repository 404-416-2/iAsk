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
					<h1 class="h3 mb-0 text-gray-800">搜索结果</h1>

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Search -->
					<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
						action="SearchAnswer">
						<div class="input-group">
							<input type="text" name="keys"
								class="form-control bg-light border-0 small" placeholder="查找回答"
								aria-label="Search" aria-describedby="basic-addon2"
								onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"
								onpaste="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"
								oncontextmenu="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')">
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
									action="SearchAnswer">
									<div class="input-group">
										<input type="text" name="keys"
											class="form-control bg-light border-0 small"
											placeholder="查找回答" aria-label="Search"
											aria-describedby="basic-addon2"
											onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"
											onpaste="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"
											oncontextmenu="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')">
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
					<div align="left">
						<button class="btn button-info">搜索到的回答 (数量: ${answerNum})</button>
					</div>

					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="row">
								<div class="col-lg-2" align="center">问题ID</div>
								<div class="col-lg-4" align="center">问题内容</div>
								<div class="col-lg-3" align="center">更新时间</div>
								<div class="col-lg-3" align="center">操作</div>
							</div>
						</div>
					</div>

					<c:forEach var="Q" items="${keyAnswers}">
						<!-- Basic Card Example -->

						<!--  a href="<%=path%>/FindFriend?friendId=${friendId}"-->


						<div class="card shadow mb-4">
							<div class="card-body">
								<div class="row">
									<div class="col-lg-2" align="center">${Q.q_id}</div>
									<div class="col-lg-4" align="center">${Q.ans_text}</div>
									<div class="col-lg-3" align="center">${Q.ans_Time}</div>
									<div class="col-lg-3" align="center">
										<a>
											<button class="btn btn-info" data-toggle="modal"
												data-target="#myModal">删除</button>
										</a> <a
											href="userPages/updateAnswer.jsp?q_id=${Q.q_id}&u_id=${Q.u_id}&a_tx=${Q.ans_text}"><button
												class="btn button-info">修改</button></a>
									</div>
								</div>

								<form method="get" action="deleteAnswer" class="form-horizontal"
									role="form" id="myForm" onsubmit="return ">
									<div class="modal fade" id="myModal" tabindex="-1"
										role="dialog" aria-labelledby="myModalLabel"
										aria-hidden="true">
										<!--  定义模态框，过渡效果为淡入，id为myModal,tabindex=-1可以禁用使用tab切换，aria-labelledby用于引用模态框的标题，aria-hidden=true保持模态框在触发前窗口不可见  -->
										<div class="modal-dialog">
											<!--  显示模态框对话框模型（若不写下一个div则没有颜色）  -->
											<div class="modal-content">
												<!--  显示模态框白色背景，所有内容都写在这个div里面  -->

												<div class="btn-info modal-header">
													<!--  模态框标题  -->
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<!--  关闭按钮  -->
													<h4>是否删除该回答？</h4>
													<!--  标题内容  -->
												</div>

												<div class="modal-body">
													<!--  模态框内容，我在此处添加一个表单 -->
													<form class="form-horizontal" role="form">
														<br> 对应问题ID为: <input type="text" name="q_id"
															style="width: 50px;" class="form-control well"
															value="${Q.q_id}" /> <br> 您的用户ID为: <input
															type="text" name="u_id" style="width: 300px;"
															class="form-control well" value="${Q.u_id}" />

													</form>
												</div>

												<div class="modal-footer">
													<!--  模态框底部样式，一般是提交或者确定按钮 -->
													<button type="submit" class="btn btn-info">提交</button>
													<button type="button" class="btn btn-default"
														data-dismiss="modal">取消</button>
												</div>

											</div>
											<!-- /.modal-content -->
										</div>
									</div>
									<!-- /.modal -->
								</form>

							</div>
						</div>
					</c:forEach>


				</div>
				<!-- /.container-fluid -->
			</div>

		</div>
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