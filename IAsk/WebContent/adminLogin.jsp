<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<style type="text/css">
  html{
    background-image:url("images/background.jpg");
    background-size:1920px 1080px;
  }
  .content{
    text-align: center;
    background-color:rgba(255,255,255,0.5);
    border-radius: 20px;
    width: 300px;
    height: 300px;
    margin: auto;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
  }
</style>
</head>
<body>
  <div class="content">
    <form action="AdminLoginServlet" name="" method="post">
      <h2 style="font-size:180%" align=center>管理员账户登录</h2>
      <br>
      <table  align=center>
	    <tr><td style="font-size:130%;font-family:KaiTi" align=right>账号：</td><td><input style="width:170px;height:20px; border:0;border-radius:5px; " type=text name="id"></td></tr>
	    <tr><td></td></tr>
	    <tr><td></td></tr>
	    <tr><td></td></tr>
	    <tr><td></td></tr>
	    <tr><td style="font-size:130%;font-family:KaiTi" align=right>密码：</td><td><input style="width:170px;height:20px; border:0;border-radius:5px; " type=password name="password"></td></tr>	
	    <tr><td></td></tr>
	    <tr><td></td></tr>
	    <tr><td></td></tr>
	    <tr><td></td></tr>
	    <tr><td></td></tr>
	    <tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
	    <tr><td colspan=2 align=center>	<input type="submit" value="登  录" style="width:250px;height:30px;background:SkyBlue;border:0px;font-size:135%;font-family:KaiTi"></td></tr>		
	  </table>								
	  <br>
    </form>
  </div>
</body>
</html>
