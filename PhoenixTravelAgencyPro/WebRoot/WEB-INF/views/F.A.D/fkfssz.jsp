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
	    			<!-- <td>付款方式描述:<input class="easyui-validatebox" type="text" name="name" ></input></td> 
	    		
	    			<td>
	    		<div style="padding:5px;border:1px solid #ddd;">
		<a href="#" class="easyui-linkbutton" data-options="toggle:true,group:'g1'">Button 1</a>
	             </div>
	    			
	    		</td>
	    		-->
	    		</tr>
	    	
	    		
	    	</table>
	
	    		
	    	
	    	</table>
	    	<div class="easyui-panel" title="付款方式"
		style="height:480px;width: auto;">
	<table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/caiwufukuanselect.do',border:false,singleSelect:true,fit:true,fitColumns:true"
		pagination="true" toolbar="#currencyDatagridtoolbar">
		<thead>
			<tr>
			    <th data-options="field:'id'" width="200px" hidden="true">ID</th>
				<th data-options="field:'fukuanfangshi',editor:'text'" width="200px">付款方式名称:</th>
				<th data-options="field:'miaoshu',editor:'text'" width="200px">付款方式描述:</th>	
		     </tr>
		</thead>
	</table>
	<div id="currencyDatagridtoolbar">
		     <a href="javascript:addMianBanMoshi()" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>  
	
		
		     <a href="javascript:werhuSelectId();" class="easyui-linkbutton" iconCls="icon-add" plain="true">修改</a>  
		
		
		     <a href="javascript:shanchu('+row.id+');" class="easyui-linkbutton" iconCls="icon-add" plain="true">删除</a>  
		
	</div>
	
	<div id="xiugai" class="easyui-dialog" title="修改"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="dicFrome" method="post">
			<table align="left">
				<tr>
					<td>
					<input id="id" name="id" class="easyui-validatebox" hidden="true">
					<div class="fitem">
							<label>付款方式名称:</label>
					</td>
					<td><input name="fukuanfangshi" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>付款描述:</label>
					</td>
					<td><input name="miaoshu" class="easyui-validatebox"
						>
						</div></td>
						
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:caiwuxiugai()" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> 
						<a href="javascript:void(0)" class="easyui-linkbutton"
							iconCls="icon-undo" onclick="$('#dicFrome')[0].reset();">重置</a></td>
				</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
	
	
	<div id="sz" class="easyui-dialog" title="添加付款方式"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="tianjia" method="post">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>付款方式:</label>
					</td>
					<td><input name="fukuanfangshi" class="easyui-validatebox"
						>
						</div></td>
					<td><div class="fitem">
							<label>付款描述:</label>
					</td>
					<td><input name="miaoshu" class="easyui-validatebox"
						>
						</div></td>
						
				</tr>
				
				
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:Saveweihu()" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> 
                      <a href="javascript:void(0)" class="easyui-linkbutton"
							iconCls="icon-undo" onclick="$('#dicFrome').form('clear')">重置</a></td> 
				</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
	
	
	<script type="text/javascript">
	function shanchu() {
		var row = $("#dg").datagrid("getSelected");
			if (row) {
				var param = {
					"id" :  row.id
				};

				$.ajax({
					url : "fenghuang/deletefukuan.do?",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("删除成功", "删除成功！", "info");
							$("#dg").datagrid('reload');
						} else {
							$.messager.alert("删除失败", "删除失败!", "error");
						}
					},
					error : function() {
						$.messager.alert("删除失败", "服务器请求失败!", "error");
					}
				});
			}
		}
		
		
		
		
		//按id查询
		function werhuSelectId(id) {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window 
			$("#xiugai").dialog("open");
			//准备回显的数据
			var row = $("#dg").datagrid("getSelected");
			//alert(row.id);
			
			if(row){
				var param = {
					"id" : row.id
				};
				
				$.ajax({
					url : "fenghuang/caiwufukuanselect.do",
					data : param,
					dataType : "json",
					success : function(data) {
		
					   $('#dicFrome').form('load',data.rows[0]);
				
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
		}
		}
		
		
		 //修改
		function caiwuxiugai() {
			$("#dicFrome").form('submit', {
				url : 'fenghuang/updatefukuan.do',
				onSubmit : function() {
				
					return $(this).form('validate');
				},
				success : function(data) {//data 是一个字符串  $.ajax(success:function(data):是一个对象)
					console.info(data);
					//var result = val('(' + data + ')');//吧字符串转换为对象
					var result = $.parseJSON(data) ;

					if (result.success) {
					  $("#xiugai").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
						$("#dg").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#dg").datagrid('reload');
					}
				}
			});
		}
		
		
		//添加	
		function addMianBanMoshi() {
			$("#sz").dialog("open");
			$("#tianjia").form("clear");
		}
        function closeEditDic() {
			$("#sz").dialog("close");
		} 
		function Saveweihu() {
			$('#tianjia').form('submit', {
				url : 'fenghuang/insertfukuan.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
						$.messager.alert("保存成功", "保存成功！", "info");
						$('#sz').dialog('close');
						$('#dg').datagrid('reload');
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#dg').datagrid('reload');
					}
				}
			});
		}
	</script>

</body>
</html>
