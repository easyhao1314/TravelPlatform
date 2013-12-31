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
<div id="wswfcxsousuo" class="easyui-dialog" title="查询"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
			text:'查询',
			iconCls:'icon-search',
			handler:function(){
			$('#wswfcxsousuo').dialog('close');
			wswfcxselect();
			}
			},
			{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#wswfcxsousuo').dialog('close');
		
			}
			}
		]"
		style="width:300px;height:180px;padding:10px;">
	<!-- 如果在正式开发环境下 url可以为后台的请求，地址 -->
   <table>
	    		<tr>
	    		   	<td>团队名称:<input class="easyui-validatebox" type="text" name="team" id="team" style="width:200px" ></input></td>
	    		</tr>
	    	</table>
	    	</div>
	    	<div id="wswfcxdgtb">	
	    	  <a href="javascript:void(0);" onclick="javascript:$('#wswfcxsousuo').dialog('open');" class="easyui-linkbutton" iconCls="icon-save" plain="true">查询</a> 
	    	</div>
	<table id="wswfcxdg" class="easyui-datagrid"
		data-options="url:'fenghuang/caiwutdfylbselect.do',border:false,singleSelect:true,fit:true,fitColumns:true, onClickRow: onClickRow,pageSize:20"
		pagination="true" toolbar="#wswfcxdgtb">
		<thead>
			<tr> 
			    <th data-options="field:'fukuantime',editor:'text'" width="10" hidden="true" >应收账期</th>
		 		<th data-options="field:'yushoutime',formatter:wswfcxshijian" width="10">应收应付账期</th>
				<th data-options="field:'team'" width="10">团名</th>
				<th data-options="field:'tuanduimc'" width="10">团号</th>
				<th data-options="field:'kxsm'" width="5">款项</th>
				<th data-options="field:'syingshou'" width="10">应收金额</th>
				<th data-options="field:'syishou'" width="10">已收金额</th>
				<th data-options="field:'weishou'" width="10">未收金额</th>
				<th data-options="field:'zerenren'" width="10">经手人</th>	
			</tr>
		</thead>
	</table>
	<script type="text/javascript">
	
	 function wswfcxshijian(val,row){
		   var ss=null;
		   	 if(row.yushoutime==""){ss=row.fukuantime;}else{return row.yushoutime;}
		     return '<div  style="width: auto;">'+ss+'</div>';
		   }
	//1 fukuantime 2 shoukuantime
	
	
	
	function wswfcxjisuan(val,row){
     var a=parseInt(row.syingshou);
     var b=parseInt(row.syishou);
      var c=(a-b);
      return '<div style="width: auto;">'+c+'</div>';
      }
	
	
		function onClickRow(index) {
			if (editIndex != index) {
				if (endEditing()) {
					$('#wswfcxdg').datagrid('selectRow', index).datagrid('beginEdit',
							index);
					editIndex = index;
				} else {
					$('#wswfcxdg').datagrid('selectRow', editIndex);
				}
			}
		}
		
		
			function wswfcxselect(id){
		
		console.info($('#wswfcxdg').datagrid('options'));
		var opts = $('#wswfcxdg').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				team: $("#team").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				

				page:  opts.pageNumber ,
				rows:  opts.pageSize
			};
		console.info(param);
				$.ajax({
					url : 'fenghuang/caiwutdfylbselect.do' ,
					data :  param,
					type : 'POST' ,
					dataType : 'json' ,
					success : function(data){
						$('#wswfcxdg').datagrid('loadData',data);
					}
				});
		}
		

	</script>
</body>
</html>
