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
  <div class="easyui-panel" title="财务" style="height:200px;width: auto;">
    <form id="caiwu" method="post">
  

</form>
</div>

  
  <div id="tb1">
           <a
href="javascript:caiwutuanduiselect();" class="easyui-linkbutton"
iconCls="icon-add" plain="true">新增(面板模式)</a>&nbsp;&nbsp;| <a
href="javascript:caiwutjfylbselect();" class="easyui-linkbutton"
iconCls="icon-cut" plain="true">删除</a>&nbsp;&nbsp;|&nbsp;
<a href="javascript:caiwutdxiugaichaxun();" class="easyui-linkbutton"
iconCls="icon-save" plain="true">修改</a>
</div>
    <div class="easyui-panel" title="团队收款" style="height:240px;width: auto;">
    
     <div id="tb2">
<a
href="javascript:tuanduifukuanopen();" class="easyui-linkbutton"
iconCls="icon-add" plain="true">新增(面板模式)</a>&nbsp;&nbsp;| <a
href="javascript:caiwutjfylbselect();" class="easyui-linkbutton"
iconCls="icon-cut" plain="true">删除</a>&nbsp;&nbsp;|
<a href="javascript:caiwutdfukuanchaxun();" class="easyui-linkbutton"
iconCls="icon-save" plain="true">修改</a>
</div>
    
  
<table id="dg" class="easyui-datagrid"
data-options="url:'fenghuang/caiwutuanduifeiyong.do?team=${param.team}&&ysyfid=1',border:false,singleSelect:true,fit:true,fitColumns:true, onClickRow: onClickRow,pageSize:20"
pagination="true" toolbar="#tb1">
<thead>
<tr>
<th data-options="field:'id',editor:'text'" width="50">单号</th>
<th data-options="field:'kxsm',editor:'text'" width="50">款项说明</th>
<th data-options="field:'khmc',editor:'text'" width="50">客户名称</th>
<th data-options="field:'yushoutime',editor:'text'" width="80">预收日期</th>
<th data-options="field:'huilv',editor:'text'" width="50">汇率</th>
<th data-options="field:'bizhong',editor:'text'" width="50">币种</th>
<th data-options="field:'yingshou',editor:'text'" width="50">应收</th>
<th data-options="field:'yishou',editor:'text'" width="50">已收</th>
<th data-options="field:'weifu',editor:'text'" width="50">未付</th>	
<th data-options="field:'ykfp',editor:'numberbox'" width="50">已开发票</th>
<th data-options="field:'fpxk',editor:'numberbox'" width="50">发票许可</th>
<th data-options="field:'a',editor:'numberbox'" width="50">销售确认</th>
<th data-options="field:'yujilirun',editor:'numberbox'" width="50">财务确认</th>
<th data-options="field:'beizhu',editor:'numberbox'" width="50">备注</th>
<th data-options="field:'fuzeren',editor:'numberbox'" width="50">责任人</th>
</tr>
</thead>
</table>
</div>	


   <div class="easyui-panel" title="团队付款" style="height:240px;width: auto;">

<table id="dgysk" class="easyui-datagrid"
data-options="url:'fenghuang/caiwutuanduifeiyong.do?team=${param.team}&&ysyfid=2',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
pagination="true" toolbar="#tb2">
<thead>
<tr>
<th data-options="field:'id',editor:'text'" width="50">单号</th>
<th data-options="field:'kxsm',editor:'text'" width="50">款项说明</th>
<th data-options="field:'khmc',editor:'text'" width="50">供应商名称</th>
<th data-options="field:'yushoutime',editor:'text'" width="80">预付日期</th>
<th data-options="field:'huilv',editor:'text'" width="50">汇率</th>
<th data-options="field:'bizhong',editor:'text'" width="50">币种</th>
<th data-options="field:'yingshou',editor:'text'" width="50">应收</th>
<th data-options="field:'yishou',editor:'text'" width="50">已收</th>
<th data-options="field:'weifu',editor:'text'" width="50">未付</th>	
<th data-options="field:'ykfp',editor:'numberbox'" width="50">已开发票</th>
<th data-options="field:'fpxk',editor:'numberbox'" width="50">发票许可</th>
<th data-options="field:'a',editor:'numberbox'" width="50">销售确认</th>
<th data-options="field:'yujilirun',editor:'numberbox'" width="50">财务确认</th>
<th data-options="field:'beizhu',editor:'numberbox'" width="50">备注</th>
<th data-options="field:'shijilirun',editor:'numberbox'" width="50">责任人</th>
</tr>
</thead>
</table>
</div>

