<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Xingcheng_weihu.jsp' starting page</title>
    
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
    <table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/xianluinfo.do',border:false,singleSelect:true,fit:true,fitColumns:true"
		pagination="true" toolbar="#tb">
		<thead>
			<tr>
				<th data-options="field:'xianid'" width="50px">编号</th>
				<th data-options="field:'xianluname'" width="50px">线路名称</th>
				<th data-options="field:'guojia'" width="50px">国家数</th>
				<th data-options="field:'tianshu'" width="50px">天数</th>
				<th data-options="field:'weihuren'" width="50px">维护人</th>
			</tr>
		</thead>
	</table>
	 <div id="tb">
		<a href="javascript:OpenAdd();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">添加</a>
		<a href="javascript:updateselectxianlu();" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true">修改</a>
		<a href="javascript:deletericheng();" class="easyui-linkbutton"
			iconCls="icon-cut" plain="true">删除</a>
	</div>
	<script type="text/javascript">
	function updateselectxianlu(){
	var row = $("#dg").datagrid("getSelected");
	if(row!=null){
		
	}
	
	
	}
	</script>
  </body>
</html>
