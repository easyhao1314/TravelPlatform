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
			<td colspan="9" align="center" ><a href="#" class="easyui-linkbutton">保存当前改动</a></td>
			</tr>
			
		</table>
		</form>
	</div>
	
  <div id="mdiv" class="easyui-panel" title="日程信息"
		style="height:auto;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		
		<form action="">
		<table border="1" width="800px">
			<tr>
			<td><strong>日期</strong></td><td><strong>行程   <a href="javascript:();" class="easyui-linkbutton" iconcls="icon-add" plain="true">日行程</a> <a href="javascript:xingcheng();" class="easyui-linkbutton" iconcls="icon-add" plain="true">酒店</a><a href="javascript:xingcheng();" class="easyui-linkbutton" iconcls="icon-add" plain="true">活动</a></strong> </td>
			</tr>
			<strong></strong>
			<tr>
			<td rolspan="4"><strong><a href="javascript:richenganpai()" class="easyui-linkbutton" iconCls="icon-add" plain="true"> 第1天</a></strong>  
    </td><td><strong>交通工具:<a href="javascript:a()" id="mb2" class="easyui-menubutton" data-options="menu:'#mm2',iconCls:'icon-edit'"> 城市</a></strong>  
     <strong><a href="javascript:void(0)" id="mb3" class="easyui-menubutton" data-options="menu:'#mm3',iconCls:'icon-edit'">交通</a></strong>  
     <hr/><strong>活动 :</strong><hr/><strong>酒店: </strong><hr/><strong>餐:&nbsp;&nbsp;
     <a href="javascript:void(0)" id="mb4" class="easyui-menubutton" data-options="menu:'#mm4',iconCls:'icon-edit'">早餐：</a></strong>  
     <strong>&nbsp;&nbsp;<a href="javascript:void(0)" id="mb5" class="easyui-menubutton" data-options="menu:'#mm5',iconCls:'icon-edit'">午餐：</a></strong>  
     <strong>&nbsp;&nbsp;<a href="javascript:void(0)" id="mb6" class="easyui-menubutton" data-options="menu:'#mm6',iconCls:'icon-edit'">晚餐</a></strong>  
     </td>
			</tr>
			<strong></strong>
		</table>
		</form>
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
                <a href="javascript:richenUpdate2();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
                <a href="javascript:closedSearch();" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
                </td>
          </tr>
        </table>
       </form>
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
						$("#mdiv").append('<div id="rixingchengdiv"><form id="d'+d+'"><table border="1" width="800px" ><tr><td width="100px;"><strong>日期</strong></td><td><strong><a href="javascript:richenganpai1('+data.rows[i].riid+')" class="easyui-linkbutton" iconCls="icon-add" plain="true"> 日程修改</a></strong></tr><tr><td><strong><a href="javascript:void()" class="easyui-linkbutton" iconCls="icon-add" plain="true">第'+d+'天</strong></td><td><input name="riid" class="easyui-validatebox">日程:<input name="richenganpai" class="easyui-validatebox"><hr />活动:<input name="huodong" class="easyui-validatebox"><hr />酒店:<input name="jiudian" class="easyui-validatebox"><hr />餐饮：早：<input name="zao" class="easyui-validatebox">中：<input name="zhong" class="easyui-validatebox">晚：<input name="wan" class="easyui-validatebox"></td></tr><table></form></div>');
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
  function richenganpai1(riid){ 
  
  $("#richeng").dialog("open");
  //把对象放到from里面

  $("#riid").val(riid);
  }
  
  function  richenUpdate2(){
     $("#richengFrom").form('submit', {
				url : 'fenghuang/updatericheng.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {//data 是一个字符串  $.ajax(success:function(data):是一个对象)
					console.info(data);
					//var result = val('(' + data + ')');//吧字符串转换为对象
					var result = $.parseJSON(data) ;
					if (result.success) {
					  $("#richeng").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
						  $("#rixingchengdiv").datagrid('reload'); 
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
					}
				}
			});
  }
  //修改日程结束
  </script>
  </body>
</html>
