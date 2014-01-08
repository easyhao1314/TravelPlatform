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
	    	<div id="dgtb">	     		 	
	    	<a href="javascript:caiwufkspselecta();" class="easyui-linkbutton" iconCls="icon-add" plain="true">审批确认</a>  
		    <a href="javascript:caiwufkspselectb();" class="easyui-linkbutton" iconCls="icon-add" plain="true">取消付款</a> 
		    <a href="javascript:void(0);"  onclick="javascript:$('#asousuo').dialog('open');" class="easyui-linkbutton" iconCls="icon-save" plain="true">查询</a> 	
			<a href="javascript:cwfkspselect(2)" class="easyui-linkbutton" iconCls="icon-search" plain="true">待确认审批</a>
			<a href="javascript:cwfkspselect(4)" class="easyui-linkbutton" iconCls="icon-search" plain="true">已确认审批</a>
	</div>
	<table id="tuikuanshenhedg" class="easyui-datagrid"
		data-options="url:'fenghuang/caiwutdfylbselect.do?',border:false,singleSelect:true,fit:true,fitColumns:true, onClickRow: onClickRow,pageSize:20"
		pagination="true" toolbar="#dgtb">
		<thead>
			<tr>	    
				<th data-options="field:'id'" width="10px">id</th>
			
			</tr>
		</thead>
	</table>
<script type="text/javascript">
		function onClickRow(index) {
			if (editIndex != index) {
				if (endEditing()) {
					$('#tuikuanshenhedg').datagrid('selectRow', index).datagrid('beginEdit',
							index);
					editIndex = index;
				} else {
					$('#tuikuanshenhedg').datagrid('selectRow', editIndex);
				}
			}
		}
		</script>
</body>
</html>
