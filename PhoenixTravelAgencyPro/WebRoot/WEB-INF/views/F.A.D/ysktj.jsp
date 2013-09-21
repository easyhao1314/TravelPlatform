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
	    		   	<td>团号:<input class="easyui-validatebox" type="text" name="team" id="team"></input></td>
	    			<td>客户:<input class="easyui-validatebox" type="text" name="khmc" id="khmc"></input></td>
	    			<td>
	    		<div style="padding:5px;">
		<a href="javascript:ysktjselect()" class="easyui-linkbutton" data-options="toggle:true,group:'g1'">搜索</a>
	             </div>
	    			
	    		</td>
	    		</tr>
	    	
	    		
	    	</table>
	    	 <div class="easyui-panel" title="应收款统计"
		style="height:450px;width: auto;" toolbar="#currencyDatagridtoolbar">	
	<table id="dgysktjselect" class="easyui-datagrid"
		data-options="url:'fenghuang/caiwutdfylbselect.do?ysyfid=1',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
		pagination="true" toolbar="#tb">
		<thead>
			<tr> 
			    <th data-options="field:'id',editor:'text'" width="50">团号</th>
				<th data-options="field:'team',editor:'text'" width="50">团号</th>
				<th data-options="field:'tuanduimc',editor:'text'" width="50">团队名称</th>
				
				<th data-options="field:'kxsm',editor:'text'" width="50">款项说明</th>
				<th data-options="field:'khmc',editor:'text'" width="50">客户名称</th>
				<th data-options="field:'yushoutime',editor:'text'" width="50">预售日期</th>
				<th data-options="field:'huilv',editor:'text'" width="50">汇率</th>
				<th data-options="field:'bizhong',editor:'text'" width="50">币种</th>
				<th data-options="field:'yingshou',editor:'text'" width="50">应收</th>
			    <th data-options="field:'yishou',editor:'text'" width="30">已收</th>
			    <th data-options="field:'aaaa',formatter:yskjs" width="30">未收</th>
				<th data-options="field:'ykfp',formatter:ysktjfp"width="50">已开发票</th>
				<th data-options="field:'fpxk',formatter:ysktjxk" width="50">发票许可</th>
				<th data-options="field:'xiaoshou',editor:'numberbox'" width="20">销售确认</th>
				<th data-options="field:'caiwuid',formatter:ysktjbeizhu" width="20">财务确认</th>
				<th data-options="field:'fuzeren',editor:'numberbox'" width="50">责任人</th>
			
			</tr>
		</thead>
	</table>
	</div>
	
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
	
	function yskjs(val,row){
var a=parseInt(row.yingshou);
var b=parseInt(row.yishou);
var c=(a-b);
return '<div style="width: auto;">'+c+'</div>';
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
				khmc: $("#khmc").val() ,
			
				ysyfid:1,
				caiwuid: id,
                   	
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
						$('#dgysktjselect').datagrid('loadData',data);
					}
				});
		}
		
	
	</script>
</body>
</html>
