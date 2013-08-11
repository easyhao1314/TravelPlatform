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
	<div class="easyui-panel" title="团队费用"
		style="height:530px;width: auto;" toolbar="#currencyDatagridtoolbar">	
	<table id="sfkzhwhdg" class="easyui-datagrid"
		data-options="url:'fenghuang/skzhanghaoselect.do',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
		pagination="true" toolbar="#tb">
		<thead>
			<tr> 
			    <th data-options="field:'id',editor:'text'" width="5">编号</th>
				<th data-options="field:'zhanghaoming',editor:'text'" width="10">账号名称</th>
				<th data-options="field:'yongtu',editor:'text'" width="10">用途</th>
				<th data-options="field:'bizhong',editor:'text'" width="10">币种</th>
				<th data-options="field:'huming',editor:'text'" width="10">户名</th>
				<th data-options="field:'zhanghao',editor:'text'" width="10">账号</th>
				<th data-options="field:'kaihuhang',editor:'text'" width="10">开户行</th>
				<th data-options="field:'shiyongshuoming',editor:'text'" width="10">使用说明</th>
			</tr>
		</thead>
	</table>
	</div>
	
	<div id="tb">
		<a
			href="javascript:sfkzhwhopen();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">新增</a>&nbsp;&nbsp;| <a
			href="javascript:shanchu();" class="easyui-linkbutton"
			iconCls="icon-cut" plain="true">删除</a>
		<a href="javascript:getChanges();" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">修改</a>
	</div>
	
	
	
	
	<div id="sfkzhwhid" class="easyui-dialog" title="财务审批确认"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="sfkzhwhform" action="">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>编号:</label>
					</td>
					<td><input id="id" name="id"
						class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>名称:</label>
					</td>
					<td><input id="zhanghaoming" name="zhanghaoming" 
						class="easyui-validatebox">
						</div></td>
				</tr>
				
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:sfkzhwhsave();" class="easyui-linkbutton"
						iconCls="icon-ok">确认</a> <a href="javascript:closedSearch();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input id="searchDicType" name="dicType" type="hidden">
		</form>
	</div>
	<script type="text/javascript">
		
		function onClickRow(index) {
			if (editIndex != index) {
				if (endEditing()) {
					$('#sfkzhwhdg').datagrid('selectRow', index).datagrid('beginEdit',
							index);
					editIndex = index;
				} else {
					$('#sfkzhwhdg').datagrid('selectRow', editIndex);
				}
			}
		}
		
		
		//添加	
		
		function sfkzhwhopen() {
			$("#sfkzhwhid").dialog("open");
			$("#sfkzhwhform").form("clear");
		}
        function closeEditDic() {
			$("#sfkzhwhid").dialog("close");
		} 
		function sfkzhwhsave() {
			$('#sfkzhwhform').form('submit', {
				url : 'fenghuang/skzhanghaoinsert.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
						$.messager.alert("保存成功", "保存成功！", "info");
						$('#sfkzhwhid').dialog('close');
						$('#sfkzhwhdg').datagrid('reload');
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#sfkzhwhdg').datagrid('reload');
					}
				}
			});
		}
	</script>
</body>
</html>
