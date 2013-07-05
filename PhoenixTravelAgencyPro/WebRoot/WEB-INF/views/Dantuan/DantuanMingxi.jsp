<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" type="text/css"
	href="js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="js/demo/demo.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/jquery.json.js"></script>

</head>

<body>
	<div class="easyui-panel" title="客户信息"
		style="height:80px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<table>
			<tr>
				<td><div class="fitem">
						<label>客户:</label>
				</td>
				<td><input name="currencyShort" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>联系人:</label>
				</td>
				<td><input name="currencyShort" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>电话:</label>
				</td>
				<td><input name="currencyName" class="easyui-validatebox">
					</div>
				</td>
			</tr>
		
		</table>
	</div>

	</div>

		<div class="easyui-panel" title="团队信息和接待要求"
		style="height:150px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<table>
			<tr>
				<td><div class="fitem">
						<label>团号:</label>
				</td>
				<td><input name="currencyShort" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>团队名称:</label>
				</td>
				<td><input name="currencyShort" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>出团日期:</label>
				</td>
				<td><input name="currencyName" class="easyui-validatebox">
					</div>
				</td>
			</tr>
			<tr>
				<td><div class="fitem">
						<label>酒店标准:</label>
				</td>
				<td><input name="currencyShort" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>用餐标准:</label>
				</td>
				<td><input name="currencyShort" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>交通:</label>
				</td>
				<td><input name="currencyName" class="easyui-validatebox">
					</div>
				</td>
			</tr>
			<tr>
				<td><div class="fitem">
						<label>特殊要求:</label>
				</td>
				<td colspan="5"><input name="currencyShort" class="easyui-validatebox">
					</div>
				</td>
				
			</tr>

		</table>
	</div>
	<div class="easyui-panel" title="行程设计"
		style="height:150px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<table>
			<tr>
			<td><div class="fitem">
						<label>团号:</label>
				</td>
				<td><input name="currencyShort" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>团名:</label>
				</td>
				<td><input name="currencyShort" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>路线名称:</label>
				</td>
				<td><input name="currencyShort" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>旅游国家数:</label>
				</td>
				<td><input name="currencyShort" class="easyui-validatebox">
					</div>
				</td>
				</tr>
				
				<tr>
				
				<td><div class="fitem">
						<label>全程天数:</label>
				</td>
				<td><input name="currencyName" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>出团人数:</label>
				</td>
				<td><input name="currencyName" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>出团日期:</label>
				</td>
				<td><input name="currencyName" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>选择国家:</label>
				</td>
				<td><input name="currencyName" class="easyui-validatebox">
					</div>
				</td>
			</tr>
		
		</table>
	 </div>
 
       <div class="easyui-panel" title="日程设置"
		style="height:350px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="left">
		<table border="1" width="800">
			<tr>
			<td>日期</td><td>行程   <a href="javascript:xingcheng();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">日行程</a> <a href="javascript:xingcheng();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">酒店</a><a href="javascript:xingcheng();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">活动</a> </td>
			</tr>
			<tr>
			<td rolspan="4"><a href="javascript:void(0)" id="mb" class="easyui-menubutton"   
        data-options="menu:'#mm',iconCls:'icon-edit'"> 第1天</a>  
     <div id="mm" style="width:150px;">  
    <div >前加一天</div>  
    <div >后加一天</div>  
    <div>删除当天</div>  
    <div>设定城市</div>  
    <div>当天行程地图</div>   
    <div >地图乘车路线</div>  
    <div>推荐为公共日行程</div>  
     </div> </td><td>交通工具:<a href="javascript:void(0)" id="mb2" class="easyui-menubutton"   
        data-options="menu:'#mm2',iconCls:'icon-edit'"> 城市</a>  
     <div id="mm2" style="width:150px;">  
    <div >当天居住</div>  
    <div >删除</div>  
    <div>之前插入城市</div>  
    <div>之后插入城市</div>  
    <div>乘坐巴士</div>   
    <div >乘坐飞机</div>  
    <div>乘坐游轮</div>  
    <div>设为入境城市</div>   
    <div >设为出境城市</div>  
    <div>城市地图资源</div> 
     </div>
     <a href="javascript:void(0)" id="mb3" class="easyui-menubutton"   
        data-options="menu:'#mm3',iconCls:'icon-edit'">交通</a>  
     <div id="mm3" style="width:150px;">  
    <div>之前插入城市</div>  
    <div>之后插入城市</div>  
    <div >删除</div>    
    <div >设置断开</div>    
     </div><hr/> 活动 :<hr/>酒店: <hr/>餐:&nbsp;&nbsp; <a href="javascript:void(0)" id="mb4" class="easyui-menubutton"   
        data-options="menu:'#mm4',iconCls:'icon-edit'">早餐：</a>  
     <div id="mm4" style="width:150px;">  
    <div>自理</div>  
    <div>酒店内美式大陆早餐</div>  
    <div >中式简餐送入房间</div>
    <div >中式简餐</div>    
    <div >酒店外自助早餐</div>    
     </div>&nbsp;&nbsp;<a href="javascript:void(0)" id="mb5" class="easyui-menubutton"   
        data-options="menu:'#mm5',iconCls:'icon-edit'">午餐：</a>  
     <div id="mm5" style="width:150px;">  
    <div>自理</div>  
    <div>四菜一汤</div>  
    <div >六菜一汤</div>
    <div >中式简餐</div>    
    <div >酒店外自助午餐</div>    
     </div>&nbsp;&nbsp;<a href="javascript:void(0)" id="mb6" class="easyui-menubutton"   
        data-options="menu:'#mm6',iconCls:'icon-edit'">晚餐</a>  
     <div id="mm6" style="width:150px;">  
    <div>自理</div>  
    <div>四菜一汤</div>  
    <div >六菜一汤</div>
    <div >中式简餐</div>    
    <div >酒店外自助晚餐</div>    
     </div></td>
			
		</table>
	 </div> 
	 
	 
	 <div class="easyui-panel" title="成本设置"
		style="height:80px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="left">
		<table>
			<tr>
				<td><div class="fitem">
						<label>核算:</label>
				</td>
				<td>
				 <a href="javascript:dantuanSave();" class="easyui-linkbutton" iconCls="icon-ok">手动核算</a>
				</td>
			</tr>
		</table>
	</div>
	 <div class="easyui-panel" title="工具"
		style="height:300px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="left">
		<table>
			<tr>
				<td><div class="fitem">
						<label>团队:</label>
				</td>
				<td>
				 <a href="javascript:dantuanSave();" class="easyui-linkbutton" iconCls="icon-ok">申请团号</a>
				 				 <a href="javascript:dantuanSave();" class="easyui-linkbutton" iconCls="icon-ok">查看行程地图</a>
				 				 				 <a href="javascript:dantuanSave();" class="easyui-linkbutton" iconCls="icon-ok">提交到行程库</a>
				 				 				 				 <a href="javascript:dantuanSave();" class="easyui-linkbutton" iconCls="icon-ok">Doc行程输出</a>
				 				 				 				 <a href="javascript:dantuanSave();" class="easyui-linkbutton" iconCls="icon-ok">输出报价单</a>
				 				 				 				 				 <a href="javascript:dantuanSave();" class="easyui-linkbutton" iconCls="icon-ok">转计调报价</a>
				</td>
			</tr>
			<tr>
				<td><div class="fitem">
						<label>酒店:</label>
				</td>
				<td>
				 <a href="javascript:dantuanSave();" class="easyui-linkbutton" iconCls="icon-ok">订房派单</a>
				</td>
			</tr>
			<tr>
				<td><div class="fitem">
						<label>巴士:</label>
				</td>
				<td>
				 <a href="javascript:dantuanSave();" class="easyui-linkbutton" iconCls="icon-ok">订车派单</a>
				</td>
			</tr>
			<tr>
				<td><div class="fitem">
						<label>导游:</label>
				</td>
				<td>
				 <a href="javascript:dantuanSave();" class="easyui-linkbutton" iconCls="icon-ok">导游派单</a>
				 <a href="javascript:dantuanSave();" class="easyui-linkbutton" iconCls="icon-ok">安排导游</a>
				</td>
			</tr>
			<tr>
				<td><div class="fitem">
						<label>购物:</label>
				</td>
				<td>
				 <a href="javascript:dantuanSave();" class="easyui-linkbutton" iconCls="icon-ok">派购物店单</a>
				</td>
			</tr>
		</table>
	</div>	  
	 
	 <div id="xingcheng" class="easyui-dialog" title="设定日程"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:200px;padding:10px;">
		<form id="xingchengForm" method="post">
			<table align="center">
				<tr>
				<td><div class="fitem"><label>行程设定:</label></td>
				<td><input name="khId" class="easyui-validatebox" required="true"  size="80"></div></td>
               </tr>
         <tr><td colspan="2" align="center">
       <a href="javascript:xingchengSave();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
       <input  type="reset" value="重置"></td>
      </tr>
				</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div> 
    <script type="text/javascript">
    $('#mb').menubutton({  
    iconCls: 'icon-edit',  
    menu: '#mm'  
});
    $('#mb2').menubutton({  
    iconCls: 'icon-edit',  
    menu: '#mm2'  
});  
    $('#mb3').menubutton({  
    iconCls: 'icon-edit',  
    menu: '#mm3'  
});  
    $('#mb4').menubutton({  
    iconCls: 'icon-edit',  
    menu: '#mm4'  
});  
    $('#mb5').menubutton({  
    iconCls: 'icon-edit',  
    menu: '#mm5'  
});  
 
 //新增
		function xingcheng() {
			$("#xingcheng").dialog("open");
			$("#xingchengForm").form("clear");
		}  
    </script>
  </body>
</html>