<!-- ********************************************************* 应收款添加 ********************************************************* -->
<div id="caiwuxinxiid" class="easyui-dialog" title="应收款"
data-options="modal:true,closed:true,iconCls:'icon-save'"
style="width:500px;height:200px;padding:10px;">
<form id="caiwuxinxiform" action="">
<table align="left">
<tr>

<td><div class="fitem">
<label>应收款项:</label>
</td>
<td>
                       <input class="easyui-combobox"
name="kxsm"
data-options="url:'fenghuang/caiwushoukuanxiangxiala.do',
valueField:'id',
textField:'name',
panelHeight:'auto',
required:true
">
</div></td>
<td><div class="fitem">
<label>收款账号:</label>
</td>
<td> <input class="easyui-combobox"
name="zhanghaoid"
data-options="url:'fenghuang/caiwusfkzhwhselect.do',
valueField:'id',
textField:'zhanghaoming',
panelHeight:'auto',
required:true
">
</div></td>
</tr>
<tr>
<td>

<div class="fitem">

</td>
<td><input id="teamname" name="team" class="easyui-validatebox" >
</div></td>


</tr>
<tr>
<td><div class="fitem">
<label>首款单位:</label>
</td>
<td>
<input id="caiwuid" name="khmc"
class="easyui-validatebox">
</div></td>

<td><div class="fitem">
<label>应收日期:</label>
</td>
<td>
<input id="htsj" name="yushoutime" type="text" class="easyui-datebox" required="required">

</div></td>
</tr>
<tr>
<td><div class="fitem">
<label>金额:</label>
</td>
<td><input id="id" name="yingshou"
class="easyui-validatebox">
</div></td>
<td><div class="fitem">
<label>单位</label>
</td>

<td>
<input class="easyui-combobox"
name="huilvid"
data-options="url:'fenghuang/caiwuhuilvxiala.do',
valueField:'id',
textField:'bizhong',
panelHeight:'auto',
required:true"></div></td>


</div></td>
</tr>
<tr>
<td><div class="fitem">
<label>备注:</label>
</td>
<td><input id="id" name="beizhu"
class="easyui-validatebox">
</div></td>

</tr>
<tr>
<td><div class="fitem">
<label>Value</label>
</td>

<td><input id="ysyfid" name="ysyfid" value="1" class="easyui-validatebox">
</div></td>
</tr>

<tr>
<td colspan="4" align="center"><a
href="javascript:caiwutuanduisave();" class="easyui-linkbutton"
iconCls="icon-ok">确认</a> <a href="javascript:closedSearch();"
class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
</tr>
</table>
<input id="searchDicType" name="dicType" type="hidden">
</form>
</div>

<!-- ********************************************************* 应收款删除 ********************************************************* -->

<div id="tdfylbid" class="easyui-dialog" title="删除"
data-options="modal:true,closed:true,iconCls:'icon-save'"
style="width:500px;height:200px;padding:10px;">
<form id="tdfylbform" method="post" >
<table align="center">
<tr>
<td>
<input id="id" name="id" class="easyui-validatebox" >
<div class="fitem">

</td>
<td><input id="shanchu" value="2" class="easyui-validatebox" hidden="true">
</div></td>

</tr>

<tr>
<td colspan="4s" align="center"><a
href="javascript:caiwutdyflbdelete()" class="easyui-linkbutton"
iconCls="icon-ok">确认</a>
<a href="javascript:closedialog2();"
class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
</tr>
</table>
<input id="dicType" name="dicType" type="hidden">
</form>
</div>

<!-- ********************************************************* 应收款修改 ********************************************************* -->


<div id="caiwutdupdateid" class="easyui-dialog" title="应收款修改"
data-options="modal:true,closed:true,iconCls:'icon-save'"
style="width:500px;height:200px;padding:10px;">
<form id="caiwutdupdateform" action="">
<table align="left">
<tr>
<td><input id="id" name="id" class="easyui-validatebox"
hidden="true"
>
</div></td>
</tr>
<tr>

