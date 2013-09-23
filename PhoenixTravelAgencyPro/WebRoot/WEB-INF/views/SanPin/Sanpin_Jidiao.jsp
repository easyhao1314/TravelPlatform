<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Sanpin_Jidiao.jsp' starting page</title>
    
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
      <div class="easyui-layout" style="width:auto; height: 600px;">
      
		<div data-options="region:'north'" style="height:50px">
			<form id="tuan" action="">
				<table>
					<tr><td><strong>团号：</strong></td><td><span>${param.tuanNo }</span></td><td><strong>团名：</strong></td><td><span>${param.tuanName }</span></td><td><strong>导游：</strong></td><td><span id="daoyou"></span></td></tr>
					
				</table>
			</form>
		</div>
		
		<div data-options="region:'south',split:true" style="height:50px;">
		<a href="javascript:UpdateSanpinstate();" class="easyui-linkbutton" iconCls="icon-ok">正式收客</a>
		</div>

		<div data-options="region:'center',title:'订车订购物店详细信息'" style="padding:10px">
			<table id="gouwurichengdg" class="easyui-datagrid"
		data-options="url:'fenghuang/selectricheng.do?xianluid=${param.xianid }',border:true,singleSelect:true,fit:true,fitColumns:true,pageSize:10"
		pagination="true" >
		
		<thead>
			<tr>
				<th data-options="field:'riid',formatter:days" width="20">日期</th>
				
				<th data-options="field:'cheName'" width="20">车辆名称</th>
				<th data-options="field:'siji'" width="20">司机</th>
				<th data-options="field:'chexinxi'" width="20">车辆信息</th>
				<th data-options="field:'zuoweishu'" width="20">座位数</th>
				<th data-options="field:'chepaihao'" width="20">牌照号</th>
				<th data-options="field:'sidao'" width="20">司导</th>
				<th data-options="field:'gongying'" width="20">供应商</th>
				<th data-options="field:'jiage'" width="20">车价格</th>
				
				<th data-options="field:'gname'" width="20">购物店名称</th>
				<th data-options="field:'glianxiren'" width="20">联系人</th>
				<th data-options="field:'gdizhi'" width="20">地址</th>
				<th data-options="field:'gshouji'" width="20">手机</th>
				<th data-options="field:'gemail'" width="20">Email</th>
				<th data-options="field:'gbz'" width="20">备注</th>
				
				
			</tr>
		</thead>
		</table>
		</div>
		
	</div>

<script type="text/javascript">
 function loadricheng(){
 	
 }
 function UpdateSanpinstate(){
 	$.ajax({
					url :"fenghuang/upsanpin.do?tuanNo="+'${param.tuanNo}'+"&fabustate="+2,
					data :'${param.tuanNo}',
					dataType : "json",
					success : function(data) {
					$.messager.alert("保存成功", "保存成功!", "info");
					},
					error : function() {
						
					}
				});
 }
 var day=0;
 function days(val,row){
		day++;
		return "第"+day+"天";
	}
 function loadoperate(){
 	var url = "fenghuang/Operateinfo.do?tuanNo="+'${param.tuanNo}';
			$.ajax({
   	      		url:url,
   	      		data:'${param.tuanNo}',
   	      		datatype:"json",
   	      		success:function(data){
   	      			document.getElementById("daoyou").innerHTML=data.rows[0].daoyouname;
   	      		},
   	      		error : function() {
						$.messager.alert("修改失败", "服务器请求失败!", "error");
					}
   	      	
   	      	});
 }
 $(document).ready(function() {
 loadoperate();
 });
</script>
  </body>
</html>
