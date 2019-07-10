<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="/New/UpdateAnswer" method="post" accept-charset="utf-8" onsubmit="document.charset='utf-8';">
		问题ID：<input type="text" name="q_id" value=<%=request.getParameter("q_id")%> readonly="readonly">
		<br>
		<br>
		
		用户ID：<input type="text" name="u_id" value=<%=request.getParameter("u_id")%> readonly="readonly">
		<br>
		<br>
		
		回答内容：<br>
		<input type="text" name="update_text" value=<%=request.getParameter("a_tx")%> style="width:300px;height:150px;">
		<br><br>
		<input type="submit" value="提交修改">
		</form>
	</div>
</body>
</html>