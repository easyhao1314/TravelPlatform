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
  <!-- 下拉列表 -->
		

	
	
   <div id="tb">
		<a href="javascript:Select();" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">查询</a>
	</div>
<table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/Sanpinliebiao.do?Reviewstatus=1',border:false,singleSelect:false,fit:true,fitColumns:true, onClickRow: onClickRow"
		pagination="true" toolbar="#tb">
		<thead>
			<tr>
				<th data-options="field:'tuanNo'" width="50">团号</th>
				<th data-options="field:'tuanName'" width="50">团名/路线</th>
				<th data-options="field:'groupdate'" width="50">出团日期</th>
				<th data-options="field:'Tourdate'" width="50">回团日期</th>
				<th data-options="field:'targetpopulation'" width="50">出发城市</th>
				<th data-options="field:'tonghang'" width="50">同行价</th>
				<th data-options="field:'zhikejia'" width="50">直客价</th>
				<th data-options="field:'numbermaster'" width="50">预收人数</th>
				<th data-options="field:'productbrand',hidden:true" width="50">产品品牌_隐藏的</th>
			</tr>
		</thead>
	</table>
	<div id="searchDic" class="easyui-dialog" title="查询业务字段"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="selectFrome" method="post">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>出团日期:</label>
					</td>
					<td><input id="searchgroupdate" name="groupdate" class="easyui-datebox" ></input>
						</div></td>
					<td><div class="fitem">
							<label>回团日期:</label>
					</td>
					<td><input id="searchTourdate" name="Tourdate" class="easyui-datebox" ></input>
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>关键字:</label>
					</td>
					<td><input id="searchtuanName" name="tuanName"
						class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>产品品牌:</label>
					</td>
					<td><input id="searchproductbrand" class="easyui-combobox" 
			name="productbrand"
			data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=12',
					valueField:'dicId',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	">
						</div></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:searchFormSubmit();" class="easyui-linkbutton"
						iconCls="icon-ok">查询</a> <a href="javascript:closedSearch();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input id="searchDicType" name="dicType" type="hidden">
		</form>
		
		
	</div>
		<div id="mm1" style="width:150px;">
		<div iconCls="icon-undo">Undo</div>
		<div iconCls="icon-redo">Redo</div>
		<div class="menu-sep"></div>
		<div>Cut</div>
		<div>Copy</div>
		<div>Paste</div>
		<div class="menu-sep"></div>
		<div iconCls="icon-remove">Delete</div>
		<div>Select All</div>
	</div>
	<script type="text/javascript">
		function Select() {
			$("#searchDic").dialog("open");
			$("#searchForm").form("clear");
		}
		function closedSearch() {
			$('#searchDic').dialog('close');
		}
		function onClickRow(index) {
			if (editIndex != index) {
				if (endEditing()) {
					$('#dg').datagrid('selectRow', index).datagrid('beginEdit',
							index);
					editIndex = index;
				} else {
					$('#dg').datagrid('selectRow', editIndex);
				}
			}
		}
		function searchFormSubmit() {
			$("#searchDic").dialog("close");
			$("#dg").datagrid("load", {
				tuanName : $("#searchtuanName").val(),
				groupdate : $("#searchgroupdate").datebox('getValue'),
				Tourdate : $("#searchTourdate").datebox('getValue'),
				productbrand : $("#searchproductbrand").combobox('getValue')
			});

		}
	</script>
  
  
  
  
  
	
  </body>
</html>
