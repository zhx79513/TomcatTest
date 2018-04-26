<%@page import="java.net.URLDecoder"%>
<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta
	http-equiv="Content-Type"
	content="text/html; charset=UTF-8"
>
<title>获取Cookies</title>
</head>
<body>
	<%
		// 从客户端获取Cookie数组
		Cookie[] cookies = request.getCookies();
		if (cookies == null) {
			out.println("没有找到Cookie");
		} else {
			for (Cookie cookie : cookies) {
				out.println("参数名：" + cookie.getName() + "<br/>");
				out.println("参数值：" + URLDecoder.decode(cookie.getValue(), "utf-8") + "<br/>");
				out.println("-----------------------------" + "<br/>");
			}
		}
	%>
</body>
</html>