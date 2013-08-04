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
	    		   	<td>团号:<input class="easyui-validatebox" type="text" name="team" id="team"></input></td>
	    			<td>销售，客户<input class="easyui-validatebox" type="text" name="caozuo" id="caozuo"></input></td>
	    			<td>
	    		<div style="padding:5px;border:0px solid #ddd;">
		<a href="javascript:cwtdfyselect()" class="easyui-linkbutton" data-options="toggle:true,group:'g1'">搜索</a>
	             </div>
	    			
	    		</td>
	    		</tr>	    		    		
	    	</table>

	<!-- 如果在正式开发环境下 url可以为后台的请求，地址 -->
	<div class="easyui-panel" title="团队费用"
		style="height:480px;width: auto;" toolbar="#currencyDatagridtoolbar">	
	<table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/caiwutuanduifeiyong.do',border:false,singleSelect:true,fit:true,fitColumns:true, onClickRow: onClickRow,pageSize:20"
		pagination="true" toolbar="#tb">
		<thead>
			<tr> 
			    <th data-options="field:'id',editor:'text'" width="5">ID</th>
				<th data-options="field:'team',editor:'text'" width="10">团号</th>
				<th data-options="field:'dicName',editor:'text'" width="10">团队名称</th>
				<th data-options="field:'chutuantime',editor:'text'" width="10">出团日期</th>
				<th data-options="field:'huituantime',editor:'text'" width="10">回团日期</th>
				<th data-options="field:'yingshou',editor:'text'" width="10">应收</th>
				<th data-options="field:'yishou',editor:'text'" width="10">已收</th>
				<th data-options="field:'yfk',editor:'text'" width="10">应付</th>		
				<th data-options="field:'yifu',editor:'numberbox'" width="10">已付</th>
				<th data-options="field:'tuikuan',editor:'numberbox'" width="10">退款</th>
				<th data-options="field:'fanyong',editor:'numberbox'" width="10">返佣</th>
				<th data-options="field:'yujilirun',editor:'numberbox'" width="10">预计利润</th>
			    <th data-options="field:'shijilirun',editor:'numberbox'" width="10">实际利润</th>
			</tr>
		</thead>
	</table>
	</div>
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
	<div id="editDic" class="easyui-dialog" title="新增业务字段"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="dicFrome" method="post">
			<table align="left">
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
		
			   //条件查询
		function cwtdfyselect(id){
		
		console.info($('#dg').datagrid('options'));
		var opts = $('#dg').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				team: $("#team").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				caozuo: $("#caozuo").val() ,
				caiwuid: id,

				page:  opts.pageNumber ,
				rows:  opts.pageSize
			};
		console.info(param);
				$.ajax({
					url : 'fenghuang/caiwutuanduifeiyong.do' ,
					data :  param,
					type : 'POST' ,
					dataType : 'json' ,
					success : function(data){
						$('#dg').datagrid('loadData',data);
					}
				});
		}
		
			//按id查询
		function caiwutdfyselect(id) {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window 
			
			//获取选中 数据
			var row = $("#dg").datagrid("getSelected");
		if(row!=null){
		 var url= "tuanduixinxi.do?team="+row.team;
       var tab = $('#tt').tabs('getSelected'); 
		if (tab){  
	                 var index = $('#tt').tabs('getTabIndex', tab); 
	                 $('#tt').tabs('close', index);  
	       } 
	       
	       $('#tt').tabs('add', {
				         title : "团队财务信息",
				         href : url,
				      //  closable : true,
				         }); 
		}
		}
		
		
	
	</script>
</body>
</html>
