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
	<div id="asousuo" class="easyui-dialog" title="查询"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
			text:'查询',
			iconCls:'icon-search',
			handler:function(){
			$('#asousuo').dialog('close');
			cwfkspselect();
			}
			},
			{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#asousuo').dialog('close');
		
			}
			}
		]"
		style="width:300px;height:180px;padding:10px;">
   <table>
	    		<tr>
	    		   	<td>团队名称:<input class="easyui-validatebox" type="text" name="team" id="team" style="width:200px"></input></td>
	    		   	</tr>
	    		   	<tr>
	    			<td>团号:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="easyui-validatebox" type="text" name="tuanduimc" id="tuanduimc" style="width:200px"></input></td>

	    		</tr>	
	    	</table>
	    	</div>
	    	
	    	<div id="dgtb">	 
	    	
	    		
	    		 	
	    	<a href="javascript:caiwufkspselecta();" class="easyui-linkbutton" iconCls="icon-add" plain="true">审批确认</a>  
		    <a href="javascript:caiwufkspselectb();" class="easyui-linkbutton" iconCls="icon-add" plain="true">取消付款</a> 
		    <a href="javascript:void(0);"  onclick="javascript:$('#asousuo').dialog('open');" class="easyui-linkbutton" iconCls="icon-save" plain="true">查询</a> 	
			<a href="javascript:cwfkspselect(2)" class="easyui-linkbutton" iconCls="icon-search" plain="true">已确认收款</a>
			<a href="javascript:cwfkspselect(4)" class="easyui-linkbutton" iconCls="icon-search" plain="true">待确认收款</a>
	</div>
	<table id="fkspdg" class="easyui-datagrid"
		data-options="url:'fenghuang/fukuanshenhe.do?shenfenid=3&ysyfid=2&caiwuid=2',border:false,singleSelect:true,fit:true,fitColumns:true, onClickRow: onClickRow,pageSize:20"
		pagination="true" toolbar="#dgtb">
		<thead>
			<tr>	 
			    
				<th data-options="field:'fukuantime'" width="10px">付款日期</th>
				<th data-options="field:'team'" width="10px">团号</th>
				<th data-options="field:'tuanduimc'" width="10px">团队名称</th>
				<th data-options="field:'khmc'" width="10px">供应商名称</th>
				<th data-options="field:'kxsm'" width="10px">款项</th>
				<th data-options="field:'yfk'" width="10px">金额</th>
			
				<th data-options="field:'caozuo'" width="10px">提交人</th>
				<th data-options="field:'review',formatter:cwfksp" width="10px">财务审核</th>
				<th data-options="field:'confirmed',formatter:cwfksp2" width="10px">财务确认</th>
			
			</tr>
		</thead>
	</table>
	<div id="caiwufksp" class="easyui-dialog" title="财务审批确认"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="spform" action="">
			<table align="center">
				<tr>
					
					<td><input id="id" name="id" hidden="true"
						class="easyui-validatebox">
						</div></td>
					
					<td>
					<input id="caiwuid" name="caiwuid"   value="4" hidden="true"
						class="easyui-validatebox">
						<input id="caiwuidaction" name="caiwuida"   value="4" hidden="true"
						class="easyui-validatebox">
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
						href="javascript:fkspupdatea();" class="easyui-linkbutton"
						iconCls="icon-ok">确认</a> <a href="javascript:aclose();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input id="searchDicType" name="dicType" type="hidden">
		</form>
	</div>
	
	<div id="caiwufkspa" class="easyui-dialog" title="财务审批取消"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">

			<table align="left">
				<tr>
					
					<td><input id="id" name="id" hidden="true"
						class="easyui-validatebox">
						</div></td>
					
					<td><input id="caiwuidssss"  name="caiwuid" value="2“
						class="easyui-validatebox">
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
						href="javascript:fkspupdateb();" class="easyui-linkbutton"
						iconCls="icon-ok">确认</a> <a href="javascript:bclose();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input id="searchDicType" name="dicType" type="hidden">

	</div>
	<script type="text/javascript">
		
		 //关闭
		   function aclose(){
			$("#caiwufksp").dialog("close");
		    }
		     //关闭
		   function bclose(){
			$("#caiwufkspa").dialog("close");
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
	
	
	   //备注
		   function cwfksp(val,row){
		   var shouke=null;
		   	 if(row.review==1){shouke="未审核";}
		   	 if(row.review==2){shouke="已审核";}
		     return '<div onclick="shoukeclick(event,'+row.tuanNo+')" style="width: auto;">'+shouke+'</div>';
		   }
		   
          function cwfksp2(val,row){
		   var shouke=null;
		   	 if(row.confirmed==1){shouke="未审核";}
		   	 if(row.confirmed==2){shouke="已审核";}
		     return '<div onclick="shoukeclick(event,'+row.tuanNo+')" style="width: auto;">'+shouke+'</div>';
		   }
		   
		   //条件查询
		function cwfkspselect(id){
		
		console.info($('#fkspdg').datagrid('options'));
		var opts = $('#fkspdg').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
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
					url : 'fenghuang/fkspselect.do' ,
					data :  param,
					type : 'POST' ,
					dataType : 'json' ,
					success : function(data){
						$('#fkspdg').datagrid('loadData',data);
					}
				});
		}
		
		//按id查询
		function caiwufkspselecta(id) {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window 
			
			//获取选中 数据
			var row = $("#fkspdg").datagrid("getSelected");
		     //清空ID
		    $('#id').attr('value','');
		    //填充
		    $('#spform').form('load', row);
		      $.messager.confirm('消息', '是否将团号：'+row.team+'确认审批通过?',
			 function(r){  
			  if (r){                  
			                fkspupdatea();
			              
			           }          
			                });
			                
			                return;
		               }
		
		
		//修改
			function fkspupdatea() {
		    var row=$("#fkspdg").datagrid("getSelected");	
		    var param={};
		    $.ajax({
			url:'fenghuang/updatefksp.do?caiwuid='+4+'&id='+row.id,
			date:param,
			dateType:"json",
			success:function(data){
			 $('#fkspdg').datagrid("reload");
			  $.messager.alert('消息','确认审批通过');	
			}
			
			});
		    
		    }
		
		
		
		//按id查询
		function caiwufkspselectb(id) {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window 
			
			//获取选中 数据
		var row = $("#fkspdg").datagrid("getSelected");
			//alert(row.id);
		//清空ID
		$('#id').attr('value','');
		//填充
		$('#caiwuidssss').attr('value',2);
		  $.messager.confirm('消息', '是否将团号：'+row.team+'确认审批通过?',
			 function(r){  
			  if (r){                  
			                fkspupdateb();
			           }          
			                });     
			                return;	
		       }
		
		
		//修改
			function fkspupdateb() {
			var row=$("#fkspdg").datagrid("getSelected");	
			var param={
			};
			
			
			$.ajax({
			url:'fenghuang/updatefksp.do?caiwuid='+2+'&id='+row.id,
			date:param,
			dateType:"json",
			success:function(data){
			$('#fkspdg').datagrid("reload");
			  $.messager.alert('消息','取消成功');	
			}
			
			});
			
			
		}
		
	
	</script>
</body>
</html>
