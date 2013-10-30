<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
-->
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@page import="com.ckeditor.CKEditorConfig"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<meta content="text/html; charset=utf-8" http-equiv="content-type"/>
	<link type="text/css" rel="stylesheet" href="ckeditor/_samples/sample.css" />
</head>
<body>
	<!-- This <fieldset> holds the HTML code that you will usually find in your pages. -->
	<form action="fenghuang/editor.do" method="post">
		<p>
			<% 
				String value = "";
				Map<String, String> attr = new HashMap<String, String>();
				attr.put("rows", "8");
				attr.put("cols", "50");
				CKEditorConfig settings = new CKEditorConfig();
				settings.addConfigValue("width", "500");
				settings.addConfigValue("toolbar", "Basic");
			%>
			<ckeditor:editor textareaAttributes="<%=attr %>"
				basePath="ckeditor/" config="<%=settings %>"
				editor="editor1" value="<%= value %>"/>
			<input type="submit" value="Submit"/>
		</p>
	</form>
</body>
</html>
