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
    <div id="p" class="easyui-panel" title="需要审批的客户信息" style="width:auto;height:auto;padding:10px;">
		<table id="caozuodg" class="easyui-datagrid"
		data-options="url:'fenghuang/shenpikehu.do?shenpitype=${param.shenpitype}&tuanNo=${param.atuanNo}&abmid=${param.abmid}',singleSelect:true,fitColumns:true,pageSize:10"
		 toolbar="#caozuotb">
		<thead>
			<tr>
				<th data-options="field:'bmid'" width="20">客户编号</th>
				<th data-options="field:'kehuid'" width="20">客户编号</th>
				<th data-options="field:'kehuname'" width="20">姓名</th>
				<th data-options="field:'sex', formatter:function(value,row){
	var sexinfo = '女';
	if(row.sex=15){
		sexinfo='男';
	}
return sexinfo;
}" width="20">性别</th>
				<th data-options="field:'zhengjianhao'" width="20">证件号</th>
				<th data-options="field:'baomingsp',formatter:function(value,row){
	var baomingsp = '未提交';
	if(row.baomingsp==1){
		baomingsp='等待审核';
	}
	if(row.baomingsp==2){
		baomingsp='审核通过';
	}
	if(row.baomingsp==3){
		baomingsp='审核失败';
	}
return baomingsp;
}" width="20">报名审批</th>
				<th data-options="field:'baomingsl'" width="20">报名受理</th>
				<th data-options="field:'yajinqueren'" width="20">押金确认</th>
				<th data-options="field:'chupiaoqueren'" width="20">出票确认</th>
				<th data-options="field:'chutuanqueren'" width="20">出团确认</th>
				<th data-options="field:'tuituanshenpi',formatter:function(value,row){
	var tuituanshenpi = '未提交';
	if(row.tuituanshenpi==1){
		tuituanshenpi='等待审核';
	}
	if(row.tuituanshenpi==2){
		tuituanshenpi='审核通过';
	}
	if(row.tuituanshenpi==3){
		tuituanshenpi='审核失败';
	}
return tuituanshenpi;
}" width="20">退团审批</th>
				<th data-options="field:'zhuantuanshenpi',formatter:function(value,row){
	var zhuantuanshenpi = '未提交';
	if(row.zhuantuanshenpi==1){
		zhuantuanshenpi='等待审核';
	}
	if(row.zhuantuanshenpi==2){
		zhuantuanshenpi='审核通过';
	}
	if(row.zhuantuanshenpi==3){
		zhuantuanshenpi='审核失败';
	}
return zhuantuanshenpi;
}" width="20">转团审批</th>
				<th data-options="field:'beizhu',formatter:shenpicaozuo" width="20">操作</th>
		</thead>
	</table>
	</div>	
  <script type="text/javascript">
 function shenpicaozuo(){
  	return '<a href="javascript:updateshenpi(2);" style="text-decoration:none; width:auto;">通过</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:updateshenpi(3);" style="text-decoration:none; width:auto;">驳回</a>';
  	}
  	function updateshenpi(jieguo){
  		
  		var url = "fenghuang/updatebaomingshenpi.do?bmid="+'${param.abmid}';
  		if('${param.shenpitype}'==2){url+="&zhuantuan="+jieguo;}
  		if('${param.shenpitype}'==1){url+="&tuituan="+jieguo;}
  		if('${param.shenpitype}'==3){url+="&baoming="+jieguo;}
  		
  		$.ajax({
  			url : url,
					data : '${param.abmid}',
					dataType : "json",
					success : function(data) {
						//$.ajax({
			
					//			url : "fenghuang/updateApproval.do",
					//			data : 1,
					//			dataType : "json",
						//		success : function(data) {

						//		},
						//		error : function() {
						//		$.messager.alert("查询失败", "服务器请求失败!", "error");
						//		}
						//			});
										$("#caozuodg").datagrid('reload');
						
					},
					error : function() {
						$.messager.alert("失败", "服务器请求失败!", "error");
					}
  		});  		
  	}
  	
  	
  $(document).ready(function() {
	shenpituanload();
	
	
		}); 
  	function shenpituanload(){
  	//请求审批明细Ajax
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
				//请求团明细Ajax
				var datakehu = {
					"shenpitype" : '${param.shenpitype}',
					"approvalNo" : '${param.atuanNo}'
				};
		$.ajax({
			
					url : "fenghuang/Sanpinliebiao.do?",
					data : datakehu,
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
