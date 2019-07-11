<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Admin Home Page</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 
<!-- 可选的Bootstrap主题文件（一般不使用） -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>
 
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
 
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="jumbotron text-center"
		style="margin-top: 0%; margin-bottom: 0%; padding-bottom: 0%; padding-top: 0%;background-color: #222222">
		<div class="row">
            <div class="col-lg-6">
                <h1 ><img src="images/answerProfile.jpg" style="width: 7%; height:7%" /><font color="#FFFFFF"size="15px" >爱问平台</font></h1>
                <p><font color="#9d9d9d" size="4px">您的个性化问答平台。 <strong>: )</strong></span></font>
                <br>
            	</p>
            </div>
            <div class="col-lg-3 col-lg-offset-3">
            <br><br>
            <c:if test="${not empty param.username}"><p><font color="#FFFFFF" size="4px">欢迎,${param.username}</font></p></c:if>
            <c:if test="${empty param.username}"><p><font color="#FFFFFF" size="4px">欢迎您!想使用更多功能请登录</font></p></c:if>
            
            <p><font color="#9d9d9d" size="4px">北京时间:<lable id="welcome_time2" class="welcome-time  hidden-sm hidden-xs" style="color:#FFFFFF"/>
            
            <script type="text/javascript">
						Date.prototype.toLocaleString = function() {
  						return this.getFullYear() + "-" + (this.getMonth() + 1) + "-" + this.getDate() + " " + this.getHours() + ":" + this.getMinutes() + ":" + this.getSeconds() + "";
						};
                        </script>	 
                        <script type="text/javascript">
                            setInterval("welcome_time2.innerHTML=new Date().toLocaleString() + ''.charAt(new Date().getDay());",1000);
                        </script>
                    </font>
            </p>
            </div>
        </div>
	</div>
</body>
</html>