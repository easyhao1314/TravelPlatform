<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>打印客户详细信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/jquery.PrintArea.js"></script>

  </head>
  
  <body>
  <input id="btnPrint" type="button" value="打印"/>
  <div id="myPrintArea" align="left">
  <div style=" margin: 50px;">
    <strong>合同编号：</strong> <span>sss</span><br><br>
    <strong>浏览线路：</strong> <span>${param.tuanName }</span><br><br>
    <strong>浏览日期：</strong> <span>${param.cjTime}</span><br><br>
    <!--  <strong>人数：</strong> <span>sss</span><strong>成人：</strong> <span>sss</span><strong>儿童：</strong> <span>sss</span><br><br> -->
    <strong>游客姓名：</strong> <span>${param.kehuName}</span><br><br>
    <strong>游客身份证号：</strong> <span>${param.sfzn}</span><br><br>
    <strong>游客电话：</strong> <span>${param.tel}</span><br><br>
    <strong>价格：</strong> <span>${param.jiage}</span><br><br>
    <strong>备注：</strong> <span>${param.beizhu}</span><br><br>
    <strong>计调：</strong> <span>${param.userName}</span><strong>接待：</strong> <span></span><strong>客源：</strong> <span></span><br><br>
    
  </div>
  </div>
  </body>
  <script type="text/javascript">
		$(function(){
			//打印
			$("#btnPrint").bind("click",function(event){
				$("#myPrintArea").printArea();
			});
		});
	</script>
</html>
