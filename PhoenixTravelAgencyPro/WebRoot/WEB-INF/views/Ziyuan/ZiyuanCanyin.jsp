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
	<div class="easyui-panel" title="餐饮查询"
		style="height:80px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<form id="canyinForm">
		<table>
			<tr>
				<td><div class="fitem">
						<label>所属城市:</label>
				</td>
				<td><input id="chengshiId" name="chengshiId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>
				<td><div class="fitem">
						<label>餐馆名称:</label>
				</td>
				<td><input id="name" name="name" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>合作级别:</label>
				</td>
				<td><input id="hzjbId" name="hzjbId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=4',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>
				<td>
					<a href="javascript:canyinSelectLike();" 
								class="easyui-linkbutton" iconCls="icon-ok">查询</a>
						<a href="javascript:void(0)" class="easyui-linkbutton"
							iconCls="icon-undo" onclick="$('#canyinForm').form('clear')">重置</a>
				</td>
			</tr>
		
		</table>
		</form>
	</div>
	
		<div class="easyui-panel" title="酒店列表" style="height:480px;width: auto;">
		<table id="dgCanyin" class="easyui-datagrid"
			data-options="url:'fenghuang/canyinSelect.do',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
			pagination="true" toolbar="#currencyDatagridtoolbar">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'chengshi'" width="80">城市</th>
					<th data-options="field:'id'" width="80">餐馆编号</th>
					<th data-options="field:'name'" width="80">餐馆名称</th>
					<th data-options="field:'dianhua'" width="80">联系电话</th>
					<th data-options="field:'chuanzhen'" width="80">传真</th>
					<th data-options="field:'shouji'" width="80">手机</th>
					<th data-options="field:'hzjb'" width="80">合作级别</th>
			
				</tr>
			</thead>
		</table>
		<div id="currencyDatagridtoolbar">
		     <a href="javascript:addCanyin();" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>  
		     <a href="javascript:canyinSelectId();" class="easyui-linkbutton" iconCls="icon-save"  plain="true">修改</a>
		     <a href="javascript:canyinDelete();" class="easyui-linkbutton" iconCls="icon-cut" plain="true">删除</a>  
		</div>
	</div>
<div id="addCanyin" class="easyui-dialog" title="餐饮新增"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:500px;padding:10px;">
		<form id="addCanyinForm" method="post">
			<table align="center">
				<tr>
<td><div class="fitem"><label>餐馆编号:</label></td><td>--系统自动生成--</td>
<td><div class="fitem"><label>所属城市：</label></td><td><input name="chengshiId"  class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
</tr>
<tr>
<td><div class="fitem"><label>餐馆名称：</label></td><td><input name="name" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>具体地址：</label></td><td><input name="dizhi" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>联系人：</label></td><td><input name="lianxiren" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>联系电话：</label></td><td><input name="dianhua"  class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>手机：</label></td><td><input name="shouji" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>传真：</label></td><td><input  name="chuanzhen" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>Email：</label></td><td><input name="Email" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>付款方式：</label></td><td><input name="fkfsId" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>合作级别：</label></td><td><input name="hzjbId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=4',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>餐标五菜一汤：</label></td><td><input name="cbwu" class="easyui-numberbox" /></div></td>
<td><div class="fitem"><label>餐标六菜一汤：</label></td><td><input name="cbliu" class="easyui-numberbox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>餐标七菜一汤：</label></td><td><input name="cbqi" class="easyui-numberbox" ></div></td>
<td><div class="fitem"><label>餐标八菜一汤：</label></td><td><input name="cbba" class="easyui-numberbox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>幼儿餐费：</label></td><td><input name="yecf" class="easyui-numberbox" ></div></td>
<td><div class="fitem"><label>幼儿年龄说明：</label></td><td><input name="yenlsm" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>儿童餐费：</label></td><td><input name="etcf" class="easyui-numberbox" ></div></td>
<td><div class="fitem"><label>儿童餐费说明：</label></td><td><input name="etcfsm" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>餐馆餐桌数：</label></td><td><input name="cgczs" class="easyui-numberbox" ></div></td>
<td><div class="fitem"><label>容纳人数：</label></td><td><input name="rnrs" class="easyui-numberbox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>免费额度说明：</label></td><td><input name="mfzdsm" class="easyui-validatebox" ></div></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>是否协议单位：</label></td><td><input name="sfxydw" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=9',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>
<td><div class="fitem"><label>是否付现单位：</label></td><td><input name="sffxdw" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=9',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>备注：</label></td><td colspan="3"><input name="beizhu" class="easyui-validatebox" size="70" ></div></td>

</tr>
<tr>
<tr><td colspan="4" align="center"><a href="javascript:SaveCanyin();" class="easyui-linkbutton" iconCls="icon-ok">保存</a> 
<a class="easyui-linkbutton" iconCls="icon-undo" onclick="$('#addCanyinForm').form('clear')">重置</a></td>
</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
	
	<div id="updateCanyin" class="easyui-dialog" title="餐饮修改"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:500px;padding:10px;">
		<form id="updateCanyinForm" method="post">
			<table align="center">
				<tr>
