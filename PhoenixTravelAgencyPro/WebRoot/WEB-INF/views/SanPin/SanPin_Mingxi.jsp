<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css"
	href="js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="js/demo/demo.css">
<!-- 这里主要是jquery的js文件  -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/jquery.json.js"></script>
<script type="text/javascript" src="js/datagrid-groupview.js"></script>

  </head>
  
  <body>
  <h1 align="center" style="font-size: 20px;">${param.tuanName}</h1>
  	<div id="sanpinzuo" style=" width: 100%;">
  		<div id="zuozuo" style="float: left; margin-right: 20px; margin-top: 40px;"></div>
  		<div id="zuoyou" style="margin-top: 30px; margin-bottom: 30px;">

    	</div>
    	<TABLE style="BORDER-RIGHT: #0076C8 2px dotted; BORDER-TOP: #0076C8 2px dotted; BORDER-LEFT: #0076C8 2px dotted; BORDER-BOTTOM: #0076C8 2px dotted; BORDER-COLLAPSE: collapse;margin-bottom: 10px;" borderColor=#0076C8  cellPadding=1 width=100% align=center border=2>
			<TBODY>
				<TR style="text-align: left; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; ">
					<TD>
						<font size="3" style="font-weight: bold">产品特点：</font><br><span id="tedian" style="width: 100%;"></span>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		
			
			
		
    	</div>
    <div id="sanpinyou" style=" width: 100%; float: left; margin-bottom: 20px;" >
		
	<font size="2" style="margin-top: -10px"></font>
		</div>
		
	
    <div style="margin-top: 20px;">
    <TABLE style="BORDER-RIGHT: #0076C8 2px dotted; BORDER-TOP: #0076C8 2px dotted; BORDER-LEFT: #0076C8 2px dotted; BORDER-BOTTOM: #0076C8 2px dotted; BORDER-COLLAPSE: collapse;margin-bottom: 10px;" borderColor=#0076C8  cellPadding=1 width=100% align=center border=2>
			<TBODY>
				<TR style="text-align: left; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; ">
					<TD>
						<font size="3" style="font-weight: bold">参团须知：</font><br><span id="cantuan" style="width: 300px;"></span>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
    	<TABLE style="BORDER-RIGHT: #0076C8 2px dotted; BORDER-TOP: #0076C8 2px dotted; BORDER-LEFT: #0076C8 2px dotted; BORDER-BOTTOM: #0076C8 2px dotted; BORDER-COLLAPSE: collapse;margin-bottom: 10px;" borderColor=#0076C8  cellPadding=1 width=100% align=center border=2>
			<TBODY>
				<TR style="text-align: left; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; ">
					<TD>
						<font size="3" style="font-weight: bold">服务包含：</font><br><span id="baohan" style="width: 300px;"></span>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE style="BORDER-RIGHT: #0076C8 2px dotted; BORDER-TOP: #0076C8 2px dotted; BORDER-LEFT: #0076C8 2px dotted; BORDER-BOTTOM: #0076C8 2px dotted; BORDER-COLLAPSE: collapse;margin-bottom: 10px;" borderColor=#0076C8  cellPadding=1 width=100% align=center border=2>
			<TBODY>
				<TR style="text-align: left; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; ">
					<TD>
						<font size="3" style="font-weight: bold">服务不含：</font><br><span id="buhan" style="width: 300px;"></span>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE style="BORDER-RIGHT: #0076C8 2px dotted; BORDER-TOP: #0076C8 2px dotted; BORDER-LEFT: #0076C8 2px dotted; BORDER-BOTTOM: #0076C8 2px dotted; BORDER-COLLAPSE: collapse;margin-bottom: 10px;" borderColor=#0076C8  cellPadding=1 width=100% align=center border=2>
			<TBODY>
				<TR style="text-align: left; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; ">
					<TD>
						<font size="3" style="font-weight: bold">备注：</font><br><span id="beizhu" style="width: 300px;"></span>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		</div>
		<!--  
	
<TABLE style="BORDER-COLLAPSE: collapse; " borderColor=#000000 cellSpacing=0 width=100% align=center bgColor=#ffffff border=1>
<TBODY>
<TR>
<TD height=40>

<TABLE style="BORDER-COLLAPSE: collapse; margin-top: -13px; margin-left: 5px; " borderColor=#000000 cellSpacing=0 width=10% align=left bgColor=#ffffff border=1>
<TBODY>
<TR>
<TD height=10>
日期
</TD></TR>
</TBODY></TABLE>
<TABLE style="BORDER-COLLAPSE: collapse; margin-top: -13px;  margin-left: 5px;" borderColor=#000000 cellSpacing=0 width=89% align=left bgColor=#ffffff border=1>
<TBODY>
<TR>
<TD height=10>
日期
</TD></TR>
</TBODY></TABLE>


