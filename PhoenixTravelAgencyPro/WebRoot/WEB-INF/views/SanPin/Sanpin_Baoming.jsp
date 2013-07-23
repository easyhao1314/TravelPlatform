<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>报名确认受理 </title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  
  <body>
  <div id="p" class="easyui-panel" title="团队基本信息" style="width:auto;height:auto;padding:10px;">
<form id="jibenForm" action="">
	<table>
			<tr>
				<td><div class="fitem">
						<strong><label>团号:</label></strong>
				</td>
				<td><strong><input name="tuanNo" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>团队名称:</label></strong>
				</td>
				<td><strong><input name="tuanName" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>收客状态:</label></strong>
				</td>
				<td><strong><input name="shoukestate" class="easyui-validatebox"></strong>
					
				</td>
			</tr>
		<tr>
				<td><div class="fitem">
						<strong><label>出团日期:</label></strong>
				</td>
				<td><strong><input name="groupdate" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>同行价:</label></strong>
				</td>
				<td><strong><input name="tonghang" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>自备签价:</label></strong>
				</td>
				<td><strong><input name="zibeiqianjia" class="easyui-validatebox"></strong>
					
				</td>
			</tr>
			<tr>
				<td><div class="fitem">
						<strong><label>预收人数:</label></strong>
				</td>
				<td><strong><input name="numbermaster" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>团队报名人数:</label></strong>
				</td>
				<td><strong><input name="ycbjNo" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>确认人数:</label></strong>
				</td>
				<td><strong><input name="tdjb" class="easyui-validatebox"></strong>
					
				</td>
			</tr>
			<tr>
				<td><div class="fitem">
						<strong><label>备注:</label></strong>
				</td>
				<td colspan="5"><strong><input name="tsDesc" class="easyui-validatebox"></strong>
				</td>
			</tr>
	</table>
</form>
</div>
<!-- ----------------------------------------------------基本信息END----------------------------------------------------------------- -->
 <div class="easyui-tabs" style="width:auto;height:auto">
<div title="团队资料维护" style="padding:10px">
<table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/getDictionaryDescs.do',border:false,singleSelect:false,fitColumns:true, onClickRow: onClickRow,pageSize:20"
		pagination="true" toolbar="#tb">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'dicNo',editor:'text'" width="80">编号</th>
				<th data-options="field:'dicName',editor:'text'" width="80">名称</th>
				<th data-options="field:'dicDesc',editor:'text'" width="80">说明</th>
				<th data-options="field:'dicHelp',editor:'text'" width="80">帮助提示</th>
				<th data-options="field:'dicSortNo',editor:'numberbox'" width="80">显示顺序</th>
				<th data-options="field:'dicType',hidden:true"></th>
				<th data-options="field:'dicId',hidden:true"></th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<a href="javascript:addHangMoshi();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">新增</a>&nbsp;&nbsp;|  <a
			href="javascript:shanchu();" class="easyui-linkbutton"
			iconCls="icon-cut" plain="true">删除</a>&nbsp;&nbsp;|
		<a href="javascript:getChanges();" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">保存修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:Select();" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true">报名确认</a>
		<a href="javascript:Select();" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true">取消确认</a>
		<a href="javascript:Select();" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true">报名审批</a>
	</div>
</div>
<div title="操作进展" style="padding:10px">
<ul class="easyui-tree" data-options="url:'../tabs/tree_data1.json',animate:true"></ul>
</div>
<div title="财务情况" style="padding:10px">
<ul class="easyui-tree" data-options="url:'../tabs/tree_data1.json',animate:true"></ul>
</div>
</div>

