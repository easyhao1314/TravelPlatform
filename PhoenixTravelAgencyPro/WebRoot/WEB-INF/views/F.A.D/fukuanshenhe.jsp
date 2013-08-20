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
	    			<td>销售，客户<input class="easyui-validatebox" type="text" name="caozuo" id="caozuo"></input></td>
	    			<td>
	    		<div style="padding:5px;border:0px solid #ddd;">
		<a href="javascript:cufkshselect()" class="easyui-linkbutton" data-options="toggle:true,group:'g1'">搜索</a>
	             </div>
	    			
	    		</td>
	    		</tr>
	    	
	    		
	    	</table>
	    	<table>
	    		<tr>
	    		<td>状态：[<a href="javascript:cufkshselect(1)">待确认收款</a>][<a href="javascript:cufkshselect(2)">已确认收款</a> ]</td>
	    		</tr>
	    		
	    	
	    	</table>
	    	<a href="javascript:caiwufkshselect();" class="easyui-linkbutton" iconCls="icon-add" plain="true">付款确认</a>  
		
		
		    <a href="javascript:caiwufkshselecta();" class="easyui-linkbutton" iconCls="icon-add" plain="true">取消付款</a>
	    	
	 <div class="easyui-panel" title="付款审核"
		style="height:450px;width: auto;" toolbar="#currencyDatagridtoolbar">	
	<table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/fukuanshenhe.do?shenfenid=3&ysyfid=2',border:false,singleSelect:true,fit:true,fitColumns:true, onClickRow: onClickRow,pageSize:20"
		pagination="true" toolbar="#tb">
		<thead>
			<tr> 
				<th data-options="field:'fukuantime',editor:'text'" width="40">付款日期</th>
				<th data-options="field:'team',editor:'text'" width="50">团号</th>
				<th data-options="field:'tuanduimc',editor:'text'" width="50">团队名称</th>
				<th data-options="field:'khmc',editor:'text'" width="50">供应商名称</th>
				<th data-options="field:'kxsm',editor:'text'" width="">款项</th>
				<th data-options="field:'yfk',editor:'text'" width="50">金额</th>
			
				<th data-options="field:'caozuo',editor:'numberbox'" width="50">销售</th>
				<th data-options="field:'review',formatter:cwfkbz" width="50">财务审核</th>
				<th data-options="field:'confirmed',formatter:cwfkbz2" width="50">出纳确认</th>
			
			</tr>
		</thead>
	</table>
	</div>
	
	
	<div id="caiwufkshid" class="easyui-dialog" title="付款审核取消"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="xg" method="post" >
			<table  align="center">
				<tr>
					<td>
					<input id="id" name="id" class="easyui-validatebox" onfocus=this.blur() hidden="true">
					<div class="fitem">
							
					</td>
					<td><input id="fkshid" value="2"  class="easyui-validatebox" hidden="true" onfocus=this.blur()>
						</div></td> 
						
				</tr>
				<tr>
					<td><div class="fitem">
							<label>团名:</label>
					</td>
					<td>
					<input id="team" name="team" 
						class="easyui-validatebox" onfocus=this.blur() >
						</div></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:fkshupdate()" class="easyui-linkbutton"
						iconCls="icon-ok">确认</a> 
						<a href="javascript:closedialog();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td></td>
				</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
	
	
	<div id="caiwuquxiao" class="easyui-dialog" title="付款审核取消"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="quxiaoform" method="post" >
			<table  align="center">
				<tr>
					<td>
					<input id="id" name="id" class="easyui-validatebox" onfocus=this.blur() hidden="true">
					<div class="fitem">
							
					</td>
					<td><input id="quxiao" value="1"  class="easyui-validatebox" hidden="true" onfocus=this.blur()>
						</div></td> 
						
				</tr>
				<tr>
					<td><div class="fitem">
							<label>团名:</label>
					</td>
					<td>
					<input id="team" name="team" 
						class="easyui-validatebox" onfocus=this.blur()>
						</div></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:fkshupdate2()" class="easyui-linkbutton"
						iconCls="icon-ok">确认</a> 
						<a href="javascript:closedialog();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td></td>
				</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
	
	
	<script type="text/javascript">	
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
		function cufkshselect(id){
		
		console.info($('#dg').datagrid('options'));
		var opts = $('#dg').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				team: $("#team").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				caozuo: $("#caozuo").val() ,
				caiwuid: id,
                shenfenid:3,
                ysyfid:2,
				page:  opts.pageNumber ,
				rows:  opts.pageSize
			};
		console.info(param);
				$.ajax({
					url : 'fenghuang/fukuanshenhe.do' ,
					data :  param,
					type : 'POST' ,
					dataType : 'json' ,
					success : function(data){
						$('#dg').datagrid('loadData',data);
					}
				});
		}
		//备注
		function cwfkbz2(val,row){
		   var shouke=null;
		   	 if(row.confirmed==1){shouke="未付款";}
		   	 if(row.confirmed==2){shouke="已付款";}
		   	 
		     return '<div onclick="shoukeclick(event,'+row.tuanNo+')" style="width: auto;">'+shouke+'</div>';
		   }
		   //备注
		   function cwfkbz(val,row){
		   var shouke=null;
		   	 if(row.review==1){shouke="未审核";}
		   	 if(row.review==2){shouke="已审核";}
		     return '<div onclick="shoukeclick(event,'+row.tuanNo+')" style="width: auto;">'+shouke+'</div>';
		   }
		   
		   

		
		
		//按id查询
		function caiwufkshselect(id) {
           //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window 
			//准备回显的数据
			var row = $("#dg").datagrid("getSelected");
	
			if(row!=null){
			$("#caiwufkshid").dialog("open");
		$('#id').attr('value','');
		$('#xg').form('load', row);
		}
		
		}
		  //修改
			function fkshupdate() {
			var caiwuid = $("#fkshid").val();
			$("#xg").form('submit', {
				url : 'fenghuang/updatefksh.do?caiwuid='+caiwuid,
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {//data 是一个字符串  $.ajax(success:function(data):是一个对象)
					console.info(data);
					//var result = val('(' + data + ')');//吧字符串转换为对象
					var result = $.parseJSON(data) ;

					if (result.success) {
					  $("#caiwufkshid").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
						$("#dg").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#dg").datagrid('reload');
					}
				}
			});
		}
		
		//caiwuquxiao quxiaoform 
		
		//按id查询
		function caiwufkshselecta(id) {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window 
			
			//获取选中 数据
			var row = $("#dg").datagrid("getSelected");
			//alert(row.id);
		if(row!=null){
		$("#caiwuquxiao").dialog("open");
		//清空ID
		$('#id').attr('value','');
		//填充
		 $('#quxiaoform').form('load',row);
		}
		}
		  //修改
			function fkshupdate2() {
			var caiwuid = $("#quxiao").val();
			$("#quxiaoform").form('submit', {
				url : 'fenghuang/updatefksh.do?caiwuid='+caiwuid,
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {//data 是一个字符串  $.ajax(success:function(data):是一个对象)
					console.info(data);
					//var result = val('(' + data + ')');//吧字符串转换为对象
					var result = $.parseJSON(data) ;

					if (result.success) {
					  $("#caiwuquxiao").dialog('close');
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
