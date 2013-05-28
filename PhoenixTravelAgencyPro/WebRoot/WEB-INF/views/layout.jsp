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
<link rel="stylesheet" type="text/css"
	href="js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="js/demo/demo.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>
</head>

<body class="easyui-layout">
	<div data-options="region:'north'" style="height:25px;background:#666;" border="false"></div>
	<div data-options="region:'south'" style="height:25px;background:#666;" border="false"></div>
	<div data-options="region:'west',split:true" title="菜单"
		style="width:150px;"></div>
	<div data-options="region:'center',title:'欢迎页面'">
		<table id="dg" class="easyui-datagrid"
			data-options="url:'js/demo/layout/datagrid_data1.json',border:false,singleSelect:true,fit:true,fitColumns:true">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'itemid'" width="80">Item ID</th>
					<th data-options="field:'productid'" width="100">Product ID</th>
					<th data-options="field:'listprice',align:'right'" width="80">List
						Price</th>
					<th data-options="field:'unitcost',align:'right'" width="80">Unit
						Cost</th>
					<th data-options="field:'attr'" width="150">Attribute</th>
					<th data-options="field:'status',align:'center'" width="50">Status</th>
				</tr>
			</thead>
		</table>
	</div>
	<script type="text/javascript">
		$('#dg').datagrid({
			pagination : true,
			checkOnSelect : true,
			onRowContextMenu : function(e, rowIndex, rowData) {
				alert(rowData.itemid);
			}
		});
	</script>
</body>
</html>
