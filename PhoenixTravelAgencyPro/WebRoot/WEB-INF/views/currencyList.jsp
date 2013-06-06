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
	<div class="easyui-panel" title="货币查询"
		style="height:80px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<table>
		   <tr>
		      <td><div class="fitem">
							<label>币种名称:</label>
					</td>
					<td><input name="currencyName" class="easyui-validatebox">
						</div></td>
						<td><div class="fitem">
							<label>币种缩写:</label>
					</td>
					<td><input name="currencyShort" class="easyui-validatebox">
						</div></td>
		   </tr>
		</table>
	</div>
	<div id="searchpanel">
		<a href="javascript:void(0)" iconCls="icon-search" onclick="javascript:alert('查询')"></a>
		<a href="javascript:void(0)" iconCls="icon-undo" onclick="javascript:alert('重置')"></a>
	</div>
	<div class="easyui-panel" title="币种列表" style="height:480px;width: auto;">
	  
	
	</div>
</body>
</html>
