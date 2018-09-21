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
<title>GET</title>
</head>
<body>
<h1>表单</h1>

<form action="main.jsp" method="post" target="_blank">
<input type="checkbox" name="Google" checked="checked"/> Google
<input type="checkbox" name="Baidu"/> Baidu
<input type="checkbox" name="Yahoo"/> Yahoo 
<input type="button" name="TestButton" value="ButtonValue" title="ButtonName"/> 
<input type="file"  />
<input type="submit" value="OK"/>
</form>
</body>
</html>