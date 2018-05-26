<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Refresh" content="3; URL=<%=basePath %>member!memberMsg?dorm_num=${dorm_num}">
<title>Insert title here</title>
</head>
<body style="background: url('img/welcome.jpg');">
	<center>
    <h2 style="color:red;" align="center"><br><br><br><br>${sRet}</h2>
  </center>
</body>
</html>