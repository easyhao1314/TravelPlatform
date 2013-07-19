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
	<div class="easyui-panel" title="邀请函成本信息查询"
		style="height:80px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<form id="yaoqingForm">
		<table>
			<tr>
				<td><div class="fitem">
						<label>国度:</label>
				</td>
				<td><input id="guoduid" name="guoduid" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
				<td><div class="fitem">
						<label>描述:</label>
				</td>
				<td><input id="miaoshu" name="miaoshu" class="easyui-validatebox">
					</div>
				</td>
				<td>	<a href="javascript:YaoqingSelectLike();" 
								class="easyui-linkbutton" iconCls="icon-ok">查询</a>
						<a href="javascript:void(0)" class="easyui-linkbutton"
							iconCls="icon-undo" onclick="$('#yaoqingForm').form('clear')">重置</a>
				</td>
			</tr>
		</table>
		</form>
	</div>

		<div class="easyui-panel" title="邀请函成本信息列表"
		style="height:480px;width: auto;">
		<table id="dg" class="easyui-datagrid"
			data-options="url:'fenghuang/yaoqinghanSelect.do',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
			pagination="true" toolbar="#currencyDatagridtoolbar">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true,singleSelect:false"></th>
					<th data-options="field:'guodu'" width="80">国度</th>
					<th data-options="field:'chengben'" width="80">成本</th>
					<th data-options="field:'bizhong'" width="80">币种</th>
					<th data-options="field:'shifou'" width="80">使用否</th>
					<th data-options="field:'miaoshu'" width="80">国度描述</th>

				</tr>
			</thead>
		</table>
		<div id="currencyDatagridtoolbar">
		     <a href="javascript:addYaoqinghan();" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>  
		     <a href="javascript:YaoqingSelectId();" class="easyui-linkbutton" iconCls="icon-save"  plain="true">修改</a>
		     <a href="javascript:YaoqingDelete();" class="easyui-linkbutton" iconCls="icon-cut" plain="true">删除</a>  
		</div>
	</div>
<div id="addYaoqinghan" class="easyui-dialog" title="邀请函成本信息新增"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:180px;padding:10px;">
		<form id="addForm" method="post">
			<table align="center">
				<tr>
<td><div class="fitem"><label>编号:</label></td><td>--系统自动生成--</div></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>国度：</label></td><td><input name="guoduid" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
<td><label>币种：</label></td><td><input name="bizhongId"  class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=5',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
</tr>
<tr>
<td><div class="fitem"><label>成本：</label></td><td><input name="chengben"  class="easyui-numberspinner" min="1" max="999999" ></div></td>
<td><div class="fitem"><label>使用否：</label></td><td><input name="shiyongid"  class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=9',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
</tr>
<tr>
<td><div class="fitem"><label>国度描述：</label></td><td colspan="3"><input name="miaoshu" class="easyui-validatebox" required="true" size="70"></div></td>

</tr>

<tr><td colspan="4" align="center"><a href="javascript:SaveYaoqinghan();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" onclick="$('#addForm').form('clear')">重置</a></td>
</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>

<div id="updateYaoqinghan" class="easyui-dialog" title="邀请函成本信息修改"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:180px;padding:10px;">
		<form id="updateForm" method="post">
			<table align="center">
			
<tr>
<td>
<input id="id" name="id" class="easyui-validatebox" hidden="true">
<div class="fitem"><label>国度：</label></td><td><input name="guoduid" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
<td><label>币种：</label></td><td><input name="bizhongId"  class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=5',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
</tr>
<tr>
<td><div class="fitem"><label>成本：</label></td><td><input name="chengben"  class="easyui-numberspinner" min="1" max="999999" ></div></td>
<td><div class="fitem"><label>使用否：</label></td><td><input name="shiyongid"  class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=9',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
</tr>
<tr>
<td><div class="fitem"><label>国度描述：</label></td><td colspan="3"><input name="miaoshu" class="easyui-validatebox" required="true" size="70"></div></td>

</tr>
<tr>
<tr><td colspan="4" align="center"><a href="javascript:YaoqingUpdate();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
<a  class="easyui-linkbutton" iconCls="icon-undo" onclick="$('#updateForm').form('clear')">重置</a></td>
</tr>

			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>



	<script type="text/javascript">
   
    //这个方法是格式化是否可用列的，0：为不使用，1：为使用
	function onIsUesStyle(val,row){
	  if(val =='1'){
	      return "使用";
	  }else{
	     return "不使用";
	  }
	  
	}
	/**
      * 查询按钮
    */
		function YaoqingSelectLike(){
		var opts = $('#dg').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				guoduid: $("#guoduid").combobox('getValue'),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				miaoshu: $("#miaoshu").val() ,
				page:  opts.pageNumber ,
				rows:  opts.pageSize
			};
		
				$.ajax({
					url : 'fenghuang/yaoqinghanSelect.do' ,
					data :  param,
					type : 'POST' ,
					dataType : 'json' ,
					success : function(data){
						$('#dg').datagrid('loadData',data);
					}
				});
		}
		


	//这个方法用来点击新增按钮
	 //新增
		function addYaoqinghan() {
			$("#addYaoqinghan").dialog("open");
			$("#addForm").form("clear");
		}
         
		function SaveYaoqinghan() {
			$('#addForm').form('submit', {
				url : 'fenghuang/yaoqingAdd.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
					$('#addYaoqinghan').dialog('close');
						$.messager.alert("保存成功", "保存成功！", "info");
						 $('#dg').datagrid('reload'); 
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#dg').datagrid('reload');
					}
				}
			});
		}
			//关闭
		function closeEditDic() {
			$('#addYaoqinghan').dialog('close');
		} 
	//删除操作要执行的方法
	function YaoqingDelete(){
	  var row = $("#dg").datagrid("getSelected");
			if (row) {
				var param = {
					"id" :  row.id
				};
		 if (confirm("确认要删除名称为 “ "+row.guodu+" ”的邀请函吗？")) {
				$.ajax({
					url : "fenghuang/yaoqingDelete.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("删除成功", "删除成功！", "info");
							$("#dg").datagrid('reload');
						} else {
							$.messager.alert("删除失败", "删除失败!", "error");
						}
					},
					error : function() {
						$.messager.alert("删除失败", "服务器请求失败!", "error");
					}
				});
			  }
			}
	}
	//按id查询
		function YaoqingSelectId() {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window 
			$("#updateYaoqinghan").dialog("open");
			//准备回显的数据
			var row = $("#dg").datagrid("getSelected");
			//alert(row.tuanNO);
		
			if(row){
				var param = {
					"id" : row.id
				};
				
				$.ajax({
					url : "fenghuang/yaoqingSelectId.do",
					data : param,
					dataType : "json",
					success : function(data) {
		
					   $('#updateForm').form('load',data.rows[0]);
				
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
		}
		}
		 //修改
		function YaoqingUpdate() {
			$("#updateForm").form('submit', {
				url : 'fenghuang/yaoqingUpdate.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {//data 是一个字符串  $.ajax(success:function(data):是一个对象)
					console.info(data);
					//var result = val('(' + data + ')');//吧字符串转换为对象
					var result = $.parseJSON(data) ;

					if (result.success) {
					  $("#updateYaoqinghan").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
						$("#dg").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#dg").datagrid('reload');
					}
				}
			});
		}
		
		//关闭
		function closedSearch() {
			$('#updateYaoqinghan').dialog('close');
		}
	
	
	</script>



</body>
</html>
