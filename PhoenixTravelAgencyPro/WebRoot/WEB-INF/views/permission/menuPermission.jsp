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
	<table id="dgMenuPermission" class="easyui-datagrid"
		data-options="url:'fenghuang/getMenuPermissions.do',border:false,singleSelect:false,fit:true,fitColumns:true, onClickRow: onClickRow,pageSize:20"
		pagination="true" toolbar="#tbMenuPermission">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'mpNo',editor:'text'" width="80">编号</th>
				<th data-options="field:'mpName',editor:'text'" width="80">名称</th>
				<th data-options="field:'mpDesc',editor:'text'" width="80">描述</th>
				<th data-options="field:'functionNo',editor:{
				   type:'combobox',
							options:{
								url:'fenghuang/getFunctionMenuComboboxs.do',
								valueField:'id',
								textField:'meunName'
							}
				},formatter:function(value,row){
				   return row.meunName;
				}" width="80">功能编号</th>
				<th data-options="field:'id',hidden:true"></th>
			</tr>
		</thead>
	</table>
	<div id="tbMenuPermission">
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
	<div id="editMenuPermission" class="easyui-dialog" title="新增业务字段"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="menuPermissionFrome" method="post">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>编号:</label>
						</div></td>
					<td><div>
							<input name="mpNo" class="easyui-validatebox" required="true">
						</div>
					</td>
					<td><div class="fitem">
							<label>名称:</label>
						</div></td>
					<td><div>
							<input name="mpName" class="easyui-validatebox" required="true">
						</div>
					</td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>描述:</label>
						</div></td>
					<td><input name="mpDesc" class="easyui-validatebox">
						</div>
					</td>
					<td><div class="fitem">
							<label>功能编号:</label>
						</div></td>
					<td>
					  <input id="functionNo" name="functionNo" class="easyui-combobox"
								data-options="
					url:'fenghuang/getFunctionMenuComboboxs.do',
					valueField:'id',
					textField:'meunName'
			">
					</td>
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
	<div id="searchMenuPermission" class="easyui-dialog" title="查询业务字段"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="searchMenuPermissionForm" action="">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>编号:</label>
						</div></td>
					<td><div>
							<input id="searchMpNo" name="mpNo" class="easyui-validatebox">
						</div>
					</td>
					<td><div class="fitem">
							<label>名称:</label>
						</div></td>
					<td><div>
							<input id="searchMpName" name="mpName"
								class="easyui-validatebox">
						</div>
					</td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>描述:</label></div>
					</td>
					<td><div><input id="searchMpDesc" name="mpDesc"
						class="easyui-validatebox">
						</div>
					</td>
					<td><div class="fitem">
							<label>功能编号:</label>
						</div></td>
					<td>
					  <input id="searchFunctionNo" name="functionNo" class="easyui-combobox"
								data-options="
					url:'fenghuang/getFunctionMenuComboboxs.do',
					valueField:'id',
					textField:'meunName'
			">
					</td>
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
	   	<div id="dgMenuPermissionMm" class="easyui-menu" style="width:120px;">
		<div onClick="editRoleRightMenu()" data-options="iconCls:'icon-edit'">修改</div>
	    <div data-options="iconCls:'icon-edit'">权限分配给角色</div>
	</div>
	<script type="text/javascript" src="js/permission/menuPermission.js">	
	</script>
</body>
</html>
