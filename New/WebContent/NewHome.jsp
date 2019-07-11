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
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="0">
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
<body" id="page-top"
	style="margin-bottom: 10%; overflow: scroll; overflow: hidden"
	onunload="window.onbeforeunload()">
	<script type="text/javascript">
		//处理键盘事件  
		function doKey(e) {
			var ev = e || window.event;//获取event对象  
			var obj = ev.target || ev.srcElement;//获取事件源  
			var t = obj.type || obj.getAttribute('type');//获取事件源类型  
			if (ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea") {
				return false;
			}
		}
		//禁止后退键 作用于Firefox、Opera  
		document.onkeypress = doKey;
		//禁止后退键  作用于IE、Chrome  
		document.onkeydown = doKey;
		
		window.onload=(function(){
			var stat = "<%=session.getAttribute("stat_flush")%>";
			if(stat == 1){
				<% session.setAttribute("stat_flush",0);%>
				location.reload;
				console.log("刷新~");
			}
			
		});
	</script>
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

				<!-- Only required for left/right tabs -->


				<!--  -->
				<div class="carousel slide" id="demo" data-ride="carousel">
					<ul class="carousel-indicators">
						<li data-slide-to="0" data-target="#demo"></li>
						<li data-slide-to="1" data-target="#demo"></li>
						<li data-slide-to="2" data-target="#demo"></li>
					</ul>
					<div class="carousel-inner">

						<div class="carousel-item active">
							<img alt="" src="images/1.jpg" />
							<div class="carousel-caption">
								<h4>学习</h4>
								<p>SQL注入产生的原因和威胁是什么？</p>
							</div>

						</div>


						<div class="carousel-item">
							<img alt="" src="images/2.jpg" />
							<div class="carousel-caption">
								<h4>每日一句</h4>
								<p>不知则问，不能则学，虽能不让，然后为德。闻之不见，虽博必谬；见之而不知，虽识不妄；知之而不行，虽敦必困。 ——
									荀况</p>
							</div>

						</div>


						<div class="carousel-item">
							<img alt="" src="images/3.jpg" />
							<div class="carousel-caption">
								<h4>生活</h4>
								<p>现实中的自行车比赛破风手和《破风》中的彭于晏的区别是怎样的？</p>
							</div>

						</div>


					</div>
					<!-- 左右切换按钮 -->
					<a class="carousel-control-prev" href="#demo" data-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</a> <a class="carousel-control-next" href="#demo" data-slide="next">
						<span class="carousel-control-next-icon"></span>
					</a>
				</div>
				<!--  -->
				<div align="center">
					<h2></h2>
				</div>

				<div align="center">
					<a class="btn btn-info btn-lg" height="160px" width="360px"
						href="GoIntoBBS">
						<h2>进入论坛</h2>
					</a>
				</div>

				<div class="tab-pane" id="panel-915052" contenteditable="true">
					<!-- Begin Page Content -->
					<div class="container-fluid" style="width: 85%">



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
					aria-labelledby="myModalLabel" aria-hidden="true"
					data-backdrop="true">
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
									action="UserLoginServlet" onsubmit="return testPwd()">
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
												pattern="[a-zA-Z0-9_-]+" maxlength="14" required="required">
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
				<div class="modal fade" id="RegisterModal" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true"
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
									action="UserRegisterServlet" onsubmit="return testPwd2()">
									<!--用户框-->
									<div class="form-group">
										<label for="username" class="col-sm-2 control-label">邮箱</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="username"
												name="uid" placeholder="请输入您的邮箱账号"
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
												pattern="[a-zA-Z0-9_-]+" maxlength="14" required="required">
										</div>
									</div>
									<!--注册登、按钮-->
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
				<script
					src="userFriend/vendor/datatables/dataTables.bootstrap4.min.js"></script>

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
						if (window.history && window.history.pushState) {
							$(window).on('popstate', function() {
								window.history.pushState('forward', null, '#');
								window.history.forward(1);
							});
						}
						window.history.pushState('forward', null, '#'); //在IE中必须得有这两行
						window.history.forward(1);
					})
				</script>
</body>
</html>