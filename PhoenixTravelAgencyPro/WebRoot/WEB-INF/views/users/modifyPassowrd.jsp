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

<title></title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<link rel="stylesheet" type="text/css"
	href="js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="js/demo/demo.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/jquery.json.js"></script>
<script type="text/javascript" src="js/datagrid-groupview.js"></script>

</head>

<body>
	<div id="p" class="easyui-panel" title="用户密码修改"
		style="width:500px;height:200px;padding:10px;">
		<form action="" id="modifyPassworForm" method="post">
			<table>
				<tr>
					<td>用户代码</td>
					<td><input class="easyui-validatebox" type="text" name="userNumber" id="userNumber" readonly="readonly" value="${sessionScope.userNumber }"/></td>
				</tr>
				<tr>
					<td>原始密码</td>
					<td><input class="easyui-validatebox" type="password" name="oldpassword" id="oldpassword"/></td>
				</tr>
				<tr>
					<td>新密码</td>
					<td><input class="easyui-validatebox" type="password" name="newPassword" id="newPassword"/></td>
				</tr>
				<tr>
					<td>确认密码</td>
					<td><input class="easyui-validatebox" type="password" name="reNewPassword" id="reNewPassword"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					    <a href="javascript:void(0)"
					class="easyui-linkbutton" onclick="submitForm()">保存</a>
					    <a href="javascript:void(0)"
					class="easyui-linkbutton" onclick="clearForm()">重置</a>
					</td>
				</tr>
			</table>
                <input type="hidden" name="id" value="${sessionScope.userId }">
		</form>
	</div>
	<script type="text/javascript">
function  submitForm(){
  $('#modifyPassworForm').form('submit', {
				url : 'fenghuang/modiryPassowrd.do',
				onSubmit : function() {
				    var  isSuccess =$(this).form('validate');
				    if(isSuccess){
				      var newPassword = $("#newPassword").val();
				      var reNewPassword = $("#reNewPassword").val();
				      if(newPassword == reNewPassword ){
				        return true;
				      }else{
				        $.messager.alert("提示", "确认密码不一致！", "info");
				        return false;
				      }
				    }else{
				      return false;
				    }
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
						$.messager.alert("修改成功", "修改成功！", "info");
						$("#newPassword").val("");
 					    $("#reNewPassword").val("");
  						$("#oldpassword").val("");
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
					}
				}
			});

}

function clearForm(){
 //$('#modifyPassworForm').form('clear');
 $("#newPassword").val("");
 $("#reNewPassword").val("");
  $("#oldpassword").val("");
}

</script>
</body>
</html>