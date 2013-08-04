<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>首页</title>
<link rel="stylesheet" type="text/css"
	href="js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="js/demo/demo.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript">
        function clearForm(){  
            $('#loginFrom').form('clear');  
        }  
</script>
</head>

<body>
	<div class="easyui-panel" title="登录" style="width:400px">
		<div style="padding:10px 0 10px 60px">
			<form action="fenghuang/login.do" id="loginFrom" method="post">
				<table>
					<tr>
						<td>用户名:</td>
						<td><input class="easyui-validatebox" type="text"
							name="loginName" data-options="required:true" value="${loginName }"></input></td>
					</tr>
					<tr>
						<td>密码：</td>
						<td><input class="easyui-validatebox" type="password"
							name="password" data-options="required:true">
						</td>
					</tr>
					<tr>
					  <td colspan="2">${loginError}</td>
					</tr>
					<tr>
					   <td colspan="2">
					   	 <input type="submit" value="提交"> <a href="javascript:void(0)"
					class="easyui-linkbutton" onclick="clearForm()">Clear</a>
					   
					   </td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
