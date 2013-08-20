<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订房任务</title>
    
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
		data-options="url:'fenghuang/dingfangSelect.do?tuanNo=${param.tuanNo}',border:false,singleSelect:true,fit:true,fitColumns:true,onRowContextMenu: caozuoContextMenu"
		pagination="true" toolbar="#dingfangtoolbar">
		<thead>
			<tr>
				<th data-options="field:'tuanNo'" width="20">团号</th>
				<th data-options="field:'ruzhuTime'" width="20">居住时间</th>
				<th data-options="field:'chengshiId'" width="20">居住城市</th>
				<th data-options="field:'jdNo'" width="20">酒店标准</th>
				<th data-options="field:'caozuoqingkuang'" width="20">操作情况</th>
				<th data-options="field:'beizhu'" width="20">备注</th>
				<th data-options="field:''" width="20">操作</th>
			</tr>
		</thead>
	</table>
	<div id="dingfangtoolbar">
	  <a href="javascript:addDingfangOpen()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加订房</a>
	  <a href="javascript:updateDingfang()" class="easyui-linkbutton" iconCls="icon-add" plain="true">修改</a>
	  <a href="javascript:deleteDingfang()" class="easyui-linkbutton" iconCls="icon-cut" plain="true">删除</a>
	</div>
	<div id="updateDingfang" class="easyui-dialog" title="修改订房" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:600px;height:500px;padding:10px;">
	   <form id="updateDingfangForm">
	      <table align="center">
	         <tr>
	            <td><div class="fitem">旅游团号：</td><td><input name="id" class="easyui-validatebox" hidden="true"><input name="tuanNo" class="easyui-validatebox"></div></td> <td><div class="fitem">团名：</td> <td><input name="tuanName" class="easyui-validatebox"></div></td>
	         </tr>
	         <tr>
	            <td><div class="fitem">国家：</td> <td><input name="cfgj" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=7',
					valueField:'dicNo',
					textField:'dicName',
					method:'get',
					panelHeight:'auto'" ></div></td> 
					<td><div class="fitem">城市：</td> <td><input name="chengshiId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
	         </tr>
	         <tr>
	            <td><div class="fitem">星级标准：</td> <td><input name="jdbzNo" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=16',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td> <td><div class="fitem">酒店名称：</td> <td><input id="jiudianId" name="jiudianId"  class="easyui-validatebox"/> <a href="javascript:ZyjiudianSelectLike();" class="easyui-linkbutton" iconCls="icon-ok">查询</a></div></td>
	         </tr>
	         <tr>
	            <td><div class="fitem">入住时间：</td> <td><input name="ruzhutime" class="easyui-datebox"></div></td> <td><div class="fitem">入住天数：</td> <td><input name="ruzhuDay" class="easyui-validatebox"></div></td>
	         </tr>
	           <tr>
	            <td><div class="fitem">支付方式：</td> <td><input name="zhifufangshi" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=33',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td> <td><div class="fitem">请选择卡号：</td> <td><input name="kahao" class="easyui-validatebox"></div></td>
	         </tr>
	           <tr>
	            <td><div class="fitem">货币单位：</td> <td><input name="huobi" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=5',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td> <td><div class="fitem">汇率：</td> <td><input name="huilv" class="easyui-validatebox"></div></td>
	         </tr>
	          <tr>
	            <td><div class="fitem">预计保留日：</td> <td><input name="yudingDay" class="easyui-datebox"></div></td> <td><div class="fitem">操作人：</td> <td><input name="" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=12',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td> 
	         </tr>
	         <tr>
	            <td><div class="fitem">操作情况：</td> <td><input name="caozuoqingkuang" class="easyui-validatebox"></div></td> <td><div class="fitem">总价：</td> <td><input name="zongjia" class="easyui-validatebox"></div></td>
	         </tr>
	         <tr>
	            <td><div class="fitem">备注：</td> <td colspan="3"><input name="beizhu" class="easyui-validatebox"></div></td>
	         </tr>
	         <tr>
                <td colspan="4" align="center"><a href="javascript:saveUpdateDingfang()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
                                <a href="javascript:closedupdateDingfang()" class="easyui-linkbutton" iconCls="icon-undo">取消</a></td>
             </tr>
	      </table>
	   </form>
	   
	  <div class="easyui-panel" title="酒店供应商列表"
		style="height:480px;width: auto;">
		<table id="dgJiudian" class="easyui-datagrid"
			data-options="url:'fenghuang/ZiyuanJiudian.do',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
			pagination="true" toolbar="#currencyDatagridtoolbar">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true,singleSelect:false"></th>				
					<th data-options="field:'chengshiName'" width="80">城市</th>
					<th data-options="field:'name'" width="80">酒店供应商名称</th>
					<th data-options="field:'hezuojibie'" width="80">合作级别</th>
					<th data-options="field:'whr'" width="80">维护人</th>
				<!--	<th data-options="field:'8',formatter:onOperateStyle" width="80">操作</th> -->
				</tr>
			</thead>
		</table>
		</div>
	</div>
	<div id="addDingfang" class="easyui-dialog" title="添加订房" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:600px;height:500px;padding:10px;">
	   <form id="addDingfangForm">
	      <table align="center">
	         <tr>
	            <td><div class="fitem">旅游团号：</td><td><input name="id" class="easyui-validatebox" hidden="true"><input id="tuanNo" name="tuanNo" class="easyui-validatebox"></div></td> <td><div class="fitem">团名：</td> <td><input name="tuanName" class="easyui-validatebox"></div></td>
	         </tr>
	         <tr>
	            <td><div class="fitem">国家：</td> <td><input name="cfgj" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=7',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td> 
					<td><div class="fitem">城市：</td> <td><input name="chengshiId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
	         </tr>
	         <tr>
	            <td><div class="fitem">星级标准：</td> <td><input name="jdbzNo" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=16',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td> <td><div class="fitem">酒店名称：</td> <td><input id="jiudianId" name="jiudianId"  class="easyui-validatebox"/> <a href="javascript:ZyjiudianSelectLike();" class="easyui-linkbutton" iconCls="icon-ok">查询</a></div></td>
	         </tr>
	         <tr>
	            <td><div class="fitem">入住时间：</td> <td><input name="ruzhutime" class="easyui-datebox"></div></td> <td><div class="fitem">入住天数：</td> <td><input name="ruzhuDay" class="easyui-validatebox"></div></td>
	         </tr>
	           <tr>
	            <td><div class="fitem">支付方式：</td> <td><input name="zhifufangshi" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=33',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td> <td><div class="fitem">请选择卡号：</td> <td><input name="kahao" class="easyui-validatebox"></div></td>
	         </tr>
	           <tr>
	            <td><div class="fitem">货币单位：</td> <td><input name="huobi" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=5',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td> <td><div class="fitem">汇率：</td> <td><input name="huilv" class="easyui-validatebox"></div></td>
	         </tr>
	          <tr>
	            <td><div class="fitem">预计保留日：</td> <td><input name="yudingDay" class="easyui-datebox"></div></td> <td><div class="fitem">操作人：</td> <td><input name="" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=12',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td> 
	         </tr>
	         <tr>
	            <td><div class="fitem">操作情况：</td> <td><input name="caozuoqingkuang" class="easyui-validatebox"></div></td> <td><div class="fitem">总价：</td> <td><input name="zongjia" class="easyui-validatebox"></div></td>
	         </tr>
	         <tr>
	            <td><div class="fitem">备注：</td> <td colspan="3"><input name="beizhu" class="easyui-validatebox"></div></td>
	         </tr>
	         <tr>
                <td colspan="4" align="center"><a href="javascript:addDingfang()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
                                <a href="javascript:closedupdateDingfang()" class="easyui-linkbutton" iconCls="icon-undo">取消</a></td>
             </tr>
	      </table>
	   </form>
	   </div>
	<script type="text/javascript">

	function addDingfangOpen(){
	 $("#addDingfang").dialog("open");
	 var tuanNo=${param.tuanNo};
			//准备回显的数据
				var param = {
					"updateTuanNO" :tuanNo
				};
				
				$.ajax({
					url : "fenghuang/DantuanSelectId.do",
					data : param,
					dataType : "json",
					success : function(data) {
		
					   $('#addDingfangForm').form('load',data.rows[0]);
				
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});

	}
	function addDingfang(){
	  $("#addDingfangForm").form('submit', {
				url : "fenghuang/addDingfang.do",				
				onSubmit : function() {
					return $(this).form('validate');
				},
			
				success : function(data) {
				//data 是一个字符串  $.ajax(success:function(data):是一个对象)
					//var result = val('(' + data + ')');//吧字符串转换为对象
				var result = $.parseJSON(data) ;
					if (result.success) {					
					  $("#addDingfang").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
						$("#caozuoliebiaodg").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#caozuoliebiaodg").datagrid('reload');
					}
				}
			});
	  
	}
	function updateDingfang(){
	   $("#updateDingfang").dialog("open");
	   var row = $('#caozuoliebiaodg').datagrid('getSelected');
	   $('#updateDingfangForm').form('load',row);
	}
	
	function saveUpdateDingfang(){
	$("#updateDingfangForm").form('submit', {
				url : "fenghuang/updateDingfang.do",				
				onSubmit : function() {
					return $(this).form('validate');
				},
			
				success : function(data) {
				//data 是一个字符串  $.ajax(success:function(data):是一个对象)
					//var result = val('(' + data + ')');//吧字符串转换为对象
				var result = $.parseJSON(data) ;
					if (result.success) {					
					  $("#updateDingfang").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
						$("#caozuoliebiaodg").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#caozuoliebiaodg").datagrid('reload');
					}
				}
			});
	  
	}
     function closedupdateDingfang(){
         $("#updateDingfang").dialog('close');
     }
     
   //模糊查询
		function ZyjiudianSelectLike(){
		var opts = $('#dgJiudian').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				name: $("#jiudianId").val(),
				page:  opts.pageNumber ,
				rows:  opts.pageSize
			};
				$.ajax({
					url : 'fenghuang/ZyjiudianSelectLike.do' ,
					data :  param,
					type : 'POST' ,
					dataType : 'json' ,
					success : function(data){
						$('#dgJiudian').datagrid('loadData',data);
					}
				});
		}
		
		function deleteDingfang(){
		 var row = $('#caozuoliebiaodg').datagrid('getSelected');
		 if(row){
		     var param={
		      id:row.id
		      };
		      
		      if(confirm("确认要删除吗？")){
		      $.ajax({
		         url:'fenghuang/deleteDingfang.do',
		         data:param,
		         type:'post',
		         dataType:'json',
		         success:function(data){
		         if (data.success) {
						  $.messager.alert("删除成功", "删除成功！", "info");
		                  $("#caozuoliebiaodg").datagrid('reload');
						} else {
							$.messager.alert("删除失败", "删除失败!", "error");
			              $("#caozuoliebiaodg").datagrid('reload');
						}
		         }
		      });
		      }
		 }
		 
		}
 
	</script>
  </body>
</html>
