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
	<div class="easyui-panel" title="待审批查询"
		style="height:80px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<table>
			<tr>
				<td><div class="fitem">
						<label>申请日期:</label>
				</td>
				<td><input name="currencyName" class="easyui-datetimebox" data-options="required:true,showSeconds:false" value="3/4/2010 2:3" style="width:150px">
					</div>
				</td>
				<td><div class="fitem">
						<label>到:</label>
				</td>
				<td><input name="currencyShort" class="easyui-datetimebox" data-options="required:true,showSeconds:false" value="3/4/2010 2:3" style="width:150px">
					</div>
				</td>
					<td><div class="fitem">
						<label>关键字:</label>
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
		<div class="easyui-panel" title="待审批列表"
		style="height:480px;width: auto;">
		<table id="dg" class="easyui-datagrid"
			data-options="url:'fenghuang/DantuanDaishen.do',border:false,singleSelect:false,fit:true,fitColumns:true,pageSize:20"
			pagination="true" toolbar="#currencyDatagridtoolbar">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'01'" width="80">提请时间</th>
					<th data-options="field:'xsNo'" width="80">提请人</th>
					<th data-options="field:'tuanNO'" width="80">报价团</th>
					<th data-options="field:'tuanName'" width="80">团名</th>
					<th data-options="field:'02'" width="80">申请说明</th>
					<th data-options="field:'03'" width="80">报价</th>
					<th data-options="field:'04'" width="80">预计毛利（万）</th>
					<th data-options="field:'shenpi'" width="80">审批状态</th>
					<th data-options="field:'05'" width="80">审批时间</th>
					<th data-options="field:'8',formatter:onOperateStyle" width="80">操作</th>
				</tr>
			</thead>
		</table>
		<div id="currencyDatagridtoolbar">
		     <a href="javascript:dantuanAdd();" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>&nbsp;&nbsp;|  
		     <a href="javascript:dantuanQueren();" class="easyui-linkbutton" iconCls="icon-add" plain="true">确认成团</a> &nbsp;&nbsp;|
		     <a href="javascript:dantuanChexiao();" class="easyui-linkbutton" iconCls="icon-add" plain="true">撤销成团</a>
		</div>
	</div>


	<script type="text/javascript">
    //这个方法是格式化操作列的函数
    function onOperateStyle(val,row){
       var returnStyleValue='<img alt="修改" src="js/themes/icons/pencil.png" onclick="dantuanUpdate('+row.id+');">修改';
       returnStyleValue+='<img alt="删除" src="js/themes/icons/cancel.png" onclick="dantuanDelete();">删除';
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
	
	//这个方法用来点击新增按钮
	function dantuanAdd(){
	   alert("新增");
	}
	//删除操作要执行的方法
	function dantuanDelete(){
	var row = $("#dg").datagrid("getSelected");
			if (row) {
				var param = {
					"deleteRows" :  row.tuanNO
				};
				$.ajax({
					url : "fenghuang/deleteDantuan.do",
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
		//更新操作要执行的方法
	   function dantuanUpdate(id){
	    alert("更新操作");
	    }
	
	//成团确认
	function dantuanQueren(){
	    var row = $("#dg").datagrid("getSelected");
			if (row) {
				var param = {
					"querenRows" :  row.tuanNO
				};
				$.ajax({
					url : "fenghuang/shenpi.do",
					data : param,
					dataType : "json",
				success : function(data) {
						if (data.success) {
							$.messager.alert("审批成功", "审批成功！", "info");
							$("#dg").datagrid('reload');
						} else {
							$.messager.alert("审批失败", "审批失败!", "error");
						}
					},
					error : function() {
						$.messager.alert("审批失败", "服务器请求失败!", "error");
					}
				});
			}
		
    }
   
			 // 撤销成团
	   function dantuanChexiao(){
	    var row = $("#dg").datagrid("getSelected");
			if (row) {
				var param = {
					"querenRows" :  row.tuanNO
				};
				$.ajax({
					url : "fenghuang/chexiao.do",
					data : param,
					dataType : "json",
				success : function(data) {
						if (data.success) {
							$.messager.alert("撤销成功", "撤销成功！", "info");
							$("#dg").datagrid('reload');
						} else {
							$.messager.alert("撤销失败", "撤销失败!", "error");
						}
					},
					error : function() {
						$.messager.alert("审批失败", "服务器请求失败!", "error");
					}
				});
			}
			}
	</script>



</body>
</html>
