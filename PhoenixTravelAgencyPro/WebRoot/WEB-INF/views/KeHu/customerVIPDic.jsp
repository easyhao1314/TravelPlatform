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
    <div class="easyui-panel" title="客户VIP字典列表"
		style="height:480px;width: auto;">
		<table id="dg" class="easyui-datagrid"
			data-options="url:'fenghuang/KehuSelect.do',border:false,singleSelect:false,fit:true,fitColumns:true,pageSize:20"
			pagination="true" toolbar="#currencyDatagridtoolbar">
			<thead>
				<tr>
				    <th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'id',align:'right'" width="100">编号</th>
					<th data-options="field:'name',align:'right'" width="100" editor="text">名称</th>
					<th data-options="field:'shuoming',align:'right'" width="100" editor="text">说明</th>
					<th data-options="field:'tishi',align:'right'" width="100" editor="text">帮助提示</th>
					<th data-options="field:'8',formatter:onOperateStyle" width="80">操作</th>
				</tr>
		</thead>
	</table>
        <div id="currencyDatagridtoolbar">
		     <a href="javascript:addZiXin();" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>  
		</div>
	</div>

	
	
	<!-- 新增客户VIP字典
	<div id="addVIP" class="easyui-dialog" title="新增业务字典"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:200px;padding:10px;">
		<form id="addForm" method="post">
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
	</div> -->
	<!-- 新增客户VIP字典结束 -->
	
	
	
	<!-- 查询客户VIP字典
	<div id="searchVIP" class="easyui-dialog" data-options="modal:true,closed:true,iconCls:'icon-save'" title="查询业务字典" style="width:600px;height:200px;padding:10px;">
		<form id="searchForm" method="post">
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
	</div> -->
	<!-- 查询客户VIP字典结束 -->
	
   <script type="text/javascript">
   		
   </script>
    	
    
</body>
</html>
