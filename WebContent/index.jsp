<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>宿舍信息系统</title>
<%--  <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	out.print(session.getAttribute("student"));
%> --%>
</head>
<frameset rows="15%,*,13%" cols="*" framespacing="0"
	frameborder="no" border="0"> <frame src="common/header.jsp" 
	name="headmenu" id="mainFrame" title="mainFrame" scrolling="No"><!-- 引用头部 -->
<!-- 引用左边和主体部分 --> <frameset rows="*" cols="220,*"
	framespacing="0" frameborder="no" border="0" > <frame
	src="left.jsp" name="leftmenu" id="mainFrame" title="mainFrame">
<frame src="main.jsp" name="main" scrolling="no" noresize="noresize"
	id="rightFrame" title="rightFrame"></frameset>
 <frame src="common/footer.html" 
	name="footmenu" id="mainFrame" title="mainFrame" scrolling="No"></frameset>
</html>