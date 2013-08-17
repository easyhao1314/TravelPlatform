<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    
    <table id="caozuoliebiaodg" class="easyui-datagrid"
		data-options="url:'fenghuang/Operateinfo.do',border:false,singleSelect:true,fit:true,fitColumns:true,onRowContextMenu: caozuoContextMenu"
		pagination="true">
		<thead>
			<tr>
				<th data-options="field:'oid',hidden:true" width="20">编号</th>
				<th data-options="field:'tuanNo'" width="20">团号</th>
				<th data-options="field:'tuanName',formatter:caozuotuanName" width="20">团名</th>
				<th data-options="field:'kehuID'" width="20">客户ID</th>
				<th data-options="field:'kehuName'" width="20">客户名称</th>
				<th data-options="field:'chutuantime'" width="20">出团日期</th>
				<th data-options="field:'huituantime'" width="20">回团日期</th>
				<th data-options="field:'paidanren'" width="20">派单人</th>
				<th data-options="field:'jiedanren'" width="20">接单人</th>
				<th data-options="field:'jinzhan'" width="20">进展</th>
				<th data-options="field:'paidantime'" width="20">派单日期</th>
				<th data-options="field:'operateType'" width="20">操作类型</th>
				<th data-options="field:'operatestate'" width="20">操作状态</th>
			</tr>
		</thead>
	</table>
	<!-- 付款window -->
    <div id="fukuan" class="easyui-window" title="应付款窗口" data-options="iconCls:'icon-save',closed:true" style="width:500px;height:200px;padding:10px;">
        <form action="">
        	<table  style="width: 400px;">
        	<tr>
        		<td>应付款项： 
        		
        		<input id="cc" class="easyui-combotree"  required style="width: 150px;">
    			</td>
        	</tr>
        	<tr>
        	<td>收款单位：<input class="easyui-validatebox" required style="width: 250px;" /></td>
        	</tr>
        	<tr>
        	<td>应付日期： <input class="easyui-datetimebox" required style="width:150px"></td>
        	</tr>
        	<tr>
        	<td>金额：<input class="easyui-validatebox" height="50px" required style="width: 150px;" /></td>
        	</tr>
        	<tr>
        	<td>备注：<input class="easyui-validatebox" style="width: 150px;" /></td>
        	</tr>
        	</table>
        </form>
    </div>
	<!-- END付款window ___________________________________________ -->
	
	
	
	
	<div id="caozuomm" class="easyui-menu" style="width:120px;">
    <div onClick="View()" data-options="iconCls:'icon-search'">查看</div>
    <div onClick="dingfang()" data-options="iconCls:'icon-search'">订房</div>
    <div onClick="dingche()" data-options="iconCls:'icon-search'">订车</div>
    <div onClick="dingcan()" data-options="iconCls:'icon-search'">订餐</div>
    <div onClick="dingdaoyou()" data-options="iconCls:'icon-search'">订导游</div>
    <div onClick="dinggouwudian()" data-options="iconCls:'icon-search'">订购物店</div>
  	 	 <div onclick="$('#fukuan').window('open')">
            <span>付款</span>
            
   		 </div>
    </div>
    
	 
	  <div id="caozuodingche"  class="easyui-dialog" title="订车明细"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:500px;padding:10px;"> 
		  <form id="caozuodingcheForm" method="post">
		    <table>
		      <tr>
		         <td>日期</td><td>行程线路</td><td>人数</td><td>车型</td><td>活动</td><td>司机酒店</td><td>客人酒店</td>
		      </tr>
		      
		    </table>
		  </form>
	    
	</div>
		  <div id="caozuodingdaoyou"  class="easyui-dialog" title="订导游明细"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:500px;padding:10px;"> 
		  <form id="caozuodingdaoyouForm" method="post">
		    <table>
		      <tr>
		         <td>导游</td><td>均摊人数</td><td>城市</td><td>住店</td><td>工资否</td><td>导游类型</td>
		      </tr>		      
		    </table>
		  </form>
	    
	</div>
	<script type="text/javascript">
	
	
	
	
	
	
	
	
	
	function caozuotuanName(val,row){
	//打开操作明细页面
		return '<a href="javascript:openCaozuomx('+row.tuanNo+')">'+row.tuanName+'</a>';
	}
	function caozuoContextMenu(e, rowIndex, rowData){
	 e.preventDefault();
	  $('#caozuomm').menu('show', {
        left:e.pageX,
        top:e.pageY
    });  
	}
	function View(){
		$("#caozuoView").dialog("open");
		var node= $("#caozuoliebiaodg").datagrid("getSelected");
	$.ajax({
					data : node,
					dataType : "json",
					success : function(data) {
					alert(data);
		 $("#caozuoViewForm").dialog('load',data.rows[0]);
				
					},
				
	});
			
	}
	function dingfang(){
	  	var row = $("#caozuoliebiaodg").datagrid("getSelected");
      var url= "Caozuo_dingfang.do?tuanNo="+row.tuanNo;
       var tab = $('#tt').tabs('getSelected'); 
		if (tab){  
	                 var index = $('#tt').tabs('getTabIndex', tab); 
	                 $('#tt').tabs('close', index);  
	       } 
	       
	       $('#tt').tabs('add', {
				         title : "订房行程详细信息",
				         href : url,
				      //  closable : true,
				         });
	}
	
	function dingche(){
	$("#caozuodingche").dialog("open");
	}
    function dingcan(){
    $("#caozuodingcan").dialog("open");
    }
    function dingdaoyou(){
    $("#caozuodingdaoyou").dialog("open");
    }
    function dinggouwudian(){
    $("#caozuodinggouwudian").dialog("open");
    }
	</script>
	
	<script type="text/javascript">
	
	</script>
  </body>
</html>
