<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'SanPin_Mingxi.jsp' starting page</title>
    
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
  	<div id="sanpinzuo" style=" width: 500px; float: left;">
  		<div id="zuozuo" style="float: left; margin-right: 20px; margin-top: 40px;"><img alt="点击设定行程图片" width="150px" height="150px" style=""></div>
  		<div id="zuoyou">
    <span style="margin: 20px;"><b><font color=#0000ff><h4>${param.tuanName}</h4></font></b></span>
    <ul>
    	<li>出发地点：<span id="chufa"></span></li>
    	<li>行程天数：<span id="numberday"></span>天</li>
    	<li>参考价格：<span id="jiage"></span>RMB</li>
    	<li>航空公司：<span id="hangkong"></span><ul><li>去程：<span id="qucheng"></span></li><li>回程：<span id="huicheng"></span></li></ul></li>
    	<li>预收人数：<span id="numbermaster"></span>人</li>
    	<li>适合人群：<span id="renqun"></span></li>
    	<li>产品品牌：<span id="prand"></span></li>
    </ul>
    	</div>
    	<h4>产品特点</h4>
    	<div style="height: 10px; background-color: #333333;"></div>
    	<span id="tedian" style="width: 300px;"></span>
    	<h4>参团须知</h4>
    	<div style="height: 10px; background-color: #333333;"></div>
    	<span id="cantuan" style="width: 300px;"></span>
    	<h4>服务包含</h4>
    	<div style="height: 10px; background-color: #333333;"></div>
    	<span id="baohan" style="width: 300px;"></span>
    	<h4>服务不含</h4>
    	<div style="height: 10px; background-color: #333333;"></div>
    	<span id="buhan" style="width: 300px;"></span>
    	</div>
    <div id="sanpinyou" style="background-color: green; width: 500px; float: left;" >
		s
    </div>
    <script type="text/javascript">
    $(document).ready(function() {
     	sanpintuanNoload();
     });
     function sanpintuanNoload(){
     $.ajax({
					url :'fenghuang/Sanpinliebiao.do?tuanNo='+'${param.tuanNo}',
					data :'${param.tuanNo}',
					dataType : "json",
					success : function(data) {
					document.getElementById("numberday").innerHTML=data.rows[0].numberday;
					document.getElementById("chufa").innerHTML=data.rows[0].chufa;
					document.getElementById("jiage").innerHTML=data.rows[0].zhikejia*data.rows[0].numbermaster;
					document.getElementById("hangkong").innerHTML=data.rows[0].airways;
					document.getElementById("qucheng").innerHTML=data.rows[0].groupflight;
					document.getElementById("huicheng").innerHTML=data.rows[0].Tourflight;
					document.getElementById("numbermaster").innerHTML=data.rows[0].numbermaster;
					document.getElementById("prand").innerHTML=data.rows[0].prand;
					document.getElementById("renqun").innerHTML=data.rows[0].renqun;
					document.getElementById("tedian").innerHTML=data.rows[0].teamexplains;
					
					document.getElementById("baohan").innerHTML=data.rows[0].Servicesinclude;
					document.getElementById("buhan").innerHTML=data.rows[0].servicenoinclude;
					document.getElementById("cantuan").innerHTML=data.rows[0].notes;
					
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
     }
    </script>
  </body>
</html>