<td><div class="fitem">
<label>应收款项:</label>
</td>
<td>
                       <input class="easyui-combobox"
name="kxsm"
data-options="url:'fenghuang/caiwushoukuanxiangxiala.do',
valueField:'id',
textField:'name',
panelHeight:'auto',
required:true
">
</div></td>
<td><div class="fitem">
<label>收款账号:</label>
</td>
<td> <input class="easyui-combobox"
name="zhanghaoid"
data-options="url:'fenghuang/caiwusfkzhwhselect.do',
valueField:'id',
textField:'zhanghaoming',
panelHeight:'auto',
required:true
">
</div></td>
</tr>
<tr>
<td>

<div class="fitem">

</td>
<td><input id="teamname" name="team" class="easyui-validatebox" hidden="true">
</div></td>


</tr>
<tr>
<td><div class="fitem">
<label>首款单位:</label>
</td>
<td>
<input id="caiwuid" name="khmc"
class="easyui-validatebox">
</div></td>

<td><div class="fitem">
<label>应收日期:</label>
</td>
<td>
<input id="htsj" name="yushoutime" type="text" class="easyui-datebox" required="required">

</div></td>
</tr>
<tr>
<td><div class="fitem">
<label>金额:</label>
</td>
<td><input id="id" name="yingshou"
class="easyui-validatebox">
</div></td>
<td><div class="fitem">
<label>单位</label>
</td>
<td>
<input class="easyui-combobox"
name="jianxiemingchen"
data-options="url:'fenghuang/caiwuhuilvxiala.do',
valueField:'id',
textField:'bizhong',
panelHeight:'auto',
required:true
"></div></td>


</div></td>
</tr>
<tr>
<td><div class="fitem">
<label>备注:</label>
</td>
<td><input id="id" name="beizhu"
class="easyui-validatebox">
</div></td>

</tr>

<tr>
<td colspan="4" align="center"><a
href="javascript:caiwutdyflbupdate();" class="easyui-linkbutton"
iconCls="icon-ok">确认</a> <a href="javascript:closedSearch();"
class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
</tr>
</table>
<input id="searchDicType" name="dicType" type="hidden">
</form>
</div>





<!-- ********************************************************************华丽的分割线--应付款操作*********************************************************************** -->

<div id="tuanduixinxisave" class="easyui-dialog" title="应付款"
data-options="modal:true,closed:true,iconCls:'icon-save'"
style="width:500px;height:200px;padding:10px;">
<form id="tuanduixinxisaveform" action="">
<table align="center">
<tr>
<td><div class="fitem">
<label>应付款酒店:</label>
</td>
<td> <input class="easyui-combobox"
name="kxsm"
data-options="url:'fenghuang/caiwufukuanxiangxiala.do',
valueField:'id',
textField:'name',
panelHeight:'auto',
required:true">	
</div></td>

</tr>
<tr>
<td><div class="fitem">
<label>收款单位:</label>
</td>
<td><input id="caiwuid" name="khmc"
class="easyui-validatebox">
</div></td>
</tr>
<tr>
<td><div class="fitem">
<label>应付日期:</label>
</td>
<td><input id="htsj" name="yushoutime" type="text" class="easyui-datebox" required="required">
</div></td>

</tr>

<tr>
<td><div class="fitem">
<label>金额:</label>
</td>
<td><input id="id" name="yingshou"
class="easyui-validatebox">
</div></td>
<td><div class="fitem">
<label>单位:</label>
</td>
<td> <input class="easyui-combobox"
name="huilvid"
data-options="url:'fenghuang/caiwuhuilvxiala.do',
valueField:'id',
textField:'bizhong',
panelHeight:'auto',
required:true">
</div></td>
</tr>
<tr>
<td><div class="fitem">
<label>备注:</label>
</td>
<td><input id="beizhu" name="beizhu"
class="easyui-validatebox">
</div></td>
</tr>
<tr>
<td><div class="fitem">
<label>Value</label>
</td>

<td><input id="ysyfid" name="ysyfid" value="2" class="easyui-validatebox">
</div></td>
</tr>
<tr>
<!-- hidden="true" -->
<td><input id="teamnamea" name="team" class="easyui-validatebox" >
</div></td>


