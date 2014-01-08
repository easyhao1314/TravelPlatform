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
        <div id="tongjisanpinsousuo" class="easyui-dialog" title="查询"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
			text:'查询',
			iconCls:'icon-search',
			handler:function(){
			$('#tongjisanpinsousuo').dialog('close');
			sanpinselect();
			}
			},
			{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#tongjisanpinsousuo').dialog('close');
		
			}
			}
		]"
		style="width:300px;height:180px;padding:10px;">
                    <table>
	    		    <tr>
	    		   	<td>销售:<input class="easyui-validatebox" type="text" name="xiaoshouyuan"  id="xiaoshouyuan" style="width:200px"></input></td>
	    		   	</tr>
	    		   	<tr>
	    			<td>年份:<input class="easyui-validatebox" type="text" name="tuanduimc" id="tuanduimc" style="width:200px"></input></td>
	    			<td>			
	    		    </td>
	    		    </tr>    		
	    	      </table>
	    	      </div>
	    	      <div id="ysktjdgtb">	
	    	  <a href="javascript:void(0);" onclick="javascript:$('#tongjisanpinsousuo').dialog('open');" class="easyui-linkbutton" iconCls="icon-save" plain="true">查询</a> 
	    	</div>
	<table id="sanpindg" class="easyui-datagrid"
		data-options="url:'fenghuang/tongjizhongxinsanpinselect.do',fitColumns:true,singleSelect:true,rownumbers:true,showFooter:true,border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
		pagination="true" toolbar="#ysktjdgtb">
		<thead>
			<tr>
				
				<th data-options="field:'xiaoshouyuan'" width="50">销售员</th>
				<th data-options="field:'khmc'" width="50" >客户</th>
				<th data-options="field:'renshu'" width="50" >人头数</th>
			</tr>		
		</thead>

	</table>
	<script type="text/javascript">
		function onClickRow(index) {
			if (editIndex != index) {
				if (endEditing()) {
					$('#sanpindg').datagrid('selectRow', index).datagrid('beginEdit',
							index);
					editIndex = index;
				} else {
					$('#sanpindg').datagrid('selectRow', editIndex);
				}
			}
		}
		
		
		function cwfkspselect(id){
		
		console.info($('#sanpindg').datagrid('options'));
		var opts = $('#sanpindg').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				xiaoshouyuan: $("#xiaoshouyuan").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				page:  opts.pageNumber ,
				rows:  opts.pageSize
			};
		console.info(param);
				$.ajax({
					url : 'fenghuang/fkspselect.do' ,
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
