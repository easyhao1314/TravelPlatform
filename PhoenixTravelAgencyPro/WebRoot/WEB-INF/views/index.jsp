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
<div style="width:100%; height:100%;  background-image: url('Image/background.jpg'); background-repeat:no-repeat;">
	<div style="width:470px; height: 225px;  position:absolute; left:50%; top:50%; margin:-105px 0 0 -200px; background-image: url('Image/loginDiv.png');">
		<div style="padding:10px 0 10px 60px">
			<form action="fenghuang/login.do" id="loginFrom" method="post" style="margin-top: 70px;">
				<table>
					<tr>	
						<td>用户名：</td>
						<td><input class="easyui-validatebox" type="text" style="height: 18px; width: 175px; border-radius:5px;"
							name="loginName" data-options="required:true" value="${loginName }"></input></td>
					<td rowspan="4"><a href="javascript:onSubmit();"   style=" width: 85px; height: 75px; background-image: url('Image/logingif.gif');display:block; margin-top: -5px;"></a></td>
					</tr>
					<tr>
						<td>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
						<td><input class="easyui-validatebox" type="password" style="height: 18px; width: 175px; border-radius:5px;" 
							name="password" data-options="required:true">
						</td>
						
					</tr>
					<tr>
						<td>验证码：</td>
						<td><input class="easyui-validatebox" name="code" style="width:78px;  height: 18px; border-radius:3px; " data-options="required:true">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="easyui-validatebox"  value="${code }" onfocus=this.blur() style="width:78px;   height: 18px; border-radius:3px; ">
						</td>
						
						
					</tr>
					<!-- 
					<tr>
					  <td colspan="2">${loginError}</td>
					</tr>
					
					<tr>
					   <td colspan="2">
					   	 <input type="submit" value="提交"> <a href="javascript:void(0)"
					class="easyui-linkbutton" onclick="clearForm()">Clear</a>
					   
					   </td>
					</tr>
					 -->
				</table>
				<span>${loginError}</span>
			</form>
		</div>
	</div>
	</div>
	<script type="text/javascript">
		function onSubmit(){
		document.getElementById("loginFrom").submit();
		}
	</script>
</body>
</html>
