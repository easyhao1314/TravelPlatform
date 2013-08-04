<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>报名确认受理 </title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  
  <body>
  <div id="p" class="easyui-panel" title="团队基本信息" style="width:auto;height:auto;padding:10px;">
<form id="jibenForm" action="">
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
				<td><strong><input name="shoukestate" class="easyui-validatebox"></strong>
					
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
<!-- ----------------------------------------------------基本信息END----------------------------------------------------------------- -->
	<div id="jibentb">
		<a href="javascript:addsanpinkehu();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">新增</a>&nbsp;&nbsp;|  <a
			href="javascript:deletesanpinkehu();" class="easyui-linkbutton"
			iconCls="icon-cut" plain="true">删除</a>&nbsp;&nbsp;|
		<a href="javascript:getChanges();" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">保存修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	</div>
	<div id="caozuotb">
	<a id="zhuantuan" onclick="sanpintuituan(this);"  class="easyui-linkbutton"
			iconCls="icon-remove" plain="true">转团审批</a>&nbsp;&nbsp;|
	<a id="tuituan" onclick="sanpintuituan(this)" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true">退团审批</a>&nbsp;&nbsp;|
	<a id="baoming" onclick="sanpintuituan(this)" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true">报名审批</a>&nbsp;&nbsp;|
	<a href="javascript:Select();" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true">报名确认</a>&nbsp;&nbsp;|
	<a href="javascript:Select();" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true">取消确认</a>
	
	</div>
	
<div class="easyui-tabs" style="width:auto;height:auto">
<div title="团队资料维护" style="padding:10px">
<table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/customInfoList.do?type=33&tuanNo=${param.tuanNo}',singleSelect:false,fitColumns:true, onClickRow: onClickRow,pageSize:10"
		pagination="true" toolbar="#jibentb">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'id'" width="80">客户编号</th>
				<th data-options="field:'name',editor:'text'" width="80">姓名</th>
				<th data-options="field:'sex',formatter:function(value,row){

return row.sexName;
},
editor:{
type:'combobox',     
options:{
valueField: 'sex',                             
textField: 'sexName', 
data: [{
			sexName: '男',
			sex: '15'
		},
		{
			sexName: '女',
			sex: '16'
		}],
		panelHeight:'auto',
		required:true,
		editable:false,
		onChange:function(newValue, oldValue){
			
		}
}
}" width="20" >性别</th>
				<th data-options="field:'sfzn',editor:'text'" width="80">证件号</th>
				<th data-options="field:'telePhone',editor:'text'" width="80">联系电话</th>
				<th data-options="field:'bz',editor:'text'" width="80">备注</th>
			</tr>
		</thead>
	</table>

</div>
<div title="操作进展" style="padding:10px" onclick="shuaxincaozuodg()">
<table id="caozuodg" class="easyui-datagrid"
		data-options="url:'fenghuang/baomingshenpiinfo.do?type=33&tuanNo=${param.tuanNo}',singleSelect:true,fitColumns:true,pageSize:10"
		pagination="true" toolbar="#caozuotb">
		<thead>
			<tr>
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
				<th data-options="field:'beizhu'" width="20">备注</th>
		</thead>
	</table>

</div>
<div title="财务情况" style="padding:10px">
<ul class="easyui-tree" data-options=""></ul>
</div>
</div>

<!-- ----------------------------------------------------TABS 选项卡 END----------------------------------------------------------------- --> 

	
	
	<!-- 填充fromLoad -->
	<script type="text/javascript">
	contentType:"application/x-www-form-urlencoded; charset=UTF-8";
