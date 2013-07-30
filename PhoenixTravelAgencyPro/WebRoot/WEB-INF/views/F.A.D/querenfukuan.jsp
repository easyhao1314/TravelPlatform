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
	    		   	<td>团号:<input class="easyui-validatebox" type="text" name="team" id="team" ></input></td>
	    			<td>操作<input class="easyui-validatebox" type="text" name="caozuo" id="caozuo" ></input></td>
	    			<td>
	    		<div style="padding:5px;border:px solid #ddd;">
		<a href="javascript:dijieSelectLike()" class="easyui-linkbutton" data-options="toggle:true,group:'g1'">搜索</a>
	             </div>
	    			
	    		</td>
	    		</tr>
	    	
	    		
	    	</table>
	    	<table>
	    		<tr>
	    		<td>状态：[<a href="javascript:dijieSelectLike(1)"  >待确认收款</a>][<a href="javascript:dijieSelectLike(2)" >已确认收款</a>]</td>
	    		</tr>    			    	
	    	</table>
	    	
	    	<div id="currencyDatagridtoolbar">
		      
	
		
		     <a href="javascript:werhuSelectId();" class="easyui-linkbutton" iconCls="icon-add" plain="true">付款确认</a>  
		
		
		      <a href="javascript:werhuSelectId2();" class="easyui-linkbutton" iconCls="icon-add" plain="true">取消付款</a>
		
	</div>
	    <div class="easyui-panel" title="付款确认"
		style="height:450px;width: auto;" toolbar="#currencyDatagridtoolbar">	
	<table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/caiwuqrfkselect.do',border:false,singleSelect:true,fit:true,fitColumns:true, onClickRow: onClickRow,pageSize:20"
		pagination="true"  >
		<thead>
			<tr>
				 
				<th data-options="field:'payment',editor:'text'" width="50px">付款日期</th>
				<th data-options="field:'zhanghaoid',editor:'text'" width="50px">账号</th>
				<th data-options="field:'team',editor:'text'" width="50px">团号</th>
				<th data-options="field:'suppliers',editor:'text'" width="50px">团队名称</th>
				<th data-options="field:'gysid',editor:'text'" width="50px">供应商名称</th>
				<th data-options="field:'dicDesc',editor:'text'" width="50px">款项</th>
				<th data-options="field:'08',editor:'text'" width="50px">金额</th>
			
				<th data-options="field:'caozuo',editor:'numberbox'" width="50px">提交人</th>
				<th data-options="field:'review',editor:'numberbox'" width="50px">财务审核</th>
				<th data-options="field:'cashier',formatter:openshouke" width="50px">出纳确认</th>
			
			</tr>
		</thead>
	</table>

	</div>
	
	<div id="xiugai" class="easyui-dialog" title="付款确认"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="weihuxiugai" method="post" >
			<table  align="center">
				<tr>
					<td>
					ID<input id="id" name="id" class="easyui-validatebox" onfocus=this.blur()>
					<div class="fitem">
							
					</td>
					<td><input id="caiwu" value="2"  class="easyui-validatebox" hidden="true">
						</div></td> 
						
				</tr>
				
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:caiwuxiugai()" class="easyui-linkbutton"
						iconCls="icon-ok">确认</a> 
						<a href="javascript:closedialog();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td></td>
				</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
	
	
	<div id="xiugai2" class="easyui-dialog" title="取消付款"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="weihuxiugai2" method="post" >
			<table  align="center">
				<tr>
					<td>
					<input id="id" name="id" class="easyui-validatebox" >
					<div class="fitem">
							
					</td>
					<td><input id="caiwu2" value="1"  class="easyui-validatebox" hidden="true">
						</div></td> 
						
				</tr>
				
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:caiwuxiugai2()" class="easyui-linkbutton"
						iconCls="icon-ok">确认</a> 
						<a href="javascript:closedialog2();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
	
	<script type="text/javascript">
	//关闭
		function closedialog(){
			$("#xiugai").dialog("close");
		}
		//关闭
		function closedialog2(){
			$("#xiugai2").dialog("close");
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
		//条件查询
		function dijieSelectLike(id){
		
		console.info($('#dg').datagrid('options'));
		var opts = $('#dg').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				team: $("#team").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				caozuo: $("#caozuo").val() ,
				caiwuid: id ,
				
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
					url : "fenghuang/caiwuqrfkselect.do",
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
			var caiwuid = $("#caiwu").val();
			$("#weihuxiugai").form('submit', {
				url : 'fenghuang/updateqrfk.do?caiwuid='+caiwuid,
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
		
		
			//按id查询
		function werhuSelectId2(id) {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window 
			$("#xiugai2").dialog("open");
			//准备回显的数据
			var row = $("#dg").datagrid("getSelected");
			//alert(row.id);
		
			if(row){
				var param = {
					"id" : row.id
				};
				
				$.ajax({
					url : "fenghuang/caiwuqrfkselect.do",
					data : param,
					dataType : "json",
					success : function(data) {
		
					   $('#weihuxiugai2').form('load',data.rows[0]);
				
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
		}
		}
		 //修改
			function caiwuxiugai2() {
			var caiwuid2 = $("#caiwu2").val();
			$("#weihuxiugai2").form('submit', {
				url : 'fenghuang/updateqrfk.do?caiwuid='+caiwuid2,
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {//data 是一个字符串  $.ajax(success:function(data):是一个对象)
					console.info(data);
					//var result = val('(' + data + ')');//吧字符串转换为对象
					var result = $.parseJSON(data) ;

					if (result.success) {
					  $("#xiugai2").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
						$("#dg").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#dg").datagrid('reload');
					}
				}
			});
		}
		
		function openshouke(val,row){
		   var shouke=null;
		   	 if(row.cashier==1){shouke="未付款";}
		   	 if(row.cashier==2){shouke="已付款";}
		     return '<div onclick="shoukeclick(event,'+row.tuanNo+')" style="width: auto;">'+shouke+'</div>';
		   }
	</script>
</body>
</html>
