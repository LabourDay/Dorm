<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
 var xmlHttp;   
//改函数用于创建一个XMLHttpRequest对象   
	function createXMLHttpRequest(){   
    	if(window.ActiveXObject){   
        	xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");   
   		}else if(window.XMLHttpRequest){   
        	xmlHttp = new XMLHttpRequest();   
    	}   
	} 
	
	function checkid(s) {
		var regu="^[0-9]{8}$";
		var re=new RegExp(regu);
		if(!re.test(s)){
			document.getElementById("id_text").innerHTML = "学号不对!";
			document.getElementById("id_text").style.color = "red";
		}else if(re.test(s)){
			var num = document.getElementById("num").value;
			createXMLHttpRequest();
			xmlHttp.onreadystatechange= processExist;
			var url="member!exist?id="+s+"&num="+num;
			xmlHttp.open("GET",url,true);   
	   	 	//发送请求   
	    	xmlHttp.send(null); 
				/* document.getElementById("id_text").innerHTML = "通过!";
				document.getElementById("id_text").style.color = "green"; */
		}/* else{
			var num = document.getElementById("num").value;
			alert(num)
			xmlHttp.onreadystatechange= processExist;
			var url="member!exist?id="+s+"&num="+num;
			xmlHttp.open("GET",url,true);   
	   	 	//发送请求   
	    	xmlHttp.send(null); 
		} */
	}

	 function processExist(){   
	       //定义一个变量用于存放 从服务器返回的响应结果   
	       var responseContext="";   
	       if(xmlHttp.readyState==4){   
	           if(xmlHttp.status==200){   
	               responseContext = xmlHttp.responseText;
	               if(responseContext == "该学生已在该宿舍！"){
	               		document.getElementById("id_text").style.color = "red";
	               }
	               if(responseContext == "通过！"){
	            	   alert("aa")
	            	   document.getElementById("id_text").style.color = "green";
	               }
	               document.getElementById("id_text").innerHTML = responseContext;
	              
	           }   
	       }   
	   }
		
	
	function checkpwd(s) {
		regu = "^[0-9a-zA-Z]{4,16}$";
		re = new RegExp(regu);
		if (!re.test(s)) {
			document.getElementById("passtext").innerHTML = "密码4-16位数字，字母组成";
			document.getElementById("passtext").style.color = "red";
		} else {
			document.getElementById("passtext").innerHTML = "通过!";
			document.getElementById("passtext").style.color = "green";
		}
	}
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
	<div style="margin: 0 auto; width: 200px; color:white; font-weight: bold;">
		<font size="5">增加成员信息</font>
	</div>
	<div></div>
	<div
		style="width: 500px; margin: 0 auto; border: 0px solid; padding: 10px; margin-top: 30px;">
		<form action="member!addMember" method="post">
			<table align="center">
				<tr>
					<td align="right">学号：</td>
					<td align="left" class="bbD"><input type="text"
						name="student.stu_id" id="s_id" onblur="checkid(this.value)"
						placeholder="请输入学号" /><span id="id_text"></span></td>
				</tr>
				<tr>
					<td align="right">密码：</td>
					<td align="left" class="bbD"><input type="password"
						name="student.stu_password" id="passwd"
						onblur="checkpwd(this.value)" placeholder="4-16数字，字母组成" /><span
						id="passtext"></span></td>
				</tr>
				<tr>
					<td align="right">姓名：</td>
					<td align="left"><input type="text" name="student.stu_name" id="name"
						 onblur="checkname(this.value)" placeholder="请输入姓名" /><span
						id="nametext"></span></td>
				</tr>
				<tr>
					<td align="right">性别：</td>
					<td colspan="6" align="left"><input type="text" name="student.stu_sex"
						value="${stu_sex }" readonly="readonly" id="sex" /></td>
				</tr>
				<tr>
					<td align="right">手机：</td>
					<td align="left"><input type="text" name="student.stu_tel"
						id="tel" onblur="checktel(this.value)" placeholder="11位数字组成" /><span
						id="teltext"></span></td>
				</tr>
				<tr>
					<td align="right">系别：</td>
					<td align="left">
						<select name="student.stu_department" id="department">
							<option value="计算机系">计算机系</option>
							<option value="电气系">电气系</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">专业：</td>
					<td align="left">
						<select name="student.stu_marjority" id="marjority" >
							 <option value="计算机">计算机</option>
							<!--<option value="软件工程">软件工程</option>
							<option value="网络工程">网络工程</option> -->
							<!-- <option>电气工程</option>
							<option>汽车服务工程</option>  -->
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">宿舍：</td>
					<td align="left"><input type="text" name="student.dorm_num"
						value="${dorm_num }" readonly="readonly" id="num" /></td>
				</tr>
				<tr>
					<td align="right">住址：</td>
					<td align="left"><input type="text" name="student.stu_addr"
						placeholder="请输入地址" id="addr" /></td>
				</tr>
			</table>
			<div style="width: 200px; margin: 0 auto; padding: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="提交" />&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" onClick="javascript:history.back();" value="返回" /> </a>
			</div>
		</form>
	 </div>

</body>
</html>