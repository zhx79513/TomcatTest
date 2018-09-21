<%@page import="java.util.Enumeration"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜鸟教程</title>
</head>
<body>
<h1>读取表单所有参数</h1>
<table width="100%" border="1" align="center">
<tr bgcolor="#949494">
<th>参数名</th><th>参数值</th>
</tr>
<%
	Enumeration<String> enumerator = request.getParameterNames();
	while (enumerator.hasMoreElements()) {
		String paramName = enumerator.nextElement();
		out.print("<tr><td>" + paramName + "</td>");
		String paramValue = request.getParameter(paramName);
		out.print("<td>" + paramValue + "</td></tr></br>");
	}
%>
</table>
</body>
</html>