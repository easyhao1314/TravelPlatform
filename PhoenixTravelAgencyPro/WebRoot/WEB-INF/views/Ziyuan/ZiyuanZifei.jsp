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
	<div class="easyui-panel" title="自费节目查询"
		style="height:80px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<form id="zifeiForm">
		<table>
	
			<tr>
			<td><div class="fitem">
						<label>名称:</label>
				</td>
				<td><input id="name" name="name" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>所属城市:</label>
				</td>
				<td><input id="chengshiId" name="chengshiId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
				<td><div class="fitem">
						<label>描述:</label>
				</td>
				<td><input id="miaoshu" name="miaoshu" class="easyui-validatebox">
					</div>
				</td>
				<td>
					<a href="javascript:zifeiSelectLike();" 
								class="easyui-linkbutton" iconCls="icon-ok">查询</a>
						<a href="javascript:void(0)" class="easyui-linkbutton"
							iconCls="icon-undo" onclick="$('#zifeiForm').form('clear')">重置</a>
				</td>
			</tr>
		</table>
		</form>
	</div>
		<div class="easyui-panel" title="自费节目列表"
		style="height:480px;width: auto;">
		<table id="dgZifei" class="easyui-datagrid"
			data-options="url:'fenghuang/zifeiSelect.do',border:false,singleSelect:true,fit:true,fitColumns:true"
			pagination="true" toolbar="#currencyDatagridtoolbar">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<!--<th data-options="field:'id'" width="80">编号</th>-->
					<th data-options="field:'name'" width="80">自费节目名称</th>
					<th data-options="field:'feiyong'" width="80">自费节目费用</th>
					<th data-options="field:'bizhong'" width="80">币种</th>
					<th data-options="field:'chengshi'" width="80">城市</th>
					<th data-options="field:'miaoshu'" width="80">自费节目描述</th>
					
				</tr>
			</thead>
		</table>
		<div id="currencyDatagridtoolbar">
		     <a href="javascript:addZifei();" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>  
		     <a href="javascript:zifeiSelectId();" class="easyui-linkbutton" iconCls="icon-save"  plain="true">修改</a>
		     <a href="javascript:zifeiDelete();" class="easyui-linkbutton" iconCls="icon-cut" plain="true">删除</a>  
		</div>
	</div>
	
	<div id="addZifei" class="easyui-dialog" title="自费节目新增"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:340px;padding:10px;">
		<form id="addZifeiForm" method="post">
			<table align="center">
				<tr>
<td><div class="fitem"><label>自费节目编号:</label></td><td>--系统自动生成--</div></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>自费节目名称：</label></td><td><input name="name" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>自费节目费用：</label></td><td><input name="feiyong" class="easyui-numberspinner" min="1" max="999999" style="width:133px;"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>所属城市：</label></td><td><input name="chengshiId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
<td><div class="fitem"><label>币种：</label></td><td><input name="bizhongId"  class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=5',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
</tr>
<tr>
<td><div class="fitem"><label>开放时间起：</label></td><td><input name="kftimeqi" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>开放时间止：</label></td><td><input  name="kftimezhi" class="easyui-validatebox"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>时间是否可变：</label></td><td><input name="timekb" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=9',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
<td><div class="fitem"><label>地接安排时间：</label></td><td><input name="djaptime" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=9',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
</tr>
<tr>
<td><div class="fitem"><label>自费节目描述：</label></td><td colspan="3"> <input name="miaoshu" class="easyui-validatebox" size="70"></div></td>
</tr>
<tr>
<tr><td colspan="4" align="center"><a href="javascript:SaveZifei();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
<a  class="easyui-linkbutton" iconCls="icon-undo" onclick="$('#addZifeiForm').form('clear')">重置</a></td>
</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
	<div id="updateZifei" class="easyui-dialog" title="自费节目修改"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:340px;padding:10px;">
		<form id="updateZifeiForm" method="post">
			<table align="center">
				
