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
  <div class="easyui-panel" title="财务" style="height:200px;width: auto;">
    <form id="caiwu" method="post">
  	
			
	</form>
	</div>
	
  
  <div id="tb">
           <a
			href="javascript:caiwutuanduisave();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">新增(面板模式)</a>&nbsp;&nbsp;| <a
			href="javascript:shanchu();" class="easyui-linkbutton"
			iconCls="icon-cut" plain="true">删除</a>&nbsp;&nbsp;|&nbsp;
		<a href="javascript:getChanges();" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">保存修改</a>
	</div>
    <div class="easyui-panel" title="团队收款" style="height:240px;width: auto;">
    
     <div id="tb">
		<a href="javascript:caiwutdfyselect();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">查看</a>&nbsp;&nbsp;| <a
			href="javascript:addMianBanMoshi();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">新增(面板模式)</a>&nbsp;&nbsp;| <a
			href="javascript:shanchu();" class="easyui-linkbutton"
			iconCls="icon-cut" plain="true">删除</a>&nbsp;&nbsp;| <a
			href="javascript:searchDiJi();" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">查询</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:getChanges();" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">保存修改</a>
	</div>
    
  
	<table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/caiwutuanduifeiyong.do?team=${param.team}',border:false,singleSelect:true,fit:true,fitColumns:true, onClickRow: onClickRow,pageSize:20"
		pagination="true" toolbar="#tb">
		<thead>
			<tr> 
			    <th data-options="field:'id',editor:'text'" width="50">单号</th>
				<th data-options="field:'kxsm',editor:'text'" width="50">款项说明</th>
				<th data-options="field:'khmc',editor:'text'" width="50">客户名称</th>
				<th data-options="field:'yushoutime',editor:'text'" width="80">预收日期</th>
				<th data-options="field:'huilvID',editor:'text'" width="50">汇率</th>
				<th data-options="field:'bizongid',editor:'text'" width="50">币种</th>
				<th data-options="field:'yingshou',editor:'text'" width="50">应收</th>
				<th data-options="field:'yishou',editor:'text'" width="50">已收</th>
				<th data-options="field:'weifu',editor:'text'" width="50">未付</th>		
				<th data-options="field:'ykfp',editor:'numberbox'" width="50">已开发票</th>
				<th data-options="field:'fpxk',editor:'numberbox'" width="50">发票许可</th>
				<th data-options="field:'a',editor:'numberbox'" width="50">销售确认</th>
				<th data-options="field:'yujilirun',editor:'numberbox'" width="50">财务确认</th>
			    <th data-options="field:'shijilirun',editor:'numberbox'" width="50">备注</th>
			    <th data-options="field:'shijilirun',editor:'numberbox'" width="50">责任人</th>
			</tr>
		</thead>
	</table>
</div>	
	
	
   <div class="easyui-panel" title="团队付款" style="height:240px;width: auto;">
	
	<table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/caiwutuanduifeiyong.do?team=${param.team}',border:false,singleSelect:true,fit:true,fitColumns:true, onClickRow: onClickRow,pageSize:20"
		pagination="true" toolbar="#tb">
		<thead>
			<tr> 
			    <th data-options="field:'id',editor:'text'" width="50">单号</th>
				<th data-options="field:'kxsm',editor:'text'" width="50">款项说明</th>
				<th data-options="field:'khmc',editor:'text'" width="50">供应商名称</th>
				<th data-options="field:'yushoutime',editor:'text'" width="80">预付日期</th>
				<th data-options="field:'huilvID',editor:'text'" width="50">汇率</th>
				<th data-options="field:'bizongid',editor:'text'" width="50">币种</th>
				<th data-options="field:'yingshou',editor:'text'" width="50">应收</th>
				<th data-options="field:'yishou',editor:'text'" width="50">已收</th>
				<th data-options="field:'weifu',editor:'text'" width="50">未付</th>		
				<th data-options="field:'ykfp',editor:'numberbox'" width="50">已开发票</th>
				<th data-options="field:'fpxk',editor:'numberbox'" width="50">发票许可</th>
				<th data-options="field:'a',editor:'numberbox'" width="50">销售确认</th>
				<th data-options="field:'yujilirun',editor:'numberbox'" width="50">财务确认</th>
			    <th data-options="field:'shijilirun',editor:'numberbox'" width="50">备注</th>
			    <th data-options="field:'shijilirun',editor:'numberbox'" width="50">责任人</th>
			</tr>
		</thead>
	</table>
	</div>
	
	
	<div id="caiwutdxxsave" class="easyui-dialog" title="应收款"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="tdxxform" action="">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>编号:</label>
					</td>
					<td><input id="id" name="id"
						class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>名称:</label>
					</td>
					<td><input id="caiwuid" name="caiwuid" value="2"
						class="easyui-validatebox">
						</div></td>
				</tr>
				
				<tr>
					<td><div class="fitem">
							<label>编号:</label>
					</td>
					<td><input id="id" name="id"
						class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>名称:</label>
					</td>
					<td><input id="caiwuid" name="caiwuid" value="2"
						class="easyui-validatebox">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>编号:</label>
					</td>
					<td><input id="id" name="id"
						class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>名称:</label>
					</td>
					<td><input id="caiwuid" name="caiwuid" value="2"
						class="easyui-validatebox">
						</div></td>
				</tr>
				
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:fkspupdateb();" class="easyui-linkbutton"
						iconCls="icon-ok">确认</a> <a href="javascript:closedSearch();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input id="searchDicType" name="dicType" type="hidden">
		</form>
	</div>
	<script type="text/javascript">
	//销售利润
	function lirun(val,row){
	var a=parseInt(row.baojia);
	var b=parseInt(row.chengben);
	var c=(a-b);
		return '<div style="width: auto;">'+c+'</div>';
	}
	//采购利润
	function caigoulirun(val,row){
	var a=parseInt(row.cgje);
	var b=parseInt(row.cglr);
	var c=(a-b);
		return '<div style="width: auto;">'+c+'</div>';
	}
	
	//添加	
		function caiwutuanduisave() {
			$("#caiwutdxxsave").dialog("open");
			$("#tdxxform").form("clear");
		}
        function closeEditDic() {
			$("#addweihu").dialog("close");
		} 
		function Saveweihu() {
			$('#dicFrome').form('submit', {
				url : 'fenghuang/weihutianjia.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
						$.messager.alert("保存成功", "保存成功！", "info");
						$('#addweihu').dialog('close');
						$('#dg').datagrid('reload');
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#dg').datagrid('reload');
					}
				}
			});
		}
	
	
	</script>
  </body>
</html>
