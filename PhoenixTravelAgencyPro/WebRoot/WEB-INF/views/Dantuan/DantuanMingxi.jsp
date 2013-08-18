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
		style="height:180px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<form id="mingxiForm" >
		<table>
			<tr>
				<td><div class="fitem">
						<strong><label>客户:</label></strong>
				</td>
				<td><strong><input name="khId" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>联系人:</label></strong>
				</td>
				<td><strong><input name="tdjb" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>电话:</label></strong>
				</td>
				<td><strong><input name="tdjb" class="easyui-validatebox"></strong>
					
				</td>
			</tr>
		<tr>
				<td><div class="fitem">
						<strong><label>团号:</label></strong>
				</td>
				<td><strong><input name="tuanNo" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>团队名称:</label></strong>
				</td>
				<td><strong><input name="tdm" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>出团日期:</label></strong>
				</td>
				<td><strong><input name="ctsj" class="easyui-validatebox"></strong>
					
				</td>
			</tr>
			<tr>
				<td><div class="fitem">
						<strong><label>酒店标准:</label></strong>
				</td>
				<td><strong><input name="jdbzNo" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>用餐标准:</label></strong>
				</td>
				<td><strong><input name="ycbjNo" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>交通:</label></strong>
				</td>
				<td><strong><input name="tdjb" class="easyui-validatebox"></strong>
					
				</td>
			</tr>
			<tr>
				<td><div class="fitem">
						<strong><label>特殊要求:</label></strong>
				</td>
				<td colspan="5"><strong><input name="tsDesc" class="easyui-validatebox"></strong>
					
				</td>
				
			</tr>
		
		</table>
		</form>
	</div>

	

	 <div class="easyui-tabs"  style="width:1000px;height:800px;">      
    <div title="行程设计" style="padding:10px;">  
	<div class="easyui-panel" title="行程属性"
		style="height:150px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<form id="" >
		<table>
			<tr>
			<td><div class="fitem">
						<strong><label>团号:</label></strong>
				</td>
				<td><strong><input name="tuanNO" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>团名:</label></strong>
				</td>
				<td><strong><input name="tdm" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>路线名称:</label></strong>
				</td>
				<td><strong><input name="currencyShort" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>旅游国家数:</label></strong>
				</td>
				<td><strong><input name="currencyShort" class="easyui-validatebox"></strong>
					
				</td>
				</tr>
				
				<tr>
				
				<td><div class="fitem">
						<strong><label>全程天数:</label></strong>
				</td>
				<td><strong><input name="cfts" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>出团人数:</label></strong>
				</td>
				<td><strong><input name="cfrs" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>出团日期:</label></strong>
				</td>
				<td><strong><input name="ctsj" class="easyui-validatebox"></strong>
					
				</td>
				<td><div class="fitem">
						<strong><label>选择国家:</label></strong>
				</td>
				<td><strong><input name="cfgj" class="easyui-validatebox"></strong>
					
				</td>
			</tr>
		
		</table>
		</form>
	 </div>

          <div class="easyui-panel" title="日程设置"
		style="height:350px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="left">
		<table border="1" width="800">
			<tr>
			<td><strong>日期</strong></td><td><strong>行程   <a href="javascript:xingcheng();" class="easyui-linkbutton" iconcls="icon-add" plain="true">日行程</a> <a href="javascript:xingcheng();" class="easyui-linkbutton" iconcls="icon-add" plain="true">酒店</a><a href="javascript:xingcheng();" class="easyui-linkbutton" iconcls="icon-add" plain="true">活动</a></strong> </td>
			</tr>
			<strong><%for(int i=1;i<=2;i++){ %></strong>
			<tr>
			<td rolspan="4"><strong><a href="javascript:void(0)" id="mb" class="easyui-menubutton" data-options="menu:'#mm',iconCls:'icon-edit'"> 第<%=i%>天</a></strong>  
     <div id="mm" style="width:150px;">  
    <div ><strong>前加一天</strong></div>  
    <div ><strong>后加一天</strong></div>  
    <div><strong>删除当天</strong></div>  
    <div><strong>设定城市</strong></div>  
    <div><strong>当天行程地图</strong></div>   
    <div ><strong>地图乘车路线</strong></div>  
    <div><strong>推荐为公共日行程</strong></div>  
     </div> </td><td><strong>交通工具:<a href="javascript:void(0)" id="mb2" class="easyui-menubutton" data-options="menu:'#mm2',iconCls:'icon-edit'"> 城市</a></strong>  
     <div id="mm2" style="width:150px;">  
    <div ><strong>当天居住</strong></div>  
    <div ><strong>删除</strong></div>  
    <div><strong>之前插入城市</strong></div>  
    <div><strong>之后插入城市</strong></div>  
    <div><strong>乘坐巴士</strong></div>   
    <div ><strong>乘坐飞机</strong></div>  
    <div><strong>乘坐游轮</strong></div>  
    <div><strong>设为入境城市</strong></div>   
    <div ><strong>设为出境城市</strong></div>  
    <div><strong>城市地图资源</strong></div> 
     </div>
     <strong><a href="javascript:void(0)" id="mb3" class="easyui-menubutton" data-options="menu:'#mm3',iconCls:'icon-edit'">交通</a></strong>  
     <div id="mm3" style="width:150px;">  
    <div><strong>之前插入城市</strong></div>  
    <div><strong>之后插入城市</strong></div>  
    <div ><strong>删除</strong></div>    
    <div ><strong>设置断开</strong></div>    
     </div><hr/><strong> 活动 :</strong><hr/><strong>酒店: </strong><hr/><strong>餐:&nbsp;&nbsp; <a href="javascript:void(0)" id="mb4" class="easyui-menubutton" data-options="menu:'#mm4',iconCls:'icon-edit'">早餐：</a></strong>  
     <div id="mm4" style="width:150px;">  
    <div><strong>自理</strong></div>  
    <div><strong>酒店内美式大陆早餐</strong></div>  
    <div ><strong>中式简餐送入房间</strong></div>
    <div ><strong>中式简餐</strong></div>    
    <div ><strong>酒店外自助早餐</strong></div>    
     </div><strong>&nbsp;&nbsp;<a href="javascript:void(0)" id="mb5" class="easyui-menubutton" data-options="menu:'#mm5',iconCls:'icon-edit'">午餐：</a></strong>  
     <div id="mm5" style="width:150px;">  
    <div><strong>自理</strong></div>  
    <div><strong>四菜一汤</strong></div>  
    <div ><strong>六菜一汤</strong></div>
    <div ><strong>中式简餐</strong></div>    
    <div ><strong>酒店外自助午餐</strong></div>    
     </div><strong>&nbsp;&nbsp;<a href="javascript:void(0)" id="mb6" class="easyui-menubutton" data-options="menu:'#mm6',iconCls:'icon-edit'">晚餐</a></strong>  
     <div id="mm6" style="width:150px;">  
    <div><strong>自理</strong></div>  
    <div><strong>四菜一汤</strong></div>  
    <div ><strong>六菜一汤</strong></div>
    <div ><strong>中式简餐</strong></div>    
    <div ><strong>酒店外自助晚餐</strong></div>    
     </div></td>
			</tr>
			<strong><%} %></strong>
		</table>
	 </div> 
	 <div id="caiwu" class="easyui-dialog" title="财务核算"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:700px;height:500px;padding:10px;">
		<form id="caiwuForm" method="post">
		<table id="testTable" align="center" border="1">
				<tr>
                    <td><strong>费用核算</strong></td><td><strong>路费</strong></td><td><strong>餐费</strong></td><td><strong>导游</strong></td><td><strong>司导</strong></td><td><strong>路饮</strong></td><td><strong>门票</strong></td><td><strong>自费节目</strong></td>
                </tr>
                <strong><%for(int i=1;i<=3;i++){ %></strong>
               <tr>
                    <td><strong>第<%=i%>天：</strong></td><td><strong><input type="text" name="ss" id="c1" class="easyui-numberbox" onfocus="" onblur="testC1(this);" ></strong></td><td><strong><input type="text" id="j<%=i%>" class="easyui-numberbox"></strong></td><td><strong>导游</strong></td><td><strong>司导</strong></td><td><strong>路饮</strong></td><td><strong>门票</strong></td><td><strong>自费节目</strong></td>
                </tr>
                <strong><%}%></strong>
               
                 <tr>
                    <td><strong>分项总报价：</strong></td><td><strong><input type="text" id="fxzc" name="fxzc" class="easyui-numberbox"></strong></td><td><strong><input type="text" id="fxcf" class="easyui-numberbox"></strong></td><td><br></td><td><br></td><td><br></td><td><br></td><td><br></td>
                </tr>
                  <tr>
                    <td><strong>总报价：</strong></td><td><strong><input type="text" id="zc" class="easyui-numberbox"></strong></td><td><strong><input type="text"></strong></td>
                </tr>
			</table>
			<strong><input type="hidden" id="dicType" name="dicType"></strong>
		</form>
	</div>

	 <div class="easyui-panel" title="成本设置"
		style="height:80px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="left">
		<table>
			<tr>
				<td><div class="fitem">
						<strong><label>核算:</label></strong>
				</td>
				<td>
				 <strong><a href="javascript:caiwu();" class="easyui-linkbutton" iconcls="icon-ok">手动核算</a></strong>
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
	      
           </div>      
       <div title="团员信息" closable="true" style="padding:10px;">
       <!-- 
       <table>
       <tr><td>姓名</td><td>性别</td><td>生日</td><td>单位</td><td>身份证号</td><td>职务</td><td>手机</td><td>航空公司</td><td>国籍</td><td>护照号</td></tr>
       </table>
        -->
         <div style="height:470px;width:100%">
	        <table id="dg" class="easyui-datagrid"
		      data-options="url:'fenghuang/DantuanXunjia.do',border:false,singleSelect:false,fit:true,fitColumns:true, onClickRow: onClickRow"
		       pagination="true" toolbar="#tb">
		      <thead>  
                    <tr>  
                      <th data-options="field:'ck',checkbox:true"></th>
                     <th data-options="field:'tdjb'" width="60">姓名</th> 
                     <th id="tuanNO" data-options="field:'tuanNO'" width="40" >性别</th>  
                     <th data-options="field:'tdzt'" width="60">生日</th>                      
                     <th data-options="field:'tdm'" width="60">单位</th> 
                      <th data-options="field:'05'" width="40">身份证号</th>                                                               
                      <th data-options="field:'ctsj'" width="60">职务</th> 
                      <th data-options="field:'htsj'" width="60">手机</th>  
                      <th data-options="field:'xsNo'" width="60"> 航空公司</th>  
                      <th data-options="field:'jdNo'" width="60">国籍</th> 
                      <th data-options="field:'01'" width="40">护照号</th>
                      <th data-options="field:'khId'" width="60"> 护照有效期</th>  
                      <th data-options="field:'02'" width="40">护照签发日期</th> 
                      <th data-options="field:'03'" width="40">护照签发地</th>
                      <th data-options="field:'04'" width="80">出生地</th> 
                      <th data-options="field:'04'" width="80">备注</th> 
                    </tr>  
                </thead>  
	           </table>
	        </div> 
          </div>
        <div title="团队财务" icon="icon-reload" closable="true" style="padding:10px;">  
           <div style="height:470px;width:100%">
	        <table id="dg" class="easyui-datagrid"
		      data-options="url:'fenghuang/DantuanXunjia.do',border:false,singleSelect:false,fit:true,fitColumns:true, onClickRow: onClickRow"
		       pagination="true" toolbar="#tb">
		      <thead>  
                    <tr>  
                      <th data-options="field:'ck',checkbox:true"></th>
                      <th data-options="field:'tdjb'" width="60">单号</th> 
                      <th id="tuanNO" data-options="field:'tuanNO'" width="40" >款项/说明</th>  
                      <th data-options="field:'tdzt'" width="60">客户名称</th>                      
                      <th data-options="field:'tdm'" width="60">预收日期</th> 
                      <th data-options="field:'05'" width="40">汇率</th>                                                               
                      <th data-options="field:'ctsj'" width="60">币种</th> 
                      <th data-options="field:'htsj'" width="60">应收</th>  
                      <th data-options="field:'xsNo'" width="60"> 已收</th>  
                      <th data-options="field:'jdNo'" width="60">未收</th> 
                      <th data-options="field:'01'" width="40">已开发票</th>
                      <th data-options="field:'khId'" width="60"> 发票许可</th>  
                      <th data-options="field:'02'" width="40">销售确认</th> 
                      <th data-options="field:'03'" width="40">财务确认</th>
                      <th data-options="field:'04'" width="80">责任人</th> 
                      <th data-options="field:'04'" width="80">备注</th> 
                    </tr>  
                </thead>  
	           </table>
	         </div>  
           </div>
           <div title="团员文档" icon="icon-reload" closable="true" style="padding:10px;">  
               Third Tab     
           </div>
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
 
 // 财务
 function caiwu() {
			$("#caiwu").dialog("open");
			$("#caiwuForm").form("clear");
		} 
		function testC1(object1){
		 obj = $("input[name='ss']");
		 for(var i=0;i<obj.length;i++){
		 	alert($(obj.get(i)).val()+$(obj.get(i+1)).val());
		}
}
		
	
		
		
        
    </script>
  </body>
</html>
