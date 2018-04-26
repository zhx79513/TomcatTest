<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除名为参数名为name的Cookie</title>
</head>
<body>
<%
	Cookie[] cookies = request.getCookies();
	
	if (cookies == null) {
		out.println("没有cookie<br/>");
	}
	else {
		boolean isCookieFound = false;
		for (Cookie cookie : cookies) {
			if (cookie.getName().compareToIgnoreCase("name") == 0) {
				out.println("删除 Cookie：" + cookie.getName() + "<br/>");
			
				// 将有效期限设为0即删除
				cookie.setMaxAge(0);
				// 将修改后的cookie添加到response的header
				response.addCookie(cookie);
				
				isCookieFound = true;
			}
			
			out.println("参数名：" + cookie.getName() + "<br/>");
			out.println("参数值：" + URLDecoder.decode(cookie.getValue(), "utf-8") + "<br/>");
		}
		
		out.println("-----------------------------<br/>");
		
		if (!isCookieFound) {
			out.println("没有找到参数名为name的cookie<br/>");
		}
	}
 %>

</body>
</html>