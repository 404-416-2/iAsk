<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description"content="Basic HTML5 App generated by MyEclipse Mobile Tools" />
 <!--引入jquery-->
 <script type="text/javascript" src="jquery-3.2.1.min.js"></script>
 <script type="text/javascript" src="./layer/layer.js"></script>

	<style>
	.part
	{
		font-size: 20px;
		width:380px;
		height: 30px;
		margin-left: 10px;
		margin-top: 40px;
	}
	.submit
	{
		width: 140px;
		height: 40px;
		font-size: 13px;
		color: white;
		background-color: #cc3300;
		border: none;
		border-radius: 5px;
		margin-left: 120px;
		margin-top: 50px;
	}
</style>
</head>
<body>
<div style="margin-top: 70px;">
<form id="loginF" action="/new/login">
<div id="part" class="part"> <h>用户名</h><input id="id" name="id" style="height: 28px;width: 263px;margin-left: 10px;"></input></div>
<div id="" class="part"> <h>密码</h><input id="psd" name="pwd" type="password" style="height: 28px;width: 263px;margin-left: 30px;"></input></div>
<div style="margin-left: 260px;margin-top: 40px;"></div>
<input type="submit" class="submit" id="subm" value="登陆">
</form>
</div>
<script type="text/javascript">
	// $(document).ready(function(){
	// 	$("#subm").click(function(event) {
	// 		var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
	// 	parent.layer.close(index); //再执行关闭        
	// 	})
		
	// });

	function form_confirm()
{
    var id=document.getElementById("id").value
    var psd=document.getElementById("psd").value
     var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
     if((!myreg.test(id))
     {
     	alert('用户名请输入有效的邮箱！');
		return false;
     }
    if(psd.length<6)
    {
        alert("密码长度不能小于6位");
        return false; 
    }
    if(psd.length>14)
    {
        alert("密码长度不能大于14位");
        return false; 
    }
}
</script>
</body>
</html>