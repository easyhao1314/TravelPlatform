<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    
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
    <div class="easyui-panel" title="部门查询"
		style="height:100px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<table>
			<tr>
				<td><div class="fitem">
						<label>部门编号:</label>
				</td>
				<td><input id="departNo" name="departNo" class="easyui-validatebox">
					</div></td>
				<td><div class="fitem">
						<label>部门名称:</label>
				</td>
				<td><input id="departName" name="departName" class="easyui-validatebox">
					</div></td>
			</tr>
		</table>
	</div>
	<div id="searchpanel">
		<a href="javascript:void(0)" iconCls="icon-search"
			onclick="javascript:searchDepartment();"></a> <a href="javascript:void(0)"
			iconCls="icon-undo" onclick="javascript:searchDepartmentReset()"></a>
	</div>
	<div class="easyui-panel" title="部门列表"
		style="height:480px;width: auto;">
		<table id="dgDepartment" class="easyui-datagrid"
			data-options="url:'fenghuang/getDepartments.do',border:false,singleSelect:false,fit:true,fitColumns:true,pageSize:20"
			pagination="true" toolbar="#departmentDatagridtoolbar">
			<thead>
				<tr>
					<th data-options="field:'departNo'" width="80">部门编号</th>
					<th data-options="field:'departName'" width="80">部门名称</th>
					<th data-options="field:'sortNo'" width="80">排序号</th>
					<th data-options="field:'8',formatter:onOperateStyle" width="80">操作</th>
				</tr>
			</thead>
		</table>
		<div id="departmentDatagridtoolbar">
		     <a href="javascript:newDepartment();" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>  
		</div>
	</div>
	<div id="editDepartment" class="easyui-dialog" title="新增部门"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="newDepartment" method="post">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>部门编号:</label></div>
					</td>
					<td><div><input name="departNo" class="easyui-validatebox"
						required="true">
						</div></td>
					<td><div class="fitem">
							<label>部门名称:</label></div>
					</td>
					<td><div><input name="departName" class="easyui-validatebox"
						required="true">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>排序号:</label></div>
					</td>
					<td><div><input name="sortNo" class="easyui-validatebox">
						</div></td>
					<td>
					</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:newDepartmentSave();" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> <a href="javascript:closeDepartment();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input id="id" name="id" type="hidden" value="">
		</form>
	</div>
	
	
	<script type="text/javascript" src="js/department/department.js">
	</script>
  </body>
</html>
