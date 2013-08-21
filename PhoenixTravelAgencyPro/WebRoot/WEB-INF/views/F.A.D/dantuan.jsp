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
	    		   	<td>团号:<input class="easyui-validatebox" type="text" name="team"  id="team"></input></td>
	    			<td>客户:<input class="easyui-validatebox" type="text" name="khmc" id="khmc"></input></td>
	    			<td>
	    		<div style="padding:5px;">
		<a href="javascript:sanpinselect()" class="easyui-linkbutton" data-options="toggle:true,group:'g1'">搜索</a>
	             </div>
	    			
	    		</td>
	    		</tr>    		
	    	</table>
	<!-- 如果在正式开发环境下 url可以为后台的请求，地址 -->
	 <div class="easyui-panel" title="单团费用列表"
		style="height:500px;width: auto;" toolbar="#currencyDatagridtoolbar">	
	<table id="sanpindg" class="easyui-datagrid"
		data-options="url:'fenghuang/caiwuqrfkselect.do?shenfenid=2&&ysyfid=1',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
		pagination="true" toolbar="#tb">
		<thead>
			<tr>
				<th data-options="field:'team',editor:'text'" width="50">团号</th>
				<th data-options="field:'tuanduimc',editor:'text'" width="50">团队名称</th>
				<th data-options="field:'suppliers',editor:'text'" width="50">回团时间</th>
				<th data-options="field:'khmc',editor:'text'" width="">客户/联系人</th>
				<th data-options="field:'xiaoshou',editor:'text'" width="50">销售专员</th>			
				<th data-options="field:'aa',editor:'numberbox'" width="">状态</th>
				<th data-options="field:'renshu',editor:'numberbox'" width="50">人数</th>
				<th data-options="field:'bizhong',editor:'numberbox'" width="50">币种</th>
				
			
			</tr>
		</thead>
	</table>
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
		
		
			function sanpinselect(id){
		console.info($('#sanpindg').datagrid('options'));
		var opts = $('#sanpindg').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				team: $("#team").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				khmc: $("#khmc").val() ,
                shenfenid:1,
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
						$('#sanpindg').datagrid('loadData',data);
					}
				});
		}
		
		
	</script>
</body>
</html>
