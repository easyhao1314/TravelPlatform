<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Caozuo_Liebiao.jsp' starting page</title>
    
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
		data-options="url:'fenghuang/Operateinfo.do',border:false,singleSelect:true,fit:true,fitColumns:true,onRowContextMenu: caozuoContextMenu"
		pagination="true">
		<thead>
			<tr>
				<th data-options="field:'oid',hidden:true" width="20">编号</th>
				<th data-options="field:'tuanNo'" width="20">团号</th>
				<th data-options="field:'tuanName',formatter:caozuotuanName" width="20">团名</th>
				<th data-options="field:'kehuID'" width="20">客户ID</th>
				<th data-options="field:'kehuName'" width="20">客户名称</th>
				<th data-options="field:'chutuantime'" width="20">出团日期</th>
				<th data-options="field:'huituantime'" width="20">回团日期</th>
				<th data-options="field:'paidanren'" width="20">派单人</th>
				<th data-options="field:'jiedanren'" width="20">接单人</th>
				<th data-options="field:'jinzhan'" width="20">进展</th>
				<th data-options="field:'paidantime'" width="20">派单日期</th>
				<th data-options="field:'operateType'" width="20">操作类型</th>
				<th data-options="field:'operatestate'" width="20">操作状态</th>
			</tr>
		</thead>
	</table>
	<div id="mm" class="easyui-menu" style="width:120px;">
    <div onClick="View()" data-options="iconCls:'icon-search'">查看</div>
    <div onClick="add()" data-options="iconCls:'icon-add'">订房</div>
    <div onClick="edit()" data-options="iconCls:'icon-edit'">订车</div>
    <div onClick="del()" data-options="iconCls:'icon-remove'">订餐</div>
    <!-- <div class="menu-sep"></div>  -->
    <div onClick="print()" data-options="iconCls:'icon-print'">订导游</div>
    <div onClick="reload()" data-options="iconCls:'icon-reload'">订购物店</div>
</div>
	<script type="text/javascript">
	function caozuotuanName(val,row){
	//打开操作明细页面
		return '<a href="javascript:openCaozuomx('+row.tuanNo+')">'+row.tuanName+'</a>';
	}
	function caozuoContextMenu(e, rowIndex, rowData){
	 e.preventDefault();
	  $('#mm').menu('show', {
        left:e.pageX,
        top:e.pageY
    });  
	}
	function View(){
		var node = $('#caozuoliebiaodg').datagrid('getSelected');
		alert(node.oid);
	}
	</script>
	
  </body>
</html>
