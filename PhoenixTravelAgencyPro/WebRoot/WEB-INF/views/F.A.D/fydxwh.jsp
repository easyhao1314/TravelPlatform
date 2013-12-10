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
	<div id="fydxwhsousuo" class="easyui-dialog" title="查询"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
			text:'查询',
			iconCls:'icon-search',
			handler:function(){
			$('#fydxwhsousuo').dialog('close');
			dijieSelectLike();
			}
			},
			{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#fydxwhsousuo').dialog('close');
		
			}
			}
		]"
		style="width:300px;height:180px;padding:10px;">
   <table>
	    		<tr>
	    			<td>费用项编号:<input class="easyui-validatebox" type="text" id="bianhao" name="bianhao" style="width:180px"></input></td>
	    			</tr>
	    			<tr>
	    			<td>付款性质:&nbsp;&nbsp;&nbsp;&nbsp;<input class="easyui-validatebox" type="text" id="xingzhi" name="xingzhi" style="width:180px"></input></td>	    
	    		</tr>
	    			
	    		
	    	</table>
          </div>
	  <div id="fydxwhtb">
	         <a href="javascript:void(0);"  onclick="javascript:$('#fydxwhsousuo').dialog('open');" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a> 	
		     <a href="javascript:addMianBanMoshi()"  onclick="javascript:$('#fydxwhsave').dialog('open');" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
		     <a href="javascript:werhuSelectId();" class="easyui-linkbutton" iconCls="icon-save" plain="true">修改</a>  		
		     <a href="javascript:shanchu('+row.id+');" class="easyui-linkbutton" iconCls="icon-cut" plain="true">删除</a>  	
	</div>	
	<table id="fydxwhdg" class="easyui-datagrid"
		data-options="url:'fenghuang/caiwuweihu.do',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
		pagination="true" toolbar="#fydxwhtb">
		<thead>
			<tr> 
				<th data-options="field:'xingzhi'" width="50">付款性质</th>
				<th data-options="field:'shouzhi'" width="50">收支类型</th>
				<th data-options="field:'shuoming'" width="50">费用项说明</th>
				<th data-options="field:'liucheng'" width="50">对应审批流程</th>
				<th data-options="field:'fulei'" width="50">父类</th>
			
			</tr>
		</thead>
	</table>
	<div id="addweihu" class="easyui-dialog" title="费用大类维护添加"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
			text:'确定',
			iconCls:'icon-search',
			handler:function(){
			$('#addweihu').dialog('close');
			Saveweihu();
			}
			},
			{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#addweihu').dialog('close');
		
			}
			}
		]"
		style="width:500px;height:200px;padding:10px;">
		<form id="dicFrome" method="post">
			<table align="left">
				<tr>
					<td>
							<label>编号:</label>
					</td>
					<td><input name="bianhao" class="easyui-validatebox"
						>
				   </td>
					<td>
							<label>付款性质:</label>
					</td>
					<td><input name="xingzhi" class="easyui-validatebox"
						>
					</td>
						
				</tr>
				
				<tr>
					<td>
							<label>收支类型:</label>
					</td>
					<td><input name="shouzhi" class="easyui-validatebox">
					</td>
					<td>
							<label>费用说明:</label>
					</td>
					<td><input name="shuoming" class="easyui-validatebox"
					>
					</td>
				</tr>
				<tr>
					<td>
							<label>对应审批流程:</label>
					</td>
					<td><input name="liucheng" class="easyui-validatebox">
					</td>
					<td>
							<label>父类:</label>
					</td>
					<td><input name="fulei" class="easyui-validatebox"
						>
					</td>
				</tr>
		
			</table>
		</form>
	</div>			
	<div id="xiugai" class="easyui-dialog" title="修改"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
			text:'确定',
			iconCls:'icon-search',
			handler:function(){
			$('#xiugai').dialog('close');
			caiwuxiugai();
			}
			},
			{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#xiugai').dialog('close');
		
			}
			}
		]"
		style="width:500px;height:200px;padding:10px;">
		<form id="weihuxiugai" method="post">
		
			<table align="left">
				<tr>
					<td>
					<input id="id" name="id" class="easyui-validatebox" hidden="true">
					
							<label>编号:</label>
					</td>
					<td><input name="bianhao" class="easyui-validatebox">
						</td>
					<td>
							<label>付款性质:</label>
					</td>
					<td><input name="xingzhi" class="easyui-validatebox"
						>
						</td>
						
				</tr>
				
				<tr>
					<td>
							<label>收支类型:</label>
					</td>
					<td><input name="shouzhi" class="easyui-validatebox">
						</td>
					<td>
							<label>费用说明:</label>
					</td>
					<td><input name="shuoming" class="easyui-numberbox"
					>
						</td>
				</tr>
				<tr>
					<td>
							<label>对应审批流程:</label>
					</td>
					<td><input name="liucheng" class="easyui-validatebox">
						</td>
					<td>
							<label>父类:</label>
					</td>
					<td><input name="fulei" class="easyui-numberbox"
						>
					</td>
				</tr>
			</table>

		</form>
	</div>
	
	<script type="text/javascript">
	
//添加	
		function addMianBanMoshi() {
			$("#addweihu").dialog("open");
			$("#dicFrome").form("clear");
		}
		function Saveweihu() {
			$('#dicFrome').form('submit', {
				url : 'fenghuang/weihutianjia.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
						$.messager.alert("保存成功", "保存成功！", "info");
						$('#addweihu').dialog('close');
						$('#fydxwhdg').datagrid('reload');
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#fydxwhdg').datagrid('reload');
					}
				}
			});
		}
//删除
		function shanchu() {
		var row = $("#fydxwhdg").datagrid("getSelected");
	    $.messager.confirm('消息', '是否将：'+row.xingzhi+'确认删除?',
	    function(r){  
	    if (r){                  
		$.ajax({
		url:'fenghuang/deleteweihu.do?id='+row.id,
		date:row.id,
        dateType:"json",
		success:function(data){
		$('#fydxwhdg').datagrid("reload");
	    $.messager.alert('消息','删除成功');
	    }
		} );     
		}          
		});	           
		}	
//模糊查询
		function dijieSelectLike(){
		console.info($('#fydxwhdg').datagrid('options'));
		var opts = $('#fydxwhdg').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				bianhao: $("#bianhao").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				xingzhi: $("#xingzhi").val() ,
				
				page:  opts.pageNumber ,
				rows:  opts.pageSize
			};
		console.info(param);
				$.ajax({
					url : 'fenghuang/caiwuweihu.do' ,
					data :  param,
					type : 'POST' ,
					dataType : 'json' ,
					success : function(data){
						$('#fydxwhdg').datagrid('loadData',data);
					}
				});
		}
		//按id查询
		function werhuSelectId(id) {
			var row = $("#fydxwhdg").datagrid("getSelected");
			if(row!=null){
		    $("#xiugai").dialog("open");
			if(row){
				var param = {
					"id" : row.id
				};
				
				$.ajax({
					url : "fenghuang/caiwuweihu.do",
					data : param,
					dataType : "json",
					success : function(data) {
		
					   $('#weihuxiugai').form('load',data.rows[0]);
				
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
		}
		}
		}
		 //修改
		function caiwuxiugai() {
			$("#weihuxiugai").form('submit', {
				url : 'fenghuang/weihuxiugai.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {
					console.info(data);
					
					var result = $.parseJSON(data) ;

					if (result.success) {
					  $("#xiugai").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
						$("#fydxwhdg").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#fydxwhdg").datagrid('reload');
					}
				}
			});
		}
		
	</script>
</body>
</html>
