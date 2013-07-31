<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>审批团明细页面</title>
    
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
  <div id="p" class="easyui-panel" title="提请审批情况" style="width:auto;height:auto;padding:10px;">
<form id="tiqingshenpiFrom" action="">
	<table>
			<tr>
				<td><div class="fitem">
						<strong><label>提请人:</label></strong>
				</td>
				<td><strong><input name="shenqingren" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>提请时间:</label></strong>
				</td>
				<td><strong><input name="shenqingDate" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>事物:</label></strong>
				</td>
				<td><strong><input name="shiwu" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>备注:</label></strong>
						
				</td>
				<td><strong><input name="beizhu" class="easyui-validatebox"></strong>
					
				</td>
			</tr>
	</table>
</form>
</div>
  
  
  <div id="p" class="easyui-panel" title="团队基本信息" style="width:auto;height:auto;padding:10px;">
<form id="tuanduituituanjiben" action="">
	<table>
			<tr>
				<td><div class="fitem">
						<strong><label>团号:</label></strong>
				</td>
				<td><strong><input name="tuanNo" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>团队名称:</label></strong>
				</td>
				<td><strong><input name="tuanName" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>收客状态:</label></strong>
				</td>
				<td><strong><input id="shoukestate" name="shoukestate" class="easyui-validatebox"></strong>
					
				</td>
			</tr>
		<tr>
				<td><div class="fitem">
						<strong><label>出团日期:</label></strong>
				</td>
				<td><strong><input name="groupdate" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>同行价:</label></strong>
				</td>
				<td><strong><input name="tonghang" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>自备签价:</label></strong>
				</td>
				<td><strong><input name="zibeiqianjia" class="easyui-validatebox"></strong>
					
				</td>
			</tr>
			<tr>
				<td><div class="fitem">
						<strong><label>预收人数:</label></strong>
				</td>
				<td><strong><input name="numbermaster" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>团队报名人数:</label></strong>
				</td>
				<td><strong><input name="ycbjNo" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>确认人数:</label></strong>
				</td>
				<td><strong><input name="tdjb" class="easyui-validatebox"></strong>
					
				</td>
			</tr>
			<tr>
				<td><div class="fitem">
						<strong><label>备注:</label></strong>
				</td>
				<td colspan="5"><strong><input name="tsDesc" class="easyui-validatebox"></strong>
				</td>
			</tr>
	</table>
</form>
</div>
    	
  <script type="text/javascript">
  $(document).ready(function() {
	shenpituanload();
	
	
		}); 
  	function shenpituanload(){
  		$.ajax({
					url : "fenghuang/Approvalinfo.do?approvalNo="+'${param.aNo}',
					data : '${param.aNo}',
					dataType : "json",
					success : function(data) {
					$('#tiqingshenpiFrom').form('load',data.rows[0]);
					//$('#mingxiForm').form('load',data.rows[0]);

					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
		$.ajax({
					url : "fenghuang/Sanpinliebiao.do?tuanNo="+'${param.atuanNo}',
					data : '${param.atuanNo}',
					dataType : "json",
					success : function(data) {
					$('#tuanduituituanjiben').form('load',data.rows[0]);
					//$('#mingxiForm').form('load',data.rows[0]);
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
				
  	}
  </script>
  </body>
</html>
