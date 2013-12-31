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
        <div id="sapinsousuo" class="easyui-dialog" title="查询"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
			text:'查询',
			iconCls:'icon-search',
			handler:function(){
			$('#sapinsousuo').dialog('close');
			sanpinselect();
			}
			},
			{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#sapinsousuo').dialog('close');
		
			}
			}
		]"
		style="width:300px;height:180px;padding:10px;">
                    <table>
	    		    <tr>
	    		   	<td>团队名称:<input class="easyui-validatebox" type="text" name="team"  id="team" style="width:200px"></input></td>
	    		   	</tr>
	    		   	<tr>
	    			<td>团号:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="easyui-validatebox" type="text" name="tuanduimc" id="tuanduimc" style="width:200px"></input></td>
	    			<td>			
	    		    </td>
	    		    </tr>    		
	    	      </table>
	    	      </div>
	    	      <div id="ysktjdgtb">	
	    	  <a href="javascript:void(0);" onclick="javascript:$('#sapinsousuo').dialog('open');" class="easyui-linkbutton" iconCls="icon-save" plain="true">查询</a> 
	    	</div>
	<!-- 如果在正式开发环境下 url可以为后台的请求，地址 -->
	<table id="sanpindg" class="easyui-datagrid"
		data-options="url:'fenghuang/caiwuqrfkselect.do?shenfenid=1&&ysyfid=1',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
		pagination="true" toolbar="#ysktjdgtb">
		<thead>
			<tr>
				<th data-options="field:'team'" width="50">团队名称</th>
				<th data-options="field:'tuanduimc'" width="50">团号</th>
				<th data-options="field:'khmc'" width="" >客户/联系人</th>
				<th data-options="field:'xiaoshouyuan'" width="50">销售专员</th>			
				<th data-options="field:'renshu'" width="50">人数</th>
				<th data-options="field:'bizhong'" width="50">币种</th>
				<th data-options="field:'syingshou'" width="50">应收</th>
				<th data-options="field:'syishou'" width="50">已收</th>
				<th data-options="field:'ysweifu'" width="50">未收</th>
				<th data-options="field:'beizhu'" width="50">备注</th>
			
			</tr>
		</thead>
	</table>
	
	<script type="text/javascript">
	
	function sanpinhesuan(val,row){
      var a=parseInt(row.yingshou);
        var b=parseInt(row.yishou);
       var c=(a-b);
        return '<div style="width: auto;">'+c+'</div>';
        }
	
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
				tuanduimc: $("#tuanduimc").val() ,
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
