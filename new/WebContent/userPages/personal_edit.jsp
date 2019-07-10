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
 <script type="text/javascript" src="jquery-3.2.1.min.js"></script>
	<link href="<%=path%>/userFriend/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<!-- Custom styles for this template-->
	<link href="<%=path%>/userFriend/css/sb-admin-2.min.css" rel="stylesheet"> 
  	<link href="userFriend/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<style type="text/css">
table {
	float: left;
	width: 90%;
	height: 50px;
	margin-top: 50px;
	line-height: 20px;
	border-radius: 10px;
	background-color: rgba(255, 255, 255, 1);
	text-align: center;
	border-collapse: separate;
	border: 2px solid rgba(54, 53, 54, 1);
}

thead {
	height: 56px;
	width: 86px;
	height: 40px;
	line-height: 26px;
	color: rgba(54, 53, 54, 1);
	font-size: 25px;
	font-weight: bold;
	text-align: center;
}

table tr th, table tr td {
	border-right: 1px solid #555555;
	border-bottom: 1px solid #555555;
	padding: 15px;
}

tbody tr {
	height: 50px;
}

button {
	width: 80px;
	height: 30px;
}

input#text {
	border: none;
	box-shadow: none;
}
</style>
</head>
<body id="page-top" style="background:#f8f9fc;margin-bottom:10%">
<script type="text/javascript">
 	$(document).ready(function(){
 		$("button.topp4").click(function hhh(){
 			//alert("hhh");
 			var dom = $(this).parent().prev().children();
 			var id = $(this).attr("id");
 			var text =dom.val();//选中的文本
 			var length = text.length;
 			if(length < 255){
 	 			$.ajax({
 	 				url:"<%=path%>/textUpdate",
 	 				type:"POST",
 	 				dataType : "json",
 	 				contentType : "application/x-www-form-urlencoded; charset=utf-8",
 	 				data : {
 	 					id : id,
 	 					text : text
 	 				},
 	 				success:function(data){
 	 					if(data.code = "success"){
 	 						alert("保存成功");
 	 						//dom.val(data.text);
 	 					}else{
 	 						alert("保存失败");
 	 						//dom.val(data.text);
 	 					}
 	 				}
 	 				
 	 			});  				
 			}else{
 				alert("自述应小于255个字符");
 			}
 		    //alert(typeof(ival));
	 			
 		});
 		$("a#logout").click(function (){
 			$.ajax({
 				type:"GET",
 				url:"/IAsk/logout",
 				dataType:"json",
 				success:function(data){
 					if(data.code == "success"){
 						alert("退出成功");
 						window.location.href = "index.jsp";
 					}else{
 						alert("退出失败");
 					}
 				}
 			});
 		});
 		$("button.topp3").click(function hhh(){
 			//alert("hhh");
 			var dom = $(this).parent().prev().children();
 			var id = $(this).attr("id");
 			var text =dom.val();//选中的文本
 		    var length = text.length;
 			if(length <= 255){
 				$.ajax({
 	 				url:"<%=path%>/nicknameUpdate",
 	 				type:"POST",
 	 				dataType : "json",
 	 				contentType : "application/x-www-form-urlencoded; charset=utf-8",
 	 				data : {
 	 					id : id,
 	 					text : text
 	 				},
 	 				success:function(data){
 	 					if(data.code = "success"){
 	 						alert("保存成功");
 	 						//dom.val(data.text);
 	 					}else{
 	 						alert("保存失败");
 	 						//dom.val(data.text);
 	 					}
 	 				}
 	 				
 	 			}); 	 		
 			}else{
 				alert("昵称小于255个字符");
 			}
 			//alert(typeof(ival));
 				
 		});
 		$("button.topp2").click(function hhh(){
 			//alert("hhh");
 			var dom = $(this).parent().prev().children();
 			var id = $(this).attr("id");
 			var val =dom.val();//选中的文本
 			var r = /^\+?[1-9][0-9]*$/;//判断是否为正整数 
 		    if(r.test(val)){
 	 			$.ajax({
 	 				url:"<%=path%>/ageUpdate",
 	 				type:"POST",
 	 				dataType : "json",
 	 				contentType : "application/x-www-form-urlencoded; charset=utf-8",
 	 				data : {
 	 					id : id,
 	 					text : val
 	 				},
 	 				success:function(data){
 	 					if(data.code = "success"){
 	 						alert("保存成功");
 	 						//dom.val(data.text);
 	 					}else{
 	 						alert("保存失败");
 	 						//dom.val(data.text);
 	 					}
 	 				}
 	 				
 	 			}); 		        
 		    } else{
 		        alert(val +"不是数字");
 		    }
 			
 		});
 		
 		$("button.toppp").click(function hhh(){
 			//alert("hhh");
 			var dom = $(this).parent().prev().children();
 			var id = $(this).attr("id");
 			var text = dom.val();
			alert(text);
 	 		$.ajax({
 	 			url:"<%=path%>/sexUpdate",
 	 			type:"POST",
 	 			dataType : "json",
 	 			contentType : "application/x-www-form-urlencoded; charset=utf-8",
 	 			data : {
 	 				id : id,
 	 				text : text
 	 			},
 	 			success:function(data){
 	 				if(data.code = "success"){
 	 					alert("保存成功");
 	 					//dom.val(data.text);
 	 				}else{
 	 					alert("保存失败");
 	 					//dom.val(data.text);
 	 				}
 	 			}
 	 			
 	 		});
 		});
 		
 		$("button.topp").click(function(){
 			var dom = $(this).parent().prev().children();
 			var id = $(this).attr("id");
 			var text = dom.val();
 			dom.val(text);
 			if(text.length <= 50){
 	 			$.ajax({
 	 				url:"<%=path%>/schoolUpdate",
					type : "POST",
					dataType : "json",
					contentType : "application/x-www-form-urlencoded; charset=utf-8",
					data : {
						id : id,
						text : text
						},
					success : function(data) {
							if (data.code = "success") {
								alert("保存成功");
								dom.val(data.text);
							} else {
								alert("保存失败");
								dom.val(data.text);
							}
					}
				});
			} else {
				alert("学校名称应小于50个字符");
			}

			});

							$("#t1").click(function() {
								$("#tag1").show();
								$("#tag2").hide();
							});

							$("#t2").click(function() {
								$("#tag2").show();
								$("#tag1").hide();
							});
						});
	</script>
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
          <h1 class="h3 mb-0 text-gray-800">个人信息</h1>
          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" action="SearchQuse">
            <div class="input-group">
              <input name="keys" type="text" class="form-control bg-light border-0 small" placeholder="请输入关键字" aria-label="Search" aria-describedby="basic-addon2">
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
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search" action="SearchQuse">
                  <div class="input-group">
                    <input name="keys" type="text" class="form-control bg-light border-0 small" placeholder="请输入关键词" aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="submit">
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
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"></span>
                <img class="img-profile rounded-circle" src="images/tou.JPG">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
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
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">个人信息修改</h1>
		  
          <!-- DataTales Example -->

          			<table>
				<thead>
					<tr>
						<td>信息</td>
						<td>更改</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="Q" items="${QuesUserAll}">
						<tr>
							<td>昵称</td>
							<td><input type="text" name="text" id="text"
								style="padding-right: 10px;" value="${Q.nickname}" /></td>
							<td style="padding: 10px;">
								<button class="topp3" onclick="hhh(this)" id="${Q.usrId}">保存</button>
							</td>
						</tr>
						<tr>
							<td>学校</td>
							<td><input type="text" name="text" id="text"
								style="padding-right: 10px;" value="${Q.school}" /></td>
							<td style="padding: 10px;">
								<button class="topp" onclick="top(this)" id="${Q.usrId}">保存</button>
							</td>
						</tr>
						<tr>
							<td>性别</td>
							<td><c:if test="${Q.sex==-1}">
									<div style="padding-right: 10px;">
										<select id="sexSelect">
											<option value="Male">Male</option>
											<option value="Female">Female</option>
										</select>
									</div>
								</c:if> <c:if test="${Q.sex==1}">
									<div style="padding-right: 10px;">
										<select id="sexSelect" style="padding-right: 10px;">
											<option value="Female">Female</option>
											<option value="Male">Male</option>
										</select>
									</div>
								</c:if></td>
							<td style="padding: 10px;">
								<button class="toppp" onclick="hhh(this)" id="${Q.usrId}">保存</button>
							</td>
						</tr>
						<tr>
							<td>年龄</td>
							<td><input type="text" name="age"
								style="padding-right: 10px;" value="${Q.age }" /></td>
							<td style="padding: 10px;">
								<button class="topp2" onclick="hhh(this)" id="${Q.usrId}">保存</button>
							</td>
						</tr>
						<tr>
							<td>自述</td>
							<td><input type="text" name="text" id="text"
								style="padding-right: 10px;" value="${Q.text}" /></td>
							<td style="padding: 10px;">
								<button class="topp4" onclick="hhh(this)" id="${Q.usrId}">保存</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer" style="background-color:rgba(28,200,138,.5);position:fixed; left:0px; bottom:0px; width:100%;z-index:100">
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

  <!-- Page level plugins -->
  <script src="userFriend/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="userFriend/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="userFriend/js/demo/datatables-demo.js"></script>

</body>
</html>