</tr>
<tr>
<td colspan="4s" align="center"><a
href="javascript:caiwutuanduifukuansave();" class="easyui-linkbutton"
iconCls="icon-ok">确认</a> <a href="javascript:closedSearch();"
class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
</tr>
</table>
<input id="searchDicType" name="dicType" type="hidden">
</form>
</div>

<!-- ****************************************************************付款修改**************************************************-->	


<div id="tuanduixinxiupdate" class="easyui-dialog" title="应付款修改"
data-options="modal:true,closed:true,iconCls:'icon-save'"
style="width:500px;height:200px;padding:10px;">
<form id="tuanduixinxiupdateform" action="">
<table align="center">
<tr>
<td><div class="fitem">
<label>应付款酒店:</label>
</td>
<td> <input class="easyui-combobox"
name="kxsm"
data-options="url:'fenghuang/caiwufukuanxiangxiala.do',
valueField:'id',
textField:'name',
panelHeight:'auto',
required:true">	
</div></td>

</tr>
<tr>
<td><div class="fitem">
<label>收款单位:</label>
</td>
<td><input id="caiwuid" name="khmc"
class="easyui-validatebox">
</div></td>
</tr>
<tr>
<td><div class="fitem">
<label>应付日期:</label>
</td>
<td><input id="htsj" name="yushoutime" type="text" class="easyui-datebox" required="required">
</div></td>

</tr>

<tr>
<td><div class="fitem">
<label>金额:</label>
</td>
<td><input id="id" name="yingshou"
class="easyui-validatebox">
</div></td>
<td><div class="fitem">
<label>单位:</label>
</td>
<td> <input class="easyui-combobox"
name="huilvid"
data-options="url:'fenghuang/caiwuhuilvxiala.do',
valueField:'id',
textField:'bizhong',
panelHeight:'auto',
required:true">
</div></td>
</tr>
<tr>
<td><div class="fitem">
<label>备注:</label>
</td>
<td><input id="beizhu" name="beizhu"
class="easyui-validatebox">
</div></td>
</tr>
<tr>
<td><div class="fitem">
<label>Value</label>
</td>

<td><input id="ysyfid" name="ysyfid" value="2" class="easyui-validatebox">
</div></td>
</tr>
<tr>
<!-- hidden="true" -->
<td><input id="teamnamea" name="team" class="easyui-validatebox" >
</div></td>


</tr>
<tr>
<td colspan="4s" align="center"><a
href="javascript:caiwutdfukuanchaxunupdate();" class="easyui-linkbutton"
iconCls="icon-ok">确认</a> <a href="javascript:closedSearch();"
class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
</tr>
</table>
<input id="searchDicType" name="dicType" type="hidden">
</form>
</div>
<script type="text/javascript">
//销售利润
function lirun(val,row){
var a=parseInt(row.baojia);
var b=parseInt(row.chengben);
var c=(a-b);
return '<div style="width: auto;">'+c+'</div>';
}
//采购利润
function caigoulirun(val,row){
var a=parseInt(row.cgje);
var b=parseInt(row.cglr);
var c=(a-b);
return '<div style="width: auto;">'+c+'</div>';
}

//添加
function caiwutuanduiselect() {
$("#caiwuxinxiid").dialog("open");
var team=${param.team};


//$("#caiwuxinxiform").form("clear");
$("#teamname").val(team);
}
        function closeEditDic() {
$("#caiwuxinxiid").dialog("close");
}
function caiwutuanduisave() {
var ysyfid = $("#ysyfid").val();
$('#caiwuxinxiform').form('submit', {
url : 'fenghuang/inserttuanbiao.do?ysyfid='+ysyfid,
onSubmit : function() {
return $(this).form('validate');
},
success : function(result) {
var result = eval('(' + result + ')');
if (result.success) {
$.messager.alert("保存成功", "保存成功！", "info");
$('#caiwuxinxiid').dialog('close');
$('#dg').datagrid('reload');
} else {
$.messager.alert("保存失败", "保存失败!", "error");
$('#dg').datagrid('reload');
}
}
});
}



