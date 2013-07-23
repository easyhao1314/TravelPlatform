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
	    		   	<td>团号:<input class="easyui-validatebox" type="text" name="team" id="team" ></input></td>
	    			<td>销售，客户<input class="easyui-validatebox" type="text" name="name" ></input></td>
	    			<td>
	    		<div style="padding:5px;border:1px solid #ddd;">
		<a href="javascript:dijieSelectLike()" class="easyui-linkbutton" data-options="toggle:true,group:'g1'">Button 1</a>
	             </div>
	    			
	    		</td>
	    		</tr>
	    	
	    		
	    	</table>
	    	<table>
	    		<tr>
	    		<td>账号：[<a href="">待确认收款</a>][<a href="">已确认收款</a>]</td>
	    		</tr>
	    		<tr>
	    		<td>状态：[<a href="">待确认收款</a>][<a href="">已确认收款</a> ]</td>
	    		</tr>	    		
	    		<tr>
	    		<td>日期：[全部] [未收到][已收到] </td>
	    		</tr>
	    		<tr>
	    		<td>
	    		日期:
              <input class="easyui-combobox"
              name="" 
              data-options="url:'',
              valueField:'dicId',
              textFiedld:'dicName',
              panelHeight:'auto'
              ">
              
               [全部] [1月] [2月] [3月] [4月] [5月] [6月] [7月] [8月] [9月] [10月] [11月] [12月]
               
                 </td> 
	    		
	    		</tr>
	    	
	    	</table>
	<table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/caiwuqrfkselect.do',border:false,singleSelect:false,fit:true,fitColumns:true, onClickRow: onClickRow,pageSize:20"
		pagination="true" toolbar="#tb">
		<thead>
			<tr>
				 
				<th data-options="field:'payment',editor:'text'" width="">付款日期</th>
				<th data-options="field:'zhanghaoid',editor:'text'" width="">账号</th>
				<th data-options="field:'team',editor:'text'" width="">团号</th>
				<th data-options="field:'suppliers',editor:'text'" width="">团队名称</th>
				<th data-options="field:'gysid',editor:'text'" width="">供应商名称</th>
				<th data-options="field:'dicDesc',editor:'text'" width="">款项</th>
				<th data-options="field:'08',editor:'text'" width="">金额</th>
			
				<th data-options="field:'caozuo',editor:'numberbox'" width="">提交人</th>
				<th data-options="field:'review',editor:'numberbox'" width="">财务审核</th>
				<th data-options="field:'cashier',editor:'numberbox'" width="">财务确认</th>
			
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
		function dijieSelectLike(){
		console.info($('#dg').datagrid('options'));
		var opts = $('#dg').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				team: $("#team").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				xingzhi: $("#xingzhi").val() ,
				
				page:  opts.pageNumber ,
				rows:  opts.pageSize
			};
		console.info(param);
				$.ajax({
					url : 'fenghuang/caiwuqrfkselect.do' ,
					data :  param,
					type : 'POST' ,
					dataType : 'json' ,
					success : function(data){
						$('#dg').datagrid('loadData',data);
					}
				});
		}

	</script>
</body>
</html>
