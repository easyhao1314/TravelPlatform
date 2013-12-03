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
	         <a href="javascript:void(0);"  onclick="javascript:$('#fydxwhsousuo').dialog('open');" class="easyui-linkbutton" iconCls="icon-save" plain="true">查询</a> 	
		     <a href="javascript:addMianBanMoshi()" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>  
		     <a href="javascript:werhuSelectId();" class="easyui-linkbutton" iconCls="icon-add" plain="true">修改</a>  		
		     <a href="javascript:shanchu('+row.id+');" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">删除</a>  	
	</div>	
	<table id="dg" class="easyui-datagrid"
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
	
	<div id="addweihu" class="easyui-dialog" title="新增业务字段"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:250px;padding:10px;">
		<form id="dicFrome" method="post">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>编号:</label>
					</td>
					<td><input name="bianhao" class="easyui-validatebox"
						>
						</div></td>
					<td><div class="fitem">
							<label>付款性质:</label>
					</td>
					<td><input name="xingzhi" class="easyui-validatebox"
						>
						</div></td>
						
				</tr>
				
				<tr>
					<td><div class="fitem">
							<label>收支类型:</label>
					</td>
					<td><input name="shouzhi" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>费用说明:</label>
					</td>
					<td><input name="shuoming" class="easyui-numberbox"
					>
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>对应审批流程:</label>
					</td>
					<td><input name="liucheng" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>父类:</label>
					</td>
					<td><input name="fulei" class="easyui-numberbox"
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
	
	
	
	<div id="xiugai" class="easyui-dialog" title="修改"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="weihuxiugai" method="post">
			<table align="left">
				<tr>
					<td>
					<input id="id" name="id" class="easyui-validatebox" hidden="true">
					<div class="fitem">
							<label>编号:</label>
					</td>
					<td><input name="bianhao" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>名称:</label>
					</td>
					<td><input name="xingzhi" class="easyui-validatebox"
						>
						</div></td>
						
				</tr>
				
				<tr>
					<td><div class="fitem">
							<label>帮助提示:</label>
					</td>
					<td><input name="shouzhi" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>显示顺序:</label>
					</td>
					<td><input name="shuoming" class="easyui-numberbox"
					>
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>帮助提示:</label>
					</td>
					<td><input name="liucheng" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>显示顺序:</label>
					</td>
					<td><input name="fulei" class="easyui-numberbox"
						>
						</div></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:caiwuxiugai()" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> 
						<a href="javascript:void(0)" class="easyui-linkbutton"
							iconCls="icon-undo" onclick="$('#weihuxiugai').form('clear')">重置</a></td>
				</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
	
	<script type="text/javascript">
	
//添加	
		function addMianBanMoshi() {
			$("#addweihu").dialog("open");
			$("#dicFrome").form("clear");
		}
        function closeEditDic() {
			$("#addweihu").dialog("close");
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
						$('#dg').datagrid('reload');
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#dg').datagrid('reload');
					}
				}
			});
		}
//删除
		function shanchu() {
		var row = $("#dg").datagrid("getSelected");
			if (row) {
				var param = {
					"id" :  row.id
				};

				$.ajax({
					url : "fenghuang/deleteweihu.do?",
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

	
//模糊查询
		function dijieSelectLike(){
		console.info($('#dg').datagrid('options'));
		var opts = $('#dg').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
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
						$('#dg').datagrid('loadData',data);
					}
				});
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
		 //修改
		function caiwuxiugai() {
			$("#weihuxiugai").form('submit', {
				url : 'fenghuang/weihuxiugai.do',
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
		
	</script>
</body>
</html>
