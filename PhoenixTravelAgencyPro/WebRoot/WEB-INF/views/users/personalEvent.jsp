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
<script type="text/javascript" src="js/datagrid-groupview.js"></script>

</head>

<body>
   	<table id="dgPersonal" class="easyui-datagrid"
		data-options="url:'fenghuang/getPersonalEvents.do?userId=${sesseionScope.userId }',border:false,singleSelect:false,fit:true,fitColumns:true,pageSize:20"
		pagination="true">
		<thead>
			<tr>
				<th data-options="field:'id'" width="80">事件编号</th>
				<th data-options="field:'eventDesc'" width="80">事件描述</th>
				<th data-options="field:'loginName'" width="80">操作人</th>
				<th data-options="field:'eventDate'" width="80">操作时间</th>
				<th data-options="field:'eventType'" width="80">操作类型</th>
			</tr>
		</thead>
	</table>
</body>