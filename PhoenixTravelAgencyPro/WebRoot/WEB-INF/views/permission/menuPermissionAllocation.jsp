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
    <table>
		<tr>
			<td>
			    <div id="dg5">
				<table id="dg1" class="easyui-datagrid" title="已有权限"
					style="width:400px;height:400px"
						data-options="singleSelect:false,collapsible:true,url:'fenghuang/getMenuPerssionsByRoleId.do?roleId=${param.roleId }'" pagination="true" >
					<thead>
						<tr>
						    <th data-options="field:'ck',checkbox:true"></th>
							<th data-options="field:'mpNo',width:80">编号</th>
							<th data-options="field:'mpName',width:100">名称</th>
							<th data-options="field:'mpDesc',width:80,align:'right'">描述</th>
						</tr>
					</thead>
				</table>
				</div>
			</td>
			 <td>
			 <input type="button" onclick="test1();" value="《《" /><br/>
			 <input type="button" onclick="test2();" value="》》" />
			 </td>
			<td>
				<div id="dg4"
					style="width: 400px;height: 400px;">
					<table id="dg2" class="easyui-datagrid" title="可分配的权限"
						style="width:400px;height:400px"
							data-options="singleSelect:false,collapsible:true,url:'fenghuang/getMenuPerssionsNotIncludeByRoleId.do?roleId=${param.roleId }'" pagination="true">
						<thead>
												<tr>
						    <th data-options="field:'ck',checkbox:true"></th>
							<th data-options="field:'mpNo',width:80">编号</th>
							<th data-options="field:'mpName',width:100">名称</th>
							<th data-options="field:'mpDesc',width:80,align:'right'">描述</th>
						</tr>
						</thead>
					</table>
				</div></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="button" onclick="test3();" value="保存" /></td>
			<td></td>
		</tr>
	</table>
	<script type="text/javascript">
		function test1(){
		   var dg2DataSelect = $("#dg2").datagrid("getSelections");
		    for(var i=0;i<dg2DataSelect.length;i++){
		     $("#dg1").datagrid("appendRow",dg2DataSelect[i]);
		    var index =  $("#dg2").datagrid("getRowIndex",dg2DataSelect[i]);
		    $("#dg2").datagrid("deleteRow",index);
		    }
		}
		
		function test2(){
		   var dg2DataSelect = $("#dg1").datagrid("getSelections");
		    for(var i=0;i<dg2DataSelect.length;i++){
		     $("#dg2").datagrid("appendRow",dg2DataSelect[i]);
		    var index =  $("#dg1").datagrid("getRowIndex",dg2DataSelect[i]);
		    $("#dg1").datagrid("deleteRow",index);
		    }
		}
		function test3(){
		var changesRows = $("#dg1").datagrid("getChanges","inserted");
		var changesRowsdelete = $("#dg1").datagrid("getChanges","deleted");
		var roleId = ${param.roleId};
      		if (changesRows.length > 0||changesRowsdelete.length) {
				var param = {
					"changesRows" : $.toJSON(changesRows),
					"changesRowsdelete" : $.toJSON(changesRowsdelete),
					"roleId":roleId
				};
				$.ajax({
					url : "fenghuang/saveMenuPerissionChange.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("成功", "成功！", "info");
							$("#dg1").datagrid('reload');
							$("#dg2").datagrid('reload');
						} else {
							$.messager.alert("失败", "失败!", "error");
						}
					},
					error : function() {
						$.messager.alert("失败", "服务器请求失败!", "error");
					}
				});
			}
        
        
		}
		
	</script>


</body>
</html>