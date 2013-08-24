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
	<div class="easyui-panel" title="交通供应商查询"
		style="height:110px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<form id="jiaotongForm">
		<table>
			<tr>
			<td><div class="fitem">
						<label>供应商名称:</label>
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
				
				<td></td>
			</tr>
			<tr>
			<td><div class="fitem">
						<label>联系人:</label>
				</td>
				<td><input id="lianxiren" name="lianxiren" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>合作级别:</label>
				</td>
				<td><input id="hzjbId" name="hzjbId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=4',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
				<td><a href="javascript:jiaotongSelectLike();" 
								class="easyui-linkbutton" iconCls="icon-ok">查询</a>
						<a href="javascript:void(0)" class="easyui-linkbutton"
							iconCls="icon-undo" onclick="$('#jiaotongForm').form('clear')">重置</a>
				</td>
			</tr>
				
		</table>
		</form>
	</div>
	<div id="searchpanel">
		<a href="javascript:void(0)" iconCls="icon-search"
			onclick="javascript:alert('查询')"></a> <a href="javascript:void(0)"
			iconCls="icon-undo" onclick="javascript:alert('重置')"></a>
	</div>
		<div class="easyui-panel" title="交通供应商列表"
		style="height:480px;width: auto;">
		<table id="dgJiaotong" class="easyui-datagrid"
			data-options="url:'fenghuang/jiaotongSelect.do',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
			pagination="true" toolbar="#currencyDatagridtoolbar">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'chengsi'" width="80">城市</th>
					<th data-options="field:'name'" width="80">供应商名称</th>
					<th data-options="field:'lianxiren'" width="80">联系人</th>
					<th data-options="field:'dianhua'" width="80">联系电话</th>
					<th data-options="field:'chuanzhen'" width="80">传真</th>
					<th data-options="field:'shouji'" width="80">手机</th>
					<th data-options="field:'jiage'" width="80">价格</th>
					<th data-options="field:'hzjb'" width="80">合作级别</th>
					
				</tr>
			</thead>
		</table>
		<div id="currencyDatagridtoolbar">
		     <a href="javascript:addJiaotong();" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>  
		     <a href="javascript:ZiyuanJiaotongSelectId();" class="easyui-linkbutton" iconCls="icon-save"  plain="true">修改</a>
		     <a href="javascript:jiaotongDelete();" class="easyui-linkbutton" iconCls="icon-cut" plain="true">删除</a>
		</div>
	</div>
<div id="addJiaotong" class="easyui-dialog" title="交通供应商新增"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:440px;padding:10px;">
		<form id="addJiaotongForm" method="post">
			<table align="center">
				<tr>
<td><div class="fitem"><label>编号:</label></td><td>--系统自动生成--</div></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>供应商名称：</label></td><td colspan="3"><input name="name" class="easyui-validatebox"   size="60"></div></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>所属城市：</label></td><td><input name="chengshiId"  class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
<td><div class="fitem"><label>地址：</label></td><td><input name="dizhi"  class="easyui-validatebox"/></div></td>
</tr>
<tr>
<td><div class="fitem"><label>联系人：</label></td><td><input name="lianxiren" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>电话：</label></td><td><input  name="dianhua" class="easyui-validatebox"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>手机：</label></td><td><input name="shouji" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>Email：</label></td><td><input name="Email" class="easyui-validatebox"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>传真：</label></td><td><input name="chuanzhen" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>网址：</label></td><td><input name="wangzhi" class="easyui-validatebox"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>价格：</label></td><td><input name="jiage" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>合作级别：</label></td><td><input name="hzjbId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=4',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
</tr>
<tr>
<td><div class="fitem"><label>外呼方式：</label></td><td><input name="whfsid" class="easyui-validatebox"></div></td>
<td></div></td>
</tr>
<tr>
<td><div class="fitem"><label>备注：</label></td><td colspan="3"><input name="beizhu" class="easyui-validatebox"  size="60"></div></td>
<td></td>
</tr>
<tr>
<tr><td colspan="4" align="center"><a href="javascript:SaveJiaotong();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
<a class="easyui-linkbutton" iconCls="icon-undo" onclick="$('#addJiaotongForm').form('clear')">重置</a></td>
</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>


<div id="jiaotongUpdate" class="easyui-dialog" title="交通供应商修改"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:440px;padding:10px;">
		<form id="updateJiaotongForm" method="post">
			<table align="center">
				<tr>
