<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>行程明细</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	    <!-- 添加easyui样式 -->
<link rel="stylesheet" type="text/css"
	href="js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="js/demo/demo.css">
<!-- 这里主要是jquery的js文件  -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/jquery.json.js"></script>

  </head>
  <body>
  <div class="easyui-panel" title="线路基本信息"
		style="height:auto;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<form id="xianlumingxiForm" >
		<table>
			<tr>
				<td><div class="fitem">
						<strong><label>线路编号:</label></strong>
				</td>
				<td><strong><input name="xianid" onfocus=this.blur() class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>线路名称:</label></strong>
				</td>
				<td><strong><input name="xianluname" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>国家数:</label></strong>
				</td>
				<td><strong><input name="guojia" class="easyui-validatebox"></strong>
					
				</td>

				<td><div class="fitem">
						<strong><label>天数:</label></strong>
				</td>
				<td><strong><input name="tianshu" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>维护人:</label></strong>
				</td>
				<td><strong><input name="weihuren" class="easyui-validatebox"></strong>
					
				</td>
			</tr>
			<tr>
			<td colspan="9" align="center" ><a href="javascript:saveUpdateXianlu();" class="easyui-linkbutton">保存当前改动</a></td>
			</tr>
			
		</table>
		</form>
	</div>
	
  <div id="mdiv" class="easyui-panel" title="日程信息"
		style="height:auto;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
	
	</div>
	
   
    <div class="easyui-panel" title="工具"
		style="height:300px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="left">
		<table>
		
			<tr>
				<td><div class="fitem">
						<label> 行程:</label>
				</td>
				<td>
				 <a href="javascript:XingchengkuSave();" class="easyui-linkbutton" iconCls="icon-ok">保存到行程库</a>
				</td>
			</tr>
		</table>
	</div>	  
	 <div id="richengdlg" class="easyui-dialog" title="设定日程"  data-options="iconCls:'icon-save',closed:true,modal:true,buttons: 
	 			[{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
                        richenUpdateSave();
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        closeDialog();
                    }
                }]" style="width:700px;height:400px;padding:10px">
        <span>日程安排(少于800汉字)</span>
        <textarea id="richengtext" name="message"  style="height:300px; width: 600px;"></textarea>
    </div>
    
     <div id="huodongdlg" class="easyui-dialog" title="活动设定"  data-options="iconCls:'icon-save',closed:true,modal:true,buttons: 
	 			[{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
                    richenUpdateSave();
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                    closeDialog();
                    }
                }]" style="width:400px;height:300px;padding:10px">
        <span>活动安排(少于800汉字)</span>
        <input id="riid" style="display: none;">
        <input id="can">
        <textarea id="huodongtext" name="message"  style="height:200px; width: 300px;"></textarea>
    </div>
    <div id="jiaotongchengshidlgmenu" style="padding:2px 0">
        <table style="width:100%">
            <tr>
                <td style="padding-left:2px;">
                	<a href="javascript:Addjiaotong(':^1')" title="飞机"  style=" height: 20px; width: 20px; margin-top:2px;  display:block;  background-image: url('Image/feiji.png'); float: left;" ></a> 
                	<a href="javascript:Addjiaotong(':^2')" title="游轮" style=" height: 20px; width: 20px; margin-top:2px;  display:block;  background-image: url('Image/youlun.png'); float: left;"></a>
                    <a href="javascript:Addjiaotong(':^3')" title="火车" style=" height: 20px; width: 20px; margin-top:2px;  display:block;  background-image: url('Image/huoche.png'); float: left;"></a>
                    <a href="javascript:Addjiaotong(':^4')" title="居住" style=" height: 20px; width: 20px; margin-top:2px;  display:block;  background-image: url('Image/juzhu.png'); float: left;"></a>
                    <a href="javascript:Addjiaotong(':^5')" title="巴士" style=" height: 20px; width: 20px; margin-top:2px;  display:block;  background-image: url('Image/bashi.png'); float: left;"></a>
                </td>
                <td style="text-align:right;padding-right:2px">
                    <input id="csselect" class="easyui-searchbox"  data-options="prompt:'在此处搜索城市',searcher:selectchengshi" style="width:150px"></input>
                </td>
            </tr>
        </table>
        </div>
   

