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
<div id="ysktjsousuo" class="easyui-dialog" title="查询"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
			text:'查询',
			iconCls:'icon-search',
			handler:function(){
			$('#ysktjsousuo').dialog('close');
			ysktjselect();
			}
			},
			{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#ysktjsousuo').dialog('close');
		
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
	    			<td>   			
	    		</td>
	    		</tr>   		
	    	</table>
	    	</div>
	    	<div id="ysktjdgtb">	
	    	  <a href="javascript:void(0);" onclick="javascript:$('#ysktjsousuo').dialog('open');" class="easyui-linkbutton" iconCls="icon-save" plain="true">查询</a> 
	    	</div>
	<table id="dgysktjselect" class="easyui-datagrid"
		data-options="url:'fenghuang/caiwutdfylbselect.do?',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20,collapsible:true"
		pagination="true" toolbar="#ysktjdgtb">
		<thead>
			<tr> 
				<th data-options="field:'team'" width="50">团队名称</th>
				<th data-options="field:'tuanduimc'" width="80">团号</th>
				<th data-options="field:'khmc'" width="50" hidden="true">客户名称</th>
				<th data-options="field:'yushoutime'" width="50">预售日期</th>
				<th data-options="field:'huilv'" width="30">汇率</th>
				<th data-options="field:'bizhong'" width="30">币种</th>
				<th data-options="field:'syingshou'" width="50">应收</th>
			    <th data-options="field:'syishou'" width="40">已收</th>
			    <th data-options="field:'weishou'" width="40">未收</th>
				<th data-options="field:'ykfp',formatter:ysktjfp"width="50">已开发票</th>
				<th data-options="field:'fpxk',formatter:ysktjxk" width="50">发票许可</th>
				<th data-options="field:'xiaoshouyuan'" width="30">销售确认</th>
				<th data-options="field:'caiwuid',formatter:ysktjbeizhu" width="30">财务确认</th>
				<th data-options="field:'zerenren'" width="50">责任人</th>
			</tr>
		</thead>
	</table>	
	<script type="text/javascript">
	
	function ysktjfp(val,row){
		   var shouke=null;
		   	 if(row.ykfp==0){shouke="未开发票";}
		   	 if(row.ykfp==1){shouke="已开发票";}
		     return '<div onclick="shoukeclick(event,'+row.tuanNo+')" style="width: auto;">'+shouke+'</div>';
		   }
	
	function ysktjxk(val,row){
		   var shouke=null;
		   	 if(row.fpxk==0){shouke="未开发票";}
		   	 if(row.fpxk==1){shouke="已开发票";}
		     return '<div onclick="shoukeclick(event,'+row.tuanNo+')" style="width: auto;">'+shouke+'</div>';
		   }
	
	
	function ysktjbeizhu(val,row){
		   var shouke=null;
		   	 if(row.caiwuid==6){shouke="未审核";}
		   	 if(row.caiwuid==7){shouke="已审核";}
		     return '<div onclick="shoukeclick(event,'+row.tuanNo+')" style="width: auto;">'+shouke+'</div>';
		   }
		   function zhuanhuan(val,row){
		        var a=null;
		        a=row.huilv;
		        a.toFixed(2);
	
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
	
     	function ysktjselect(id){
		
		console.info($('#dgysktjselect').datagrid('options'));
		var opts = $('#dgysktjselect').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				team: $("#team").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
			    tuanduimc: $("#tuanduimc").val() ,
			
				ysyfid:1, 	
				page:  opts.pageNumber ,
				rows:  opts.pageSize
			};
		console.info(param);
				$.ajax({
					url : 'fenghuang/caiwutdfylbselect.do' ,
					data :  param,
					type : 'POST' ,
					dataType : 'json' ,
					success : function(data){
						$('#dgysktjselect').datagrid('loadData',data);
					}
				});
		}
		
	
	</script>
</body>
</html>
