<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
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
    <title>新建散拼</title>
    
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
   <div style="background:#fafafa;padding:10px;width:10	00px;height:300px;">
  <form id="ff" method="post">
  <div >
  <h4><p>基础信息</p></h4> 
  <table style="" >
  	<tr><td>价格体系（RMB）：</td>
  	<td>审批价：</td><td><input class="easyui-validatebox" type="text" name="name" style="width: 50px; height: 15px;"></input></td>
  	<td>大客户：</td><td><input class="easyui-validatebox" type="text" name="name" style="width: 50px; height: 15px;"></input></td>
  	<td>直客：</td><td><input class="easyui-validatebox" type="text" name="name" style="width: 50px; height: 15px;"></input></td>
  	<td>同行：</td><td><input class="easyui-validatebox" type="text" name="name" style="width: 50px; height: 15px;"></input></td>
  	<td>儿童站床：</td><td><input class="easyui-validatebox" type="text" name="name" style="width: 50px; height: 15px;"></input></td>
 	<td>儿童不占床：</td><td><input class="easyui-validatebox" type="text" name="name" style="width: 50px; height: 15px;"></input></td>
 	<td>自备签价：</td><td><input class="easyui-validatebox" type="text" name="name" style="width: 50px; height: 15px;"></input></td>
  	</tr>
  </table>
  <table>
   	<tr>
  	<td>出团计划名称：</td><td><input class="easyui-validatebox" type="text" name="name" required="true"></input></td>
  	<td></td><td></td>
  	<td>出团计划编号：</td><td><input class="easyui-validatebox" type="text" name="number" ></input></td>
  	</tr>
  	<tr>
  	<td>全程天数：</td><td><input id="ss" class="easyui-numberspinner" min="1" max="100" required="true" style="width:133px;"></input></td>
  	<td></td><td></td>
  	<td>全程国家数：</td><td><input id="ss" class="easyui-numberspinner" min="1" max="100" required="true" style="width:133px;"></input></td>
  	</tr>
  	<tr>
  	<td>出团日期：</td><td><input id="dd" class="easyui-datebox" required="true"></input></td>
  	<td></td><td></td>
  	<td>预收人数：</td><td><input id="ss" class="easyui-numberspinner" min="1" max="100" required="true" style="width:133px;"></input></td>
  	</tr>
  	  	<tr>
  	<td>回团日期：</td><td><input id="dd" class="easyui-datebox" required="true"></input></td>
  	<td></td><td></td>
  	<td>地域类型：</td><td><input class="easyui-combobox" 
			name="language"
			data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=12',
					valueField:'dicId',
					textField:'dicName',
					panelHeight:'auto'
			">
	</td>
  	</tr>
  	  	<tr>
  	<td>航空公司：</td><td><input class="easyui-validatebox" type="text" name="name"></input></td>
  	<td></td><td></td>
  	<td>目标人群：</td><td><select id="cc" class="easyui-combobox" name="state" style="width:133px;" required="true">
		<option value="AL">新婚夫妇</option>
		<option value="AK">退休老人</option>
		<option value="AZ">在校学生</option>
	</select></td>
  	</tr>
  	  	
  	  	<tr>
  	<td>去程航班：</td><td><input class="easyui-validatebox" type="text" name="name"></input></td>
  	<td></td><td></td>
  	<td>出发城市：</td><td><select id="cc" class="easyui-combobox" name="state" style="width:133px;" required="true">
		<option value="AL">北京</option>
		<option value="AK">天津</option>
		<option value="AZ">上海</option>
	</select></td>
  	</tr>
  	  	<tr>
  	<td>回程航班：</td><td><input class="easyui-validatebox" type="text" name="name"></input></td>
  	<td></td><td></td>
  	<td>终点城市：</td><td><select id="cc" class="easyui-combobox" name="state" style="width:133px;" required="true">
		<option value="AL">上海</option>
		<option value="AK">天津</option>
		<option value="AZ">北京</option>
	</select></td>
  	</tr>
  	  	<tr>
  	<td>酒店标准：</td><td>
  	<select id="cc" class="easyui-combobox" name="state" style="width:133px;" required="true">
		<option value="AL">三星级</option>
		<option value="AK">四星级</option>
		<option value="AZ">五星级</option>
	</select>
	</td>
  	<td></td><td></td>
  	<td>产品类型：</td><td><select id="cc" class="easyui-combobox" name="state" style="width:133px;" required="true">
		<option value="AL">亲子游</option>
		<option value="AK">休闲游</option>
		<option value="AZ">自由行</option>
	</select></td>
  	</tr>
  	  	<tr>
  	<td>用餐标准：</td><td><select id="cc" class="easyui-combobox" name="state" style="width:44px;">
		<option value="AL">早</option>
		<option value="AK">自理</option>
		<option value="AZ">中式</option>
	</select>
	<select id="cc" class="easyui-combobox" name="state" style="width:44px;">
		<option value="AL">中</option>
		<option value="AK">自理</option>
		<option value="AZ">中式</option>
	</select>
	<select id="cc" class="easyui-combobox" name="state" style="width:44px;">
		<option value="AL">晚</option>
		<option value="AK">自理</option>
		<option value="AZ">中式</option>
	</select>
	
	</td>
  	<td></td><td></td>
  	<td>产品品牌：</td><td><select id="cc" class="easyui-combobox" name="state" style="width:133px;" required="true">
		<option value="AL">经典东欧</option>
		<option value="AK">纯西欧</option>
		<option value="AZ">Arizona</option>
	</select></td>
  	</tr>
  </table>
  </div>
  
  <div>
  <h4><p>出境团基础信息</p></h4>
    预警人数<input class="easyui-validatebox" type="text" name="name" style=" "></input>
  报警人数<input class="easyui-validatebox" type="text" name="name" style=" "></input>
  需办签证<select id="cc" class="easyui-combobox" name="state" style="width: 100px;">
		<option value="AL">是</option>
		<option value="AK">否</option>
	</select>
  </div>
        <div>
        <h4><p>扩展信息</p></h4>
     团队特色说明：
   <br>
   <textarea name="message" style="height:60px; width: 500px;"></textarea>
   <br>
   服务包含： 
   <br>      
   <textarea name="message" style="height:60px; width: 500px;"></textarea>
   <br>
   服务不含： 
   <br>      
   <textarea name="message" style="height:60px; width: 500px;"></textarea>
   <br>  
   服务不含： 
   <br>      
   <textarea name="message" style="height:60px; width: 500px;"></textarea>
   <br>
  <a  class="easyui-linkbutton" >保存</a><a  class="easyui-linkbutton" >重置</a>
        </div>
       
    </form>
</div>
  </body>
</html>
