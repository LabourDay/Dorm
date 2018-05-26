<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/updatepw.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body style="background:  url('img/timg.jpg');">
	<form action="updatePw" method="post" target="_top" style="margin-top: 20px;">
	<input type="hidden"  name="id"
			value='<s:property value="#session.student.stu_id"/>'/> 
	<input type="hidden" class="input3" name="oldpw"
		value='<s:property value="#session.student.stu_password"/>'/> 

	
	<div id="pageAll">
		<div class="page ">
			<!-- 修改密码页面样式 -->
			<div class="bacen">	
				<div class="bbD">
					&nbsp;&nbsp;&nbsp;&nbsp;输入旧密码：<input type="password" class="input3"
						onblur="checkpwd1()"  name="pwd1" id="pwd1" /> <img class="imga"
						src="img/ok.png" /><img class="imgb" src="img/no.png" />
				</div>
				
				<div class="bbD">
					&nbsp;&nbsp;&nbsp;&nbsp;输入新密码：<input type="password" class="input3"
						onblur="checkpwd2()" name="pwd2" id="pwd2" /> <img class="imga"
						src="img/ok.png" /><img class="imgb" src="img/no.png" />
				</div>
				<div class="bbD">
					再次确认密码：<input type="password" class="input3" onblur="checkpwd3()"
						id="pwd3" /> <img class="imga" src="img/ok.png" /><img
						class="imgb" src="img/no.png" />
				</div>
				<div class="bbD">
					<p class="bbDP">
						<button class="btn_ok btn_yes" type="submit">提交</button>
						<a class="btn_ok btn_no" href="main.jsp">取消</a>
					</p>
				</div>
			</div>

			<!-- 修改密码页面样式end -->
		</div>
	</div>
	</form>
</body>
<script type="text/javascript">
function checkpwd1(){
var user = document.getElementById('pwd1').value.trim();
 if (user.length >= 6 && user.length <= 12) {
  $("#pwd1").parent().find(".imga").show();
  $("#pwd1").parent().find(".imgb").hide();
 }else{
  $("#pwd1").parent().find(".imgb").show();
  $("#pwd1").parent().find(".imga").hide();
 };
}
function checkpwd2(){
var user = document.getElementById('pwd2').value.trim();
 if (user.length >= 6 && user.length <= 12) {
  $("#pwd2").parent().find(".imga").show();
  $("#pwd2").parent().find(".imgb").hide();
 }else{
  $("#pwd2").parent().find(".imgb").show();
  $("#pwd2").parent().find(".imga").hide();
 };
}
function checkpwd3(){
var user = document.getElementById('pwd3').value.trim();
var pwd = document.getElementById('pwd2').value.trim();
 if (user.length >= 6 && user.length <= 12 && user == pwd) {
  $("#pwd3").parent().find(".imga").show();
  $("#pwd3").parent().find(".imgb").hide();
 }else{
   $("#pwd3").parent().find(".imgb").show();
  $("#pwd3").parent().find(".imga").hide();
 };
}
</script>
</html>