<!-- 设定城市 交通 dlg！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！ -->
<div id="csjiaotongdlg" class="easyui-dialog" title="设定城市和交通工具" Toolbar="#jiaotongchengshidlgmenu"  style="width:560px;height:360px;padding:10px"
            data-options="
                closed:true,
                modal:true,buttons: 
	 			[{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
                    updatejiaotongchengshi();
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                    closeDialog();
                    }
                }]
            ">
            <div id="divdlg"></div>
            <div id="showdivdlg" style="width: auto;  margin-top:30px; height:50px;  line-height:20px; background-color: yellow;">日程安排走向：</div>
            <input id="chengshijiaotong"  style="display: none;" />
            <input id="chengshijiaotongriid" style="display: none;">
    </div>
    
        <script type="text/javascript">
        function selectchengshi(getValue){
        var jtapp="";
        document.getElementById("divdlg").innerHTML="";
        var url="fenghuang/getDictionaryDescs2.do?dicType=8&dicName="+getValue;
        	$.ajax({
					url :url,
					data :getValue,
					dataType : "json",
					success : function(data) {
					for(var i=0;i<data.rows.length;i++){
					jtapp+='<a href="javascript:Addjiaotong(\''+data.rows[i].dicName+'\')" title="'+data.rows[i].dicName+'" style=" text-decoration:none;" >'+data.rows[i].dicName+'</a>&nbsp;&nbsp;&nbsp;&nbsp;';
					 
					}
						$('#divdlg').append(jtapp);
					
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
        	
        }
        
        
        </script>
<script type="text/javascript">
	function updatejiaotongchengshi(){
	var riid = $('#chengshijiaotongriid').val();
	var url = 'fenghuang/updatericheng.do?riid='+riid+'&jiaotongchengshi='+jtgj;
	$.ajax({
					url : url,
					data : riid,
					dataType : "json",
					success : function(data) {
					document.getElementById("mdiv").innerHTML="";
						xunhuanRicheng('${param.xianid}');
					$.messager.alert("保存成功", "保存成功!", "info");
					},
					error : function() {
					$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
	}
	
	//交通和城市全局变量
	var jtgj='';
	function Addjiaotong(jt){
	
	if(jt==':^1'){
	$('#showdivdlg').append('<img src="Image/feiji.png" style="line-height:20px;" />');
	jtgj+=jt;
	}
	if(jt==':^2'){
	$('#showdivdlg').append('<img src="Image/youlun.png" />');
	jtgj+=jt;
	}
	if(jt==':^3'){
	$('#showdivdlg').append('<img src="Image/huoche.png" />');
	jtgj+=jt;
	}
	if(jt==':^4'){
	$('#showdivdlg').append('<img src="Image/juzhu.png" />');
	jtgj+=jt;
	}
	if(jt==':^5'){
	$('#showdivdlg').append('<img src="Image/bashi.png" />');
	jtgj+=jt;
	}
	if(jt!=':^1'&&jt!=':^2'&&jt!=':^3'&&jt!=':^4'&&jt!=':^5'){
	$('#showdivdlg').append('<a href="javascript:void(0)">'+jt+'</a>');
	var fenge = ':';
	fenge+=jt;
	jtgj+=fenge;
	
	}
	$('#chengshijiaotong').val(jtgj);
	
	}
	//打开DLG
	function chengshijiaotongdlgOpen(riid){
	
	$('#chengshijiaotong').val("");
	jtgj='';
	$('#chengshijiaotongriid').val(riid);
	document.getElementById("showdivdlg").innerHTML="";
	$('#csjiaotongdlg').dialog('open');
	
	
	}
	
</script>

  <script type="text/javascript">
//页面加载时填充xianlumingxiForm
  $(document).ready(function() {
  $('#csjiaotongdlg').attr('Toolbar','#jiaotongchengshidlgmenu');
  	
	
  
  
  
 	var param = {
					"xianid" :  '${param.xianid}'
				};
		$.ajax({
					url :'fenghuang/xianluinfo.do',
					data :param,
					dataType : "json",
					success : function(data) {
					//循环添加天数
					
					$('#xianlumingxiForm').form('load',data.rows[0]);
					
					xunhuanRicheng('${param.xianid}');
					//pares方法是 渲染JqueryEasyUi 插件的 解决不显示EasyUi的样式问题
					//$.parser.parse("#mdiv");

					//循环结束
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
				
				
  });
 
  //页面加载时填充xianlumingxiForm结束
  //保存当前改动方法开始
  function saveUpdateXianlu(){
     $('#xianlumingxiForm').form('submit',{
        url:'fenghuang/updateXianluSave.do',
         onSubmit : function() {
					return $(this).form('validate');
				},
         success : function(data) {
					var result = $.parseJSON(data) ;
           if(result.success){      
           	 
             $.messager.alert("保存修改成功","保存成功","info");
           }else{
              $.messager.alert("保存修改失败","保存失败","error");
           }
        }
     });
     
  }
  //保存当前改动方法结束
  
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
						 var zao = "fenghuang/getDicByTypeComboboxs.do?dicType=22";
						 var zhong = "fenghuang/getDicByTypeComboboxs.do?dicType=23";
						 var wan = "fenghuang/getDicByTypeComboboxs.do?dicType=24";
						 var app='<form id="d'+d+'">'
						 +'<table border="1" width="800px" >'
						 	+'<tr><td width="100px;"><strong>日期</strong></td>'
						 		+'<td valign="middle"><div id="jtcs'+i+'" style="height:20px; backaground-color:yellow"></div><a href="javascript:richenganpaiOpen()"  class="easyui-linkbutton" style="float: right;" iconCls="icon-add" plain="true">酒店</a><a href="javascript:openhuodongDialog(\''+data.rows[i].huodong+'\','+data.rows[i].riid+')"  class="easyui-linkbutton" style="float: right;" iconCls="icon-add" plain="true">活动</a><a  href="javascript:openrichengDialog(\''+data.rows[i].richenganpai+'\','+data.rows[i].riid+')"   class="easyui-linkbutton"   style="float: right;" iconCls="icon-add" plain="true">日程</a></td>'
						 	+'</tr>'
						 	+'<tr><td> <a href="javascript:chengshijiaotongdlgOpen('+data.rows[i].riid+')" title="设定当天的交通工具和城市" class="easyui-linkbutton" plain="true" iconCls="icon-reload">第'+d+'天</a></td><td><h4>日程:</h4> <span>'+data.rows[i].richenganpai+'</span><hr /><h4>活动:</h4> <span>'+data.rows[i].huodong+'</span><hr /><h4>酒店:</h4> <span>'+data.rows[i]+'</span><hr />餐饮：<input name="zao" class="easyui-combobox" data-options="url:\''+zao+'\',valueField:\'dicNo\',textField:\'dicName\',panelHeight:\'auto\',editable:false,onSelect:function(rel){funcanyin(rel,'+data.rows[i].riid+',\'zao\');}" > 中：<input name="zhong" class="easyui-combobox" data-options="url:\''+zhong+'\',valueField:\'dicNo\',textField:\'dicName\',panelHeight:\'auto\',editable:false,onSelect:function(rel){funcanyin(rel,'+data.rows[i].riid+',\'zhong\');}" >晚：<input id="wan" name="wan"  class="easyui-combobox" data-options="url:\''+wan+'\',valueField:\'dicNo\',textField:\'dicName\',panelHeight:\'auto\',editable:false,onSelect:function(rel){funcanyin(rel,'+data.rows[i].riid+',\'wan\');}"></td></tr>'
						 +'<table></form>';			
						$("#mdiv").append(app);
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

function funcanyin(rel,riid,type){
	var url = 'fenghuang/updatericheng.do?riid='+riid+'&'+type+'='+rel.dicNo;
	$.ajax({
					url : url,
					data : rel.dicNo,
					dataType : "json",
					success : function(data) {
					$('#wan').combobox('reload'); 
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
}

  
  
  
  //修改日程开始
  function richenganpaiOpen(riid){ 

  $("#richeng").dialog("open");
  //把对象放到from里面
  var param={
      "riid":riid
     };
  $.ajax({
      url:'fenghuang/selectricheng.do',
      data:param,
      dataType:"json",
      success:function(data){
       $('#richengFrom').form('load',data.rows[0]);
      }
   });

  }
 
function closedSearch(){
  $("#richeng").dialog("close");
}
 
  function richenUpdateSave(){
  var riid = $('#riid').val();
  var richengtext = $('#richengtext').val();
  var huodongtext = $('#huodongtext').val();
  var param = {
					"riid" : riid,
					"huodong":huodongtext,
					"richenganpai" :richengtext
				};
    	var  url = "fenghuang/updatericheng.do?";
    	 $.ajax({
					url :url,
					data : param,
					dataType : "json",
					success : function(data) {
						$.messager.alert("保存成功","保存成功","info");
						document.getElementById("mdiv").innerHTML="";
						xunhuanRicheng('${param.xianid}');
						$('#richengtext').val("");
						$('#huodongtext').val("");
					},
					error : function() {
						$.messager.alert("保存失败", "服务器请求失败!", "error");
					}
				});
  }
  //修改日程结束
  //保存到行程库开始
  function XingchengkuSave(){
       
  }
  //保存到行程库结束
  </script>
  <script type="text/javascript">
  	function openrichengDialog(richeng,riid){
  	$('#riid').attr('value',riid);
  	var a=document.getElementById("richengtext");
  	a.value=richeng;
  	$('#richengdlg').dialog('open');
    }
  	function closeDialog() {
	$('#richengdlg').dialog('close');
	$('#huodongdlg').dialog('close');
	$('#richengtext').val("");
	$('#huodongtext').val("");
	$('#csjiaotongdlg').dialog('close');
	}
	function openhuodongDialog(huodong,riid){
	$('#riid').attr('value',riid);
	var huo=document.getElementById("huodongtext");
  	huo.value=huodong;
	$('#huodongdlg').dialog('open');
	}
	function openjiaotongdlg(){
	$('#csjiaotongdlg').dialog('open');
	}
  </script>
  </body>
</html>
