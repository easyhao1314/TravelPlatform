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
<script type="text/javascript" src="js/datagrid-groupview.js"></script>
</head>

<body>
	<table id="dgUsers" class="easyui-datagrid"
		data-options="url:'fenghuang/getUsers.do',border:false,singleSelect:false,fit:true,fitColumns:true,pageSize:20,view:groupview,
          groupField:'departName',
          groupFormatter:function(value,rows){
           return '所属部门:'+value + ' - ' + rows.length + '名员工';
          }"
		pagination="true" toolbar="#tbUsers">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'userNumber',editor:'text'" width="80">编号</th>
				<th data-options="field:'userName',editor:'text'" width="80">姓名</th>
				<th data-options="field:'loginName',editor:'text'" width="80">登陆名</th>
				<th data-options="field:'enName',editor:'text'" width="80">简写</th>
				<th data-options="field:'birthday',editor:'text'" width="80">生日</th>
				<th data-options="field:'telephoneExt',editor:'text'" width="80">分机号</th>
				<th data-options="field:'telephone',editor:'text'" width="80">电话</th>
				<th data-options="field:'email',editor:'text'" width="80">MAIL</th>
				<th data-options="field:'departName',editor:{
					type:'combobox',
							options:{
								valueField:'id',
								textField:'departName',
								url:'fenghuang/getDepartmentComboboxs.do'
							}
				}" width="80">所属部门</th>
				<th data-options="field:'jobDescription',editor:'text'" width="80">岗位说明</th>
				<th data-options="field:'sortNumber',editor:'text'" width="80">排序</th>
				<th data-options="field:'companyName',editor:{
					type:'combobox',
							options:{
								valueField:'id',
								textField:'companyName',
								url:'fenghuang/getCompanyComboboxs.do'
							}
				
				}" width="80">公司</th>
				<th data-options="field:'id',hidden:true"></th>
			</tr>
		</thead>
	</table>
	<div id="tbUsers">
		<a href="javascript:addHangMoshi();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">新增(行模式)</a>&nbsp;&nbsp;| <a
			href="javascript:addMianBanMoshi();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">新增(面板模式)</a>&nbsp;&nbsp;| <a
			href="javascript:shanchu();" class="easyui-linkbutton"
			iconCls="icon-cut" plain="true">删除</a>&nbsp;&nbsp;| <a
			href="javascript:searchDiJi();" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">查询</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:getChanges();" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">保存修改</a>
	</div>
</body>