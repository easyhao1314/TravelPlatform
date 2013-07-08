<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link rel="stylesheet" type="text/css"
	href="js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="js/demo/demo.css">
<script type="text/javascript" src="js/jquery.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/jquery.json.js" charset="UTF-8"></script>
</head>

<body>
    <!-- 查询结果展示 -->
	   <table id="queryResult">
			<thead>
				<tr>
					<th data-options="field:'tpsdNo',align:'right'" width="100">编号</th>
					<th data-options="field:'tpsdName',align:'right'" width="100" editor="text">名称</th>
					<th data-options="field:'tpsdDesc',align:'right'" width="100" editor="text">说明</th>
					<th data-options="field:'tpsdHelp',align:'right'" width="100" editor="text">帮助提示</th>
					<th data-options="field:'tpsdSort',align:'right'" width="100" editor="numberbox">显示顺序</th>
				</tr>
		</thead>
	</table>
	<!-- 查询结果展示 -->
	
	<div id="tb">
			<a
			href="javascript:addMianBanMoshi();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">新增</a>&nbsp;&nbsp;|
			<a
			href="javascript:shanchu();" class="easyui-linkbutton"
			iconCls="icon-cut" plain="true">删除</a>&nbsp;&nbsp;|
			<a
			href="javascript:searchValueDialog();" class="easyui-linkbutton"
			iconCls="icon-search" plain="true">查询</a>&nbsp;&nbsp;|
			<a
			href="javascript:getChanges();" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true">保存修改</a>&nbsp;&nbsp;
	</div>
	<!-- 新增客户价值字典 -->
	<div id="addValue" class="easyui-dialog" title="新增客户价值字典"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:200px;padding:10px;">
		<form id="addValueForm" method="post">
			<table align="center">
				<tr>
					<td><div class="fitem">
							<label>编号:</label>
					</td>
					<td><input name="tpsdNo" class="easyui-validatebox" required="true">
						</input>
						</div></td>
						<td><div class="fitem">
							<label>名称:</label>
					</td>
					<td><input  name="tpsdName" class="easyui-validatebox" required="true">
						</input>
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>帮助提示:</label>
					</td>
					<td><input name="tpsdHelp" class="easyui-validatebox" required="true">
						</div></td>
					<td><div class="fitem">
							<label>显示顺序:</label>
					</td>
					<td><input name="tpsdSort" class="easyui-numberbox easyui-validatebox" required="true" missingMessage="请输入数字." invalidMessage="请输入数字.">
						</div></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:mainBanMoshiSave();" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> <a href="javascript:closeaddMianBan();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 新增客户价值字典结束 -->
	
	
	
	<!-- 查询客户价值字典 -->
	<div id="searchValue" class="easyui-dialog" data-options="modal:true,closed:true,iconCls:'icon-save'" title="查询业务字典" style="width:600px;height:200px;padding:10px;">
		<form id="searchValueForm" method="post">
		<input type="hidden" value="${param.wordprefix}" name="wordprefix" />
			<table align="center">
				<tr>
					<td><div class="fitem">
							<label>编　　号:</label>
					</td>
					<td><input name="tpsdNo" class="easyui-validatebox" >
						</input>
						</div></td>
						<td><div class="fitem">
							<label>名　　称:</label>
					</td>
					<td><input  name="tpsdName" class="easyui-validatebox" >
						</input>
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>帮助提示:</label>
					</td>
					<td><input name="tpsdHelp" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>显示顺序:</label>
					</td>
					<td><input name="tpsdSort" class="easyui-numberbox easyui-validatebox">
						</div></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:mainBanMoshiSearch();" class="easyui-linkbutton"
						iconCls="icon-ok">查询</a> <a href="javascript:closesearchMianBan();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 查询客户价值字典结束 -->
	
   <script type="text/javascript">
   		$("#queryResult").datagrid({
   			url : 'fenghuang/customerVIPDic.do?wordprefix=${param.wordprefix}' ,
   			border : false ,
   			singleSelect : true ,
   			fit : true ,
   			fitColumns : true ,
   			toolbar : '#tb' ,
   			pagination: true,
			checkOnSelect : true,
			onRowContextMenu : onRowContextMenu,
			pageSize : 10 ,
			pageList : [10,20,50]  ,
			onClickRow : onClickRow 
		});
		
		function onRowContextMenu(e, rowIndex, rowData) {
			e.preventDefault();
			var selected = $("#queryResult").datagrid('getRows'); //获取所有行集合对象
			selected[rowIndex].id; //index为当前右键行的索引，指向当前行对象
			$('#mm').menu('show', {
				left : e.pageX,
				top : e.pageY
			});
		}
		
		var editIndex = undefined;
		function endEditing() {
			if (editIndex == undefined) {
				return true ;
			}
			if ($('#queryResult').datagrid('validateRow', editIndex)) {
				$('#queryResult').datagrid('endEdit', editIndex);
				$('#queryResult').datagrid('unselectRow', editIndex);
				editIndex = undefined;
				return true;
			} else {
				return false;
			}
		}
		
		function onClickRow(index) {
			if (editIndex != index) {
				if (endEditing()) {
					$('#queryResult').datagrid('selectRow', index).datagrid('beginEdit',
							index);
					editIndex = index;
				} else {
					$('#queryResult').datagrid('selectRow', editIndex);
				}
			}
		}
		//保存修改
		function getChanges() {
			$('#queryResult').datagrid('endEdit', editIndex);
			var row = $("#queryResult").datagrid("getChanges");
			//console.info(encodeURI($.toJSON(row)));
			if (row) {
				var param = {
					"updateRow" : encodeURI($.toJSON(row),"UTF-8")
				};
				$.ajax({
					url : "fenghuang/updateCustomVIP.do",
					data : param,
					dataType : "json",
					contentType : "application/json;charset=UTF-8",
					success : function(data) {
						if (data.success) {
							$.messager.alert("修改成功", "修改成功！", "info");
							$("#queryResult").datagrid('reload');
							editIndex = undefined;
						} else {
							$.messager.alert("修改失败", "修改失败!", "error");
						}
					},
					error : function() {
						$.messager.alert("修改失败", "服务器请求失败!", "error");
					}
				});
			}

		}
		
		
		//弹出增加客户价值字典面板
		function addMianBanMoshi() {
			$("#addValue").dialog("open");
			$("#addValueForm").form("clear");
		}
		
		//关闭新增面板
		function closeaddMianBan() {
			$("#addValue").dialog('close');
		} 
		//关闭查询面板
		function closesearchMianBan(){
			$("#searchValue").dialog('close');
		}
		//将Form表单的值序列化成对象
		serializeObject = function(form){
			var o = {} ;
			$.each(form.serializeArray(),function(index){
				if(o[this['name']]){
					o[this['name']] = o[this['name']] + "," + this['value'] ;
				}else{
					o[this['name']] =this['value'] ;
				}
			});
			return o ;
		} ;
		//点击面板保存,保存客户价值字典信息
		function mainBanMoshiSave() {
	  			$.ajax({
	  				url : 'fenghuang/addCustomerVIP.do',
	  				type : 'POST' ,
	  				data : JSON.stringify(serializeObject($("#addValueForm").form())),
	  				dataType : 'json' ,
	  				contentType : 'application/json;charset=UTF-8' ,
	  				success : function(data){
						if (data.success) {
							$.messager.alert("保存成功", "保存成功！", "info");
							$("#addValue").dialog('close');
							$("#queryResult").datagrid('reload');
						} else {
							$.messager.alert("保存失败", "保存失败!", "error");
							$("#queryResult").datagrid('reload');
						}
					}  
	  			});
		}
		
		//点击删除按钮
		function shanchu() {
			$.messager.confirm('删除确认','您确定要删除此项纪录吗?',function(r){
			if(r){
					var row = $("#queryResult").datagrid("getSelected");
			if (row) {
				var param = {
					"deleteRow" : row.tpsdNo
				};
				$.ajax({
					url : "fenghuang/deleteCustomVIP.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("删除成功", "删除成功！", "info");
							$("#queryResult").datagrid('reload');
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
		});
		
		}
	
		//开启查询dialog
		function searchValueDialog(){
			//$('#searchValue').dialog('open');
			alert(111);
		}
		
		//查询
		function mainBanMoshiSearch(){
			$.post('fenghuang/searchCustomVIP.do',$('#searchValueForm').serialize(),function(data){
				$('#searchValue').dialog('close');
				$('#queryResult').datagrid('loadData',data);
			},'json');
		}
   </script>
    	
    
</body>
</html>
