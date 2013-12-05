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
<div id="shoukuansousuo" class="easyui-dialog" title="查询"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
			text:'查询',
			iconCls:'icon-search',
			handler:function(){
			$('#shoukuansousuo').dialog('close');
			shoukuanselect();
			}
			},
			{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#shoukuansousuo').dialog('close');
		
			}
			}
		]"
		style="width:300px;height:180px;padding:10px;">
	<!-- 如果在正式开发环境下 url可以为后台的请求，地址 -->
   <table>
	    		<tr>
	    		   	<td>团队名称:<input class="easyui-validatebox" type="text" name="team" id="team" style="width:200px"></input></td>
	    		   	</tr>
	    		   	<tr>
	    			<td>团号:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="easyui-validatebox" type="text" name="tuanduimc" id="tuanduimc" style="width:200px"></input></td>
	    			</tr>
	    			<tr>
	    			<td><input class="easyui-validatebox" type="text" name="caozuo" id="zhi" hidden="true ></input></td>
	    			</tr>
	    			<td>
	    			<!-- hidden="true" -->
	    		    </td>
	    		</tr>    		
	    	</table>
	    </div> 			    	
	    	  <div id="shoukuandgtb">	
	    	   <a href="javascript:shoukuanopen(7);" class="easyui-linkbutton" iconCls="icon-add" plain="true">审批确认</a>  
		       <a href="javascript:shoukuanopen(6);" class="easyui-linkbutton" iconCls="icon-add" plain="true">取消付款</a>	   
		       <a href="javascript:void(0);" onclick="javascript:$('#shoukuansousuo').dialog('open');" class="easyui-linkbutton" iconCls="icon-save" plain="true">查询</a>  	  
	           <a href="javascript:shoukuanselect(6)" class="easyui-linkbutton" iconCls="icon-search" plain="true">待确认收款</a>
			   <a href="javascript:shoukuanselect(7)" class="easyui-linkbutton" iconCls="icon-search" plain="true">已确认收款</a>
	    	  </div>
	<table id="shoukuandg" class="easyui-datagrid"
		data-options="url:'fenghuang/caiwuqrfkselect.do?ysyfid=1&&caiwuid=6&&shenfenid=5',border:false,singleSelect:true,fit:true,fitColumns:true, onClickRow: onClickRow,pageSize:20"
		pagination="true" toolbar="#shoukuandgtb">
		<thead>
			<tr>	 
			    <th data-options="field:'yushoutime'" width="10px">收款日期</th>
				<th data-options="field:'team'" width="10px">团名</th>
				<th data-options="field:'tuanduimc'" width="10px">团号</th>
				<th data-options="field:'khmc'" width="10px">客户名称</th>
				<th data-options="field:'kxsm'" width="10px">款项</th>
				<th data-options="field:'yishou'" width="10px">金额</th>
			
				<th data-options="field:'xiaoshouyuan'" width="10px">操作人</th>
				<th data-options="field:'beizhu'" width="10px">备注</th>
				<th data-options="field:'confirmed',formatter:caiwuqueren" width="10px">财务确认</th>
			</tr>
		</thead>
	</table>
		<div id="shoukuanxiugai" class="easyui-dialog" title="财务收款"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="shoukuanxiugaiform" action="">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>编号:</label>
					</td>
					<td><input id="id" name="id"
						class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>名称:</label>
					</td>
					<td><input id="caiwuid" name="caiwuid" 
						class="easyui-validatebox">
						</div></td>
				</tr>
				
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:shoukuanupdate();" class="easyui-linkbutton"
						iconCls="icon-ok">确认</a> <a href="javascript:shoukuanclose();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	
	
	<script type="text/javascript">
	  //关闭
		   function shoukuanclose(){
			$("#shoukuanxiugai").dialog("close");
		    }
	
	
		function caiwuqueren(val,row){
			var caiwu = '未确认';
			if(row.confirmed==2){
				caiwu='已确认';
			}
			return caiwu;
			
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
	
        //首款查询    
	    function shoukuanselect(id){
	     var z = $("#zhi").val();
	   
	     if(id==6){
	      z=6;
	   
	     }
	     if(z==7){
	       id=7;
	     
	     }
	  
	    if(id==null||id==6){
	     id=6;
	     var a=id;
	      $("#zhi").val(a);
	      var caiwuid = $("#zhi").val();
	   
         
	    }
	     if(id==7){
	      id=7;
          var a=id;
          $("#zhi").val(a);
           var c = $("#zhi").val();
         
            
	    }
	   
		console.info($('#shoukuandg').datagrid('options'));
		var opts = $('#shoukuandg').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				team: $("#team").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				tuanduimc: $("#tuanduimc").val(),
				ysyfid:1,
				shenfenid:5,
				caiwuid:id,
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
						$('#shoukuandg').datagrid('loadData',data);
					}
				});
		}
		
		
		
		
			//按id查询
		function shoukuanopen(id) {
			var row = $("#shoukuandg").datagrid("getSelected");
		    $('#id').attr('value','');
		     row.caiwuid=id;
		     if(row.caiwuid==7){
		     $.messager.confirm('消息', '是否将团号：'+row.team+'收款审批通过?',
			 function(r){  
			  if (r){                  
			                $.ajax({
			           url:'fenghuang/updatefksp.do?caiwuid='+row.caiwuid+'&id='+row.id,
			           date:row.id,
			           dateType:"json",
			           success:function(data){
			           $('#shoukuandg').datagrid("reload");
			           $.messager.alert('消息','收款成功');	     
			          }
			          });    
			           }                  
			                }); 
			       }   
			       
			   if(row.caiwuid==6){
		     $.messager.confirm('消息', '是否将团号：'+row.team+'取消收款通过?',
			 function(r){  
			  if (r){                  
			                $.ajax({
			           url:'fenghuang/updatefksp.do?caiwuid='+row.caiwuid+'&id='+row.id,
			           date:row.id,
			           dateType:"json",
			           success:function(data){
			           $('#shoukuandg').datagrid("reload");
			           $.messager.alert('消息','取消收款成功');	     
			          }
			          });    
			           }                  
			                }); 
			       }   
			       
			                return;	
		}	
	</script>
</body>
</html>
