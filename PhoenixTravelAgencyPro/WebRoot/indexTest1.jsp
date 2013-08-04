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
    <!-- 页面的样式让赵阳 他们来决定吧，这个要根据需求来定义啊 -->
    <div>
        可以在这里添加相应的 查询，条件等操作
    </div>
    <!-- 如果在正式开发环境下 url可以为后台的请求，地址 -->
	<table id="dg" class="easyui-datagrid"
		data-options="url:'js/demo/layout/datagrid_data1.json',border:false,singleSelect:true,fit:true,fitColumns:true">
		<thead>
			<tr>
				<th data-options="field:'itemid',checkbox:true"></th>
				<th data-options="field:'productid'" width="100">Product ID</th>
				<th data-options="field:'listprice',align:'right'" width="80">List
					Price</th>
				<th data-options="field:'unitcost',align:'right'" width="80">Unit
					Cost</th>
				<th data-options="field:'attr',editor:'text'" width="150">Attribute</th>
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
			//在这里可以通过请求后台，查看该信息。是否打开tab，还是直接弹出window 

		}
		function edit() {
			var node = $('#dg').datagrid('getSelected');
			alert(node.itemid);
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window 
		}
		function del() {
			var node = $('#dg').datagrid('getSelected');
			alert(node.itemid);
			//通过主键，删除该记录，并重新加载datagrid。
		}

		function add() {
		$('#w').window('open','index.jsp');
			
			
		}
	</script>
	
	  <div id="w" class="easyui-window" title="Basic Window" data-options="iconCls:'icon-save'" style="width:500px;height:200px;padding:10px;">    
    </div>  
</body>
</html>