<tr>
<td>
<input id="id" name="id" class="easyui-validatebox" hidden="true">
<div class="fitem"><label>自费节目名称：</label></td><td><input name="name" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>自费节目费用：</label></td><td><input name="feiyong" class="easyui-numberspinner" min="1" max="999999" style="width:133px;"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>所属城市：</label></td><td><input name="chengshiId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
<td><div class="fitem"><label>币种：</label></td><td><input name="bizhongId"  class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=5',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
</tr>
<tr>
<td><div class="fitem"><label>开放时间起：</label></td><td><input name="kftimeqi" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>开放时间止：</label></td><td><input  name="kftimezhi" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>时间是否可变：</label></td><td><input name="timekb" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=9',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
<td><div class="fitem"><label>地接安排时间：</label></td><td><input name="djaptime" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=9',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
</tr>
<tr>
<td><div class="fitem"><label>自费节目描述：</label></td><td colspan="3"> <input name="miaoshu" class="easyui-validatebox" size="70"></div></td>
<td></td>
</tr>
<tr>
<tr><td colspan="4" align="center"><a href="javascript:zifeiUpdate();" class="easyui-linkbutton" iconCls="icon-ok">保存</a> 
<a href="javascript:closedupdateZifei()"  class="easyui-linkbutton" iconCls="icon-undo" >取消</a></td>
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
		function zifeiSelectLike(){
		var opts = $('#dgZifei').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				name: $("#name").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				chengshiId: $("#chengshiId").combobox('getValue'),
				miaoshu : $("#miaoshu").val(),
				page:  opts.pageNumber ,
				rows:  opts.pageSize
			};
		
				$.ajax({
					url : 'fenghuang/zifeiSelect.do' ,
					data :  param,
					type : 'POST' ,
					dataType : 'json' ,
					success : function(data){
						$('#dgZifei').datagrid('loadData',data);
					}
				});
		}
		

	   //新增
		function addZifei() {
			$("#addZifei").dialog("open");
			$("#addZifeiForm").form("clear");
		}
         
		function SaveZifei() {
			$('#addZifeiForm').form('submit', {
				url : 'fenghuang/zifeiAdd.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
					$('#addZifei').dialog('close');
						$.messager.alert("保存成功", "保存成功！", "info");
						 $('#dgZifei').datagrid('reload'); 
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#dgZifei').datagrid('reload');
					}
				}
			});
		}
			//关闭
		function closeEditDic() {
			$('#addZifei').dialog('close');
		} 
	//删除操作要执行的方法
	function zifeiDelete(){
	  var row = $("#dgZifei").datagrid("getSelected");
			if (row) {
				var param = {
					"id" :  row.id
				};
			 if (confirm("确认要删除名称为 “ "+row.name+" ”的供应商吗？")) {
				$.ajax({
					url : "fenghuang/zifeiDelete.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("删除成功", "删除成功！", "info");
							$("#dgZifei").datagrid('reload');
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
		function zifeiSelectId() {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window 
			$("#updateZifei").dialog("open");
			//准备回显的数据
			var row = $("#dgZifei").datagrid("getSelected");
			//alert(row.tuanNO);
		
			if(row){
				var param = {
					"id" : row.id
				};
				
				$.ajax({
					url : "fenghuang/zifeiSelectId.do",
					data : param,
					dataType : "json",
					success : function(data) {
		
					   $('#updateZifeiForm').form('load',data.rows[0]);
				
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
		}
		}
		 //修改
		function zifeiUpdate() {
			$("#updateZifeiForm").form('submit', {
				url : 'fenghuang/zifeiUpdate.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {//data 是一个字符串  $.ajax(success:function(data):是一个对象)
					console.info(data);
					//var result = val('(' + data + ')');//吧字符串转换为对象
					var result = $.parseJSON(data) ;

					if (result.success) {
					  $("#updateZifei").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
						$("#dgZifei").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#dgZifei").datagrid('reload');
					}
				}
			});
		}
		
		//关闭
		function closedupdateZifei() {
			$('#updateZifei').dialog('close');
		}
	
	</script>



</body>
</html>
