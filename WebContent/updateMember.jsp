<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	function checkname() {
		var name = document.getElementById("name").value;
		if (name == "") {
			document.getElementById("nametext").innerHTML = "姓名不能为空!";
			document.getElementById("nametext").style.color = "red";
		} else {
			document.getElementById("nametext").innerHTML = "姓名通过!";
			document.getElementById("nametext").style.color = "green";
		}
	}
	function checktel(s) {
		var regu = "^[0-9]{11}$";
		var re = new RegExp(regu);
		if (!re.test(s)) {
			document.getElementById("teltext").innerHTML = "手机号不对!";
			document.getElementById("teltext").style.color = "red";
		} else {
			document.getElementById("teltext").innerHTML = "手机号通过!";
			document.getElementById("teltext").style.color = "green";
		}
	}

	$(document).ready(
			function() {
				$("#department").change(
						function() {
							var dp = $("#department").find("option:selected")
									.text();
							//alert(dp);
							if (dp == "计算机系") {
								$("#marjority").html("");
								$("#marjority").append(
										"<option value='"+"计算机"+"'>" + "计算机"
												+ "</option>");
								$("#marjority").append(
										"<option value='"+"软件工程"+"'>" + "软件工程"
												+ "</option>");
								$("#marjority").append(
										"<option value='"+"网络工程"+"'>" + "网络工程"
												+ "</option>");
							}
							if (dp == "电气系") {
								$("#marjority").html("");
								$("#marjority").append(
										"<option value='"+"电气工程"+"'>" + "电气工程"
												+ "</option>");
								$("#marjority").append(
										"<option value='"+"汽车服务工程"+"'>"
												+ "汽车服务工程" + "</option>");
							}
						});
				/* var dp = $("#department").value;
				alert(dp);
				if(dp == "计算机系"){
					
					$("#marjority").append("<option value='"+"软件工程"+"'>"+"软件工程"+"</option>");
				} */
			});
</script>
</head>
<body style="background: url(img/add.jpg);">
	<div
		style="margin: 0 auto; width: 200px; color: white; font-weight: bold;">
		<font size="5">修改成员信息</font>
	</div>
	<div></div>
	<div
		style="width: 500px; margin: 0 auto; border: 0px; padding: 10px; margin-top: 34px;">
		<form action="member!updateMember" method="post">
			<table align="center">
				<s:iterator value="list" status="st">
					<tr>
						<td align="right">学号：</td>
						<td align="left"><input type="text" name="student.stu_id"
							value='<s:property value="stu_id"/>' readonly="readonly" id="id" /></td>
					</tr>

					<tr>
						<td align="right">姓名：</td>
						<td align="left"><input type="text" name="student.stu_name"
							value='<s:property value="stu_name"/>' id="name" onblur="checkname(this.value)"/>
							<span id="nametext"></span></td>
					</tr>
					<tr>
						<td align="right">性别：</td>
						<td align="left"><input type="text" name="student.stu_sex"
							value='<s:property value="stu_sex"/>' id="sex" readonly="readonly"/></td>
					</tr>
					<tr>
						<td align="right">手机：</td>
						<td align="left"><input type="text" name="student.stu_tel"
							value='<s:property value="stu_tel"/>' id="tel" onblur="checktel(this.value)"/>
							<span id="teltext"></span></td>
					</tr>
					<tr>
						<td align="right">系别：</td>
						<td align="left"><input type="text"
							name="student.stu_department"
							value='<s:property value="stu_department"/>' id="department" />
						</td>
					</tr>
					<tr>
						<td align="right">专业：</td>
						<td align="left"><input type="text"
							name="student.stu_marjority"
							value='<s:property value="stu_marjority"/>' id="marjority" /></td>
					</tr>
					<tr>
						<td align="right">宿舍：</td>
						<td align="left"><input type="text" name="student.dorm_num"
							value='<s:property value="dorm_num"/>' readonly="readonly"
							id="num" /></td>
					</tr>
					<tr>
						<td align="right">住址：</td>
						<td align="left"><input type="text" name="student.stu_addr"
							value='<s:property value="stu_addr"/>' id="addr" /></td>
					</tr>
				</s:iterator>
			</table>
			<div style="width: 200px; margin: 0 auto; padding: 10px;">
				&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="提交" />&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" onClick="javascript:history.back();" value="返回" />
			</div>
		</form>
	</div>
</body>
</html>