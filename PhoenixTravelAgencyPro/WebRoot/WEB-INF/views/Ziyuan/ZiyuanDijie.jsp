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
	<div class="easyui-panel" title="地接供应查询"
		style="height:85px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<form id="dijieForm">
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
				<td><input id="chengshiId" name="chengshiId"  class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
				<td><div class="fitem">
						<label>联系人:</label>
				</td>
				<td><input id="lianxiren"  name="lianxiren" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>合作级别:</label>
				</td>
				<td><input id="hzjbId"  name="hzjbId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=4',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
				
				<td>
					<a href="javascript:dijieSelectLike();" 
								class="easyui-linkbutton" iconCls="icon-ok">查询</a>
					<a href="javascript:void(0)" class="easyui-linkbutton"
							iconCls="icon-undo" onclick="$('#dijieForm').form('clear')">重置</a>
				</td>
			</tr>

		</table>
		</form>
	</div>
	
		<div class="easyui-panel" title="地接社供应商列表"
		style="height:480px;width: auto;">
		<table id="dgDijie" class="easyui-datagrid"
			data-options="url:'fenghuang/DijieSelect.do',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
			pagination="true" toolbar="#currencyDatagridtoolbar">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<!--<th data-options="field:'id'" width="80">编号</th>-->
					<th data-options="field:'chengshi'" width="80">所属城市</th>
					<th data-options="field:'name'" width="80">供应商名称</th>
					<th data-options="field:'lianxiren'" width="80">联系人</th>
					<th data-options="field:'dianhua'" width="80">移动电话</th>
					<th data-options="field:'chuanzhen'" width="80">传真</th>
					<th data-options="field:'shouji'" width="80">手机</th>
					<th data-options="field:'hzjb'" width="80">合作级别</th>
					<th data-options="field:'bz'" width="80">备注</th>
				
				</tr>
			</thead>
		</table>
		<div id="currencyDatagridtoolbar">
		     <a href="javascript:addDijie();" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>  
		     <a href="javascript:dijieSelectId();" class="easyui-linkbutton" iconCls="icon-save"  plain="true">修改</a>
		     <a href="javascript:dijieDelete();" class="easyui-linkbutton" iconCls="icon-cut" plain="true">删除</a>  
		</div>
	</div>
     <div id="addDijie" class="easyui-dialog" title="地接新增"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:800px;height:500px;padding:10px;">
		<form id="addDijieForm" method="post">
			<table align="center">
				<tr>
<td><div class="fitem"><label>供应商编号:</label></td><td>--系统自动生成--</div></td>
<td><div class="fitem"><label>供应商名称:</label></td><td><input name="name" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>供应商英文名称:</label></td><td><input name="ywname" class="easyui-validatebox"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>所属城市：</label></td><td><input name="chengshiId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
<td><div class="fitem"><label>业务区域：</label></td><td><input name="ywqyId"class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=7',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
<td><div class="fitem"><label>合作级别:</label></td><td><input name="hzjbId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=4',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
</tr>
<tr>
<td><div class="fitem"><label>联系人：</label></td><td><input name="lianxiren" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>电话：</label></td><td><input name="dianhua" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>手机:</label></td><td><input name="shouji" class="easyui-validatebox"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>传真：</label></td><td><input name="chuanzhen" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>Email：</label></td><td><input name="email" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>SKYPE:</label></td><td><input name="skype" class="easyui-validatebox"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>MSN：</label></td><td><input name="msn" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>YAHOO：</label></td><td><input name="yahoo" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>网址:</label></td><td><input name="wangzhi" class="easyui-validatebox"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>代理人开户银：</label></td><td><input name="kaihu" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>代理人账号：</label></td><td><input name="dlrzh" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>银行地址:</label></td><td><input name="yhdz" class="easyui-validatebox"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>收款人账号：</label></td><td><input name="skrzh" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>收款人名称：</label></td><td><input name="skrxm" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>收款人地址:</label></td><td><input name="skrdz" class="easyui-validatebox"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>具体地址：</label></td><td colspan="5"><input name="dizhi" class="easyui-validatebox"  size="80"></div></td>

</tr>
<tr>
<td><div class="fitem"><label>地接描述：</label></td><td colspan="5"><input name="djsms" class="easyui-validatebox"  size="80"></div></td>

</tr>
<tr>
<td><div class="fitem"><label>性价比：</label></td><td colspan="5"><input name="xjb" class="easyui-validatebox"  size="80"></div></td>

</tr>
<tr>
<td><div class="fitem"><label>优势：</label></td><td colspan="5"><input name="youshi" class="easyui-validatebox"  size="80"></div></td>

</tr>
<tr>
<td><div class="fitem"><label>备注：</label></td><td colspan="5"><input name=" bz" class="easyui-validatebox"  size="80"></div></td>

</tr>
<tr>
<tr><td colspan="4" align="center"><a href="javascript:dijieSave();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
<a class="easyui-linkbutton" iconCls="icon-undo" onclick="$('#addDijieForm').form('clear')">重置</a></td>
</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
     
     <div id="updateDijie" class="easyui-dialog" title="地接修改"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:800px;height:500px;padding:10px;">
		<form id="updateDijieForm" method="post">
			<table align="center">
				<tr>

