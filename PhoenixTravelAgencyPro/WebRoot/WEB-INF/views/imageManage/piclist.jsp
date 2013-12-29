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
    <div id="tupianchaxundlg" class="easyui-dialog" title="查询窗口" data-options="iconCls:'icon-search',closed:true,buttons: 
	 			[{
                    text:'搜索',
                    iconCls:'icon-search',
                    handler:function(){
                    searchDepartment();
                    searchDepartmentReset();
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                    $('#tupianchaxundlg').dialog('close');
                    }
                }]" style="width:400px;height:200px;padding:10px">
    <div class="demo-info">
        <div class="demo-tip icon-tip"></div>
        <div>在此处搜索图片的名字,已关键字为准进行模糊查找。</div>
    </div>
        <input id="searchName" name="searchName" class="easyui-validatebox" style="width: 300px; text-align: center; margin-left: 30px;">
    </div>
<!--    <div class="easyui-panel" title="图片查询"
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
 -->
	
 	<table id="dgPicManage" class="easyui-datagrid" 
		data-options="url:'fenghuang/getPicManages.do',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
		pagination="true" toolbar="#dgPicToolbar">
		<thead>
			<tr>
				<th data-options="field:'url',formatter:onOperateStyle" width="80">图片</th>
			    <th data-options="field:'searchName'" width="80">名字</th>
			</tr>
		</thead>
	</table>
	<div id="dgPicToolbar">
			 <a href="javascript:void(0);" onclick="javascript:$('#tupianchaxundlg').dialog('open');" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>  
		     <a href="javascript:newUpload();" class="easyui-linkbutton" iconCls="icon-add" plain="true">上传</a>  
		</div>
	<script type="text/javascript">
	function onOperateStyle(val,row,index){
       var returnStyleValue='<img alt="修改" src="'+row.url+'" width="100px" height="100px">';
       return returnStyleValue;
         }

	
function searchDepartment(){
searchName:$("#searchName").val();
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
