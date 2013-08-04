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
	<table id="dgUsers" class="easyui-datagrid"
		data-options="url:'fenghuang/getUsers.do',border:false,singleSelect:false,fit:true,fitColumns:true,pageSize:20,onClickRow: onClickRow,view:groupview,
          groupField:'departName',
          groupFormatter:function(value,rows){
           return '所属部门:'+value + ' - ' + rows.length + '名员工';
          }"
		pagination="true" toolbar="#tbUsers">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'userNumber',editor:'text'" width="80">编号</th>
				<th data-options="field:'userName',editor:'text'" width="80">姓名</th>
				<th data-options="field:'loginName',editor:'text'" width="80">登陆名</th>
				<th data-options="field:'enName',editor:'text'" width="80">简写</th>
				<th data-options="field:'birthday',editor:{
				   type:'datebox',
				   options:{
				      formatter:myformatter,parser:myparser
				   }
				}" width="80">生日</th>
				<th data-options="field:'telephoneExt',editor:'text'" width="80">分机号</th>
				<th data-options="field:'telephone',editor:'text'" width="80">电话</th>
				<th data-options="field:'email',editor:'text'" width="80">MAIL</th>
				<th
					data-options="field:'departName',editor:{
					type:'combobox',
							options:{
								valueField:'id',
								textField:'departName',
								url:'fenghuang/getDepartmentComboboxs.do'
							}
				}"
					width="80">所属部门</th>
				<th data-options="field:'jobDescription',editor:'text'" width="80">岗位说明</th>
				<th data-options="field:'sortNumber',editor:'text'" width="80">排序</th>
				<th
					data-options="field:'companyName',editor:{
					type:'combobox',
							options:{
								valueField:'id',
								textField:'companyName',
								url:'fenghuang/getCompanyComboboxs.do'
							}
				
				}"
					width="80">公司</th>
				<th data-options="field:'id',hidden:true"></th>
			</tr>
		</thead>
	</table>
	<div id="tbUsers">
		<a href="javascript:addHangMoshi();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">新增(行模式)</a>&nbsp;&nbsp;| <a
			href="javascript:addMianBanMoshi();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">新增(面板模式)</a>&nbsp;&nbsp;| <a
			href="javascript:shanchu();" class="easyui-linkbutton"
			iconCls="icon-cut" plain="true">删除</a>&nbsp;&nbsp;| <a
			href="javascript:searchDiJi();" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">查询</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:getChanges();" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">保存修改</a>
	</div>
	<div id="editUsers" class="easyui-dialog" title="修改用户信息"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:650px;height:500px;padding:10px;">
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
		</form>
	</div>
	<div id="searchUsers" class="easyui-dialog" title="查询业务字段"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:650px;height:500px;padding:10px;">
		<form id="searchUsersForm" action="">
		     <table align="center">
				<tr>
					<td><div class="fitem">
							<label>用户编号:</label>
						</div>
					</td>
					<td><input id="searchUserNumber" name="userNumber" class="easyui-validatebox"></td>
					<td><div class="fitem">
							<label>用户名称:</label>
						</div>
					</td>
					<td><input id="searchUserName" name="userName" class="easyui-validatebox"></td>
					<td colspan="2" rowspan="8">
						<div>图片</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>登录名:</label>
						</div></td>
					<td><input id="searchLoginName" name="loginName" class="easyui-validatebox"></td>
					<td><div class="fitem">
							<label>英文名:</label>
						</div></td>
					<td><input id="searchEnName" name="enName" class="easyui-validatebox"></td>

				</tr>
				<tr>
					<td><div class="fitem">
							<label>性别:</label>
						</div></td>
					<td>
					<input id="searchSex" class="easyui-combobox" name="sex"
			    data-options="data:[{id:1,text:'男'},{id:0,text:'女'}],valueField:'id',textField:'text',panelHeight:'auto'">
					</td>
					<td><div class="fitem">
							<label>简写:</label>
						</div></td>
					<td><input id="searchEnName1" name="enName1" class="easyui-validatebox"></td>

				</tr>
				<tr>
					<td><div class="fitem">
							<label>联系电话:</label>
						</div></td>
					<td><input id="searchTelephone" name="telephone" class="easyui-validatebox"></td>
					<td><div class="fitem">
							<label>出生日期:</label>
						</div></td>
					<td><input id="searchBirthday" name="birthday" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser"></input></td>

				</tr>
				<tr>
					<td><div class="fitem">
							<label>分机号:</label>
						</div></td>
					<td><input id="searchTelephoneExt" name="telephoneExt" class="easyui-validatebox"></td>
					<td><div class="fitem">
							<label>EMAIL:</label>
						</div></td>
					<td><input id="searchEmail" name="email" class="easyui-validatebox"></td>

				</tr>
				<tr>
					<td><div class="fitem">
							<label>手机号:</label>
						</div></td>
					<td><input id="searchMobilePhone" name="mobilePhone" class="easyui-validatebox"></td>
					<td><div class="fitem">
							<label>MSN:</label>
						</div></td>
					<td><input id="searchMsn"  name="msn" class="easyui-validatebox"></td>

				</tr>
				<tr>
					<td><div class="fitem">
							<label>传真:</label>
						</div></td>
					<td><input id="searchFax" name="fax" class="easyui-validatebox"></td>
					<td><div class="fitem">
							<label>MSN2：</label>
						</div></td>
					<td><input id="searchMsn2" name="msn2" class="easyui-validatebox"></td>

				</tr>
				<tr>
					<td><div class="fitem">
							<label>SKYPE:</label>
						</div></td>
					<td><input id="searchSkype" name="skype" class="easyui-validatebox"></td>
					<td><div class="fitem">
							<label>MSN3:</label>
						</div></td>
					<td><input id="searchMsn3" name="msn3" class="easyui-validatebox"></td>

				</tr>
				<tr>
					<td></td>
					<td></td>
					<td><div class="fitem">
							<label>QQ:</label>
						</div></td>
					<td><input id="searchQq" name="qq" class="easyui-validatebox"></td>


				</tr>
				<tr>
					<td><div class="fitem">
							<label>公司:</label>
						</div></td>
					<td><input id="searchCompanyId" name="companyId" class="easyui-combobox"
								data-options="
					url:'fenghuang/getCompanyComboboxs.do',
					valueField:'id',
					textField:'companyName',
					panelHeight:'auto'
			"></td>
					<td><div class="fitem">
							<label>部门:</label>
						</div></td>
					<td><input id="searchDepartmentId" name="departmentId" class="easyui-combobox"
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
					<td><input id="searchjobDescription" name="jobDescription" class="easyui-validatebox"></td>
					<td><div class="fitem">
							<label>排序号:</label>
						</div></td>
					<td><input id="searchSortNumber" name="sortNumber" class="easyui-numberbox"></td>


				</tr>
				<tr>
					<td><div class="fitem">
							<label>地址:</label>
						</div></td>
					<td colspan="5"><input id="searchAddress" name="address" class="easyui-validatebox"></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>邮编:</label>
						</div></td>
					<td><input id="searchZip" name="zip" class="easyui-validatebox"></td>
					<td></td>
					<td></td>

				</tr>
				<tr>
					<td><div class="fitem">
							<label>备注:</label>
						</div></td>
					<td colspan="5">
					  <textarea id="searchRemark" name="remark" rows="4" cols="50"></textarea>
					
					</td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr>
				    <td colspan="6" align="center">
				   <a
						href="javascript:searchFormSubmit();" class="easyui-linkbutton"
						iconCls="icon-ok">查询</a> <a href="javascript:closedSearch();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
				   
				   </td>
				
				</tr>
		  </table>
		
		</form>
    </div>
   	<div id="dgUserMm" class="easyui-menu" style="width:120px;">
		<div onClick="editUsers()" data-options="iconCls:'icon-edit'">修改</div>
		<div>
	       <span>用户权限</span>
	       <div>
		   <div data-options="iconCls:'icon-edit'">恢复默认密码</div>
		   <div data-options="iconCls:'icon-edit'">设为离职</div>
		   </div>
		</div>
		
	</div>
    
    
	<script type="text/javascript" src="js/users/users.js">
		
	</script>
</body>
</html>