$(document).ready(function() {
	load();
}); 
function load(){
var url = "fenghuang/Sanpinliebiao.do?tuanNo="+'<%=request.getParameter("tuanNo") %>';
	$.ajax({
					url :url ,
					data : '<%=request.getParameter("tuanNo") %>',
					dataType : "json",
					success : function(data) {
					$('#jibenForm').form('load',data.rows[0]);

					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
}
	</script>
	<script type="text/javascript">
	function shuaxincaozuodg(){
		$("#caozuodg").datagrid('reload');
	}
		var editIndex = undefined;
		function endEditing() {
			if (editIndex == undefined) {
				return true;
			}
			if ($('#dg').datagrid('validateRow', editIndex)) {
			    var ed = $('#dg').datagrid('getEditor', {index:editIndex,field:'sex'});
				var sexName = $(ed.target).combobox('getText');
				$('#dg').datagrid('getRows')[editIndex]['sexName'] = sexName;
				$('#dg').datagrid('endEdit', editIndex);
				$('#dg').datagrid('unselectRow', editIndex);
				//alert($('#dg').datagrid('getRows')[editIndex]['sex']);
				editIndex = undefined;
				return true;
			} else {
				return false;
			}
		}
		function addsanpinkehu() {
			$("#dg").datagrid("insertRow", {
				index : 0,
				row : {
					tuanNo : '${param.tuanNo}',
					type:33
				}
			});
			editIndex = undefined;
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
		
		//时间格式化转换
		function ChangeDateFormat(cellval) {
    try {
        var date = new Date(parseInt(cellval.replace("/Date(", "").replace(")/", ""), 10));
        var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
        var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
        return date.getFullYear() + "-" + month + "-" + currentDate;
    } catch (e) {
        return "";
    }
}
		function getChanges() {
			$('#dg').datagrid('endEdit', editIndex);
			var rows = $("#dg").datagrid("getChanges");
			
				var param = {
					"updateRows" : $.toJSON(rows)
				};
				$.ajax({
					url : "fenghuang/updateCustom.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("保存成功", "保存成功！", "info");
							$("#dg").datagrid('reload');
							$("#caozuodg").datagrid('reload');
							editIndex = undefined;
						} else {
							$.messager.alert("保存失败", "保存失败!", "error");
						}
					},
					error : function() {
						$.messager.alert("保存失败", "服务器请求失败!", "error");
					}
				});
			}

		


		

		function deletesanpinkehu() {
		var row = $("#dg").datagrid("getSelected");
		var url="fenghuang/deleteCustomInfo.do?deleteRow="+row.id;
		$.ajax({
					url :url ,
					data : row.id,
					dataType : "json",
					success : function(data) {
					$.messager.alert("删除成功", "删除成功", "info");
					$("#dg").datagrid("reload");
					$("#caozuodg").datagrid('reload');

					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
		}
		function closeEditDic() {
			$('#editDic').dialog('close');
		} 

		//
		function searchDiJi() {
			$("#searchDic").dialog("open");
			$("#searchForm").form("clear");
		}


		function closedSearch() {
			$('#searchDic').dialog('close');
		}
		
		
	</script>
  	<script type="text/javascript">
  	function sanpintuituan(object){
			var row = $("#caozuodg").datagrid("getSelected");
			if(row==null){
			$.messager.alert('警告','请选中一行','warning');
			return;
			}
			var approvaltype=null;
			if(object.id=='tuituan'){
				approvaltype=1;
				if(row.tuituanshenpi==1){
				 $.messager.alert('警告','客户:'+row.kehuname+'   已在退团审核中，请耐心等待!','warning');
				return;
				}
			}
			if(object.id=='zhuantuan'){
				approvaltype=2;
				if(row.zhuantuanshenpi==1){
				  $.messager.alert('警告','客户:'+row.kehuname+'   已在转团审核中，请耐心等待!','warning');
				return;
				}
			}
			if(object.id=='baoming'){
				approvaltype=3;
				if(row.baomingsp==1){
				  $.messager.alert('警告','客户:'+row.kehuname+'   已在报名审核中，请耐心等待!','warning');
				return;
				}
			}
			
			var param = {
					"shiwu" : "用户角色"+"提交",
					"shenqingren" : 1,
					"shenpiren" : 1,
					"beizhu" : "客人名单: "+row.kehuname,
					"approvaltype" : approvaltype,
					"tuanNo" : '${param.tuanNo}',
					"approvalStatus" : 1,
					"bmid" : row.bmid
					
				};
			$.ajax({
					url : "fenghuang/addApproval.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("成功", "提交审批成功！", "info");
							$("#dg").datagrid('reload');
							$("#caozuodg").datagrid('reload');
							editIndex = undefined;
						} else {
							$.messager.alert("错误", "提交审批失败!", "error");
						}
					},
					error : function() {
						$.messager.alert("失败", "服务器请求失败!", "error");
					}
				});
			
		}
  	</script>
  </body>
</html>
