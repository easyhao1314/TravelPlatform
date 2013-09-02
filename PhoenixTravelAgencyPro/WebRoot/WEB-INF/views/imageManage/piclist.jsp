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
   <div class="easyui-panel" title="图片查询"
		style="height:100px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<table>
			<tr>
				<td><div class="fitem">
						<label>关键字:</label>
				</td>
				<td><input id="searchName" name="searchName" class="easyui-validatebox">
					</div></td>
			</tr>
		</table>
	</div>
	<div id="searchpanel">
		<a href="javascript:void(0)" iconCls="icon-search"
			onclick="javascript:searchDepartment();"></a> <a href="javascript:void(0)"
			iconCls="icon-undo" onclick="javascript:searchDepartmentReset()"></a>
	</div>

	<div class="easyui-panel" title="图片列表"
		style="height:480px;width: auto;">
 	<table id="dgPicManage" class="easyui-datagrid" 
		data-options="url:'fenghuang/getPicManages.do',border:false,singleSelect:false,fit:true,fitColumns:true,pageSize:20"
		pagination="true" toolbar="#dgPicToolbar">
		<thead>
			<tr>
				<th data-options="field:'url',formatter:onOperateStyle" width="80">图片</th>
			    <th data-options="field:'searchName'" width="80">名字</th>
			</tr>
		</thead>
	</table>
	</div>
	<div id="dgPicToolbar">
		     <a href="javascript:newUpload();" class="easyui-linkbutton" iconCls="icon-add" plain="true">上传</a>  
		</div>
	<script type="text/javascript">
	function onOperateStyle(val,row,index){
       var returnStyleValue='<img alt="修改" src="'+row.url+'" width="100px" height="100px">';
       return returnStyleValue;
         }

	
function searchDepartment(){
	$('#dgPicManage').datagrid('load',{
		searchName:$("#searchName").val()	
	});
	
}
	function searchDepartmentReset(){
		searchName:$("#searchName").val();
}

function newUpload(){
  window.open('upload.do','上传','height=400,width=480,top=200,left=200,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
}
	</script>
</body>

 
</html>