<td><div class="fitem"><label>编号:</label></td><td><input name="id" class="easyui-validatebox" readonly="true" style="width:40px;">--不可修改--</div></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>供应商名称：</label></td><td colspan="3"><input name="name" class="easyui-validatebox"   size="60"></div></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>所属城市：</label></td><td><input name="chengshiId"  class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
<td><div class="fitem"><label>地址：</label></td><td><input name="dizhi"  class="easyui-validatebox"/></div></td>
</tr>
<tr>
<td><div class="fitem"><label>联系人：</label></td><td><input name="lianxiren" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>电话：</label></td><td><input  name="dianhua" class="easyui-validatebox"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>手机：</label></td><td><input name="shouji" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>Email：</label></td><td><input name="Email" class="easyui-validatebox"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>传真：</label></td><td><input name="chuanzhen" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>网址：</label></td><td><input name="wangzhi" class="easyui-validatebox"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>价格：</label></td><td><input name="jiage" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>合作级别：</label></td><td><input name="hzjbId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=4',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>外呼方式：</label></td><td><input name="whfsid" class="easyui-validatebox"></div></td>
<td></div></td>
</tr>
<tr>
<td><div class="fitem"><label>备注：</label></td><td colspan="3"><input name="beizhu" class="easyui-validatebox"  size="60"></div></td>
<td></td>
</tr>
<tr>
<tr><td colspan="4" align="center"><a href="javascript:jiaotongUpdate();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
<a href="javascript:closedjiaotongUpdate()" class="easyui-linkbutton" iconCls="icon-undo">取消</a></td>
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
		function jiaotongSelectLike(){
		var opts = $('#dgJiaotong').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				name: $("#name").val(),				
				chengshiId: $("#chengshiId").combobox('getValue'),
				lianxiren: $("#lianxiren").val(),
				hzjbId: $("#hzjbId").combobox('getValue'),
				page:  opts.pageNumber ,
				rows:  opts.pageSize
			};
				$.ajax({
					url : 'fenghuang/jiaotongSelect.do' ,
					data :  param,
					type : 'POST' ,
					dataType : 'json' ,
					success : function(data){
						$('#dgJiaotong').datagrid('loadData',data);
					}
				});
		}
		


	//删除操作要执行的方法
	function jiaotongDelete(){
	  var row = $("#dgJiaotong").datagrid("getSelected");
			if (row) {
				var param = {
					"id" :  row.id
				};
				if (confirm("确认要删除名称为 “ "+row.name+" ”的供应商吗？")) {
				$.ajax({
					url : "fenghuang/jiaotongDelete.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("删除成功", "删除成功！", "info");
							$("#dgJiaotong").datagrid('reload');
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
	 //新增
		function addJiaotong() {
			$("#addJiaotong").dialog("open");
			$("#addJiaotongFrome").form("clear");
		}
         
		function SaveJiaotong() {
			$('#addJiaotongForm').form('submit', {
				url : 'fenghuang/jiaotongAdd.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
					$('#addJiaotong').dialog('close');
						$.messager.alert("保存成功", "保存成功！", "info");
						 $('#dgJiaotong').datagrid('reload'); 
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#dgJiaotong').datagrid('reload');
					}
				}
			});
		}
			//关闭
		function closeEditDic() {
			$('#addJiaotong').dialog('close');
		} 
		
		//按id查询
		function ZiyuanJiaotongSelectId() {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window 
			$("#jiaotongUpdate").dialog("open");
			//准备回显的数据
			var row = $("#dgJiaotong").datagrid("getSelected");
			//alert(row.tuanNO);
		
			if(row){
				var param = {
					"id" : row.id
				};
				
				$.ajax({
					url : "fenghuang/jiaotongSelectId.do",
					data : param,
					dataType : "json",
					success : function(data) {
		
					   $('#updateJiaotongForm').form('load',data.rows[0]);
				
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
		}
		}
		 //修改
		function jiaotongUpdate() {
			$("#updateJiaotongForm").form('submit', {
				url : 'fenghuang/jiaotongUpdate.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {//data 是一个字符串  $.ajax(success:function(data):是一个对象)
					console.info(data);
					//var result = val('(' + data + ')');//吧字符串转换为对象
					var result = $.parseJSON(data) ;

					if (result.success) {
					  $("#jiaotongUpdate").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
						$("#dgJiaotong").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#dgJiaotong").datagrid('reload');
					}
				}
			});
		}
		
		//关闭
		function closedjiaotongUpdate() {
			$('#jiaotongUpdate').dialog('close');
		}

	
	</script>



</body>
</html>
