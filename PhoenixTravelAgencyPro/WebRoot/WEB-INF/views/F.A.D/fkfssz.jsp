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
     <div id="fkfsszdbtb">	  
             <a href="javascript:addMianBanMoshi()" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>  	
		     <a href="javascript:werhuSelectId();" class="easyui-linkbutton" iconCls="icon-save" plain="true">修改</a>  
		     <a href="javascript:shanchu('+row.id+');" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">删除</a>  
     </div>
	<table id="fkfsszdg" class="easyui-datagrid"
		data-options="url:'fenghuang/caiwufukuanselect.do',border:false,singleSelect:true,fit:true,fitColumns:true"
		pagination="true" toolbar="#fkfsszdbtb">
		<thead>
			<tr>
			    <th data-options="field:'id'" width="200px" hidden="true">ID</th>
				<th data-options="field:'fukuanfangshi'" width="200px">付款方式名称:</th>
				<th data-options="field:'miaoshu'" width="200px">付款方式描述:</th>	
		     </tr>
		</thead> 
	</table>
	<div id="fkfsszxiugai" class="easyui-dialog" title="修改"
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
						href="javascript:caiwufkfsszxiugai()" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> 
						<a href="javascript:fkfsszxiugaizclose();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
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
                      <a href="javascript:fkfsszsavezclose();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td> 
				</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
	
	
	<script type="text/javascript">
	
	
	        function fkfsszxiugaizclose(){
			$("#fkfsszxiugai").dialog("close");
		    }
		     function fkfsszsavezclose(){
			$("#sz").dialog("close");
		    }
	
		//删除
		function shanchu() {
			//准备回显的数据
			var row = $("#fkfsszdg").datagrid("getSelected");
			var param = {
					"id" :  row.id
				};
			 $.messager.confirm('消息', '是否将团号：'+row.fukuanfangshi+'删除?',
			 function(r){  
			  if (r){                  
			         
			          $.ajax({
			           url:'fenghuang/deletefukuan.do',
			           date:row.id,
			           data : param,
			           dateType:"json",
			           success:function(data){
			           $('#fkfsszdg').datagrid("reload");
			           $.messager.alert('消息','删除成功');	
			          }
			          });    
			           }          
			                });
			                
			                return;	
		               }
			
		function werhuSelectId(id) {
		var row = $("#fkfsszdg").datagrid("getSelected");
		 $('#id').attr('value','');
		if(row!=null){
		$("#fkfsszxiugai").dialog("open");
		 $('#dicFrome').form('load', row);
		 }
		 
		}
		
		 //修改
		function caiwufkfsszxiugai() {
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
					  $("#fkfsszxiugai").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
						$("#fkfsszdg").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#fkfsszdg").datagrid('reload');
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
						$('#fkfsszdg').datagrid('reload');
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#fkfsszdg').datagrid('reload');
					}
				}
			});
		}
	</script>

</body>
</html>
