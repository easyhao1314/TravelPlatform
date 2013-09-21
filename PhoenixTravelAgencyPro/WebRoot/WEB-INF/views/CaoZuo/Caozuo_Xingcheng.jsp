<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>行程详细信息</title>
    
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
  <div id="xcdiv"></div>
    <script type="text/javascript">
    $(document).ready(function() {

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
						 	var feiji='';
						 	var bashi='';
						 	var youlun='';
						 	var huoche='';
						 for(var j=0;j<jt.length;j++){
						 if(jt[j]=="^1"){
						 	jtapp+='<img src="Image/feiji.png" style="margin-top: -2px;">';
						 	feiji='飞机 ';
						 }
						 if(jt[j]=="^2"){
						  	jtapp+='<img src="Image/youlun.png" style="margin-top: -2px;">';
						  	youlun='游轮 ';
						 }
						 if(jt[j]=="^3"){
						  	jtapp+='<img src="Image/huoche.png" style="margin-top: -2px;">';
						  	huoche='火车 ';	
						 }
						 if(jt[j]=="^4"){
						  	jtapp+='<img src="Image/juzhu.png" style="margin-top: -2px;">';
						 }
						 if(jt[j]=="^5"){
						  	jtapp+='<img src="Image/bashi.png" style="margin-top: -2px;">';
						  	bashi='巴士 ';
						 }
						 if(jt[j]!="^1"&&jt[j]!="^2"&&jt[j]!="^3"&&jt[j]!="^4"&&jt[j]!="^5"){
						 	jtapp+='<font id="fon" size="2" style="margin-top: -5px">'+jt[j]+'</font>';
						 }
						 
						  
						 		 
						 }
						 
						
						 
						 
						 
						 
						 var d = parseInt(i+1);	
						 var app='<table border="0" cellpadding="3" cellspacing="1" width="600px" align="center" style="background-color: #b9d8f3; margin-top:15px;" >'
						 	+'<tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">'
    							+'<td colspan="3" align="left"><font size="2"  style="float: left;">第'+d+'天</font><div id="jtcs'+i+'"></div></td>'
    						+'</tr>'
	
						+'<tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">'
    						+'<td colspan="3" align="left"><font size="2">日程安排：'+data.rows[i].richenganpai+'</font></td>'
    					+'</tr>'
    					
    					+'<tr style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">'
    						+'<td colspan="3" align="left"><font size="2">活动安排：'+data.rows[i].huodong+'</font></td>'
    					+'</tr>'
	
	
    					+'<tr style="text-align: left; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">'
    +'<td style="width:200px" ><font size="2">早餐：'+data.rows[i].zaos+'</font></td>'
    +'<td><font size="2">午餐：'+data.rows[i].zhongs+'</font></td>'
    +'<td><font size="2">晚餐：'+data.rows[i].wans+'</font></td>'
    +'</tr>'

	+'<tr style="text-align: left; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">'
    +'<td><font size="2" style="float: left;">交通工具：</font><div id="jtgj'+i+'"></div></td>'
    +'<td><font size="2"></font></td>'
    +'<td><font size="2">住宿：</font></td>'
    +'</tr>'
						 +'<table>';			
						$("#xcdiv").append(app);
						$('#d'+d).form('load',data.rows[i]);
						$('#jtcs'+i).append(jtapp);
						$('fon').attr('margin-top','-10px');
						$('#jtgj'+i).append(feiji+bashi+huoche+youlun);
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