<!-- ----------------------------------------------------TABS 选项卡 END----------------------------------------------------------------- --> 

	
	<div id="editDic" class="easyui-dialog" title="新增业务字段"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="dicFrome" method="post">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>编号:</label>
					</td>
					<td><input name="dicNo" class="easyui-validatebox"
						required="true">
						</div></td>
					<td><div class="fitem">
							<label>名称:</label>
					</td>
					<td><input name="dicName" class="easyui-validatebox"
						required="true">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>帮助提示:</label>
					</td>
					<td><input name="dicHelp" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>显示顺序:</label>
					</td>
					<td><input name="dicSortNo" class="easyui-numberbox"
						required="true">
						</div></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:mainBanMoshiSave();" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> <a href="javascript:closeEditDic();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
	<div id="searchDic" class="easyui-dialog" title="查询业务字段"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="searchForm" action="">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>编号:</label>
					</td>
					<td><input id="searchDicNo" name="dicNo"
						class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>名称:</label>
					</td>
					<td><input id="searchDicName" name="dicName"
						class="easyui-validatebox">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>帮助提示:</label>
					</td>
					<td><input id="searchDicHelp" name="dicHelp"
						class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>显示顺序:</label>
					</td>
					<td><input id="searchDicSortNo" name="dicSortNo"
						class="easyui-numberbox">
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
	<script type="text/javascript">
$(document).ready(function() {
	load();
}); 
function load(){
var url = "fenghuang/Sanpinliebiao.do?tuanNo="+'<%=request.getParameter("tuanNo") %>';
	$.ajax({
					url :url ,
					data : '<%=request.getParameter("tuanNo") %>',
					dataType : "json",
					success : function(data) {
					$('#jibenForm').form('load',data.rows[0]);

					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
}
	</script>
	<script type="text/javascript">
		var editIndex = undefined;
		function endEditing() {
			if (editIndex == undefined) {
				return true;
			}
			if ($('#dg').datagrid('validateRow', editIndex)) {
				$('#dg').datagrid('endEdit', editIndex);
				$('#dg').datagrid('unselectRow', editIndex);
				editIndex = undefined;
				return true;
			} else {
				return false;
			}
		}
		function addHangMoshi() {
			$("#dg").datagrid("insertRow", {
				index : 0,
				row : {
					dicType : '${param.dicType}'
				}
			});
			editIndex = undefined;
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
		function getChanges() {
			$('#dg').datagrid('endEdit', editIndex);
			var rows = $("#dg").datagrid("getChanges");
			if (rows.length > 0) {
				var param = {
					"updateRows" : $.toJSON(rows)
				};
				$.ajax({
					url : "fenghuang/updateDic.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("保存成功", "保存成功！", "info");
							$("#dg").datagrid('reload');
							editIndex = undefined;
						} else {
							$.messager.alert("保存失败", "保存失败!", "error");
						}
					},
					error : function() {
						$.messager.alert("保存失败", "服务器请求失败!", "error");
					}
				});
			}

		}

		function addMianBanMoshi() {
			$("#editDic").dialog("open");
			$("#dicFrome").form("clear");
		}

		function mainBanMoshiSave() {
			$('#dicFrome').form('submit', {
				url : 'fenghuang/saveDic.do?dicType=${param.dicType}',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
						$.messager.alert("保存成功", "保存成功！", "info");
						$('#editDic').dialog('close');
						$('#dg').datagrid('reload');
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#dg').datagrid('reload');
					}
				}
			});
		}

		function shanchu() {
			var rows = $("#dg").datagrid("getSelections");
			if (rows.length > 0) {
				var param = {
					"deleteRows" : $.toJSON(rows)
				};
				$.ajax({
					url : "fenghuang/deleteDics.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("删除成功", "删除成功！", "info");
							$("#dg").datagrid('reload');
						} else {
							$.messager.alert("删除失败", "删除失败!", "error");
						}
					},
					error : function() {
						$.messager.alert("删除失败", "服务器请求失败!", "error");
					}
				});
			}
		}
		function closeEditDic() {
			$('#editDic').dialog('close');
		} 

		//
		function searchDiJi() {
			$("#searchDic").dialog("open");
			$("#searchForm").form("clear");
		}
		function searchFormSubmit() {
			$("#searchDic").dialog("close");
			$("#dg").datagrid("load", {
				dicNo : $("#searchDicNo").val(),
				dicName : $("#searchDicName").val(),
				dicHelp : $("#searchDicHelp").val(),
				dicSortNo : $("#searchDicSortNo").val()
			});

		}

		function closedSearch() {
			$('#searchDic').dialog('close');
		}
	</script>
  </body>
</html>
