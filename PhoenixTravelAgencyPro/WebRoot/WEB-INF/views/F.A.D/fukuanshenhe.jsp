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
	<div id="fukuanshenhesousuo" class="easyui-dialog" title="查询"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
			text:'查询',
			iconCls:'icon-search',
			handler:function(){
			$('#fukuanshenhesousuo').dialog('close');
			cufkshselect();
			}
			},
			{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#fukuanshenhesousuo').dialog('close');
		
			}
			}
		]"
		style="width:300px;height:180px;padding:10px;">
            <table>
	    		<tr>
	    		   	<td>团队名称：<input class="easyui-validatebox" type="text" name="team"  id="team" style="width:200px"></input></td>
	    		</tr>
	    		<tr>
	    		   	<td>团号：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="easyui-validatebox" type="text" name="tuanduimc"  id="tuanduimc" style="width:200px"></input></td>			
	    		</tr>
	    	
	    		
	    	</table>
	 </div>
	    	
	    	<div id="dgtb">
	    	
	    	<a href="javascript:caiwufkshselect();" class="easyui-linkbutton" iconCls="icon-add" plain="true">付款确认</a>
		    <a href="javascript:caiwufkshselecta();" class="easyui-linkbutton" iconCls="icon-add" plain="true">取消付款</a>
	    	<a href="javascript:void(0);" onclick="javascript:$('#fukuanshenhesousuo').dialog('open');" class="easyui-linkbutton" iconCls="icon-save" plain="true">查询</a>  
	    	<a href="javascript:cufkshselect(1)" class="easyui-linkbutton" iconCls="icon-search" plain="true">已确认收款</a>
			<a href="javascript:cufkshselect(2)" class="easyui-linkbutton" iconCls="icon-search" plain="true">待确认收款</a>
	    	</div>
	
	<table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/caiwuqrfkselect.do?shenfenid=3&&ysyfid=2&&caiwuid=1',border:false,singleSelect:true,fit:true,fitColumns:true, onClickRow: onClickRow,pageSize:20"
		pagination="true" toolbar="#dgtb">
		<thead>
			<tr>  
				<th data-options="field:'fukuantime'" width="40">付款日期</th>
				<th data-options="field:'team'" width="50">团号</th>
				<th data-options="field:'tuanduimc'" width="50">团队名称</th>
				<th data-options="field:'khmc'" width="50">供应商名称</th>
				<th data-options="field:'kxsm'" width="">款项</th>
				<th data-options="field:'yfk'" width="50">金额</th>
				<th data-options="field:'xiaoshouyuan'" width="50">销售</th>
				<th data-options="field:'review',formatter:cwfkbz" width="50">财务审核</th>
				<th data-options="field:'confirmed',formatter:cwfkbz2" width="50">出纳确认</th>
			
			</tr>
		</thead>
	</table>
	
	
	<div id="caiwufkshid" class="easyui-dialog" title="付款审核确认"
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
							<label>团号:</label>
					</td>
					<td>
					<input id="team" name="team" 
						class="easyui-validatebox" onfocus=this.blur() >
						</div></td>
				<td><div class="fitem">
							<label>团名:</label>
					</td>
					<td>
					<input id="tuanduimc" name="tuanduimc" 
						class="easyui-validatebox" onfocus=this.blur() >
						</div></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:fkshupdate()" class="easyui-linkbutton"
						iconCls="icon-ok">确认</a> 
						 <a href="javascript:fukuanshenheclose();"
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
						<a href="javascript:fukuanshenheclose1();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td></td>
				</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
	
	
	<script type="text/javascript">	
	      //关闭
		   function fukuanshenheclose(){
			$("#caiwufkshid").dialog("close");
		    }
	
	       //关闭
		   function fukuanshenheclose1(){
			$("#caiwuquxiao").dialog("close");
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
		function cufkshselect(id){
		
		console.info($('#dg').datagrid('options'));
		var opts = $('#dg').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				team: $("#team").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				tuanduimc: $("#tuanduimc").val() ,
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
			$('#id').attr('value','');
		    $('#xg').form('load', row);
			 $.messager.confirm('消息', '是否将团号：'+row.team+'确认付款?',
			 function(r){  
			  if (r){                  
			                fkshupdate();
			              
			           }          
			                });
			                
			                return;
			                
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
			$('#id').attr('value','');
		    $('#quxiaoform').form('load',row);
			//alert(row.id);
			 $.messager.confirm('消息', '是否将团号：'+row.team+'取消付款?',
			 function(r){  
			  if (r){                  
			                fkshupdate2();
			              
			           }          
			                });
			                
			                return;
			   
		   
		
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
