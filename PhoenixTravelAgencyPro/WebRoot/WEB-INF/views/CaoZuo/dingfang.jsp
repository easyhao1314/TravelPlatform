<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订房任务</title>
    
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

		    <table id="caozuoliebiaodg" class="easyui-datagrid"
		data-options="url:'fenghuang/dingfangSelect.do',border:false,singleSelect:true,fit:true,fitColumns:true,onRowContextMenu: caozuoContextMenu"
		pagination="true">
		<thead>
			<tr>
				<th data-options="field:'tuanNo'" width="20">团号</th>
				<th data-options="field:'ruzhuTime'" width="20">居住时间</th>
				<th data-options="field:'01'" width="20">居住城市</th>
				<th data-options="field:'02'" width="20">酒店标准</th>
				<th data-options="field:'caozuoqingkuang'" width="20">操作情况</th>
				<th data-options="field:'paidanren'" width="20">操作</th>
			</tr>
		</thead>
	</table>
	
  </body>
</html>