<td><div class="fitem"><label>餐馆编号:</label></td><td><input name="id" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>所属城市：</label></td><td><input name="chengshiId"  class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
</tr>
<tr>
<td><div class="fitem"><label>餐馆名称：</label></td><td><input name="name" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>具体地址：</label></td><td><input name="dizhi" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>联系人：</label></td><td><input name="lianxiren" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>联系电话：</label></td><td><input name="dianhua"  class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>手机：</label></td><td><input name="shouji" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>传真：</label></td><td><input  name="chuanzhen" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>Email：</label></td><td><input name="Email" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>付款方式：</label></td><td><input name="fkfsId" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>合作级别：</label></td><td><input name="hzjbId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=4',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>餐标五菜一汤：</label></td><td><input name="cbwu" class="easyui-numberbox" /></div></td>
<td><div class="fitem"><label>餐标六菜一汤：</label></td><td><input name="cbliu" class="easyui-numberbox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>餐标七菜一汤：</label></td><td><input name="cbqi" class="easyui-numberbox" ></div></td>
<td><div class="fitem"><label>餐标八菜一汤：</label></td><td><input name="cbba" class="easyui-numberbox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>幼儿餐费：</label></td><td><input name="yecf" class="easyui-numberbox" ></div></td>
<td><div class="fitem"><label>幼儿年龄说明：</label></td><td><input name="yenlsm" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>儿童餐费：</label></td><td><input name="etcf" class="easyui-numberbox" ></div></td>
<td><div class="fitem"><label>儿童餐费说明：</label></td><td><input name="etcfsm" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>餐馆餐桌数：</label></td><td><input name="cgczs" class="easyui-numberbox" ></div></td>
<td><div class="fitem"><label>容纳人数：</label></td><td><input name="rnrs" class="easyui-numberbox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>免费额度说明：</label></td><td><input name="mfzdsm" class="easyui-validatebox" ></div></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>是否协议单位：</label></td><td><input name="sfxydw" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=9',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>
<td><div class="fitem"><label>是否付现单位：</label></td><td><input name="sffxdw" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=9',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>备注：</label></td><td colspan="3"><input name="beizhu" class="easyui-validatebox" size="70" ></div></td>
</tr>
<tr>
<tr><td colspan="4" align="center"><a href="javascript:canyinUpdate();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
<a href="javascript:closedupdateCanyin()" class="easyui-linkbutton" iconCls="icon-undo">取消</a></td>
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
		function canyinSelectLike(){

		var opts = $('#dgCanyin').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				name: $("#name").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				chengshiId: $("#chengshiId").combobox('getValue'),
				hzjbId : $("#hzjbId").combobox('getValue'),
				page:  opts.pageNumber ,
				rows:  opts.pageSize
			};

				$.ajax({
					url : 'fenghuang/canyinSelect.do' ,
					data :  param,
					type : 'POST',
					dataType : 'json' ,
					success : function(data){
						$('#dgCanyin').datagrid('loadData',data);
					}
				});
		}
		
	
	
	 //新增
		function addCanyin() {
			$("#addCanyin").dialog("open");
			$("#addCanyinForm").form("clear");
		}
         
		function SaveCanyin(){
			$('#addCanyinForm').form('submit', {
				url : 'fenghuang/canyinAdd.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
					$('#addCanyin').dialog('close');
						$.messager.alert("保存成功", "保存成功！", "info");
						 $('#dgCanyin').datagrid('reload'); 
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#dgCanyin').datagrid('reload');
					}
				}
			});
		}
			//关闭
		function closeEditDic() {
			$('#addCanyin').dialog('close');
		} 
	//删除操作要执行的方法
	function canyinDelete(){
	  var row = $("#dgCanyin").datagrid("getSelected");
			if (row) {
				var param = {
					"id" :  row.id
				};
				if(confirm("确认要删除名称为 “ "+row.name+" ”的供应商吗？")){
				$.ajax({
					url : "fenghuang/canyinDelete.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("删除成功", "删除成功！", "info");
							$("#dgCanyin").datagrid('reload');
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
		function canyinSelectId() {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window 
			$("#updateCanyin").dialog("open");
			//准备回显的数据
			var row = $("#dgCanyin").datagrid("getSelected");
			//alert(row.tuanNO);
		
			if(row){
				var param = {
					"id" : row.id
				};
				
				$.ajax({
					url : "fenghuang/canyinSelectId.do",
					data : param,
					dataType : "json",
					success : function(data) {
		
					   $('#updateCanyinForm').form('load',data.rows[0]);
				
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
		}
		}
		 //修改
		function canyinUpdate() {
			$("#updateCanyinForm").form('submit', {
				url : 'fenghuang/canyinUpdate.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {//data 是一个字符串  $.ajax(success:function(data):是一个对象)

					//var result = val('(' + data + ')');//吧字符串转换为对象
					var result = $.parseJSON(data) ;

					if (result.success) {
					  $("#updateCanyin").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
	
						$("#dgCanyin").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#dgCanyin").datagrid('reload');
					}
				}
			});
		}
		
		//关闭
		function closedupdateCanyin() {
			$('#updateCanyin').dialog('close');
		}
	
	</script>



</body>
</html>