<td>
<input id="id" name="id" class="easyui-validatebox" hidden="true">
<div class="fitem"><label>供应商名称:</label></td><td><input name="name" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>供应商英文名称:</label></td><td><input name="ywname" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>所属城市：</label></td><td><input name="chengshiId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
<td><div class="fitem"><label>业务区域：</label></td><td><input name="ywqyId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=7',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
<td><div class="fitem"><label>合作级别:</label></td><td><input name="hzjbId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=4',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
</tr>
<tr>
<td><div class="fitem"><label>联系人：</label></td><td><input name="lianxiren" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>电话：</label></td><td><input name="dianhua" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>手机:</label></td><td><input name="shouji" class="easyui-validatebox"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>传真：</label></td><td><input name="chuanzhen" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>Email：</label></td><td><input name="email" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>SKYPE:</label></td><td><input name="skype" class="easyui-validatebox"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>MSN：</label></td><td><input name="msn" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>YAHOO：</label></td><td><input name="yahoo" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>网址:</label></td><td><input name="wangzhi" class="easyui-validatebox"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>代理人开户银：</label></td><td><input name="kaihu" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>代理人账号：</label></td><td><input name="dlrzh" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>银行地址:</label></td><td><input name="yhdz" class="easyui-validatebox"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>收款人账号：</label></td><td><input name="skrzh" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>收款人名称：</label></td><td><input name="skrxm" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>收款人地址:</label></td><td><input name="skrdz" class="easyui-validatebox"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>具体地址：</label></td><td colspan="5"><input name="dizhi" class="easyui-validatebox"  size="80"></div></td>

</tr>
<tr>
<td><div class="fitem"><label>地接描述：</label></td><td colspan="5"><input name="djsms" class="easyui-validatebox"  size="80"></div></td>

</tr>
<tr>
<td><div class="fitem"><label>性价比：</label></td><td colspan="5"><input name="xjb" class="easyui-validatebox"  size="80"></div></td>

</tr>
<tr>
<td><div class="fitem"><label>优势：</label></td><td colspan="5"><input name="youshi" class="easyui-validatebox"  size="80"></div></td>

</tr>
<tr>
<td><div class="fitem"><label>备注：</label></td><td colspan="5"><input name=" bz" class="easyui-validatebox"  size="80"></div></td>

</tr>
<tr>
<tr><td colspan="4" align="center"><a href="javascript:dijieUpdate();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
<a href="javascript:closedupdateDijie()" class="easyui-linkbutton" iconCls="icon-undo">取消</a></td>
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
		function dijieSelectLike(){
		console.info($('#dgDijie').datagrid('options'));
		var opts = $('#dgDijie').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				name: $("#name").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				chengshiId: $("#chengshiId").combobox('getValue') ,
				lianxiren : $("#lianxiren").val(),
				hzjbId : $("#hzjbId").combobox('getValue'),
				page:  opts.pageNumber ,
				rows:  opts.pageSize
			};
		console.info(param);
				$.ajax({
					url : 'fenghuang/DijieSelect.do' ,
					data :  param,
					type : 'POST' ,
					dataType : 'json' ,
					success : function(data){
						$('#dgDijie').datagrid('loadData',data);
					}
				});
		}
		
	
	

	  //新增
		function addDijie() {
			$("#addDijie").dialog("open");
			$("#addDijieForm").form("clear");
		}
         
		function dijieSave() {
			$('#addDijieForm').form('submit', {
				url : 'fenghuang/dijieAdd.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
					$('#addDijie').dialog('close');
						$.messager.alert("保存成功", "保存成功！", "info");
						 $('#dgDijie').datagrid('reload'); 
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#dgDijie').datagrid('reload');
					}
				}
			});
		}
			//关闭
		function closeEditDic() {
			$('#addDijie').dialog('close');
		} 
	
	
		//删除操作要执行的方法
	function dijieDelete(){
	  var row = $("#dgDijie").datagrid("getSelected");
			if (row) {
				var param = {
					"id" :  row.id
				};
				if(confirm("确认要删除名称为 “ "+row.name+" ”的供应商吗？")){
				$.ajax({
					url : "fenghuang/dijieDelete.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("删除成功", "删除成功！", "info");
							$("#dgDijie").datagrid('reload');
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
		function dijieSelectId() {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window 
			$("#updateDijie").dialog("open");
			//准备回显的数据
			var row = $("#dgDijie").datagrid("getSelected");
			alert(row.id);
		
			if(row){
				var param = {
					"id" : row.id
				};
				
				$.ajax({
					url : "fenghuang/dijieSelectId.do",
					data : param,
					dataType : "json",
					success : function(data) {
		
					   $('#updateDijieForm').form('load',data.rows[0]);
				
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
		}
		}
		 //修改
		function dijieUpdate() {
			$("#updateDijieForm").form('submit', {
				url : 'fenghuang/dijieUpdate.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {//data 是一个字符串  $.ajax(success:function(data):是一个对象)
					console.info(data);
					//var result = val('(' + data + ')');//吧字符串转换为对象
					var result = $.parseJSON(data) ;

					if (result.success) {
					  $("#updateDijie").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
						$("#dgDijie").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#dgDijie").datagrid('reload');
					}
				}
			});
		}
		
		//关闭
		function closedupdateDijie() {
			$('#updateDijie').dialog('close');
		}
	
	</script>



</body>
</html>
