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
	<!-- 如果在正式开发环境下 url可以为后台的请求，地址 -->
   <table>
	    		<tr>

	    			<td>
	    		币种:
              <input class="easyui-combobox"
              name="" 
              data-options="url:'',
              valueField:'dicId',
              textFiedld:'dicName',
              panelHeight:'auto'
              ">
              
               
                 </td> 
	    			<td>日期:<input id="dt" class="easyui-datetimebox" style="width:150px"></td>
	    		
	    			<td>
	    		<div style="padding:5px;border:1px solid #ddd;">
		<a href="#" class="easyui-linkbutton" data-options="toggle:true,group:'g1'">Button 1</a>
	             </div>
	    			
	    		</td>
	    		</tr>
	    	
	    		
	    	</table>
	
	    	<div id="tb">
		<a
			href="javascript:sfkzhwhopen();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">新增</a>&nbsp;&nbsp;| <a
			href="javascript:sfkzhwhdeleteopen();" class="easyui-linkbutton"
			iconCls="icon-cut" plain="true">删除</a>
		<a href="javascript:sfkzhwhupdateopen();" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">修改</a>
	</div>	
	    	
	    	</table>
	<table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/bizhonghuilv.do',border:false,singleSelect:false,fit:true,fitColumns:true, onClickRow: onClickRow,pageSize:20"
		pagination="true" toolbar="#tb">
		<thead>
		
			<tr>
			    
				<th data-options="field:'bizhong',editor:'text'" width="50">币种</th>
				<th data-options="field:'riqi',editor:'text'" width="50">日期</th>
				<th data-options="field:'huilv',editor:'text'" width="50">汇率</th>
				<th data-options="field:'danwei',editor:'text'" width="50">单位</th>
				<th data-options="field:'xianjinhuilv',editor:'text'" width="50">现金收款/换汇汇率</th>
				<th data-options="field:'gongshou',editor:'text'" width="50">对公收款/换汇汇率</th>
				<th data-options="field:'zhonghang',editor:'text'" width="50">中行折算价/基准价</th>
				<th data-options="field:'zuidihuilv',editor:'text'" width="50">公司最低汇率标准</th>
				
				
			
			</tr>
		</thead>
	</table>
	
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
	
	<script type="text/javascript">
		
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


		
	</script>
</body>
</html>
