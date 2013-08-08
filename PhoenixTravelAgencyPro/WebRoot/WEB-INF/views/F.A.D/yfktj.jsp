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
	    		   	<td>团号:<input class="easyui-validatebox" type="text" name="team"  id="team"></input></td>
	    			<td>客户:<input class="easyui-validatebox" type="text" name="khmc" id="khmc"></input></td>
	    			<td>
	    		<div style="padding:5px;">
		<a href="javascript:yfktjselect()" class="easyui-linkbutton" data-options="toggle:true,group:'g1'">搜索</a>
	             </div>
	    			
	    		</td>
	    		</tr>
	    	
	    		
	    	</table>
	    	 <div class="easyui-panel" title="付款审批"
		style="height:450px;width: auto;" toolbar="#currencyDatagridtoolbar">	
	<table id="dgyfktj" class="easyui-datagrid"
		data-options="url:'fenghuang/caiwuqrfkselect.do?ysyfid=2',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
		pagination="true" toolbar="#tb">
		<thead>
			<tr> 
				<th data-options="field:'danhao',editor:'text'" width="">单号</th>
				<th data-options="field:'team',editor:'text'" width="">团号</th>
				<th data-options="field:'tuanduimc',editor:'text'" width="">团队名称</th>
				<th data-options="field:'kxsm',editor:'text'" width="">款项说明</th>
				<th data-options="field:'khmc',editor:'text'" width="">客户名称</th>
				<th data-options="field:'yushoutime',editor:'text'" width="">预售日期</th>
			
				<th data-options="field:'huilv',editor:'numberbox'" width="">汇率</th>
				<th data-options="field:'bizhong',editor:'numberbox'" width="">币种</th>
				<th data-options="field:'yingshou',editor:'numberbox'" width="">应收</th>
				<th data-options="field:'yishou',editor:'numberbox'" width="">已收</th>
				<th data-options="field:'09',editor:'numberbox'" width="">未收</th>
				<th data-options="field:'ykfp',editor:'numberbox'" width="">已开发票</th>
				<th data-options="field:'fpxk',editor:'numberbox'" width="">发票许可</th>
				
				<th data-options="field:'aaa',editor:'numberbox'" width="">销售确认</th>
			    <th data-options="field:'confirmed',editor:'numberbox'" width="">财务确认</th>
			    <th data-options="field:'zerenren',editor:'numberbox'" width="">责任人</th>
			</tr>
		</thead>
	</table>
	</div>
	
	<script type="text/javascript">
	
		function onClickRow(index) {
			if (editIndex != index) {
				if (endEditing()) {
					$('#dgyfktj').datagrid('selectRow', index).datagrid('beginEdit',
							index);
					editIndex = index;
				} else {
					$('#dgyfktj').datagrid('selectRow', editIndex);
				}
			}
		}
		
		
		
			function yfktjselect(id){
		
		console.info($('#dgyfktj').datagrid('options'));
		var opts = $('#dgyfktj').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				team: $("#team").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				khmc: $("#khmc").val() ,
			    ysyfid:2,

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
						$('#dgyfktj').datagrid('loadData',data);
					}
				});
		}
		
		
	</script>
</body>
</html>
