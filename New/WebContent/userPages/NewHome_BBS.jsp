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
<title>首页</title>
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
<body id="page-top" style="margin-bottom: 10%;"
	onunload="window.onbeforeunload()">
	<script type="text/javascript">
		function del(temp) {
			//alert(temp.parentNode.parentNode);//这个temp.parentNode就是div元素
			$(temp.parentNode.parentNode.parentNode).remove();
		}

		function loc(temp) {
			alert("已锁定");
			// $($(temp).next("button.unlock")).attr('disabled',"false");
			// $(temp).attr('disabled',"true");

		};
		function unl(temp) {
			alert("解锁");
			// $($(temp).sblings("button.lock")).attr('disabled',"false");
			// $(temp).attr('disabled',"true");

		};
		function top(temp) {
			alert("已置顶");
			// $($(temp).sblings("button.untop")).attr('disabled',"false");
			// $(temp).attr('disabled',"true");
		};
		function unt(temp) {
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
				<h1 class="h3 mb-0 text-gray-800">爱问知识论坛</h1>
				<!-- Sidebar Toggle (Topbar) -->
				<button id="sidebarToggleTop"
					class="btn btn-link d-md-none rounded-circle mr-3">
					<i class="fa fa-bars"></i>
				</button>

				<!-- Topbar Search --> <!-- 				<form
					class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
					action="QuestionSearchServlet">
					<div class="input-group">
						<input name="id" type="text"
							class="form-control bg-light border-0 small" placeholder="请输入关键字"
							aria-label="Search" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="submit">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form> --> <!-- Topbar Navbar --> <!-- <ul class="navbar-nav ml-auto">

					Nav Item - Search Dropdown (Visible Only XS)
					<li class="nav-item dropdown no-arrow d-sm-none"><a
						class="nav-link dropdown-toggle" href="#" id="searchDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
					</a> Dropdown - Messages
						<div
							class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
							aria-labelledby="searchDropdown">
							<form class="form-inline mr-auto w-100 navbar-search"
								action="QuestionSearchServlet">
								<div class="input-group">
									<input name="id" type="text"
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
						</div></li> -->

				<div class="mr-auto ml-md-3 my-2 my-md-0 mw-100"></div>
				<div class="topbar-divider d-none d-sm-block"></div>

				<c:if test="${login_uid ne null}">
					<div class="topbar-divider d-none d-sm-block"></div>

					<!-- Nav Item - User Information -->
					<li class="nav-item dropdown no-arrow"><a
						class="nav-link dropdown-toggle" href="#" id="userDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <span
							class="mr-2 d-none d-lg-inline text-gray-600 small">您好，${nickname}</span>
					</a> <!-- Dropdown - User Information --> <!-- Nav Item - User Information -->
					<li class="nav-item dropdown no-arrow"><a
						class="nav-link dropdown-toggle" href="#" id="userDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <span
							class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.uid}
						</span> <img class="img-profile rounded-circle"
							src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
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
				</c:if> <c:if test="${login_uid == null}">
					<button class="btn btn-primary btn-sm" data-toggle="modal"
						data-target="#LoginModal">登陆</button>
					<button class="btn btn-default btn-sm" data-toggle="modal"
						data-target="#RegisterModal">注册</button>
				</c:if>



				</ul>

				</nav>
				<!-- End of Topbar -->
				<!-- Begin Page Content -->
				<div class="container-fluid" style="width: 85%">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">问题列表</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3"></div>
						<div class="card-body">
							<div class="table-responsive">
								<div class="input-group">
									<input type="text" max-width="300px" class="form-control"
										placeholder="输入关键字" id="filterName" name="filterName">
									<span class="search btn btn-info" style="width: 120px">搜索</span>
								</div>


								<table class="table table-bordered" width="100%" cellspacing="0"
									id="cs_table">
									<thead>
										<tr>
											<th>问题内容</th>
											<th>回答数量</th>
											<th>收藏数量</th>
											<th>问题类型</th>
											<th>发布时间</th>
											<th style="padding: 10px; width: 25%">操作</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>问题内容</th>
											<th>回答数量</th>
											<th>收藏数量</th>
											<th>问题类型</th>
											<th>发布时间</th>
											<th style="padding: 10px; width: 25%">操作</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach var="Q" items="${AllQues}">
											<tr>

												<c:if test="${Q.isTop eq 1}">
													<td align="center" title="${Q.quesText}"
														style="max-width: 250px; background-color: #FFFF66; overflow: hidden; text-overflow: ellipsis; white-space: nowrap">
														<a href="<%=path%>/ViewQuesAnswer?q_id=${Q.quesId}">
															${Q.quesText}</a>
													</td>
												</c:if>
												<c:if test="${Q.isTop eq 0}">
													<td align="center" title="${Q.quesText}"
														style="max-width: 250px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap">
														<a href="<%=path%>/ViewQuesAnswer?q_id=${Q.quesId}">
															${Q.quesText}</a>
													</td>
												</c:if>

												<td>${Q.follow}</td>
												<td>${Q.starNum}</td>
												<td>${Q.category}</td>
												<td>${Q.subTime}</td>
												<td style="padding: 10px; width: 5%">
													<%
														request.setAttribute("is_col", 0);
													%> <c:forEach var="i" items="${col_ques}">

														<c:set var="queid" value="${Q.quesId}" scope="session" />
														<c:set var="i" value="${i}" scope="session" />
														<%
															int i = (int) request.getSession().getAttribute("i");
																	int queId = (int) request.getSession().getAttribute("queid");
																	if (i == queId) {
																		request.setAttribute("is_col", 1);
																	}
														%>
													</c:forEach> <c:choose>
														<c:when test="${is_col eq 0}">
															<a href="#" class="btn btn-default btn-icon-split"> <span
																class="icon text-white-50"> <i
																	class="fas fa-heart"></i>
															</span> <span class="text">收藏</span>
															</a>
														</c:when>
														<c:when test="${is_col eq 1}">
															<a href="#" class="btn btn-danger btn-icon-split"> <span
																class="icon text-white-50"> <i
																	class="fas fa-heart"></i>
															</span> <span class="text">收藏</span>
															</a>
														</c:when>
													</c:choose>


												</td>
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
				<div class="modal-body">确定要退出吗？退出将关闭当前会话</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">取消</button>
					<a class="btn btn-primary" href="<%=path%>/UserLogoutServlet">退出</a>
				</div>
			</div>
		</div>
	</div>

	<!-- ---------------------------------登录的模态框--------------------------- -->
	<div class="modal fade" id="LoginModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!--登陆框头部-->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">欢迎登陆！</h4>
				</div>
				<!--登陆框中间部分(form表单)-->
				<div class="modal-body">
					<form class="form-horizontal" role="form" method="post"
						action="UserLoginServlet"  onsubmit="return testPwd()">
						<!--用户框-->
						<div class="form-group">
							<label for="username" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="uid"
									placeholder="请输入您的邮箱账号"
									pattern="^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$"
									required="required">
							</div>
						</div>
						<!--密码框-->
						<div class="form-group">
							<label for="password" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="password"
									name="pwd" placeholder="请输入6-14位不含特殊字符的密码"
									pattern="[a-zA-Z0-9_-]+" maxlength="14" required="required"
									>
							</div>
						</div>
						<!--登陆按钮-->
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-info">登录</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- ---------------------------------登录的模态框--------------------------- -->

	<!-- ---------------------------------注册的模态框--------------------------- -->
	<div class="modal fade" id="RegisterModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel2" aria-hidden="true"
		data-backdrop="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!--注册框头部-->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">欢迎注册！</h4>
				</div>
				<!--注册框中间部分(form表单)-->
				<div class="modal-body">
					<form class="form-horizontal" role="form" method="post"
						action="UserRegisterServlet"  onsubmit="return testPwd2()">
						<!--用户框-->
						<div class="form-group">
							<label for="username" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="username" name="uid"
									placeholder="请输入您的邮箱账号"
									pattern="^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$"
									required="required">
							</div>
						</div>
						<!--密码框-->
						<div class="form-group">
							<label for="password" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="password2"
									name="pwd" placeholder="请输入6-14位不含特殊字符的密码"
									pattern="[a-zA-Z0-9_-]+" maxlength="14" required="required"
									>
							</div>
						</div>
						<!--注册按钮-->
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-info">注册</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- ---------------------------------注册的模态框--------------------------- -->

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

	<script language="JavaScript" type="text/javascript">
		function testPwd() {
			str = document.getElementById('password').value
			if (str.length < 6) {
				alert('密码不能小于六位');
				return false;
			}
		}
		function testPwd2() {
			str = document.getElementById('password2').value
			if (str.length < 6) {
				alert('密码不能小于六位');
				return false;
			}
		}
		$(function() {
			$('.search').on('click', function() {
				// console.log($('#filterName').val());
				$('table tbody tr').hide().filter(":contains('" + ($('#filterName').val()) + "')").show();
			})
		})

		window.onload = function() {
			goPage(1, 5);
		};
	</script>
</body>
</html>