</TD></TR>
</TBODY></TABLE>
	
	
	
	<table border="1" width=100%>
		<tr><td rowspan="3" width="10%">第一天</td><td colspan="2">路线</td></tr>
		<tr><td width="%80">新城安排</td><td width="10%"><img id="sanpintupian" alt="点击设定日程图片" width="100%" height="100px" onclick="opentupiandlg()" style=""></td></tr>
		<tr><td>早：午：晚：</td><td>住宿</td></tr>
	</table>
	-->
	
	
			
    <div id="tupianxuanzedlg-buttons">
    	<a id="richeng" href="javascript:void(0)" class="easyui-linkbutton" onclick="saverichengtupian()">保存日程</a>
        <a id="xianlu" href="javascript:void(0)" class="easyui-linkbutton" onclick="savesanpintupian()">保存线路</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#tupianxuanzedlg').dialog('close')">关闭</a>
        <input id="rid" type="hidden">
    </div>
    <div id="tupianxuanzedlg" class="easyui-dialog" title="设定图片" data-options="iconCls:'icon-save',buttons: '#tupianxuanzedlg-buttons',closed:true" style="width:700px;height:400px;padding:10px">
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
    </div>
    <script type="text/javascript">
    $(document).ready(function() {
     	sanpintuanNoload();
     	xingchengload();
     });
     function savesanpintupian(){
     	var row = $('#dgPicManage').datagrid("getSelected");
     	$.ajax({
					url :"fenghuang/upsanpin.do?tuanNo="+'${param.tuanNo}'+"&tupian="+row.url,
					data :'${param.tuanNo}',
					dataType : "json",
					success : function(data) {
						$.messager.alert("成功", "设定图片成功!", "info");
						$('#sanpintupian').attr('src',row.url);
					},
					error : function() {
						$.messager.alert("失败", "设定图片失败!", "error");
					}
				});
     	
     }
     function onOperateStyle(val,row,index){
       var returnStyleValue='<img alt="修改" src="'+row.url+'" width="100px" height="100px">';
       return returnStyleValue;
         }
     
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
					document.getElementById("jiage").innerHTML=data.rows[0].zhikejia;
					document.getElementById("hangkong").innerHTML=data.rows[0].airways;
					document.getElementById("qucheng").innerHTML=data.rows[0].groupflight;
					document.getElementById("huicheng").innerHTML=data.rows[0].Tourflight;
					document.getElementById("ertongzhanchuang").innerHTML=data.rows[0].ertongzhanchuang;
					document.getElementById("ertongbuzhanchuang").innerHTML=data.rows[0].ertongbuzhanchuang;
					document.getElementById("prand").innerHTML=data.rows[0].prand;
					document.getElementById("renqun").innerHTML=data.rows[0].renqun;
					document.getElementById("tedian").innerHTML=data.rows[0].teamexplains;
					document.getElementById("buhan").innerHTML=data.rows[0].Servicesinclude;
					document.getElementById("baohan").innerHTML=data.rows[0].servicenoinclude;
					document.getElementById("beizhu").innerHTML=data.rows[0].beizhu;
					document.getElementById("cantuan").innerHTML=data.rows[0].notes;
					document.getElementById("groupdatebeizhu").innerHTML=data.rows[0].groupdatebeizhu;
					document.getElementById("groupdate").innerHTML=data.rows[0].groupdate;
					document.getElementById("Tourdate").innerHTML=data.rows[0].Tourdate;
					$('#sanpintupian').attr('src',data.rows[0].tupian);
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
						 var app='<table border="1" width=100%>'
						 	+'<tr><td rowspan="3"  width="10%" style="text-align:center;">第'+d+'天</td><td colspan="2"><div id="jtcs'+i+'"></div></td></tr>'
						 		+'<tr><td width="%75">'+data.rows[i].richenganpai+'</td><td width="15%"><img id="sanpintupian" alt="暂无图片" src="'+data.rows[i].richengtupian+'" width="170px" height="120px" onclick="openrichengtupiandlg('+data.rows[i].riid+')" style=""></td></tr>' 

								+''
						 		+'<tr><td>早：'+data.rows[i].zaos+' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;午：'+data.rows[i].zhongs+' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 晚：'+data.rows[i].wans+'</td><td>住宿：'+data.rows[i].jiudian+'</td></tr>'
    							+'</table>';			
						$("#sanpinyou").append(app);
						$('#d'+d).form('load',data.rows[i]);
						$('#jtcs'+i).append(jtapp+"<br>"+data.rows[i].huodong);
						$('fon').attr('margin-top','-10px');
						$('#jtgj'+i).append(feiji+bashi+huoche+youlun);
					} 
					
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
      
      });
  }
  function opentupiandlg(){
  $('#richeng').hide();
  $('#xianlu').show();
  	$('#tupianxuanzedlg').dialog('open');
  }
  function openrichengtupiandlg(riid){
  	$('#xianlu').hide();
  	$('#richeng').show();
  	$('#rid').attr('value',riid);
  	$('#tupianxuanzedlg').dialog('open');
  }
  function saverichengtupian(){
  	var row = $('#dgPicManage').datagrid("getSelected");
  	var riid = $('#rid').val();
     	$.ajax({
					url :"fenghuang/updatericheng.do?riid="+riid+"&richengtupian="+row.url,
					data :riid,
					dataType : "json",
					success : function(data) {
						$.messager.alert("成功", "设定图片成功!", "info");
						$('#tupianxuanzedlg').dialog('close');
					},
					error : function() {
						$.messager.alert("失败", "设定图片失败!", "error");
					}
				});
  }
    </script>
  </body>
</html>
