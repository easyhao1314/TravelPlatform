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
		data-options="url:'fenghuang/Approvalinfo.do?shenpitype=${param.shenpitype} ',border:false,singleSelect:true,fit:true,fitColumns:true"
		pagination="true" toolbar="#tb">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'shenqingDate'" width="50">申请日期</th>
				<th data-options="field:'shiwu',formatter:tuituanshiwu" width="50">事务</th>
				<th data-options="field:'shenqingren'" width="50">申请人</th>
				<th data-options="field:'shenpiDate'" width="50">审批日期</th>
				<th data-options="field:'shenheren'" width="50">审核人</th>
				<th data-options="field:'approvalStatus'" width="50">审批状态</th>
				<th data-options="field:'shenpitype'" width="50">审批类型</th>
				<th data-options="field:'approvaltuanNo'" width="50">申请团号</th>
				<th data-options="field:'beizhu'" width="50">备注</th>
			</tr>
		</thead>
	</table>
	
	<script type="text/javascript">
	function tuituanshiwu(val,row){
	return '<a href="javascript:openShenpimingxi('+row.approvalNo+','+row.approvaltuanNo+')">'+row.shiwu+'</a>';
	}
	function openShenpimingxi(aNo,atuanNo){
	var url = "Sanpin_shenpimingxi.do?aNo="+aNo+"&atuanNo="+atuanNo;
		 var tab = $('#tt').tabs('getSelected'); 
		if (tab){  
	                 var index = $('#tt').tabs('getTabIndex', tab); 
	                 $('#tt').tabs('close', index);  
	       } 
	       
	       $('#tt').tabs('add', {
				         title : "退团详细信息",
				         href : url,
				      //  closable : true,
				         });  
	}
	</script>
  
  
  
  
  
	
  </body>
</html>
