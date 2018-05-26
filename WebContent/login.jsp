<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>宿舍信息登录界面</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/login.css" />
	
</head>
<body>
	<div class="container demo-1">
		<div class="content">
			<div id="large-header" class="large-header">
				<canvas id="demo-canvas"></canvas>
				<div class="logo_box">
  					<form class="login" action="Login.action" method="post">
  						
   						<p class="title" align="center">宿舍信息系统</p>
    					<input type="text" placeholder="请输入账户" name="student.stu_id" autofocus style="background-color: #19e64dff;"/>
    					<i class="fa fa-user"></i>
    					<input type="password" name="student.stu_password" placeholder="请输入密码" />
    					<i class="fa fa-key"></i>
    					<!--<a href="#">Forgot your password?</a>-->
    					<!-- <table align="center">
    					  <tr><td align="center"><input type="radio" name="user" id="radio1" />&nbsp;舍管&nbsp;&nbsp;
    					  <input type="radio" name="user" id="radio2" />&nbsp;学生</td></tr>
    					</table> -->
    					<button>
     					<i class="spinner"></i>
      					<span class="state">登录</span>
   						</button>
   						
  					</form>
  				</div>
			</div>
		</div>
	</div>
	<script src="js/TweenLite.min.js"></script>
	<script src="js/EasePack.min.js"></script>
	<!--<script src="js/rAF.js"></script>-->
	<script src="js/demo-1.js"></script>
</body>
</html>