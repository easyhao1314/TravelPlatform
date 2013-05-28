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

<title>Test DataGrid 例子</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" type="text/css"
	href="js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="js/demo/demo.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
</head>

<body>

    <div>
        可以在这里添加相应的 查询，条件等操作
    </div>

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
	<div id="mm" class="easyui-menu" style="width:120px;">
		<div onClick="view()" data-options="iconCls:'icon-search'">查看</div>
		<div onClick="add()" data-options="iconCls:'icon-add'">新增</div>
		<div onClick="edit()" data-options="iconCls:'icon-edit'">编辑</div>
		<div onClick="del()" data-options="iconCls:'icon-remove'">删除</div>
	</div>
	<script type="text/javascript">
		$('#dg').datagrid({
			pagination : true,
			checkOnSelect : true,
			onRowContextMenu : onRowContextMenu,
		});
		function onRowContextMenu(e, rowIndex, rowData) {
			e.preventDefault();
			var selected = $("#dg").datagrid('getRows'); //获取所有行集合对象
			selected[rowIndex].id; //index为当前右键行的索引，指向当前行对象
			$('#mm').menu('show', {
				left : e.pageX,
				top : e.pageY
			});
		}

		function view() {
			var node = $('#dg').datagrid('getSelected');
			alert(node.itemid);

		}
		function edit() {

		}
		function del() {
		}

		function add() {

		}
	</script>
</body>
</html>
