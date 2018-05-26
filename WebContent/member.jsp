<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"
					+request.getServerName()+":"+request.getServerPort()
					+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="background: url(img/member.jpg);">
	<table width="700" style="margin-left: 270px;margin-top: 30px;">
		<tr>
			<td colspan="2" align="center"><font size="6">成员信息</font></td>
		</tr>
		<tr align="center">
			<td width="300"><a href="addMember.jsp"><font size="4">增加成员</font></a>
			</td>
			<td>
				<form action="member!findMember">
					<input type="text" id="id" name="select_id"
						placeholder="请输入学号" /> <input type="submit" value="搜索" />
				</form>
			</td>
		</tr>
	</table>
	<table width="700" align="center" border="1" style="margin-left: 270px;margin-top: 10px;">
		<tr>
			<th>学号</th>
			<th>姓名</th>
			<th>性别</th>
			<th>手机</th>
			<th>系别</th>
			<th>专业</th>
			<th>宿舍号</th>
			<th>住址</th>
			<th>操作</th>
		</tr>
		
		<%--  <s:iterator value="#request.list"  status="st">
		       <tr>
		        <s:iterator value="#request.list.get(#st.index)">
		        	 <td align="center">
		        	 <s:property value="value"/>
		      	</s:iterator>
		    	<td align="center">
		            <a href="goods!goodsFindId?Id=<s:property value="g_id"/>">
		              <img src="<%=basePath %>img/record_(edit)_16x16.gif" border="0" 
		              			title="修改" />&nbsp;&nbsp;
		            </a>
		             <a href="goods!goodsDelete?Id=<s:property value="g_id"/>">
		            <a onclick="deleteGoods('<s:property value="g_id"/>')">
		              <img src="<%=basePath %>img/record_(delete)_16x16.gif" border="0"
								title="删除" />
		            </a>
		          </td>
		    	</tr>
		      </s:iterator> --%>
		<s:iterator value="list" status="st">
			<tr>
				<td><s:property value="stu_id" /></td>
				<td><s:property value="stu_name" /></td>
				<td><s:property value="stu_sex" /></td>
				<td><s:property value="stu_tel" /></td>
				<td><s:property value="stu_department" /></td>
				<td><s:property value="stu_marjority" /></td>
				<td><s:property value="dorm_num" /></td>
				<td><s:property value="stu_addr" /></td>
				<td align="center"><a
					href="member!transUpdate?id=<s:property value="stu_id"/>"> <img
						src="<%=basePath %>img/record_(edit)_16x16.gif" border="0"
						title="修改成员信息" />&nbsp;&nbsp;
				</a> <a href="member!delMember?id=<s:property value="stu_id"/>"> <img
						src="<%=basePath %>img/record_(delete)_16x16.gif" border="0"
						title="删除成员信息" />
				</a></td>

			</tr>
		</s:iterator>

	</table>
</body>
</html>