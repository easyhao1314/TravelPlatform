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

<title></title>
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
		<div class="easyui-panel" title="酒店查询"
		style="height:80px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<form id="jiudianForm">
		<table>
			<tr>
				<td><div class="fitem">
						<label>酒店供应商名称:</label>
				</td>
				<td><input id="name" name="name" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>维护人:</label>
				</td>
				<td><input id="weihuren" name="weihuren" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>城市:</label>
				</td>
				<td><input id="chengshi" name="chengshi" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
				<td>	<a href="javascript:ZyjiudianSelectLike();" 
								class="easyui-linkbutton" iconCls="icon-ok">查询</a>
						<a href="javascript:void(0)" class="easyui-linkbutton"
							iconCls="icon-undo" onclick="$('#jiudianForm').form('clear')">重置</a>
				</td>
			</tr>
		</table>
		</form>
	</div>
	<!--
	<div id="searchpanel">
		<a href="javascript:ZyjiudianSelectLike()" iconCls="icon-search"
			onclick="javascript:alert('查询')"></a> <a href="javascript:void(0)"
			iconCls="icon-undo" onclick="javascript:alert('重置')"></a>
	</div>
	  -->
		<div class="easyui-panel" title="酒店供应商列表"
		style="height:480px;width: auto;">
		<table id="dg" class="easyui-datagrid"
			data-options="url:'fenghuang/ZiyuanJiudian.do',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
			pagination="true" toolbar="#currencyDatagridtoolbar">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true,singleSelect:false"></th>
					<th data-options="field:'id'" width="80">编号</th>
					<th data-options="field:'chengshiName'" width="80">城市</th>
					<th data-options="field:'name'" width="80">酒店供应商名称</th>
					<th data-options="field:'xingjibaozhun'" width="80">星级标准</th>
					<th data-options="field:'hezuojibie'" width="80">合作级别</th>
					<th data-options="field:'whr'" width="80">维护人</th>
					<th data-options="field:'bz'" width="80">备注</th>
				<!--	<th data-options="field:'8',formatter:onOperateStyle" width="80">操作</th> -->
				</tr>
			</thead>
		</table>
		<div id="currencyDatagridtoolbar">
		     <a href="javascript:addJiudian();" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
		     <a href="javascript:ZiyuanJiudianSelectId();" class="easyui-linkbutton" iconCls="icon-save"  plain="true">修改</a>
		     <a href="javascript:ZyjiudianDelete();" class="easyui-linkbutton" iconCls="icon-cut" plain="true">删除</a>  
		</div>
	</div>
	
	<div id="addJiudian"  class="easyui-dialog" title="酒店新增"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:700px;height:450px;padding:10px;">
		<form id="addForm" method="post">
			<table align="center">
<tr>
<td><div class="fitem"><label>酒店编号:</label></td><td>--系统自动生成--</div></td>
<td><div class="fitem"><label>酒店名称:</label></td><td><input name="name" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>合作级别:</label></td><td><input name="hzjb" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=4',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
</tr>
<tr>
<td><div class="fitem"><label>所属城市：</label></td><td><input name="chengshi"  class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
<td><div class="fitem"><label>星级标准：</label></td><td><input name="xjbz"  class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=16',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
<td><div class="fitem"><label>房间数：</label></td><td><input name="fangjian" class="easyui-numberspinner" min="1" max="999999" style="width:133px;"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>联系人：</label></td><td><input name="whr" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>电话：</label></td><td><input name="dianhua" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>传真:</label></td><td><input name="chuanzhen" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>Email：</label></td><td><input name="email" class="easyui-validatebox" ></div></td>
<td></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>官方网站地址：</label></td><td  colspan="5"><input name="guanwang" class="easyui-validatebox"  size="80"></div></td>
<td></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>酒店地址:</label></td><td  colspan="5"><input name="dizhi" class="easyui-validatebox"  size="80"></div></td>
<td></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>评价说明：</label></td><td colspan="5"><input name="pingjia" class="easyui-validatebox"  size="80"></div></td>
<td></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>温馨提示：</label></td><td colspan="5"><input name="tishi" class="easyui-validatebox"  size="80"></div></td>
<td></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>淡季价：</label></td><td><input name="danjijia" class="easyui-numberspinner" min="0" max="999999" style="width:133px;"  /></div></td>
<td><div class="fitem"><label>旺季价：</label></td><td><input name="wangjijia" class="easyui-numberspinner" min="0" max="999999" style="width:133px;" /></div></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>价格说明:</label></td><td  colspan="5"><input name="jgsm" class="easyui-validatebox"  size="80"></div></td>
<td></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>备注：</label></td><td  colspan="5"><input name="bz" class="easyui-validatebox"  size="80"></div></td>
<td></td><td></td>
</tr>

<tr>
<tr><td colspan="4s" align="center">
<a href="javascript:SaveJiudian();" class="easyui-linkbutton" iconCls="icon-ok">保存</a> 
<a class="easyui-linkbutton" iconCls="icon-undo" onclick="$('#addForm').form('clear')">重置</a></td>
</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
	
	<div id="updateJiudian"  class="easyui-dialog" title="酒店修改"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:700px;height:450px;padding:10px;">
		<form id="updateForm" method="post">
			<table align="center">
