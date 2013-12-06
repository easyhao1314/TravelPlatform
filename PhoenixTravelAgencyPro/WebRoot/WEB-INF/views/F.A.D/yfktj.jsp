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
<div id="yfktjchaxun" class="easyui-dialog" title="查询"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
			text:'查询',
			iconCls:'icon-search',
			handler:function(){
			$('#yfktjchaxun').dialog('close');
			yfktjselect();
			}
			},
			{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#yfktjchaxun').dialog('close');
		
			}
			}
		]"
		style="width:300px;height:180px;padding:10px;">
	<!-- 如果在正式开发环境下 url可以为后台的请求，地址 -->
          <table>
	    		<tr>
	    		   	<td>团队名称:<input class="easyui-validatebox" type="text" name="team"  id="team"  style="width:200px"></input></td>
	    		   	</tr>
	    		   	<tr>
	    			<td>团号:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="easyui-validatebox" type="text" name="tuanduimc" id="tuanduimc"  style="width:200px"></input></td>
	    			<td>
	    		    </td>
	    		</tr>
	    	
	    		
	    	</table>
	    	</div>
	    	<div id="yfktjdgtb">
	    	<a href="javascript:void(0);" onclick="javascript:$('#yfktjchaxun').dialog('open');" class="easyui-linkbutton" iconCls="icon-save" plain="true">查询</a>  
	    	</div>
	   <table id="dgyfktj" class="easyui-datagrid"
		data-options="url:'fenghuang/caiwuqrfkselect.do?ysyfid=2&shenfenid=3',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
		pagination="true" toolbar="#yfktjdgtb">
		<thead>
			<tr> 
				<th data-options="field:'id'" width="50" hidden="true"></th>
				<th data-options="field:'team'" width="50">团号</th>
				<th data-options="field:'tuanduimc'" width="50">团队名称</th>
				<th data-options="field:'khmc'" width="">客户名称</th>
				<th data-options="field:'yushoutime'" width="50">预售日期</th>
				<th data-options="field:'huilv'" width="50">汇率</th>
				<th data-options="field:'bizhong'" width="50">币种</th>
				<th data-options="field:'syfk'" width="50">应付款</th>
				<th data-options="field:'syifu'" width="50">已付</th>
				<th data-options="field:'weifu'" width="50">未付</th>
				<th data-options="field:'ykfp',formatter:yfktjykfp" width="50">已开发票</th>
				<th data-options="field:'fpxk',formatter:yfktjfpxk" width="50">发票许可</th>
				<th data-options="field:'aaa'" width="50">销售确认</th>
			    <th data-options="field:'confirmed',formatter:yfktjconfirmed" width="50">财务确认</th>
			    <th data-options="field:'fuzeren',editor:'numberbox'" width="50">责任人</th>
			</tr>
		</thead>
	</table>
	
	<script type="text/javascript">
	
	 //备注
		   function yfktjconfirmed(val,row){
		   var shouke=null;
		   	 if(row.confirmed==1){shouke="未审核";}
		   	 if(row.confirmed==2){shouke="已审核";}
		     return '<div onclick="shoukeclick(event,'+row.tuanNo+')" style="width: auto;">'+shouke+'</div>';
		   }
	
	
	
	  //备注
		   function yfktjykfp(val,row){
		   var shouke=null;
		   	 if(row.ykfp==0){shouke="未开发票";}
		   	 if(row.ykfp==1){shouke="已开发票";}
		     return '<div onclick="shoukeclick(event,'+row.tuanNo+')" style="width: auto;">'+shouke+'</div>';
		   }
	
	  //备注
		   function yfktjfpxk(val,row){
		   var shouke=null;
		   	 if(row.fpxk==0){shouke="未开发票";}
		   	 if(row.fpxk==1){shouke="已开发票";}
		     return '<div onclick="shoukeclick(event,'+row.tuanNo+')" style="width: auto;">'+shouke+'</div>';
		   }
		function onClickRow(index) {
			if (editIndex != index) {
				if (endEditing()) {
					$('#dgyfktj').datagrid('selectRow', index).datagrid('beginEdit',
							index);
					editIndex = index;
				} else {
					$('#dgyfktj').datagrid('selectRow', editIndex);
				}
			}
		}
			
		
		
	  function yfktjselect(id){
		
		console.info($('#dgyfktj').datagrid('options'));
		var opts = $('#dgyfktj').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				team: $("#team").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				tuanduimc: $("#tuanduimc").val() ,
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
						$('#dgyfktj').datagrid('loadData',data);
					}
				});
		}
		
		
	</script>
</body>
</html>
