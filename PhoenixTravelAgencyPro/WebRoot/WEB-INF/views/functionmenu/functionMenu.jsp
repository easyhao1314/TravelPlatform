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
	<div class="easyui-panel" title="系统功能"
		style="height:100px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchFunMenuPanel'" align="center">
		<table>
			<tr>
				<td><div class="fitem">
						<label>菜单编号:</label></div>
				</td>
				<td><div><input id="id" name="id" class="easyui-validatebox">
					</div></td>
				<td><div class="fitem">
						<label>菜单名称:</label></div>
				</td>
				<td><div><input id="meunName" name="meunName">
					</div></td>
				<td><div class="fitem">
						<label>菜单排序号:</label></div>
				</td>
				<td><div><input id="sortNo" name="sortNo" class="easyui-validatebox">
					</div></td>
			</tr>
			<tr>
				<td><div class="fitem">
						<label>应用程序名称:</label></div>
				</td>
				<td><div><input id="menuPath" name="menuPath" class="easyui-validatebox">
					</div></td>
				<td><div class="fitem">
						<label>菜单父级编号:</label></div>
				</td>
				<td>
				<input id="parentId" class="easyui-combobox" 
			name="parentId"
			data-options="
					url:'fenghuang/getFunctionMenuComboboxs.do',
					valueField:'id',
					textField:'meunName'
			">
			</tr>
		</table>
	</div>
	<div id="searchFunMenuPanel">
		<a href="javascript:void(0)" iconCls="icon-search"
			onclick="javascript:searchFunctionMenu();"></a> <a href="javascript:searchFunctionMenuReset();"
			iconCls="icon-undo"></a>
	</div>
	<div class="easyui-panel" title="系统功能"
		style="height:480px;width: auto;">
		<table id="dgFuncMenu" class="easyui-datagrid"
			data-options="url:'fenghuang/getFunctionMenus.do',border:false,singleSelect:false,fit:true,fitColumns:true,pageSize:20"
			pagination="true" toolbar="#menuDatagridtoolbar">
			<thead>
				<tr>
					<th data-options="field:'id'" width="80">菜单编码</th>
					<th data-options="field:'meunName'" width="80">菜单名称</th>
					<th data-options="field:'menuPath'" width="80">应用程序名称</th>
					<th data-options="field:'parentName'" width="80">菜单父级编号</th>
					<th data-options="field:'sortNo'" width="80">菜单排序号</th>
					<th data-options="field:'8',formatter:onOperateStyle" width="80">操作</th>
				</tr>
			</thead>
		</table>
		<div id="menuDatagridtoolbar">
		     <a href="javascript:newFunctionMenu();" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>  
		</div>
	</div>
		<div id="editFuncMenu" class="easyui-dialog" title="新增系统功能"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="newFunMenuForm" method="post">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>菜单编码:</label></div>
					</td>
					<td><div><label>系统生成</label>
						</div></td>
					<td><div class="fitem">
							<label>菜单名称:</label></div>
					</td>
					<td><div><input name="meunName" class="easyui-validatebox"
						required="true">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>应用程序名称:</label></div>
					</td>
					<td><div><input name="menuPath" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>菜单父级编号:</label></div>
					</td>
					<td><div><input class="easyui-combobox" 
			name="parentId"
			data-options="
					url:'fenghuang/getFunctionMenuComboboxs.do',
					valueField:'id',
					textField:'meunName'
			">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>菜单排序号:</label></div>
					</td>
					<td><div><input name="sortNo" class="easyui-validatebox">
						</div></td>
					<td>
					</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:newFunctionMenuSave();" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> <a href="javascript:clostEditFuncMenu();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input id="id" name="id" type="hidden" value="">
		</form>
	</div>
	<script type="text/javascript" src="js/functionmenu/functionmenu.js">
	</script>
</body>

</html>
