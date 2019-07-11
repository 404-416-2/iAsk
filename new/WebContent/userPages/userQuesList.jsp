<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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
<title>question page</title>
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
				<h1 class="h3 mb-0 text-gray-800">问题管理</h1>
				<!-- Sidebar Toggle (Topbar) -->
				<button id="sidebarToggleTop"
					class="btn btn-link d-md-none rounded-circle mr-3">
					<i class="fa fa-bars"></i>
				</button>

				<!-- Topbar Navbar -->
				<ul class="navbar-nav ml-auto">

					<!-- Nav Item - Search Dropdown (Visible Only XS) -->
<%-- 					<li class="nav-item dropdown no-arrow d-sm-none"><a
						class="nav-link dropdown-toggle" href="#" id="searchDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
					</a> <!-- Dropdown - Messages -->
						<div
							class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
							aria-labelledby="searchDropdown">
							<form class="form-inline mr-auto w-100 navbar-search"
								action="QuestionSearchServlet">
								<div class="input-group">
									<input 	name="id" type="text"
													onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"
													onpaste="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"
													oncontextmenu = "value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5\（\）\《\》\——\；\，\。\“\”\<\>\！]/g,'')"
													class="form-control bg-light border-0 small"
													placeholder="请输入关键词"
													aria-label="Search"
													aria-describedby="basic-addon2">
									<div class="input-group-append">
										<button class="btn btn-primary" type="submit">
											<i class="fas fa-search fa-sm"></i>
										</button>
									</div>
								</div>
							</form>
						</div></li> --%>


					<div class="topbar-divider d-none d-sm-block"></div>

					<!-- Nav Item - User Information -->
					<li class="nav-item dropdown no-arrow"><a
						class="nav-link dropdown-toggle" href="#" id="userDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <span
							class="mr-2 d-none d-lg-inline text-gray-600 small">您好，${nickname}</span>
					</a> <!-- Dropdown - User Information -->
					<!-- Nav Item - User Information -->
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
						</ul></li></li>

				</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid" style="width:85%">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">问题列表</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">您提过的问题</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
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
										<c:forEach var="Q" items="${usrAllQues}">
											<tr>
												<td align="center" title="${Q.quesText}" style="max-width: 100px;
														overflow: hidden;	text-overflow: ellipsis; white-space: nowrap">
														<a onclick="return checkLogin()" href="<%=path%>/ViewQuesAnswer?q_id=${Q.quesId}" >
													  ${Q.quesText} </a></td>
												<td>${Q.follow}</td>
												<td>${Q.starNum}</td>
												<td>${Q.category}</td>
												<td>${Q.subTime}</td>
												<td style="padding: 10px; width: 25%">
													<a  class="btn btn-danger btn-icon-split"
														data-toggle="modal" data-target="#myModal" 
														data-qid="${Q.quesId}" data-uid="${Q.usrId}"
														onclick="return checkLogin()">
														<span class="icon text-white-50"> 
															<i class="fas fa-trash"></i>
														</span> 
														<span class="text">删除</span>
													</a>
													<a  href="userPages/updateQues.jsp?q_id=${Q.quesId}&u_id=${Q.usrId}&q_tx=${Q.quesText}&cate=${Q.category}"
														class="btn btn-info btn-icon-split"
														onclick="return checkLogin()">
														<span class="icon text-white-50"> 
															<i class="fas fa-edit"></i>
														</span> 
														<span class="text">编辑</span>
													</a>
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
	
		<form method="get" action="deleteQues" class="form-horizontal"
		  role="form" id="myForm" onsubmit="return ">
		<div class="modal fade" id="myModal" tabindex="-1"
			 role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<!--  定义模态框，过渡效果为淡入，id为myModal,tabindex=-1可以禁用使用tab切换，aria-labelledby用于引用模态框的标题，aria-hidden=true保持模态框在触发前窗口不可见  -->
			<div class="modal-dialog">
			<!--  显示模态框对话框模型（若不写下一个div则没有颜色）  -->
				<div class="modal-content">
				<!--  显示模态框白色背景，所有内容都写在这个div里面  -->

					<div class="btn-info modal-header">
					<!--  模态框标题  -->
						<button type="button" class="close" data-dismiss="modal">&times;</button>
							<!--  关闭按钮  -->
								<h4>是否删除该问题？</h4>
								<!--  标题内容  -->
					</div>

					<div class="modal-body">
					<!--  模态框内容，我在此处添加一个表单 -->
						<form class="form-horizontal" role="form">
							<br> 对应问题ID为: 
							<input type="text" name="q_id" style="width: 50px;" 
								   class="form-control well" id="qid_del"/> 
							<br> 您的用户ID为: 
							<input type="text" name="u_id" style="width: 300px;"
								   class="form-control well" id="uid_del"/>
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


	<script>
		$("#myModal").on("show.bs.modal", function(event){
			var qid = $(event.relatedTarget).data("qid");
			var uid = $(event.relatedTarget).data("uid");
			$('#qid_del').attr('value',qid);
			$('#uid_del').attr('value',uid);	
		});
		function checkLogin(){ 
		   　　var log_stat = "<%=session.getAttribute("uid")%>";
		   　　if (log_stat == null){
			   alert("please login first!");
			   console.log("gacha!");
			   return false;
		   　　}else{
			   console.log(log_stat);
			   return false;
		   　　}
		　　}
	</script>
　　

	
	

</body>
</html>
