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

	<div class="easyui-panel" title="团队信息"
		style="height:120px;padding:10px;width:auto;"
		 align="center">
		<form id="mingxiForm" >
		<table>
			<tr>
				<td>
						<label>团号:</label>
				</td>
				<td>
				<input name="tuanNo"  class="easyui-validatebox">
				</td>
				<td>
						<label>团队名称:</label>
				</td>
				<td><input name="tuanName" class="easyui-validatebox">
					
				</td>
				<td>
						<label>团队状态:</label>
				</td>
				<td><input name="Reviewstatus" class="easyui-validatebox">
					
				</td>
				<td>
						<label>出团日期:</label>
				</td>
				<td><input name="groupdate" class="easyui-validatebox">
					
				</td>
				<td>
						<label>同行价:</label>
				</td>
				<td><input name="tonghang" class="easyui-validatebox">
					
				</td>
			</tr>

			<tr>
			<td>
						<label>自备签价:</label>
				</td>
				<td><input name="zibeiqianjia" class="easyui-validatebox">
				</td>
				<td>
						<label>预售人数:</label>
				</td>
				<td><input name="numbermaster" class="easyui-validatebox">
				
				</td>
				<td>
						<label>已报名数:</label>
				</td>
				<td><input name="ycbjNo" class="easyui-validatebox">
					
				</td>
				<td>
						<label>确认人数:</label>
				</td>
				<td><input name="tdjb" class="easyui-validatebox">
				
				</td>
				<td>
						<label>备注:</label>
				</td>
				<td ><input name="tsDesc" class="easyui-validatebox">
					
				</td>
			</tr>
		</table>
		</form>
	</div>



<div style="margin:10px 0;"></div>
<div class="easyui-tabs"  style="height:auto;width: 1200px;">
<div title="团队行程" style="padding:10px">
 
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
<div title="收客明细" style="padding:10px">
   <div id="tb">
  	    <a href="javascript:Select();" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true">转团申请</a>
		<a href="javascript:Select();" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true">退团申请</a>
		<a href="javascript:Select();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">添加客户</a>
		<a href="javascript:Select();" class="easyui-linkbutton"
			iconCls="icon-cut" plain="true">删除客户</a>
		<a href="javascript:Select();" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">保存</a>
	</div>

</div>
<!-- 

 -->
<div title="报名列表" style="padding:10px">
<table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/Sanpinliebiao.do?Reviewstatus=1'"
		pagination="true" toolbar="#tb">
		<thead>
			<tr> 	
				<th data-options="field:'tuanNo'" width="50">团号</th>
				<th data-options="field:'groupdate'" width="50">出团日期</th>
				<th data-options="field:'Tourdate'" width="50">回团日期</th>
				<th data-options="field:'targetpopulation'" width="50">出发城市</th>
				<th data-options="field:'tonghang'" width="50">同行价</th>
				<th data-options="field:'zhikejia'" width="50">直客价</th>
				<th data-options="field:'numbermaster'" width="50">预收人数</th>
				<th data-options="field:'productbrand',hidden:true" width="50">产品品牌_隐藏的</th>
			</tr>
		</thead>
	</table>
</div>
<div title="财务情况" style="padding:10px">

</div>
</div>
 <script type="text/javascript">
           var tuanNo = '${param.tuanNo}';
         var  url = "fenghuang/Sanpinliebiao.do?tuanNo="+'${param.tuanNo}';
           $.ajax({
					url :url,
					data : tuanNo,
					dataType : "json",
					success : function(data) {
					$('#mingxiForm').form('load',data.rows[0]);
					//$('#mingxiForm').form('load',data.rows[0]);
					//alert(data.rows[0].tuanNo);
					
					   //$('#mingxiForm').form('load',rows[0]);

					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
     

 
 
 
 
 
 
 </script>

  </body>
</html>
