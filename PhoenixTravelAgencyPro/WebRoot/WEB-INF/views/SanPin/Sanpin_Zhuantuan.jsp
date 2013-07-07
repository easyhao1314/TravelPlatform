<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>散拼团列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  
	

	
	 <div id="tb">
		<a href="" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">待审批</a>
		<a href="" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">已审批</a>
	</div>
  
<table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/tuituan.do',border:false,singleSelect:false,fit:true,fitColumns:true, onClickRow: onClickRow"
		pagination="true" toolbar="#tb">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true">选中</th>
				<th data-options="field:'shenqingDate'" width="50">申请日期</th>
				<th data-options="field:'shiwu'" width="50">事务</th>
				<th data-options="field:'shenqingren'" width="50">申请人</th>
				<th data-options="field:'shenpiDate'" width="50">审批日期</th>
				<th data-options="field:'shenheren'" width="50">审核人</th>
				<th data-options="field:'beizhu'" width="50">备注</th>
				<th data-options="field:'shenqingDate',hidden:true" width="50">审批号</th>
			</tr>
		</thead>
	</table>
	
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
