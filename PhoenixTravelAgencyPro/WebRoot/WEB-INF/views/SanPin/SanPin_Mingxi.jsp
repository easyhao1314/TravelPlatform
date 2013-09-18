<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>出团通知单</title>
    
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
    <span style="margin: 20px;"><b><font color=#0000ff>${param.tuanName}</font></b></span>
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
    <div id="sanpinyou" style=" width: 600px; float: left;" >
		
	
		</div>
    
    <script type="text/javascript">
    $(document).ready(function() {
     	sanpintuanNoload();
     	xingchengload();
     });
     
     
     
     function xingchengload(){
     var param = {
					"xianid" :  '${param.xianid}'
				};
		$.ajax({
					url :'fenghuang/xianluinfo.do',
					data :param,
					dataType : "json",
					success : function(data) {
					xunhuanRicheng('${param.xianid}');
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
     }
     
     
     
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
     function xunhuanRicheng(xianluid){
     var param = {
					"xianluid" : xianluid
				};
           $.ajax({
                    url :'fenghuang/selectricheng.do',
					data :param,
					dataType : "json",
					success : function(data) {
					for(var i=0;i<data.rows.length;i++){
					//循环修改交通城市在数据库里面读取出来的代码显示到JSP
						 var jt = new Array();
						 var jj = data.rows[i].jiaotongchengshi;
						 jt=jj.split(":");
						 	var jtapp='';
						 for(var j=0;j<jt.length;j++){
						 if(jt[j]=="^1"){
						 	jtapp+='<img src="Image/feiji.png">';
						 }
						 if(jt[j]=="^2"){
						  	jtapp+='<img src="Image/youlun.png">';
						 }
						 if(jt[j]=="^3"){
						  	jtapp+='<img src="Image/huoche.png">';
						 }
						 if(jt[j]=="^4"){
						  	jtapp+='<img src="Image/juzhu.png">';
						 }
						 if(jt[j]=="^5"){
						  	jtapp+='<img src="Image/bashi.png">';
						 }
						 if(jt[j]!="^1"&&jt[j]!="^2"&&jt[j]!="^3"&&jt[j]!="^4"&&jt[j]!="^5"){
						 	jtapp+=jt[j];
						 }
						 		 
						 }
						 
						 
						 var d = parseInt(i+1);	
						 var app='<table border="0" cellpadding="3" cellspacing="1" width="100%" align="center" style="background-color: #b9d8f3; margin-top:15px;" >'
						 	+'<tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">'
    							+'<td colspan="3" align="left"><font size="2"  style="float: left;">第'+d+'天</font><div id="jtcs'+i+'" style="height:20px; backaground-color:yellow"></div></td>'
    						+'</tr>'
	
						+'<tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">'
    						+'<td colspan="3" align="left"><font size="2">日程安排：'+data.rows[i].richenganpai+'</font></td>'
    					+'</tr>'
    					
    					+'<tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">'
    						+'<td colspan="3" align="left"><font size="2">活动安排：'+data.rows[i].huodong+'</font></td>'
    					+'</tr>'
	
	
    					+'<tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">'
    +'<td><font size="2">'+data.rows[i].zaos+'</font></td>'
    +'<td><font size="2">'+data.rows[i].zhongs+'</font></td>'
    +'<td><font size="2">'+data.rows[i].wans+'</font></td>'
    +'</tr>'

	+'<tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">'
    +'<td><font size="2">列1</font></td>'
    +'<td><font size="2">列1</font></td>'
    +'<td><font size="2">列1</font></td>'
    +'</tr>'
						 +'<table>';			
						$("#sanpinyou").append(app);
						$('#d'+d).form('load',data.rows[i]);
						$('#jtcs'+i).append(jtapp);
					} 
					//pares方法是 渲染JqueryEasyUi 插件的 解决不显示EasyUi的样式问题
					$.parser.parse("#mdiv");
					//循环结束
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
      
      });
  }
    </script>
  </body>
</html>
