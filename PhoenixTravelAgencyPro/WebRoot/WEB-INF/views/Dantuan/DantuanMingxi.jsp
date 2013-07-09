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
						<label>客户:</label>
				</td>
				<td><input name="khId" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>联系人:</label>
				</td>
				<td><input name="tdjb" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>电话:</label>
				</td>
				<td><input name="tdjb" class="easyui-validatebox">
					</div>
				</td>
			</tr>
		<tr>
				<td><div class="fitem">
						<label>团号:</label>
				</td>
				<td><input name="tuanNO" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>团队名称:</label>
				</td>
				<td><input name="tdm" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>出团日期:</label>
				</td>
				<td><input name="ctsj" class="easyui-validatebox">
					</div>
				</td>
			</tr>
			<tr>
				<td><div class="fitem">
						<label>酒店标准:</label>
				</td>
				<td><input name="jdbzNo" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>用餐标准:</label>
				</td>
				<td><input name="ycbjNo" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>交通:</label>
				</td>
				<td><input name="tdjb" class="easyui-validatebox">
					</div>
				</td>
			</tr>
			<tr>
				<td><div class="fitem">
						<label>特殊要求:</label>
				</td>
				<td colspan="5"><input name="tsDesc" class="easyui-validatebox">
					</div>
				</td>
				
			</tr>
		
		</table>
		</form>
	</div>

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
						<label>团号:</label>
				</td>
				<td><input name="tuanNO" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>团名:</label>
				</td>
				<td><input name="tdm" class="easyui-validatebox">
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
				<td><input name="cfts" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>出团人数:</label>
				</td>
				<td><input name="cfrs" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>出团日期:</label>
				</td>
				<td><input name="ctsj" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>选择国家:</label>
				</td>
				<td><input name="cfgj" class="easyui-validatebox">
					</div>
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
	 <div id="caiwu" class="easyui-dialog" title="财务核算"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:700px;height:500px;padding:10px;">
		<form id="caiwuForm" method="post">
		<table align="center" border="1">
				<tr>
                    <td>费用核算</td><td>车</td><td>酒店</td>
                </tr>
                	<tr>
                    <td>第一天：</td><td><input id="c1" type="text" class="easyui-numberbox" ></td><td><input id="j1" type="text" class="easyui-numberbox" ></td>
                </tr>
                <tr>
                    <td>第二天：</td><td><input id="c2" type="text" class="easyui-numberbox" ></td><td><input id="j2" class="easyui-numberbox"  type="text" class="easyui-numberbox" ></td>
                </tr>
                 <tr>
                    <td>分项总报价：</td><td><input id="c3" name="c3"  type="text" class="easyui-numberbox" ></td><td><input id="j3" type="text" class="easyui-numberbox" ></td>
                </tr>
                  <tr>
                    <td>总报价：</td><td><input id="z1" type="text"  class="easyui-numberbox" ></td><td><input type="text"></td>
                </tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
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
				 <a href="javascript:caiwu();" class="easyui-linkbutton" iconCls="icon-ok">手动核算</a>
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
		$("#c1").numberbox({
				required : true ,
				editable : false ,
				onChange : function(newValue, oldValue){
					var c1 = $("#c1").val();
					var c2 = $("#c2").val();
					var c12= c1+c2;
					$("#c3").numberbox('setValue', c1);
					
				}
			});
	    $("#c2").numberbox({
				required : true ,
				editable : false ,
				onChange : function(newValue, oldValue){
					var c1 = $("#c1").val();
					var c2 = $("#c2").val();
					var c12=(Number(c1))+(Number(c2));
					$("#c3").numberbox('setValue', c12);
					
				}
			});
    </script>
  </body>
</html>
