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
		<a href="javascript:OpenAdd();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">添加</a>
		<a href="javascript:OpenUpdatericheng();" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true">修改</a>
		<a href="javascript:deletericheng();" class="easyui-linkbutton"
			iconCls="icon-cut" plain="true">删除</a>
	</div>
<table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/selectricheng.do',border:false,singleSelect:true,fit:true,fitColumns:true"
		pagination="true" toolbar="#tb">
		<thead>
			<tr>
				<th data-options="field:'riid'" width="50px">编号</th>
				<th data-options="field:'richenganpai'" width="50">日程安排</th>
				<th data-options="field:'chengshiid'" width="50">途径城市ID</th>
				<th data-options="field:'riid',formatter:onOperateSanpinList" width="50">操作</th>
			</tr>
		</thead>
	</table>
	<div id="addricheng" class="easyui-dialog" title="添加日行程"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="addform" method="post">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>编号:</label>
					</td>
					<td>系统自动生成
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
							<label>城市:</label>
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
	<!-- 修改日行程                        -->
	<div id="updatericheng" class="easyui-dialog" title="添加日行程"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="updaterichengfrom" method="post">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>编号:</label>
					</td>
					<td><input id="searchriid" name="riid" onfocus=this.blur() class="easyui-validatebox" ></input>
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
					<td><input id="searchtujingchengshiid" name="chengshiid"
						class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>城市:</label>
					</td>
					<td><input id="searchcaiyong" name="caiyong"
						class="easyui-validatebox">
						</div></td>
				</tr>
	
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:xingchengUpdate();" class="easyui-linkbutton"
						iconCls="icon-save">提交</a> <a href="javascript:closedSearch();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input id="searchDicType" name="dicType" type="hidden">
		</form>
		
		
	</div>
	<script type="text/javascript">
	function OpenAdd() {
			$("#addricheng").dialog("open");
			$("#addform").form("clear");
		}
	function OpenUpdatericheng(){
	var row = $("#dg").datagrid("getSelected");
		$("#updatericheng").dialog("open");
		$("#addform").form("clear");
		var url = "fenghuang/selectricheng.do?riid="+row.riid;
	$.ajax({
					url :url ,
					data : row.riid,
					dataType : "json",
					success : function(data) {
					$('#updatericheng').form('load',data.rows[0]);

					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
		
		
	}
		
	
	function  onOperateSanpinList(val,row){
		return '<a href="#">修改</a>';
	}
		function closedSearch() {
			$('#searchDic').dialog('close');
			$('#addricheng').dialog('close');
			$('#updatericheng').dialog('close');
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
				url : 'fenghuang/addricheng.do',
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
		function xingchengUpdate() {
			$('#updaterichengfrom').form('submit', {
				url : 'fenghuang/updatericheng.do',
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
		
		function deletericheng(){
		var row = $("#dg").datagrid("getSelected");
		var url="fenghuang/deletericheng.do?riid="+row.riid;
		$.ajax({
					url :url ,
					data : row.riid,
					dataType : "json",
					success : function(data) {
					$.messager.alert("删除成功", "删除成功", "info");
					$("#dg").datagrid("reload");

					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
		}
		
	</script>
  
  
  
  
  
	
  </body>
</html>
