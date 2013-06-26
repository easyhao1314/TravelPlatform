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
		<table>
			<tr>
				<td><div class="fitem">
						<label>编号:</label>
				</td>
				<td><input name="currencyName" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>名称:</label>
				</td>
				<td><input name="currencyShort" class="easyui-validatebox">
					</div>
				</td>
			</tr>
			<tr>
				<td><div class="fitem">
						<label>描述:</label>
				</td>
				<td><input name="currencyName" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>所属城市:</label>
				</td>
				<td><input name="currencyShort" class="easyui-validatebox">
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div id="searchpanel">
		<a href="javascript:void(0)" iconCls="icon-search"
			onclick="javascript:alert('查询')"></a> <a href="javascript:void(0)"
			iconCls="icon-undo" onclick="javascript:alert('重置')"></a>
	</div>
		<div class="easyui-panel" title="自费节目列表"
		style="height:480px;width: auto;">
		<table id="dg" class="easyui-datagrid"
			data-options="url:'fenghuang/ZiyuanZifei.do',border:false,singleSelect:false,fit:true,fitColumns:true,pageSize:20"
			pagination="true" toolbar="#currencyDatagridtoolbar">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'id'" width="80">自费节目编号</th>
					<th data-options="field:'name'" width="80">自费节目名称</th>
					<th data-options="field:'feiyong'" width="80">自费节目费用</th>
					<th data-options="field:'bizhongId'" width="80">币种</th>
					<th data-options="field:'chengshiId'" width="80">城市</th>
					<th data-options="field:''" width="80">自费节目描述</th>
					<th data-options="field:'8',formatter:onOperateStyle" width="80">操作</th>
				</tr>
			</thead>
		</table>
		<div id="currencyDatagridtoolbar">
		     <a href="javascript:addZifei();" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>  
		</div>
	</div>
	
	<div id="addZifei" class="easyui-dialog" title="自费节目新增"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:240px;padding:10px;">
		<form id="addForm" method="post">
			<table align="center">
				<tr>
<td><div class="fitem"><label>自费节目编号:</label></td><td><input name="id" class="easyui-validatebox" required="true"></div></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>自费节目名称：</label></td><td><input name="name" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>自费节目费用：</label></td><td><input name="feiyong" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>所属城市：</label></td><td><input name="chengshiId"  class="easyui-combobox"
 data-options="url:'fenghuang/CountrySetting.do',valueField:'csdNo',textField:'csdName'"/></div></td>
<td><div class="fitem"><label>币种：</label></td><td><input name="bizhongId"  class="easyui-combobox"
 data-options="url:'fenghuang/CountrySetting.do',valueField:'csdNo',textField:'csdName'"/></div></td>
</tr>
<tr>
<td><div class="fitem"><label>开放时间起：</label></td><td><input name="kftimeqi" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>开放时间止：</label></td><td><input  name="kftimezhi" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>时间是否可变：</label></td><td><input name="timekb" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>地接安排时间：</label></td><td><input name="djaptime" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>自费节目描述：</label></td><td><input name="miaoshu" class="easyui-validatebox" required="true"></div></td>
<td></td>
</tr>
<tr>
<tr><td colspan="4s" align="center"><a href="javascript:SaveZifei();" class="easyui-linkbutton" iconCls="icon-ok">保存</a> <input  type="reset" value="重置"></td>
</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>


	<script type="text/javascript">
    //这个方法是格式化操作列的函数
    function onOperateStyle(val,row){
       var returnStyleValue='<img alt="修改" src="js/themes/icons/pencil.png" onclick="onOperateUpdate('+row.id+');">';
       returnStyleValue+='<img alt="删除" src="js/themes/icons/cancel.png" onclick="onOperateDelete('+row.id+');">';
       return returnStyleValue;
    }
    //这个方法是格式化是否可用列的，0：为不使用，1：为使用
	function onIsUesStyle(val,row){
	  if(val =='1'){
	      return "使用";
	  }else{
	     return "不使用";
	  }
	  
	}
	//更新操作要执行的方法
	function onOperateUpdate(id){
	 alert("更新操作");
	
	}
	//删除操作要执行的方法
	function onOperateDelete(id){
	  alert("删除操作");
	}
	   //新增
		function addZifei() {
			$("#addZifei").dialog("open");
			$("#addFrome").form("clear");
		}
         
		function SaveZifei() {
			$('#addForm').form('submit', {
				url : 'fenghuang/.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
					$('#addZifei').dialog('close');
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
			$('#addZifei').dialog('close');
		} 
	
	
	</script>



</body>
</html>