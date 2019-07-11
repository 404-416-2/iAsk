<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="0">
<head>
<body οnbefοreonlοad="history.go(0)" >
	<script>
		window.onload=(function() {
			if (window.location.href.indexOf("/logout.jsp") > -1) {
				//防止页面后退
				history.pushState(null, null, document.URL);
				window.addEventListener('popstate', function() {
					history.pushState(null, null, document.URL);
				});
			}
		});
	</script>

	<script>
	window.onload=(function closePage() {
			var userAgent = navigator.userAgent;
			if (userAgent.indexOf("Firefox") != -1 || userAgent.indexOf("Chrome") != -1) {
				window.location.href = "about:blank";
			} else {
				window.opener = null;
				window.open("", "_self");
				window.close();
			}
		});
	</script>

	<%
		request.getSession().removeAttribute("uid");
		request.getSession().removeAttribute("login_uid");
		System.out.println("网页清除session，uid= " + request.getSession().getAttribute("uid"));
		request.getSession().setAttribute("stat_flush" , 1);
		response.sendRedirect("NewHome.jsp");
	%>

</body>
</head>
</html>