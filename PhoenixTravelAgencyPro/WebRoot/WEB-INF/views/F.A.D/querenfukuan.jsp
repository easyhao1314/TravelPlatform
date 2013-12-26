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
	<div id="qurenfukuansousuo" class="easyui-dialog" title="查询"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
			text:'查询',
			iconCls:'icon-search',
			handler:function(){
			$('#qurenfukuansousuo').dialog('close');
			dijieSelectLike();
			}
			},
			{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#qurenfukuansousuo').dialog('close');
		
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
	    			<td>		
	    		   </td>
	    		</tr>		
	    	</table>
	    	</div>
	    	<div id="querenfukuandgtb">	
		      <a href="javascript:werhuSelectId();" class="easyui-linkbutton" iconCls="icon-add" plain="true">付款确认</a>  
		      <a href="javascript:werhuSelectId2();" class="easyui-linkbutton" iconCls="icon-add" plain="true">取消付款</a>
		      <a href="javascript:void(0);" onclick="javascript:$('#qurenfukuansousuo').dialog('open');" class="easyui-linkbutton" iconCls="icon-save" plain="true">查询</a> 
		      <a href="javascript:dijieSelectLike(4)" class="easyui-linkbutton" iconCls="icon-search" plain="true">待确认审批</a>
			  <a href="javascript:dijieSelectLike(5)" class="easyui-linkbutton" iconCls="icon-search" plain="true">已确认审批</a> 		
	         </div>
	   
	<table id="qurenfukuandg" class="easyui-datagrid"
		data-options="url:'fenghuang/caiwuqrfkselect.do?shenfenid=3&ysyfid=2&caiwuid=4',border:false,singleSelect:true,fit:true,fitColumns:true, onClickRow: onClickRow,pageSize:20"
		pagination="true" toolbar="#querenfukuandgtb" >
		<thead>
			<tr>	 
				<th data-options="field:'fukuantime'" width="50px">付款日期</th>
				<th data-options="field:'zhanghaoid'" width="50px">账号</th>
				<th data-options="field:'team'" width="50px">团号</th>
				<th data-options="field:'tuanduimc'" width="50px">团队名称</th>
				<th data-options="field:'khmc'" width="50px">供应商名称</th>
				<th data-options="field:'kxsm'" width="50px">款项</th>
				<th data-options="field:'syfk'" width="50px">金额</th>
				<th data-options="field:'xiaoshouyuan'" width="50px">提交人</th>
				<th data-options="field:'review',formatter:shenhezhuanhuan" width="50px">财务审核</th>
				<th data-options="field:'cashier',formatter:openshouke" width="50px">出纳确认</th>
			
			</tr>
		</thead>
	</table>
	
	<div id="xiugai" class="easyui-dialog" title="付款确认"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="weihuxiugai" method="post" >
			<table  align="center">
				<tr>
					<td>
					<input id="id" name="id" class="easyui-validatebox" onfocus=this.blur() hidden="true">
							
					</td>
					<td><input id="caiwu" value="5"  class="easyui-validatebox" hidden="true">
				</td> 
						
				</tr>
					<tr>
					<td>
							<label>团名:</label>
					</td>
					<td>
					<input id="team" name="team" 
						class="easyui-validatebox" onfocus=this.blur() >
				</td>
				</tr>
			</table>
		</form>
	</div>
	
	
	<div id="xiugai2" class="easyui-dialog" title="取消付款"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="weihuxiugai2" method="post" >
			<table  align="center">
				<tr>
					<td>
					<input id="id" name="id" class="easyui-validatebox"  hidden="true">
							
					</td>
					<td><input id="caiwu2" value="4"  class="easyui-validatebox" hidden="true">
					</td> 
						
				</tr>
				<tr>
					<td>
							<label>团名:</label>
					</td>
					<td>
					<input id="team" name="team" 
						class="easyui-validatebox" onfocus=this.blur() >
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<script type="text/javascript">
		function onClickRow(index) {
			if (editIndex != index) {
				if (endEditing()) {
					$('#qurenfukuandg').datagrid('selectRow', index).datagrid('beginEdit',
							index);
					editIndex = index;
				} else {
					$('#qurenfukuandg').datagrid('selectRow', editIndex);
				}
			}
		} 
		//条件查询
		function dijieSelectLike(id){
		
		console.info($('#qurenfukuandg').datagrid('options'));
		var opts = $('#qurenfukuandg').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				team: $("#team").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				tuanduimc: $("#tuanduimc").val() ,
				caiwuid:  id ,
				shenfenid:3,
				ysyfid:2,
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
						$('#qurenfukuandg').datagrid('loadData',data);
					}
				});
		}
		
		
		//按id查询
		function werhuSelectId(id) {
			//准备回显的数据
			var row = $("#qurenfukuandg").datagrid("getSelected");
			
			 $.messager.confirm('消息', '是否将团号：'+row.team+'确认付款?',
			 function(r){  
			  if (r){                  
			         
			          $.ajax({
			           url:'fenghuang/updatefksp.do?caiwuid='+5+'&id='+row.id,
			           date:row.id,
			           dateType:"json",
			           success:function(data){
			           $('#qurenfukuandg').datagrid("reload");
			           $.messager.alert('消息','付款成功');	
			          }
			          });    
			           }          
			                });
			                
			                return;	
		               }
			
		
			//按id查询
		function werhuSelectId2(id) {
			var row = $("#qurenfukuandg").datagrid("getSelected");
			 $.messager.confirm('消息', '是否将团号：'+row.team+'确认付款?',
			 function(r){  
			  if (r){                  
			         
			          $.ajax({
			           url:'fenghuang/updatefksp.do?caiwuid='+4+'&id='+row.id,
			           date:row.id,
			           dateType:"json",
			           success:function(data){
			           $('#qurenfukuandg').datagrid("reload");
			           $.messager.alert('消息','取消付款成功');	
			          }
			          });    
			           }          
			                });
			                
			                return;	
						
		}
		
		function openshouke(val,row){
		   var shouke=null;
		   	 if(row.cashier==1){shouke="未付款";}
		   	 if(row.cashier==2){shouke="已付款";}
		     return '<div onclick="shoukeclick(event,'+row.tuanNo+')" style="width: auto;">'+shouke+'</div>';
		   }
		   function shenhezhuanhuan(val,row){
		   var shouke=null;
		   	 if(row.review==1){shouke="未付款";}
		   	 if(row.review==2){shouke="已付款";}
		     return '<div onclick="shoukeclick(event,'+row.tuanNo+')" style="width: auto;">'+shouke+'</div>';
		   }
	</script>
</body>
</html>
