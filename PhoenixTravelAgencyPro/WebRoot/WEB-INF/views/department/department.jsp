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
				<td><input name="departNo" class="easyui-validatebox">
					</div></td>
				<td><div class="fitem">
						<label>部门名称:</label>
				</td>
				<td><input name="departName" class="easyui-validatebox">
					</div></td>
			</tr>
		</table>
	</div>
	<div id="searchpanel">
		<a href="javascript:void(0)" iconCls="icon-search"
			onclick="javascript:alert('查询')"></a> <a href="javascript:void(0)"
			iconCls="icon-undo" onclick="javascript:alert('重置')"></a>
	</div>
	<div class="easyui-panel" title="部门列表"
		style="height:480px;width: auto;">
		<table id="dg" class="easyui-datagrid"
			data-options="border:false,singleSelect:false,fit:true,fitColumns:true,pageSize:20"
			pagination="true" toolbar="#menuDatagridtoolbar">
			<thead>
				<tr>
					<th data-options="field:'departNo'" width="80">部门编号</th>
					<th data-options="field:'departName'" width="80">部门名称</th>
					<th data-options="field:'sortNo'" width="80">排序号</th>
					<th data-options="field:'8',formatter:onOperateStyle" width="80">操作</th>
				</tr>
			</thead>
		</table>
		<div id="menuDatagridtoolbar">
		     <a href="javascript:alert('新增');" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>  
		</div>
	</div>
	<script type="text/javascript" src="js/department/department.js">
	</script>
  </body>
</html>
