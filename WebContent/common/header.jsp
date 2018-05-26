<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/public.css" />
		<script>
			function getTime(){
				var arrWeekDay = new Array(
					"星期日","星期一","星期二","星期三","星期四","星期五","星期六","星期日"
				);
				var today;
				today = new Date();
				var minutes = today.getMinutes();
				if(minutes<10){
					minutes="0"+minutes;
				}
				var seconds = today.getSeconds();
				if(seconds<10){
					seconds="0"+seconds;
				}
				document.getElementById("time").innerHTML="现在是"+today.getFullYear()+"年"+(today.getMonth()+1)+"月"+today.getDate()
								+"日"+arrWeekDay[today.getDay()]+today.getHours()+":"+minutes
								+":"+seconds;
				setTimeout("getTime()",1000);
			}
			
		</script>
</head>
<body>
	<div class="head">
			<h1 align="center" style="color: #000000;margin-top: 10px;font-size: 25px;">宿舍信息系统</h1>
			<div style="margin-top: 16px;margin-left:10px; font-size:16px; float: left; color: red;">欢迎${name}同学</div>
			<div style="float: right;margin-top: 16px; margin-right: 10px; font-size:16px; color: red;" id="time">
          		<script>getTime()</script>
        	</div>
	</div>
</body>
</html>