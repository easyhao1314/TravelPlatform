<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="js/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="js/themes/icon.css">
		<link rel="stylesheet" type="text/css" href="js/demo/demo.css">
	 <script type="text/javascript" src="js/jquery.min.js"></script>  
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script> 
  </head>
  
  <body>
     <h2>Basic Layout</h2>  
    <div class="demo-info">  
        <div class="demo-tip icon-tip"></div>  
        <div>The layout contains north,south,west,east and center regions.</div>  
    </div>  
    <div style="margin:10px 0;"></div>  
    <div class="easyui-layout" style="width:700px;height:350px;">  
        <div data-options="region:'north'" style="height:50px"></div>  
        <div data-options="region:'south',split:true" style="height:50px;"></div>  
        <div data-options="region:'east',split:true" title="East" style="width:180px;"></div>  
        <div data-options="region:'west',split:true" title="West" style="width:100px;"></div>  
        <div data-options="region:'center',title:'Main Title',iconCls:'icon-ok'">  
            <table class="easyui-datagrid"  
                    data-options="url:'js/demo/layout/datagrid_data1.json',border:false,singleSelect:true,fit:true,fitColumns:true">  
                <thead>  
                    <tr>  
                        <th data-options="field:'itemid'" width="80">Item ID</th>  
                        <th data-options="field:'productid'" width="100">Product ID</th>  
                        <th data-options="field:'listprice',align:'right'" width="80">List Price</th>  
                        <th data-options="field:'unitcost',align:'right'" width="80">Unit Cost</th>  
                        <th data-options="field:'attr'" width="150">Attribute</th>  
                        <th data-options="field:'status',align:'center'" width="50">Status</th>  
                    </tr>  
                </thead>  
            </table>  
        </div>  
    </div> 
  </body>
</html>
