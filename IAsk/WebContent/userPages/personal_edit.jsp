<%@ page import="entity.*" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
String path = request.getContextPath();
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
        input#text{
        	border:none;
        	box-shadow : none;
        }
	</style>
</head>
<body style="background-image: url(images/back.jpg)">
<script type="text/javascript">
 	$(document).ready(function(){
 		
 		$("button.topp").click(function(){
 			var dom = $(this).parent().prev().children();
 			var id = $(this).attr("id");
 			var text = dom.val();
 			dom.val(text);
 			$.ajax({
 				url:"<%=path %>/schoolUpdate",
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
 						dom.val(data.text);
 					}else{
 						alert("保存失败");
 						dom.val(data.text);
 					}
 				}
 				
 			});
 		});
	 	
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

</script>
<div class="header" id="header">
		<nav class="navbar" role="navigation"  style="height: 105px">
		   <div class="navbar-header" >
		      <img  class="tubiao" src="images/biao.jpg" width="100" height="100" alt="图标">
		   </div>
		  		    <div id="avatar" class="geren" style="margin-left:550px;margin-top:70px;">
  						<a href="ToPersonServlet">查看我的提问</a>
	  					</div>

			  </div>
			  </nav>
			  
		   </div>
<div class=" tab-content " style="height: 900px;margin-top: 80px;background-color:white;width: 1170px; margin-left: 170px;">
		<div style="margin-left: 70px;">
			<table>
            <thead>
                <tr>
                    <td>学校</td>
                    <td>操作</td>
                </tr>
            </thead>
            <tbody>

            <c:forEach var="Q" items="${QuesUserAll}">
            	<tr>
                 	<td><input type="text" name="text" id="text" value="${Q.school}" /></td>
                 	<td style="padding: 10px;">
                    	<button class="topp" onclick="top(this)" id="${Q.id}">保存</button>
                 	</td>
            	</tr>
            </c:forEach>
            </tbody>
            </table>



		</div>
		
			</div>
</body>
</html>