//按id查询
function caiwutjfylbselect(id) {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window

//获取选中 数据

var row = $("#dg").datagrid("getSelected");
if(row==null){
var row = $("#dgysk").datagrid("getSelected");
}
//alert(row.id);
if(row!=null){
$("#tdfylbid").dialog("open");
//清空ID
$('#id').attr('value','');
//填充
$('#tdfylbform').form('load', row);
}
}
//修改
function caiwutdyflbdelete() {
var shanchu = $("#shanchu").val();
$("#tdfylbform").form('submit', {
url : 'fenghuang/updateqrfk.do?shanchu='+shanchu,
onSubmit : function() {
return $(this).form('validate');
},
success : function(data) {//data 是一个字符串 $.ajax(success:function(data):是一个对象)
console.info(data);
//var result = val('(' + data + ')');//吧字符串转换为对象
var result = $.parseJSON(data) ;

if (result.success) {
$("#tdfylbid").dialog('close');
$.messager.alert("修改成功", "修改成功！", "info");
$("#dg").datagrid('reload');
$("#dgysk").datagrid('reload');
} else {
$.messager.alert("修改失败", "修改失败!", "error");
$("#dg").datagrid('reload');
}
}
});
}





//按id查询
function caiwutdxiugaichaxun() {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window



//获取选中 数据
var row = $("#dg").datagrid("getSelected");

//alert(row.id);
if(row!=null){
$("#caiwutdupdateid").dialog("open");
//清空ID
$('#id').attr('value','');
//填充
$('#caiwutdupdateform').form('load', row);

}
}
//修改
function caiwutdyflbupdate() {
$("#caiwutdupdateform").form('submit', {
url : 'fenghuang/updateqrfk.do',
onSubmit : function() {
return $(this).form('validate');
},
success : function(data) {//data 是一个字符串 $.ajax(success:function(data):是一个对象)
console.info(data);
//var result = val('(' + data + ')');//吧字符串转换为对象
var result = $.parseJSON(data) ;

if (result.success) {
$("#caiwutdupdateid").dialog('close');
$.messager.alert("修改成功", "修改成功！", "info");
$("#dg").datagrid('reload');
} else {
$.messager.alert("修改失败", "修改失败!", "error");
$("#dg").datagrid('reload');
}
}
});
}


/**------------------------------------------付款添加 ---------------------------------------------------------**/


//添加
function tuanduifukuanupdateopen() {



$("#tuanduixinxisave").dialog("open");
var team=${param.team};
alert(team);
//$("#caiwuxinxiform").form("clear");
$("#teamnamea").val(team);
}
        function closeEditDic() {
$("#tuanduixinxisave").dialog("close");
}
function caiwutuanduifukuansave() {
var ysyfid = $("#ysyfid").val();
$('#tuanduixinxisaveform').form('submit', {
url : 'fenghuang/inserttuanbiao.do?ysyfid='+ysyfid,
onSubmit : function() {
return $(this).form('validate');
},
success : function(result) {
var result = eval('(' + result + ')');
if (result.success) {
$.messager.alert("保存成功", "保存成功！", "info");
$('#tuanduixinxisave').dialog('close');
$('#dgysk').datagrid('reload');
} else {
$.messager.alert("保存失败", "保存失败!", "error");
$('#dgysk').datagrid('reload');
}
}
});
}

/**------------------------------------------付款修改 ---------------------------------------------------------**/

//按id查询
function caiwutdfukuanchaxun() {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window



//获取选中 数据
var row = $("#dgysk").datagrid("getSelected");

//alert(row.id);
if(row!=null){
$("#tuanduixinxiupdate").dialog("open");
//清空ID
$('#id').attr('value','');
//填充
$('#tuanduixinxiupdateform').form('load', row);

}
}
//修改
function caiwutdfukuanchaxunupdate() {
$("#tuanduixinxiupdateform").form('submit', {
url : 'fenghuang/updateqrfk.do',
onSubmit : function() {
return $(this).form('validate');
},
success : function(data) {//data 是一个字符串 $.ajax(success:function(data):是一个对象)
console.info(data);
//var result = val('(' + data + ')');//吧字符串转换为对象
var result = $.parseJSON(data) ;

if (result.success) {
$("#tuanduixinxiupdate").dialog('close');
$.messager.alert("修改成功", "修改成功！", "info");
$("#dgysk").datagrid('reload');
} else {
$.messager.alert("修改失败", "修改失败!", "error");
$("#dgysk").datagrid('reload');
}
}
});
}


</script>
  </body>
</html>