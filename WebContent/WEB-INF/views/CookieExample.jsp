<%@page import="java.net.URLEncoder"%>
<%@page import="javax.servlet.http.*"%>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>

<%
	// 对中文值编码，防止出现乱码
	request.setCharacterEncoding("utf-8");

	Cookie nameCookie = new Cookie("name", URLEncoder.encode(request.getParameter("name"), StandardCharsets.UTF_8));
	Cookie urlCookie = new Cookie("url", request.getParameter("url"));

	nameCookie.setMaxAge(60 * 60);
	urlCookie.setMaxAge(60 * 60);

	response.addCookie(nameCookie);
	response.addCookie(urlCookie);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta
	http-equiv="Content-Type"
	content="text/html; charset=UTF-8"
>
<title>设置Cookies</title>
</head>
<body>
	<ul>
		<li><p>
				<b>名称：</b><%=request.getParameter("name")%>
			</p></li>
		<li><p>
				<b>URL：</b><%=request.getParameter("url")%>
			</p></li>
	</ul>

</body>
</html>