<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Caozuo_Liebiao.jsp' starting page</title>
    
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
	<div id="mm" class="easyui-menu" style="width:120px;">
    <div onClick="View()" data-options="iconCls:'icon-search'">查看</div>
    <div onClick="dingfang()" data-options="iconCls:'icon-add'">订房</div>
    <div onClick="dingche()" data-options="iconCls:'icon-edit'">订车</div>
    <div onClick="dingcan()" data-options="iconCls:'icon-remove'">订餐</div>
    <div onClick="dingdaoyou()" data-options="iconCls:'icon-print'">订导游</div>
    <div onClick="dinggouwudian()" data-options="iconCls:'icon-reload'">订购物店</div>
    </div>
    <div id="caozuoView"  class="easyui-dialog" title="查看明细"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:500px;padding:10px;">
            <form id="caozuoViewForm" method="post">
           <table>
              <tr>
                 <td>团号：</td><td><input name="tuanNo" class="easyui-validatebox"/></td><td>团名：</td><td><input name="tuanName" class="easyui-validatebox"/></td>
              </tr>
               <tr>
                 <td>客户名称：</td><td><input name="kehuName" class="easyui-validatebox"/></td><td></td><td></td>
              </tr>
               <tr>
                 <td>出团日期：</td><td><input name="chutuantime" class="easyui-validatebox"/></td><td>回团日期：</td><td><input name="huituantime" class="easyui-validatebox"/></td>
              </tr>
               <tr>
                 <td>派单人：</td><td><input name="paidanren" class="easyui-validatebox"/></td><td>接单人：</td><td><input name="jiedanren" class="easyui-validatebox"/></td>
              </tr>
               <tr>
                 <td>操作进展：</td><td><input name="jinzhan" class="easyui-validatebox"/></td><td>派单日期：</td><td><input name="operateType" class="easyui-validatebox"/></td>
              </tr>
               <tr>
                 <td>订单状态：</td><td><input name="operateType" class="easyui-combobox"/></td><td>操作状态：</td><td><input name="operatestate" class="easyui-combobox"/></td>
              </tr>
           </table>
        </form>
    </div>
	  <div id="caozuodingfang"  class="easyui-dialog" title="订房明细"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:500px;padding:10px;"> 
		  <form id="caozuodingfangForm" method="post">
		    <table>
		      <tr>
		         <td>居住时间</td><td>居住城市</td><td>酒店标准</td><td>操作情况</td><td>操作</td>
		      </tr>
		       
		    </table>
		  </form>
	    
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
	  $('#mm').menu('show', {
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
	  $("#caozuodingfang").dialog("open");
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
	
  </body>
</html>
