<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>IAsk</title>
<link rel="shortcut icon" href="images/answerProfile.jpg">

<script src="zhyyao/js/bootstrap-select.js"></script>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 
<!-- 可选的Bootstrap主题文件（一般不使用） -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>
 
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
 
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="zhyyao/css/animate.css">
<link rel="stylesheet" href="zhyyao/css/reader.css" />
<link rel="stylesheet" href="zhyyao/css/bootstrap-select.css">
<link rel="stylesheet" href="zhyyao/css/JobDemand.css">
</head>
<body class="style">
	<jsp:include page="welcome.jsp">
		<jsp:param value="${sessionScope.uid}"
			name="username" />
	</jsp:include>
	<nav class="navbar navbar-default  navbar-inverse" role="navigation"
		style="margin-top: 0%; margin-bottom: 0%; padding-bottom: 0%; padding-top: 0%">
		<div class="navbar-header nav-tabs " style="position: absolute">
			<a href="searchJobDemand.do"><img src="img/logo.png"
				class="navbar-brand" style="padding-right: 0%" /> <span
				class="navbar-brand " style="margin-left: 0%; padding-left: 0%">IAsk welcome you</span></a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a class="dropdown-toggle" href="#"
				data-toggle="dropdown">用户 ${sessionScope.uid}</a>
					<ul class="dropdown-menu">
						<c:if test="${sessionScope.uid eq null }">
							<li><a href="userPages/login.jsp"><span
									class="glyphicon glyphicon-log-out"
									style="color: rgb(255, 140, 60);"></span>登录</a></li>
						</c:if>
						<c:if test="${sessionScope.uid ne null }">

							<!--添加连接-->
							<li><a href="applicantHome.do"><span class="glyphicon glyphicon-user" style="color: rgb(255, 140, 60);"> </span>个人中心</a>
							<li><a href="applicantLogout.do"><span
									class="glyphicon glyphicon-log-out"
									style="color: rgb(255, 140, 60);"></span> 退出登录</a></li>
							<li><a href="<%=path%>/ViewUsrAnswer" style="color: rgb(255, 140, 60);">回答管理</a>
							<li><a href="<%=path%>/ViewUsrQues" style="color: rgb(255, 140, 60);">提问管理</a>
							</li>
						</c:if>
					</ul></li>
			</ul>
		</div>
	</nav>
	<br>
	<br>
	<div class="container">
		<div class="row">
		<div class="panel panel-default col-lg-12">
				<div class="form-group">
					<form role="search" action="searchJobDemand.do" method="GET">

						<div class="input-group searchrow">
							<input type="text" name="search_s" class="form-control "
								placeholder="请输入关键字" value="${sessionScope.search_word }">
							<div class="input-group-btn">
								<button class="btn-gradient blue small" type="submit">搜索</button>
							</div>
						</div>
					</form>
				</div>
				<form action="filtJobDemand.do" method="post">
				<label for="type">职位：</label>

				<c:forEach var="type" items="${IndustryType}">
					<input name="type" type="submit" class="btn-gradient blue mini"
						value="${type }">
				</c:forEach>

				<hr>
				<label for="Region">工作地点：</label>

				<c:forEach var="region" items="${Region }">
					<input name="region" type="submit" class="btn-gradient blue mini"
						value="${region }">
				</c:forEach>
			</form>
			<hr>
			<c:if test="${sessionScope.type_r ne null }">
			<label class="btn-gradient cyan mini" >${sessionScope.type_r } <a href="deleteTag.do?delete=1" style="color: rgb(255, 255, 255);"> <span class="glyphicon glyphicon-remove"></span></a></label>
			</c:if>
			<c:if test="${sessionScope.region_r ne null}">
			<label class="btn-gradient cyan mini">${sessionScope.region_r }<a href="deleteTag.do?delete=2" style="color: rgb(255, 255, 255);"> <span class="glyphicon glyphicon-remove"></span></a></label>
			</c:if>		
			</div>
		</div>

		<c:forEach var="question" items="${sessionScope.qslist }"
			varStatus="qsLoopCount">
			<div class="row">
				<div class="list-group">
					<a href="#" class="list-group-item active">
						<h4 class="list-group-item-heading">${qsLoopCount.count}.
							${question.quesId }</h4>
					</a> 
						<h4 class="list-group-item-heading">
							${question.quesText }
						</h4>
						<hr>
						<h4 class="list-group-item-heading">
							<label>学校：</label>${question.school }
						</h4>
						<h4 class="list-group-item-heading">
							<label>点击量：</label>${question.starNum }
						</h4>
					</a>
				</div>



			</div>
		</c:forEach>
		<script>
			function createOptions(number) {
				var options = [], _options;

				for (var i = 0; i < number; i++) {
					var option = '<option value="' + i + '">Option ' + i
							+ '</option>';
					options.push(option);
				}

				_options = options.join('');

				$('#number')[0].innerHTML = _options;
				$('#number-multiple')[0].innerHTML = _options;
				$('#number2')[0].innerHTML = _options;
				$('#number2-multiple')[0].innerHTML = _options;
			}

			function fixLogical() {
				var mySelect = $('#ops');
				op = document.getElementById("ops");
				//default as op[0]
				if (!op[0].selected && !op[1].selected && !op[2].selected
						&& !op[3].selected) {
					op[0].selected = true;
				}
				var multisearch = op[1].selected || op[2].selected
						|| op[3].selected;
				if (op[0].selected && multisearch) {
					op[0].selected = false;
				}
				var allsearch = op[1].selected && op[2].selected
						&& op[3].selected;
				if (!op[0].selected && allsearch) {
					op[0].selected = true;
					op[1].selected = false;
					op[2].selected = false;
					op[3].selected = false;
				}
				mySelect.selectpicker('refresh');
			}

			var mySelect = $('#first-disabled2');
			createOptions(4000);

			$('#basic2').selectpicker({
				liveSearch : true,
				maxOptions : 1
			});
		</script>
		<script>
			function Paging(index) {
				var RankInfo = document.getElementById('record');
				var totalPage = RankInfo.rows.length; //总条数
				var pageSize = 15;//每页显示条数
				var pageNumber = Math.ceil(totalPage / pageSize); //总页数
				var currentPage = index;//当前页数
				var start_row = (currentPage - 1) * pageSize;//开始显示的行
				var end_row = currentPage * pageSize;//结束显示的行
				end_row = (end_row > totalPage) ? totalPage : end_row;
				for (var i = 0; i < totalPage; i++) {
					var irow = RankInfo.rows[i];
					if (i >= start_row && i < end_row) {
						irow.style.display = 'table-row';
					} else {
						irow.style.display = 'none';
					}
				}
				var pageHTML = '';
				pageHTML += "<ul class=\"pager\" >\n<li><a class='p_first' href='javascript:Paging(1)'>First Page</a></li>\n";
				var up = parseInt(currentPage) - 1;
				if (up < 1) {
					up = 1;
				}

				pageHTML += "<li><a class='p_prev' href=\"javascript:Paging("
						+ up + ")\">&laquo;</a> </li>";
				pageHTML += "<span>" + currentPage + "/" + pageNumber
						+ "</span>";

				var next = parseInt(currentPage) + 1;
				if (next > pageNumber) {
					next = pageNumber;
				}
				pageHTML += "<li><a class='p_next js_page' href=\"javascript:Paging("
						+ next + ")\">&raquo;</a> </li>";
				pageHTML += "<li><a  class='p_last js_page' href=\"javascript:Paging("
						+ pageNumber + ")\">End Page</a></li> </ul>";
				if (totalPage != 0) {
					$("#page").html(pageHTML);
				}
			}
			Paging(1);
		</script>

	</div>

	<jsp:include page="footer.jsp"/>
</body>

<script type="text/javascript">
	$('.dropdown-toggle').dropdown();
</script>
</html>
