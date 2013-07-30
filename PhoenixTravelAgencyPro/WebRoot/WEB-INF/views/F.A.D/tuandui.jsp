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
	<table id="dg" class="easyui-datagrid"
		data-options="url:'',border:false,singleSelect:false,fit:true,fitColumns:true, onClickRow: onClickRow,pageSize:20"
		pagination="true" toolbar="#tb">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>	 
				<th data-options="field:'dicNo',editor:'text'" width="">付款日期</th>
				<th data-options="field:'dicName',editor:'text'" width="">团号</th>
				<th data-options="field:'dicDesc',editor:'text'" width="">团队名称</th>
				<th data-options="field:'dicHelp',editor:'text'" width="">供应商名称</th>
				<th data-options="field:'dicDesc',editor:'text'" width="">款项</th>
				<th data-options="field:'08',editor:'text'" width="">金额</th>
			
				<th data-options="field:'09',editor:'numberbox'" width="">提交人</th>
				<th data-options="field:'09',editor:'numberbox'" width="">审批状态</th>
				<th data-options="field:'09',editor:'numberbox'" width="">财务审核</th>
				<th data-options="field:'09',editor:'numberbox'" width="">财务确认</th>
				<th data-options="field:'09',editor:'numberbox'" width="">操作</th>
			
			</tr>
		</thead>
	</table>
	<div id="tb">
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
	<div id="editDic" class="easyui-dialog" title="新增业务字段"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="dicFrome" method="post">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>编号:</label>
					</td>
					<td><input name="dicNo" class="easyui-validatebox"
						required="true">
						</div></td>
					<td><div class="fitem">
							<label>名称:</label>
					</td>
					<td><input name="dicName" class="easyui-validatebox"
						required="true">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>帮助提示:</label>
					</td>
					<td><input name="dicHelp" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>显示顺序:</label>
					</td>
					<td><input name="dicSortNo" class="easyui-numberbox"
						required="true">
						</div></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:mainBanMoshiSave();" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> <a href="javascript:closeEditDic();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
	
	<script type="text/javascript">
		
		
		function onClickRow(index) {
			if (editIndex != index) {
				if (endEditing()) {
					$('#dg').datagrid('selectRow', index).datagrid('beginEdit',
							index);
					editIndex = index;
				} else {
					$('#dg').datagrid('selectRow', editIndex);
				}
			}
		}
	

		
	
	</script>
</body>
</html>
