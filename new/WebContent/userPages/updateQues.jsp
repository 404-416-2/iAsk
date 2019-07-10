<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="/New/UpdateQues" method="post" accept-charset="utf-8" onsubmit="document.charset='utf-8';">
		问题ID：<input type="text" name="q_id" value=<%=request.getParameter("q_id")%> readonly="readonly"/>
		<br>
		<br>
		
		用户ID：<input type="text" name="u_id" value=<%=request.getParameter("u_id")%> readonly="readonly"/>
		<br>
		<br>
		
		问题内容：<br>
		<input onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')" 
				onpaste="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')" 
				oncontextmenu = "value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"
				type="text" name="update_text" value=<%=request.getParameter("q_tx")%> style="width:300px;height:150px;"/>
		<br><br>
		
		问题类别：<input onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')" 
						onpaste="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')" 
						oncontextmenu = "value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"
					type="text" name="cate" value=<%=request.getParameter("cate")%> />
		<br>
		<br>
		
		<input type="submit" value="提交修改"/>
		</form>
	</div>
</body>
</html>