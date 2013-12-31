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
<div id="tuanduisousuo" class="easyui-dialog" title="查询"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
			text:'查询',
			iconCls:'icon-search',
			handler:function(){
			$('#tuanduisousuo').dialog('close');
			cwtdfyselect();
			}
			},
			{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#tuanduisousuo').dialog('close');
		
			}
			}
		]"
		style="width:300px;height:180px;padding:10px;">
 <table>
<tr>
<td>团队名称:<input class="easyui-validatebox" type="text" name="team" id="team" style="width: 200px"></input></td>
</tr>
<tr>
<td>团号:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="easyui-validatebox" type="text" name="tuanduimc" id="tuanduimc" style="width: 200px"></input></td>
</tr>	
</table>
</div>
<div id="querenfukuandgtb">	
 <a href="javascript:void(0);" onclick="javascript:$('#tuanduisousuo').dialog('open');" class="easyui-linkbutton" iconCls="icon-save" plain="true">查询</a> 
 <a href="javascript:caiwutdfyselecta();" class="easyui-linkbutton"iconCls="icon-search" plain="true">查看</a>
</div>
<table id="tuanduifeiyongdg" class="easyui-datagrid"
data-options="url:'fenghuang/caiwutdfylbselect.do',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
pagination="true" toolbar="#querenfukuandgtb"  >
<thead>
<tr>
<th data-options="field:'tuanduimc'"  width="15">团号</th>
<th data-options="field:'sanpinName'" width="10">团名</th>
<th data-options="field:'sanpinchutuan'"  width="10">出团日期</th>
<th data-options="field:'sanpinhuituan'"  width="10">回团日期</th>
<th data-options="field:'xiaoshouyuan'" width="10">操作人</th>
<th data-options="field:'syingshou'" width="10">应收(RMB)</th>
<th data-options="field:'syishou'" width="10">已收(RMB)</th>
<th data-options="field:'syfk'" width="10" style="color:red">应付(RMB)</th>	
<th data-options="field:'syifu'" width="10">已付(RMB)</th>
<th data-options="field:'yuji'">预计利润(RMB)</th>
</tr>
</thead>
</table>
<script type="text/javascript">

function onClickRow(index) {
if (editIndex != index) {
if (endEditing()) {
$('#tuanduifeiyongdg').datagrid('selectRow', index).datagrid('beginEdit',
index);
editIndex = index;
} else {
$('#tuanduifeiyongdg').datagrid('selectRow', editIndex);
}
}
}

//条件查询
function cwtdfyselect(id){

console.info($('#tuanduifeiyongdg').datagrid('options'));
var opts = $('#tuanduifeiyongdg').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
var param = {
team: $("#team").val(),//获取databox的值 ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
tuanduimc: $("#tuanduimc").val() ,
caiwuid: id,

page: opts.pageNumber ,
rows: opts.pageSize
};
console.info(param);
$.ajax({
url : 'fenghuang/caiwutdfylbselect.do' ,
data : param,
type : 'POST' ,
dataType : 'json' ,
success : function(data){
$('#tuanduifeiyongdg').datagrid('loadData',data);
}
});
}

//按id查询
function caiwutdfyselecta(id) {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window

//获取选中 数据
var row = $("#tuanduifeiyongdg").datagrid("getSelected");
if(row!=null){
var url= "tuanduixinxi.do?team="+row.team+"&tuanduimc="+row.tuanduimc+"&shenfenid="+row.shenfenid+"&xiaoshou="+row.xiaoshou;
       var tab = $('#tt').tabs('getSelected');
if (tab){
var index = $('#tt').tabs('getTabIndex', tab);
$('#tt').tabs('close', index);
}

$('#tt').tabs('add', {
title : "团队财务信息",
href : url,
// closable : true,
});
}
}


</script>
</body>
</html>