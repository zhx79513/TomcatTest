<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>页面重定向</title>
</head>
<body>
<%
	// 重定向到新页面
	String redirectSite = "http://www.baidu.com";
	response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
	response.setHeader("location", redirectSite);
%>
</body>
</html>