<tr>
<input id="id" name="id" class="easyui-validatebox" hidden="true">
<td><div class="fitem"><label>酒店名称:</label></td><td><input name="name" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>合作级别:</label></td><td><input name="hzjb" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=4',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td><td></td>
</tr>
<tr>
<td><div class="fitem"><label>所属城市：</label></td><td><input name="chengshi"  class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
<td><div class="fitem"><label>星级标准：</label></td><td><input name="xjbz"  class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=16',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
<td><div class="fitem"><label>房间数：</label></td><td><input name="fangjian" class="easyui-numberspinner" min="1" max="999999" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>联系人：</label></td><td><input name="whr" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>电话：</label></td><td><input name="dianhua" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>传真:</label></td><td><input name="chuanzhen" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>Email：</label></td><td><input name="email" class="easyui-validatebox" ></div></td>
<td></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>官方网站地址：</label></td><td  colspan="5"><input name="guanwang" class="easyui-validatebox"  size="80"></div></td>
<td></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>酒店地址:</label></td><td  colspan="5"><input name="dizhi" class="easyui-validatebox"  size="80"></div></td>
<td></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>评价说明：</label></td><td colspan="5"><input name="pingjia" class="easyui-validatebox"  size="80"></div></td>
<td></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>温馨提示：</label></td><td colspan="5"><input name="tishi" class="easyui-validatebox"  size="80"></div></td>
<td></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>淡季价：</label></td><td><input name="danjijia" class="easyui-numberspinner" min="1" max="999999" style="width:133px;" ></div></td>
<td><div class="fitem"><label>旺季价：</label></td><td><input name="wangjijia" class="easyui-numberspinner" min="1" max="999999" style="width:133px;"></div></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>价格说明:</label></td><td  colspan="5"><input name="jgsm" class="easyui-validatebox"  size="80"></div></td>
<td></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>备注：</label></td><td  colspan="5"><input name="bz" class="easyui-validatebox"  size="80"></div></td>
<td></td><td></td>
</tr>

<tr>
<tr><td colspan="4s" align="center"><a href="javascript:jiudianUpdate();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
<a class="easyui-linkbutton" iconCls="icon-undo" onclick="$('#updateForm').form('clear')">重置</a></td>
</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
	
	
		<script type="text/javascript">
    //这个方法是格式化操作列的函数
    // function onOperateStyle(val,row){
    //  var returnStyleValue='<img alt="修改" src="js/themes/icons/pencil.png" onclick="ZiyuanJiudianSelectId('+row.id+');">';
    //  returnStyleValue+='<img alt="删除" src="js/themes/icons/cancel.png" onclick="ZyjiudianDelete('+row.id+');">';
    //   return returnStyleValue;
    // }
    //这个方法是格式化是否可用列的，0：为不使用，1：为使用
	function onIsUesStyle(val,row){
	  if(val =='1'){
	      return "使用";
	  }else{
	     return "不使用";
	  }
	  
	}
		//模糊查询
		function ZyjiudianSelectLike(){
		var opts = $('#dg').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				name: $("#name").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				chengshi: $("#chengshi").combobox('getValue'),
				weihuren : $("#weihuren").val(),
				page:  opts.pageNumber ,
				rows:  opts.pageSize
			};
			//{name:$("#name").val(),chengshi:$("#chengshi").val() ,page:opts.pageNumber ,rows:opts.pageSize} 
			//console.info(param);
			//console.info($.toJSON(param));
			//console.info(JSON.stringify(param));
				$.ajax({
					url : 'fenghuang/ZyjiudianSelectLike.do' ,
					data :  param,
					type : 'POST' ,
					dataType : 'json' ,
					success : function(data){
						$('#dg').datagrid('loadData',data);
					}
				});
		}
		

	//删除
	function ZyjiudianDelete(){
	 var row = $("#dg").datagrid("getSelected");
			if (row) {
				var param = {
					"id" :  row.id
				};
				  if (confirm("确认要删除名称为 “ "+row.name+" ”的供应商吗？")) {
    
				$.ajax({
					url : "fenghuang/ZiyuanJiudianDelete.do",
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
				}) }
			}
		
		}

	  //新增
		function addJiudian() {
			$("#addJiudian").dialog("open");
			$("#addForm").form("clear");
		}
         //新增保存
		function SaveJiudian() {
			$('#addForm').form('submit', {
				url : 'fenghuang/ZiyuanJiudianAdd.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
					$('#addJiudian').dialog('close');
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
			$('#addJiudian').dialog('close');
		} 
		
		//按id查询
		function ZiyuanJiudianSelectId() {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window 
			$("#updateJiudian").dialog("open");
			//准备回显的数据
			var row = $("#dg").datagrid("getSelected");
			//alert(row.tuanNO);
		
			if(row){
				var param = {
					"id" : row.id
				};
				
				$.ajax({
					url : "fenghuang/ZiyuanJiudianSelectId.do",
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
		function jiudianUpdate() {
			$("#updateForm").form('submit', {
				url : 'fenghuang/ZiyuanJiudianUpdate.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {//data 是一个字符串  $.ajax(success:function(data):是一个对象)
					console.info(data);
					//var result = val('(' + data + ')');//吧字符串转换为对象
					var result = $.parseJSON(data) ;

					if (result.success) {
					  $("#updateJiudian").dialog('close');
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
			$('#updateJiudian').dialog('close');
		}
	
	
	</script>
</body>
</html>
