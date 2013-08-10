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
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" type="text/css" href="js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="js/demo/demo.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/jquery.json.js"></script>

  </head>
  
  <body>
  <div class="easyui-panel" title="线路列表" style="height:480px;width: auto;">
    <table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/xianluinfo.do',border:false,singleSelect:true,fit:true,fitColumns:true"
		pagination="true" toolbar="#currencyDatagridtoolbar">
		<thead>
			<tr>
				<th data-options="field:'xianid'" width="50px">编号</th>
				<th data-options="field:'xianluname'" width="50px">线路名称</th>
				<th data-options="field:'guojia'" width="50px">国家数</th>
				<th data-options="field:'tianshu'" width="50px">天数</th>
				<th data-options="field:'weihuren'" width="50px">维护人</th>
			</tr>
		</thead>
	</table>
	</div>
	 <div id="currencyDatagridtoolbar">
		<a href="javascript:addXianluOpen();" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
		<a href="javascript:updateselectxianlu();" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		<a href="javascript:deletericheng();" class="easyui-linkbutton" iconCls="icon-cut" plain="true">删除</a>
	</div>
	<!--新增 -->
	<div id="xianluAdd" class="easyui-dialog" title="线路新增"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:500px;padding:10px;">
	  <form id="xianluAddForm" method="post">
	     <table>
	       <tr>
	         <td>线路名称：</td><td><input name="xianluname" class="easyui-validatebox"  required="true"></td><td>天数：</td><td><input name="tianshu" class="easyui-validatebox"  required="true"></td>
	       </tr>
	        <tr>
	         <td>国家：</td><td><input name="guojia" class="easyui-validatebox"  required="true"></td><td>维护人：</td><td><input name="weihuren" class="easyui-validatebox"  required="true"></td>
	       </tr>
	        <tr>
	        <td colspan="4" align="center"><a href="javascript:addXianlu();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" onclick="$('#updateForm').form('clear')">重置</a></td>
	       </tr>
	     </table>
	  </form>
	</div>
	<!--新增结束 -->
	<script type="text/javascript">
	
	function addXianluOpen(){
	$("#xianluAdd").dialog("open");
	   $("#xianluAddForm").form("clear");
	}
	function addXianlu(){
	 $('#xianluAddForm').form('submit',{
	      url:"fenghuang/addXianlu.do",
	      onSubmit:function(){
	      return $(this).form('validate');
	      },
	      success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
						$.messager.alert("保存成功", "保存成功！", "info");
					   $("#xianluAdd").dialog('close');
					   $("#dg").datagrid("reload");
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
					
					}
				}
	 });
	}
	function updateselectxianlu(){
	var row = $("#dg").datagrid("getSelected");
	if(row!=null){
		 	var url= "Xingcheng_mx.do?xianid="+row.xianid;//在框架中的方法：Xingcheng_mx.do打开明细页面传xianid的值
		 	
       var tab = $('#tt').tabs('getSelected'); 
		if (tab){  
	                 var index = $('#tt').tabs('getTabIndex', tab); 
	                 $('#tt').tabs('close', index);  
	       } 
	       
	       $('#tt').tabs('add', {
				         title : row.xianluname+"行程明细",
				         href : url,
				      //  closable : true,
				         });
   	      }
   	      else{
   	      	$.messager.alert('信息', '请选择一行要修改的数据', 'info'); 
   	      }
	}
	
	
	
	</script>
  </body>
</html>
