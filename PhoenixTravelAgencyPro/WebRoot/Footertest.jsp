<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Footertest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="pirobox/css_pirobox/style_1/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="pirobox/css/css.css"/>
<link rel="stylesheet" type="text/css" href="pirobox/content/css/default.css"/>
<link rel="stylesheet" type="text/css" href="pirobox/css/sansation/stylesheet.css"/>
<script type="text/javascript" src="pirobox/js/jquery.min.js"></script>
<script type="text/javascript" src="pirobox/js/jquery-ui-1.8.2.custom.min.js"></script>
<script type="text/javascript" src="pirobox/js/pirobox_extended.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$().piroBox_ext({
	piro_speed : 700,
		bg_alpha : 0.5,
		piro_scroll : true // pirobox always positioned at the center of the page
	});
});
</script>
  </head>
  
  <body>
<a href="pirobox/img/27.jpg" rel="gallery"  class="pirobox_gall" title="Lights"><img src="pirobox/img/27s.jpg"  /></a>
<a href="pirobox/img/29.jpg" rel="gallery"  class="pirobox_gall" title="Sun salutation."><img src="pirobox/img/29s.jpg"  /></a>
<a href="pirobox/img/30.jpg" rel="gallery"  class="pirobox_gall" title="Bonfire"><img src="pirobox/img/30s.jpg"  /></a>
  </body>
</html>
