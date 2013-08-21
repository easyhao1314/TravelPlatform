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
		data-options="url:'fenghuang/caiwuqrfkselect.do?ysyfid=2&shenfenid=3',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
		pagination="true" toolbar="#tb">
		<thead>
			<tr> 
				<th data-options="field:'id',editor:'text'" width="50" hidden="true"></th>
				<th data-options="field:'team',editor:'text'" width="50">团号</th>
				<th data-options="field:'tuanduimc',editor:'text'" width="50">团队名称</th>
				<th data-options="field:'kxsm',editor:'text'" width="50">款项说明</th>
				<th data-options="field:'khmc',editor:'text'" width="">客户名称</th>
				<th data-options="field:'yushoutime',editor:'text'" width="50">预售日期</th>
			
				<th data-options="field:'huilv',editor:'numberbox'" width="50">汇率</th>
				<th data-options="field:'bizhong',editor:'numberbox'" width="50">币种</th>
				<th data-options="field:'yfk',editor:'numberbox'" width="50">应付款</th>
				<th data-options="field:'yifu',editor:'numberbox'" width="50">已付</th>
				<th data-options="field:'09',formatter:yfktjjisuan" width="50">未付</th>
				<th data-options="field:'ykfp',editor:'numberbox'" width="50">已开发票</th>
				<th data-options="field:'fpxk',editor:'numberbox'" width="50">发票许可</th>
				
				<th data-options="field:'aaa',editor:'numberbox'" width="50">销售确认</th>
			    <th data-options="field:'confirmed',editor:'numberbox'" width="50">财务确认</th>
			    <th data-options="field:'fuzeren',editor:'numberbox'" width="50">责任人</th>
			</tr>
		</thead>
	</table>
	</div>
	
	<script type="text/javascript">
	function yfktjjisuan(val,row){
      var a=parseInt(row.yfk);
        var b=parseInt(row.yifu);
       var c=(a-b);
        return '<div style="width: auto;">'+c+'</div>';
        }
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
