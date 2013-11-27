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
  
    <table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/xianluinfo.do?xingchengku=1',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
		pagination="true" toolbar="#currencyDatagridtoolbar">
		<thead>
			<tr>
				<th data-options="field:'xianid'" width="50px">编号</th>
				<th data-options="field:'xianluname'" width="50px">线路名称</th>
				<th data-options="field:'guojia'" width="50px">国家数</th>
				<th data-options="field:'tianshu'" width="50px">天数</th>
				<th data-options="field:'userName'" width="50px">维护人</th>
			</tr>
		</thead>
	</table>


	 <div id="currencyDatagridtoolbar">
		<a href="javascript:addXianluOpen();" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
		<a href="javascript:updateselectxianlu();" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		<a href="javascript:deletericheng();" class="easyui-linkbutton" iconCls="icon-cut" plain="true">删除</a>
		<a href="javascript:void(0);" onclick="newricheng();" class="easyui-linkbutton" iconCls="icon-add" plain="true">生成新日程</a>
		<a href="javascript:void(0);" onclick="daoruword();" class="easyui-linkbutton" iconCls="icon-add" plain="true">导入word日程</a>
	</div>
	<!--新增 -->
	<div id="xianluAdd" class="easyui-dialog" title="线路新增"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons: 
	 			[{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
                    addXianlu();
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                    $('#xianluAdd').dialog('close');
                    }
                }]"
		style="width:600px;height:500px;padding:10px;">
		 <p ><font  color="FF0000">提示：添加线路基本信息之后不会立即生成行程而是根据用户的需要，是否进行导入行程，导入行程的流程是选择一条线路，然后点击上方的导入Word行程，然后选择行程。导入完成之后刷新一遍即可。</font></p>
	<p><font color="FF0000">注意：个别浏览器可能会出现拦截窗口的的情况，大部分浏览器都在地址栏的下边或者左边！</font></p> 
	  
	  <form id="xianluAddForm" method="post">
	     <table>
	       <tr>
	         <td>线路名称：</td><td><input name="xianluname" class="easyui-validatebox" style="width: 400px;"  required="true"></td>
	       </tr>
	       <tr>
	       	<td>行程天数：</td><td><input  name="tianshu" class="easyui-numberspinner"  style="width: 400px;" min="1" max="100" style="width:133px;" required="true"></input></td>
	       </tr>
	       
	        <tr>
	         <td>行程国家数：</td><td><input name="guojia" class="easyui-numberspinner"  style="width: 400px;" min="1" max="100" style="width:133px;" required="true"></input></td>
	       </tr>
	        <tr>
	        <td></td><td><input name="weihuren" type="hidden" title="维护人" value="${sessionScope.userId}"></td>
	        <td></td><td><input name="xingchengku" type="hidden" title="是否行程库1代表是" value="1"></td>
			
	       </tr>
	     </table>
	  </form>
	 
	</div>
	
	
	<!--新增结束 -->
	<script type="text/javascript">
	
	function addXianluOpen(){
	$("#xianluAdd").dialog("open");
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
	function daoruword(){
	var row = $('#dg').datagrid('getSelected');
		$.ajax({
					url :"fenghuang/selectricheng.do?xianluid="+row.xianid,
					data :row.xianid,
					dataType : "json",
					success : function(data) {
					if(data.rows.length!=0){
					$.messager.alert("发送失败", " 该线路已设定日程!", "error");
					}else{
					window.open('uploadXingcheng.do?xianid='+row.xianid,'上传文档','height=400,width=480,top=200,left=200,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
					}
					
					},
					error : function() {
						
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
	function newricheng(){
		var row = $("#dg").datagrid("getSelected");
		$.ajax({
					url :"fenghuang/selectricheng.do?xianluid="+row.xianid,
					data :row.xianid,
					dataType : "json",
					success : function(data) {
					if(data.rows.length!=0){
					$.messager.alert("发送失败", " 该团已设定行程!", "error");
					}else{
					 	$.messager.confirm('提示', '系统 会根据行程天数生成新的日程，是否继续?', function(r){
							if (r){
					$.ajax({
					url :"fenghuang/shengchengricheng.do?xianid="+row.xianid+"&numberday="+row.tianshu,
					data :row.xianid,
					dataType : "json",
					success : function(data) {
					$.messager.alert("消息", "生成线路日程成功!", "info");
					}
					
					});
					
								   }
						});
					
					}
					
					},
					error : function() {
						
					}
				});
	}
	
	
	
	</script>
  </body>
</html>
