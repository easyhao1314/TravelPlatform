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
<div class="easyui-panel" title="用户信息"
		style="height:480px;width: auto;">
		<form id="userForm" method="post" action="">
			<table align="center">
				<tr>
					<td><div class="fitem">
							<label>用户编号:</label>
						</div>
					</td>
					<td><input name="userNumber" class="easyui-validatebox"></td>
					<td><div class="fitem">
							<label>用户名称:</label>
						</div>
					</td>
					<td><input name="userName" class="easyui-validatebox"></td>
					<td colspan="2" rowspan="8">
						<div>图片</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>登录名:</label>
						</div></td>
					<td><input name="loginName" class="easyui-validatebox"></td>
					<td><div class="fitem">
							<label>英文名:</label>
						</div></td>
					<td><input name="enName" class="easyui-validatebox"></td>

				</tr>
				<tr>
					<td><div class="fitem">
							<label>性别:</label>
						</div></td>
					<td>
					<input class="easyui-combobox" name="sex"
			    data-options="data:[{id:1,text:'男'},{id:0,text:'女'}],valueField:'id',textField:'text',panelHeight:'auto'">
					</td>
					<td><div class="fitem">
							<label>简写:</label>
						</div></td>
					<td><input name="enName" class="easyui-validatebox"></td>

				</tr>
				<tr>
					<td><div class="fitem">
							<label>联系电话:</label>
						</div></td>
					<td><input name="telephone" class="easyui-validatebox"></td>
					<td><div class="fitem">
							<label>出生日期:</label>
						</div></td>
					<td><input name="birthday" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser"></input></td>

				</tr>
				<tr>
					<td><div class="fitem">
							<label>分机号:</label>
						</div></td>
					<td><input name="telephoneExt" class="easyui-validatebox"></td>
					<td><div class="fitem">
							<label>EMAIL:</label>
						</div></td>
					<td><input name="email" class="easyui-validatebox"></td>

				</tr>
				<tr>
					<td><div class="fitem">
							<label>手机号:</label>
						</div></td>
					<td><input name="mobilePhone" class="easyui-validatebox"></td>
					<td><div class="fitem">
							<label>MSN:</label>
						</div></td>
					<td><input name="msn" class="easyui-validatebox"></td>

				</tr>
				<tr>
					<td><div class="fitem">
							<label>传真:</label>
						</div></td>
					<td><input name="fax" class="easyui-validatebox"></td>
					<td><div class="fitem">
							<label>MSN2：</label>
						</div></td>
					<td><input name="msn2" class="easyui-validatebox"></td>

				</tr>
				<tr>
					<td><div class="fitem">
							<label>SKYPE:</label>
						</div></td>
					<td><input name="skype" class="easyui-validatebox"></td>
					<td><div class="fitem">
							<label>MSN3:</label>
						</div></td>
					<td><input name="msn3" class="easyui-validatebox"></td>

				</tr>
				<tr>
					<td></td>
					<td></td>
					<td><div class="fitem">
							<label>QQ:</label>
						</div></td>
					<td><input name="qq" class="easyui-validatebox"></td>


				</tr>
				<tr>
					<td><div class="fitem">
							<label>公司:</label>
						</div></td>
					<td><input name="companyId" class="easyui-combobox"
								data-options="
					url:'fenghuang/getCompanyComboboxs.do',
					valueField:'id',
					textField:'companyName',
					panelHeight:'auto'
			"></td>
					<td><div class="fitem">
							<label>部门:</label>
						</div></td>
					<td><input name="departmentId" class="easyui-combobox"
								data-options="
					url:'fenghuang/getDepartmentComboboxs.do',
					valueField:'id',
					textField:'departName',
					panelHeight:'auto'
			"></td>


				</tr>
				<tr>
					<td><div class="fitem">
							<label>职位说明:</label>
						</div></td>
					<td><input name="jobDescription" class="easyui-validatebox"></td>
					<td><div class="fitem">
							<label>排序号:</label>
						</div></td>
					<td><input name="sortNumber" class="easyui-validatebox"></td>


				</tr>
				<tr>
					<td><div class="fitem">
							<label>地址:</label>
						</div></td>
					<td colspan="5"><input name="address" class="easyui-validatebox"></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>邮编:</label>
						</div></td>
					<td><input name="zip" class="easyui-validatebox"></td>
					<td></td>
					<td></td>

				</tr>
				<tr>
					<td><div class="fitem">
							<label>备注:</label>
						</div></td>
					<td colspan="5">
					  <textarea name="remark" rows="4" cols="50"></textarea>
					
					</td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr>
				   <td colspan="6" align="center">
				   <a
						href="javascript:mainBanMoshiSave();" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> <a href="javascript:closeEditUsers();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
				   
				   </td>
				</tr>
			</table>
			<input id="id" type="hidden" name="id">
		</form>
	</div>
	<script type="text/javascript">
            var userId = '${param.userId}';
	    	var param = {
					"userId" :userId 
				};
				$.ajax({
					url : "fenghuang/getPersondetails.do",
					data : param,
					dataType : "json",
					success : function(data) {
				       $("#userForm").form("load",data);
					},
					error : function() {
						$.messager.alert("失败", "服务器请求失败!", "error");
					}
				});
	</script>
	<script type="text/javascript" src="js/users/personDetails.js">
	</script>
</body>
</html>