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
</head>

<body>
	<!-- 如果在正式开发环境下 url可以为后台的请求，地址 -->
	<table id="dgRole" class="easyui-datagrid"
		data-options="url:'fenghuang/getRoles.do',border:false,singleSelect:false,fit:true,fitColumns:true, onClickRow: onClickRow,pageSize:20"
		pagination="true" toolbar="#tbRole">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'roleNo',editor:'text'" width="80">角色编号</th>
				<th data-options="field:'roleName',editor:'text'" width="80">角色名称</th>
				<th data-options="field:'roleDesc',editor:'text'" width="80">角色描述</th>
				<th data-options="field:'id',hidden:true"></th>
			</tr>
		</thead>
	</table>
	<div id="tbRole">
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
	<div id="editRole" class="easyui-dialog" title="新增业务字段"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="roleFrome" method="post">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>角色编号:</label>
						</div></td>
					<td><div>
							<input name="roleNo" class="easyui-validatebox" required="true">
						</div>
					</td>
					<td><div class="fitem">
							<label>角色名称:</label>
						</div></td>
					<td><div>
							<input name="roleName" class="easyui-validatebox" required="true">
						</div>
					</td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>角色描述:</label>
						</div></td>
					<td><input name="roleDesc" class="easyui-validatebox">
						</div>
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:mainBanMoshiSave();" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> <a href="javascript:closeEditRole();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
					</td>
				</tr>
			</table>
			<input id="id" name="id" type="hidden">
		</form>
	</div>
	<div id="searchRole" class="easyui-dialog" title="查询业务字段"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="searchRoleForm" action="">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>角色编号:</label>
						</div></td>
					<td><div>
							<input id="searchRoleNo" name="roleNo" class="easyui-validatebox">
						</div>
					</td>
					<td><div class="fitem">
							<label>角色名称:</label>
						</div></td>
					<td><div>
							<input id="searchRoleName" name="roleName"
								class="easyui-validatebox">
						</div>
					</td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>角色描述:</label></div>
					</td>
					<td><div><input id="searchRoleDesc" name="roleDesc"
						class="easyui-validatebox">
						</div>
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:searchFormSubmit();" class="easyui-linkbutton"
						iconCls="icon-ok">查询</a> <a href="javascript:closedSearch();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	   	<div id="dgRoleMm" class="easyui-menu" style="width:120px;">
		<div onClick="editRoleRightMenu()" data-options="iconCls:'icon-edit'">修改</div>
		<div>
	       <span>用户权限</span>
	       <div>
		   <div data-options="iconCls:'icon-edit'">设置用户</div>
		   <div data-options="iconCls:'icon-edit'">2</div>
		   </div>
		</div>
		
	</div>
	<script type="text/javascript" src="js/role/role.js">	
	</script>
</body>
</html>
