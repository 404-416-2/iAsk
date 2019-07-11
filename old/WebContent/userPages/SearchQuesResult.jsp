<%@ page import="entity.*" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
String path = request.getContextPath();
//System.out.print(path);
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description"content="Basic HTML5 App generated by MyEclipse Mobile Tools" />
    <meta charset="utf-8">
	<script type="text/javascript" src="jquery-3.2.1.min.js"></script>
 <!--引入Bootstrap-->
 <link href="<%= path %>/bootstrap3.3.7/css/bootstrap.css" rel="stylesheet" >
 <script type="text/javascript" src="<%= path %>/bootstrap3.3.7/js/bootstrap.js" ></script>
<link href="<%= path %>/css/feed.css" rel="stylesheet" >
	<title>ad</title>
	<style type="text/css">
		
		  table
        {   
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
        thead
        {
            height:56px;
            width: 86px;
            height: 40px;
            line-height: 26px;
            color: rgba(54, 53, 54, 1);
            font-size: 25px;
            font-weight: bold;
            text-align: center;
          

        }
        table tr th,table tr td {
            border-right: 1px solid #555555 ;
            border-bottom: 1px solid #555555 ;
            padding: 15px;
}
        
        tbody tr{
        	height: 50px;
        }
        button
        {
        	width: 80px;
        	height: 30px;
        }
	</style>
</head>
<body>
<script type="text/javascript">

	 	$(document).ready(function(){
	 	$("#t1").click(function(){
	 		$("#tag1").show();
	 		$("#tag2").hide();
	 	});

	 
	 	$("#t2").click(function(){
	 		$("#tag2").show();
	 		$("#tag1").hide();
	 	});
});
</script>
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
<div class="header" id="header">
		<nav class="navbar" role="navigation"  style="height: 105px">
		   <div class="navbar-header" >
		      <img  class="tubiao" src="images/biao.jpg" width="100" height="100" alt="图标">
		   </div>
		   <div>
			  <div class="group">
			  <form action="SearchQues" name="" method="post">
					<input class="searchk" type="text" class="form-control" placeholder="请输入关键字" name="keys">
					<input type="submit" value="查找">
					<!--  <img class="searchk1" src="images/search.png" alt="搜索" width="30" height="30">-->
				
			</form>
				
				
				</div>
		      <div id="avatar" class="touxiang" class="nav nav-tabs">
					<div class="dropdown">
  						<img class="touxiang1" src="./images/tou.JPG" width="60" height="60" alt="头像">
	  					<div class="dropdown-content">
	    				<a href="<%=path%>/userQuesManagement">提问管理</a>
	    				<a href="<%=path%>/ViewUserAnswer">回答管理</a>
	    				<a href="<%=path%>/login.jsp">退出登录</a>
	  					</div>
					</div>

			  </div>
			  
		   </div>
		</nav>
	</div>
<div class=" tab-content " style="height: 900px;margin-top: 80px;background-color:white;width: 1170px; margin-left: 170px;">
		<div style="margin-left: 70px;">
			<table>
            <thead>
                <tr>
                	<td>问题ID</td>
                    <td>回答内容</td>
                    <td>回答时间</td>
                    <td>回答数量</td>
                    <td>收藏数量</td>
                    <td>是否置顶</td>
                    <td>问题类型</td>
                    <td>操作</td>
                </tr>
            </thead>
            <tbody>

            <c:forEach var="Q" items="${keyQues}">
            	<tr>
                 	<td>${Q.quesId}</td>
                	<td align="center"   title="${Q.quesText}"  style="max-width: 100px;overflow: hidden; text-overflow:ellipsis;white-space: nowrap">
                		${Q.quesText}</td>
                 	<td>${Q.subTime}</td>
                 	<td>${Q.follow}</td>
                 	<td>${Q.starNum}</td>
                 	<td>
                 		<c:if test="${Q.isTop > 0}">
                 			<p>是</p>
                 		</c:if>
                 		<c:if test="${Q.isTop < 1}">
                 			<p>否</p>
                 		</c:if>
                 	</td>
                 	<td>${Q.category}</td>
                 	<td style="padding: 10px;">
                    	<a href="deleteQues?q_id=${Q.quesId}&u_id=${Q.usrId}"><button class="delete" onclick="del(this)">删除</button></a>
                    	<a href="userPages/updateQues.jsp?q_id=${Q.quesId}&u_id=${Q.usrId}&q_tx=${Q.quesText}&cate=${Q.category}"><button class="update" >修改</button></a>
                 	</td>
            	</tr>
            </c:forEach>
            </tbody>
            </table>



		</div>
		
			</div>
</body>
</html>