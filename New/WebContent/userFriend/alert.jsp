<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
+ path + "/"; %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=path %>/bootstrap3.3.7/css/bootstrap.min.css">
<script type="text/javascript"
	src="<%=path %>/bootstrap3.3.7/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="<%=path %>/bootstrap3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="refresh" content="3;url=${jumpUrl}">
</head>
<body>
	<div class="alert alert-warning">
		<a href="<%=basePath %>${jumpUrl}" class="close" data-dismiss="alert">
			&times; </a> <strong>您好！</strong>${alertInfo},三秒后自动跳转，未跳转请点击<a
			href="<%=basePath %>${jumpUrl}">这里</a>
	</div>
</body>
</html>