<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Caozuo_Mingxi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    ${param.oid}



<div class="easyui-accordion" data-options="fit:true,border:false">
<div id="tuanNo" title="团号：${param.tuanNo}" style="padding:10px;">
<form id="tuan" action="">
	<table>
		<tr>
		<td><strong>团号：</strong></td><td><input value="${param.tuanNo}"/></td>
		<td><strong>团名/路线：</strong></td><td><input name="tuanName"/></td>
		<td><strong>出团日期：</strong></td><td><input name="tuanName"/></td>
		<td><strong>回团日期：</strong></td><td><input name="tuanName"/></td>
		
		</tr>
	</table>
</form>
</div>
<div title="Title2" data-options="selected:true" style="padding:10px;">
content2
</div>
<div title="Title3" style="padding:10px">
content3
</div>
</div>

    <script type="text/javascript">
     $(document).ready(function() {
     	tuanNoload();
     });
     function tuanNoload(){
     	
     }
    </script>
  </body>
</html>
