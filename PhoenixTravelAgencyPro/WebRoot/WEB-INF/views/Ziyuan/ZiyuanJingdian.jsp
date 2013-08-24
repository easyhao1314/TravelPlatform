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
	<div class="easyui-panel" title="景点查询"
		style="height:85px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<form id="jingdianForm">
		<table>
			<tr>				
				<td><div class="fitem">
						<label>景点名称:</label>
				</td>
				<td><input id="name" name="name" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>所属城市:</label>
				</td>
				<td><input id="chengsiId" name="chengsiId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
				<td><div class="fitem">
						<label>价格:</label>
				</td>
				<td><input id="jiage" name="jiage" class="easyui-numberspinner" min="1" max="999999" style="width:133px;"></div></td>
				<td colspan="3">
					<a href="javascript:jingdianSelectLike();" 
								class="easyui-linkbutton" iconCls="icon-ok">查询</a>
						<a href="javascript:void(0)" class="easyui-linkbutton"
							iconCls="icon-undo" onclick="$('#jingdianForm').form('clear')">重置</a></td>
			</tr>
		</table>
		</form>
	</div>

		<div class="easyui-panel" title="景点列表"
		style="height:480px;width: auto;">
		<table id="dgJingdian" class="easyui-datagrid"
			data-options="url:'fenghuang/JingdianSelect.do',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
			pagination="true" toolbar="#currencyDatagridtoolbar">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<!--<th data-options="field:'id'" width="80">编号</th>-->
					<th data-options="field:'name'" width="80">景点名称</th>
					<th data-options="field:'name2'" width="80">景点英文名称</th>
					<th data-options="field:'chengsi'" width="80">所属城市</th>
					<th data-options="field:'jiage'" width="80">门票价格</th>
					<th data-options="field:'bizong'" width="80">币种</th>
					<th data-options="field:'sf'" width="80">是否订车默认景点</th>
					
				</tr>
			</thead>
		</table>
		<div id="currencyDatagridtoolbar">
		     <a href="javascript:addJingdian();" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>  
		     <a href="javascript:jingdianSelectId();" class="easyui-linkbutton" iconCls="icon-save"  plain="true">修改</a>
		     <a href="javascript:jingdianDelete();" class="easyui-linkbutton" iconCls="icon-cut" plain="true">删除</a>
		</div>
	</div>
<div id="addJingdian" class="easyui-dialog" title="景点新增"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:800px;height:300px;padding:10px;">
		<form id="addJingdianForm" method="post">
			<table align="center">
				<tr>
<td><div class="fitem"><label>景点编号:</label></td><td>--系统自动生成--</div></td>
<td><div class="fitem"><label>景点名称:</label></td><td><input name="name" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>景点英文名称:</label></td><td><input name="name2" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>所属城市：</label></td><td><input name="chengsiId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
<td><div class="fitem"><label>门票价格：</label></td><td><input name="jiage" class="easyui-numberspinner" min="1" max="999999" style="width:133px;"></div></td>
<td><div class="fitem"><label>币种:</label></td><td><input name="bizongId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=5',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
</tr>
<tr>
<td><div class="fitem"><label>开放时间起：</label></td><td><input name="kftimeqi" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>开放时间止：</label></td><td><input name="kftimezhi" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>时间可变否:</label></td><td><input name="timekb" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=9',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
</tr>
<tr>
<td><div class="fitem"><label>联系人：</label></td><td><input name="lianxiren" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>电话：</label></td><td><input name="dianhua" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>传真:</label></td><td><input name="chuanzhen" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>邮箱：</label></td><td><input name="email" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>是否订车默认景点：</label></td><td><input name="dcmr" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=9',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>地址：</label></td><td colspan="5"><input name="dizhi" class="easyui-validatebox" size="80"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>英文地址：</label></td><td colspan="5"><input name="ywdz" class="easyui-validatebox" size="80" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>景点描述：</label></td><td colspan="5"><input name="jdms" class="easyui-validatebox"  size="80"></div></td>
</tr>
<tr>
<tr><td colspan="6" align="center"><a href="javascript:SaveJingdian();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
<a class="easyui-linkbutton" iconCls="icon-undo" onclick="$('#addJingdianForm').form('clear')">重置</a></td>
</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>

<div id="jingdianUpdate" class="easyui-dialog" title="景点修改"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:800px;height:300px;padding:10px;">
		<form id="updateJingdianForm" method="post">
			<table align="center">
				<tr>
