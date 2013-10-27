<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
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
   	<table id="sanpinshenpidg" class="easyui-datagrid"
		data-options="url:'fenghuang/Sanpinshenpiinfo.do?userId=${sessionScope.userId}',border:false,singleSelect:true,fit:true,fitColumns:true"
		pagination="true" toolbar="#sanpinshenpitb">
		<thead>
			<tr>
				<th data-options="field:'id',hidden:true" width="50">ID</th>
				<th data-options="field:'tuanNo'" width="50">团号</th>
				<th data-options="field:'tuanName'" width="50">团名</th>
				<th data-options="field:'shenheren'" width="50">审核人</th>
				<th data-options="field:'shenpi'" width="50">状态</th>
				<th data-options="field:'shenhejieguo'" width="50">审核结果</th>
				<th data-options="field:'shenpiyijian'" width="50">审批意见</th>
				
			</tr>
		</thead>
	</table>
  </body>
</html>
