<%@page import="java.util.Date"%>
<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%
	Date sessionCreationTime = new Date(session.getCreationTime());
	Date lastVisitTime = new Date(session.getLastAccessedTime());
	
	// 1分钟超时
	session.setMaxInactiveInterval(60);
	
	// session值
	Integer visitCount = new Integer(0);
	String visitCountKey = new String("visitCount");
	String userIdKey = new String("userId");
	String userId = new String("ABCDFE");
	
	String title;
	
	// 是否新用户访问
	if (session.isNew()) {
		title = "首次访问";
		session.setAttribute(userIdKey, userId);
		session.setAttribute(visitCountKey, visitCount);
	} 
	else {
		title = "再次访问";
		userId = (String) session.getAttribute(userIdKey);
		visitCount = (Integer) session.getAttribute(visitCountKey);
		visitCount ++;
		
		session.setAttribute(visitCountKey, visitCount);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta
	http-equiv="Content-Type"
	content="text/html; charset=UTF-8"
>
<title>Session 跟踪</title>
</head>
<body>
<h1 align="center"><%= title %></h1>

<table border="1" align="center"> 
<tr bgcolor="#949494">
   <th>Session 信息</th>
   <th>值</th>
</tr>
<tr>
<td>Session ID</td>
<td><%=session.getId() %></td>
</tr>
<tr>
<td>创建时间</td>
<td><%=sessionCreationTime %></td>
</tr>
<tr>
<td>最后访问时间</td>
<td><%=lastVisitTime %></td>
</tr>
<tr>
<td>用户ID</td>
<td><%=userId %></td>
</tr>
<tr>
<td>访问次数</td>
<td><%=visitCount %></td>
</tr>
</table>
</body>
</html>