<td><div class="fitem"><label>景点编号:</label></td><td><input name="id"  class="easyui-validatebox" readonly="true" style="width:40px;">--不可修改</div></td>
<td><div class="fitem"><label>景点名称:</label></td><td><input name="name" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>景点英文名称:</label></td><td><input name="name2" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>所属城市：</label></td><td><input name="chengsiId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
<td><div class="fitem"><label>门票价格：</label></td><td><input name="jiage" class="easyui-numberspinner" min="1" max="999999" style="width:133px;"></div></td>
<td><div class="fitem"><label>币种:</label></td><td><input name="bizongId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=5',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
</tr>
<tr>
<td><div class="fitem"><label>开放时间起：</label></td><td><input name="kftimeqi" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>开放时间止：</label></td><td><input name="kftimezhi" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>时间可变否:</label></td><td><input name="timekb" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=9',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
</tr>
<tr>
<td><div class="fitem"><label>联系人：</label></td><td><input name="lianxiren" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>电话：</label></td><td><input name="dianhua" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>传真:</label></td><td><input name="chuanzhen" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>邮箱：</label></td><td><input name="email" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>是否订车默认景点：</label></td><td><input name="dcmr" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=9',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>地址：</label></td><td colspan="5"><input name="dizhi" class="easyui-validatebox"  size="80"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>英文地址：</label></td><td colspan="5"><input name="ywdz" class="easyui-validatebox"  size="80"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>景点描述：</label></td><td colspan="5"><input name="jdms" class="easyui-validatebox"  size="80"></div></td>
</tr>
<tr>
<tr><td colspan="6" align="center"><a href="javascript:jingdianUpdate();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
<a href="javascript:closedjingdianUpdate()" class="easyui-linkbutton" iconCls="icon-undo">取消</a></td>
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
		function jingdianSelectLike(){
		var opts = $('#dgJingdian').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				name: $("#name").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				chengsiId: $("#chengsiId").combobox('getValue') ,
				jiage : $("#jiage").val(),
				page:  opts.pageNumber ,
				rows:  opts.pageSize
			};
		console.info(param);
				$.ajax({
					url : 'fenghuang/JingdianSelect.do' ,
					data :  param,
					type : 'POST' ,
					dataType : 'json' ,
					success : function(data){
						$('#dgJingdian').datagrid('loadData',data);
					}
				});
		}
		
	


	  //新增
		function addJingdian() {
			$("#addJingdian").dialog("open");
			$("#addJingdianForm").form("clear");
		}
         
		function SaveJingdian() {
			$('#addJingdianForm').form('submit', {
				url : 'fenghuang/jingdanAdd.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
					$('#addJingdian').dialog('close');
						$.messager.alert("保存成功", "保存成功！", "info");
						 $('#dgJingdian').datagrid('reload'); 
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#dgJingdian').datagrid('reload');
					}
				}
			});
		}
			//关闭
		function closeEditDic() {
			$('#addJingdian').dialog('close');
		} 
	//删除操作要执行的方法
	function jingdianDelete(){
	  var row = $("#dgJingdian").datagrid("getSelected");
			if (row) {
				var param = {
					"id" :  row.id
				};
			 if (confirm("确认要删除名称为 “ "+row.name+" ”的供应商吗？")) {
				$.ajax({
					url : "fenghuang/jingdianDelete.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("删除成功", "删除成功！", "info");
							$("#dgJingdian").datagrid('reload');
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
		function jingdianSelectId() {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window 
			$("#jingdianUpdate").dialog("open");
			//准备回显的数据
			var row = $("#dgJingdian").datagrid("getSelected");
			//alert(row.tuanNO);
		
			if(row){
				var param = {
					"id" : row.id
				};
				
				$.ajax({
					url : "fenghuang/jingdianSelectId.do",
					data : param,
					dataType : "json",
					success : function(data) {
		
					   $('#updateJingdianForm').form('load',data.rows[0]);
				
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
		}
		}
		 //修改
		function jingdianUpdate() {
			$("#updateJingdianForm").form('submit', {
				url : 'fenghuang/jingdianUpdate.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {//data 是一个字符串  $.ajax(success:function(data):是一个对象)
					console.info(data);
					//var result = val('(' + data + ')');//吧字符串转换为对象
					var result = $.parseJSON(data) ;

					if (result.success) {
					  $("#jingdianUpdate").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
						$("#dgJingdian").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#dgJingdian").datagrid('reload');
					}
				}
			});
		}
		
		//关闭
		function closedjingdianUpdate() {
			$('#jingdianUpdate').dialog('close');
		}
	
	
	</script>



</body>
</html>
