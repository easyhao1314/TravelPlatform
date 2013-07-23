<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>日行程</title>
    
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
			iconCls="icon-add" plain="true">添加</a>
	</div>
<table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/selectricheng.do',border:false,singleSelect:false,fit:true,fitColumns:true, onClickRow: onClickRow"
		pagination="true" toolbar="#tb">
		<thead>
			<tr>
				<th data-options="field:'riid'" width="50">编号</th>
				<th data-options="field:'richenganpai'" width="50">日程安排</th>
				<th data-options="field:'chengshiid'" width="50">途径城市ID</th>
				<th data-options="field:'moren'" width="50">途径城市</th>
				<th data-options="field:'caiyong'" width="50">操作</th>
			</tr>
		</thead>
	</table>
	<div id="searchDic" class="easyui-dialog" title="添加日行程"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="addform" method="post">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>编号:</label>
					</td>
					<td><input id="searchid" name="id" class="easyui-validatebox" ></input>
						</div></td>
					<td><div class="fitem">
							<label>日程安排:</label>
					</td>
					<td><input id="searchrichenganpai" name="richenganpai" class="easyui-validatebox" ></input>
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>途径城市ID:</label>
					</td>
					<td><input id="searchtujingchengshiid" name="tujingchengshiid"
						class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>是否默认:</label>
					</td>
					<td><input id="searchmoren" name="moren" class="easyui-validatebox" ></input>
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>是否采用:</label>
					</td>
					<td><input id="searchcaiyong" name="caiyong"
						class="easyui-validatebox">
						</div></td>
					
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:xingchengSave();" class="easyui-linkbutton"
						iconCls="icon-save">提交</a> <a href="javascript:closedSearch();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input id="searchDicType" name="dicType" type="hidden">
		</form>
		
		
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
		function xingchengSave() {
			$('#addform').form('submit', {
				url : 'fenghuang/insertrixingcheng.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
						$.messager.alert("保存成功", "保存成功！", "info");
						closedSearch();
					   $("#dg").datagrid("reload");
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
					
					}
				}
			});
		}
	</script>
  
  
  
  
  
	
  </body>
</html>
