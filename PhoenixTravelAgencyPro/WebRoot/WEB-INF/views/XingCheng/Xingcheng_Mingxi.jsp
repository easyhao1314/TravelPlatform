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
	<div id="richeng" class="easyui-dialog" title="日程"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:800px;height:300px;padding:10px;">
		<form id="richengFrom" method="post">
        <table>
          <tr>
          <td>id</td>
        <td><input id="riid" name="riid" class="easyui-validatebox"/></td>
             <td>日程</td>
            <td> <input name="richenganpai" class="easyui-validatebox"/></td>
             </tr>
             <tr>
              <td>活动</td> <td><input name="huodong" class="easyui-validatebox"/></td>
               <td>酒店</td> <td><input name="jiudian" class="easyui-validatebox"/></td>
                </tr>
                <tr>
             <td>早餐</td><td><input name="zao" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=22',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>
					<td>午餐</td><td><input name="zhong" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=23',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>
					</tr>
					 <tr>             
					<td>午餐</td><td><input name="wan" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=24',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>
					<td></td>
					</tr>
					<tr>
                <td colspan="4">
                <a href="javascript:richenUpdateSave();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
                <a href="javascript:closedSearch();" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
                </td>
          </tr>
        </table>
       </form>
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
	      
  <!-- 此页面查询的是视图 -->
  <script type="text/javascript">
//页面加载时填充xianlumingxiForm
  $(document).ready(function() {
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
					
					xunhuanRicheng(data.rows[0].xianid);
					//pares方法是 渲染JqueryEasyUi 插件的 解决不显示EasyUi的样式问题
					$.parser.parse();
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
					//循环添加天数
		
					for(var i=0;i<data.rows.length;i++){
						 var d = parseInt(i+1);				
						$("#mdiv").append('<form id="d'+d+'"><table border="1" width="800px" ><tr><td width="100px;"><strong>日期</strong></td><td><strong><a href="javascript:richenganpaiOpen('+data.rows[i].riid+')"  class="easyui-linkbutton" iconCls="icon-add" plain="true"> 日程修改</a></strong><input name="riid" class="easyui-validatebox"></td></tr><tr><td><strong><a href="javascript:void()" class="easyui-linkbutton" iconCls="icon-add" plain="true">第'+d+'天</strong></td><td>日程:<input name="richenganpai" class="easyui-validatebox"><hr />活动:<input name="huodong" class="easyui-validatebox"><hr />酒店:<input name="jiudian" class="easyui-validatebox"><hr />餐饮：早：<input name="zao" class="easyui-validatebox">中：<input name="zhong" class="easyui-validatebox">晚：<input name="wan" class="easyui-validatebox"></td></tr><table></form>');
						 $('#d'+d).form('load',data.rows[i]);
					} 
					//pares方法是 渲染JqueryEasyUi 插件的 解决不显示EasyUi的样式问题
					$.parser.parse();
					//循环结束
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
     }
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
 
  function  richenUpdateSave(){
     $("#richengFrom").form('submit', {
				url : 'fenghuang/updatericheng.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {
					var result = $.parseJSON(data) ;
					if (result.success) {
					  $("#richeng").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
						  $("#mdiv").reload(); 
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
					}
				}
			});
  }
  //修改日程结束
  //保存到行程库开始
  function XingchengkuSave(){
       
  }
  //保存到行程库结束
  </script>
  </body>
</html>
