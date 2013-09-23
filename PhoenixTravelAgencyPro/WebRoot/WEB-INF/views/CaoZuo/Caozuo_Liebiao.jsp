<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

  </head>
  
  <body>
  <div id="gouwudlg"  class="easyui-dialog" title="购物店列表"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons: 
	 			[{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
                    updaterichenggouwu();
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                    $('#gouwudlg').dialog('close');
                    }
                }]"
		style="width:600px;height:500px;padding:10px;">
		<table id="gouwudg" class="easyui-datagrid"
		data-options="border:true,singleSelect:true,fit:true,fitColumns:true,pageSize:10"
		pagination="true" >
		
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'chengshi'" width="80">所属城市</th>
					<th data-options="field:'name'" width="80">购物店名称</th>
					<th data-options="field:'lianxiren'" width="80">联系人</th>
					<th data-options="field:'dianhua'" width="80">移动电话</th>
					<th data-options="field:'chuanzhen'" width="80">传真</th>
					<th data-options="field:'shouji'" width="80">手机</th>
					<th data-options="field:'hzjb'" width="80">合作级别</th>
					<th data-options="field:'bz'" width="80">备注</th>
			</tr>
		</thead>
		</table>
		</div>
  
  
  
  <div id="richenggouwu">  
		     <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-save" onclick="gouwudianinfo()"  plain="true">选择购物店</a>  
  </div>
  <div id="dinggouwudlg"  class="easyui-dialog" title="设定购物店"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons: 
	 			[{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                    $('#dinggouwudlg').dialog('close');
                    }
                }]"
		style="width:600px;height:500px;padding:10px;">
		<table id="gouwurichengdg" class="easyui-datagrid"
		data-options="border:true,singleSelect:true,fit:true,fitColumns:true,pageSize:10"
		pagination="true" toolbar="#richenggouwu" >
		
		<thead>
			<tr>
				<th data-options="field:'riid',formatter:days" width="auto">日期</th>
				<th data-options="field:'gname'" width="auto">购物店名称</th>
				<th data-options="field:'glianxiren'" width="auto">联系人</th>
				<th data-options="field:'gdizhi'" width="auto">地址</th>
				<th data-options="field:'gshouji'" width="auto">手机</th>
				<th data-options="field:'gemail'" width="auto">Email</th>
				<th data-options="field:'gbz'" width="auto">备注</th>
				
				
			</tr>
		</thead>
		</table>
		</div>
  
  
  
  <div id="xuanzechedlg"  class="easyui-dialog" title="选择车辆"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons: 
	 			[{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
                    updaterichengche();
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                    $('#xuanzechedlg').dialog('close');
                    }
                }]"
		style="width:600px;height:500px;padding:10px;">
		<input id="riid" type="hidden">
		<table id="dingchedg" class="easyui-datagrid"
		data-options="border:true,singleSelect:true,fit:true,fitColumns:true,pageSize:10"
		pagination="true" >
		<thead>
			<tr>
				<th data-options="field:'cheName'" width="1">车辆名称</th>
				<th data-options="field:'siji'" width="auto">司机</th>
				<th data-options="field:'chexinxi'" width="auto">车辆信息</th>
				<th data-options="field:'zuoweishu'" width="auto">座位数</th>
				<th data-options="field:'chepaihao'" width="auto">牌照号</th>
				<th data-options="field:'sidao'" width="auto">司导</th>
				<th data-options="field:'jiage'" width="auto">价格</th>
				<th data-options="field:'gongying'" width="auto">供应商</th>
			</tr>
		</thead>
		</table>
		
		</div>
  
  
  <div id="addchedlg"  class="easyui-dialog" title="添加车辆"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons: 
	 			[{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
                    saveDingche();
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                    $('#addchedlg').dialog('close');
                    }
                }]"
		style="width:600px;height:500px;padding:10px;">
		<form id="dingcheform" >
			<table>
				<tr><td>车辆名称：</td><td><input class="easyui-validatebox" type="text" name="cheName" style="width: 130px; " /></td></tr>
				<tr><td>车辆信息：</td><td><input class="easyui-validatebox" type="text" name="cheXinxi" style="width: 130px; " /></td></tr>
				<tr><td>车牌号：</td><td><input class="easyui-validatebox" type="text" name="chePaihao" style="width: 130px; " /></td></tr>
				<tr><td>司机：</td><td><input class="easyui-validatebox" type="text" name="siji" style="width: 130px; " /></td></tr>
				<tr><td>司导分开：</td>
				<td><select class="easyui-combobox" name="sidao" style="width: 133px;">
											<option value="1">是</option>
											<option value="2">否</option>
										</select>
				</td></tr>
				<tr><td>座位数：</td><td><input class="easyui-numberspinner" name="zuoweishu" min="1" max="100" required="true" style="width:133px;" /></td></tr>
				<tr><td>价格：</td><td><input class="easyui-numberspinner" name="jiage" min="1" max="100" required="true" style="width:133px;" /></td></tr>
				<tr><td>车公司：</td>
				<td><input name="gongyingshang" required="true" class="easyui-combobox" data-options="
					url:'fenghuang/getjiaotongComboboxs.do',
					valueField:'id',
					textField:'name',
					panelHeight:'auto',
					editable:false 
	">			</td></tr>
			</table>
		
		</form>
		
		</div>
  <div id="richengdingche">
		     <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" onclick="javascript:$('#addchedlg').dialog('open');" plain="true">添加车辆信息</a>  
		     <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-save" onclick="shedingcheliang()"  plain="true">设定车辆</a>  
   </div>
    <div id="dingchedlg"  class="easyui-dialog" title="车辆设定"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons: 
	 			[{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                    $('#dingchedlg').dialog('close');
                    }
                }]"
		style="width:600px;height:500px;padding:10px;">
		<table id="richengdg" class="easyui-datagrid"
		data-options="border:true,singleSelect:true,fit:true,fitColumns:true,pageSize:10"
		pagination="true" toolbar="#richengdingche" >
		<thead>
			<tr>
				<th data-options="field:'riid',formatter:days" width="auto">日期</th>
				<th data-options="field:'cheName'" width="1">车辆名称</th>
				<th data-options="field:'siji'" width="auto">司机</th>
				<th data-options="field:'chexinxi'" width="auto">车辆信息</th>
				<th data-options="field:'zuoweishu'" width="auto">座位数</th>
				<th data-options="field:'chepaihao'" width="auto">牌照号</th>
				<th data-options="field:'sidao'" width="auto">司导</th>
				<th data-options="field:'gongying'" width="auto">供应商</th>
				<th data-options="field:'jiage'" width="auto">价格</th>
				
			</tr>
		</thead>
		</table>
		</div>
    
    
    <table id="caozuoliebiaodg" class="easyui-datagrid"
		data-options="url:'fenghuang/Operateinfo.do',border:false,singleSelect:true,fit:true,fitColumns:true,onRowContextMenu: caozuoContextMenu,pageSize:20"
		pagination="true">
		<thead>
			<tr>
				<th data-options="field:'id',hidden:true" width="20">编号</th>
				<th data-options="field:'tuanNo'" width="20">团号</th>
				<th data-options="field:'tuanName',formatter:caozuotuanName" width="20">团名</th>
				<th data-options="field:'beizhu',formatter:chakanbeizhu" width="20">备注</th>
				<th data-options="field:'chutuantime'" width="20">出团日期</th>
				<th data-options="field:'huituantime'" width="20">回团日期</th>
				<th data-options="field:'paidanren',formatter:function(value,row){
							return row.paidan;
				}" width="20">派单人</th>
				<th data-options="field:'jiedanren',formatter:function(value,row){
							return row.jiedan;
				}" width="20">接单人</th>
				<th data-options="field:'jinzhan',formatter:jinzhan" width="20">进展</th>
				<th data-options="field:'paidantime'" width="20">派单日期</th>
				<th data-options="field:'operateType',formatter:operatetype" width="20">操作类型</th>
			</tr>
		</thead>
	</table> 
	
	
	
	
	<!--订房开始-->
	<div id="dingfangwindow" class="easyui-window" title="订房"  data-options="closable:true,closed:true,tools:'#searchpanel'"  style="width:500px;height:250px;padding:5px;">

    <div class="easyui-layout" fit="true">
        <table id="caozuodingfangdg" class="easyui-datagrid"
		data-options="border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:10"
		pagination="true"  toolbar="#currencyDatagridtoolbar">
		<thead>
			<tr>
				<th data-options="field:'id'" width="20">编号</th>
				<th data-options="field:'tuanNo'" width="20">团号</th>
				<th data-options="field:'ruzhuTime'" width="20">居住时间</th>
				<th data-options="field:'ruzhuDay'" width="20">居住天数</th>
				<th data-options="field:'chengshiId'" width="20">居住城市</th>
				<th data-options="field:'jdNo'" width="20">酒店标准</th>
				<th data-options="field:'caozuoqingkuang'" width="20">操作情况</th>
				<th data-options="field:'beizhu'" width="20">备注</th>
				
			</tr>
		</thead>
		</table>

               <div region="south" border="false" style="text-align:right;height:30px;line-height:30px;">
            		<a class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">确认</a>
            		<a class="easyui-linkbutton" icon="icon-cancel" href="javascript:closewindow()">取消</a>
               </div>

         </div>
         </div>
         <div id="addDingfang" class="easyui-dialog" title="添加订房" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:600px;height:500px;padding:10px;">
	   <form id="addDingfangForm">
	      <table align="center">
	         <tr>
	            <td><div class="fitem">旅游团号：</td><td><input id="tuanNo" name="tuanNo" class="easyui-validatebox"></div></td> <td><div class="fitem">团名：</td> <td><input name="tuanName" class="easyui-validatebox"></div></td>
	         </tr>
	         <tr>
	            <td><div class="fitem">国家：</td> <td><input name="cfgj" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=7',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td> 
					<td><div class="fitem">城市：</td> <td><input name="chengshiId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
	         </tr>
	         <tr>
	            <td><div class="fitem">星级标准：</td> <td><input name="jdbzNo" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=16',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td> <td><div class="fitem">酒店名称：</td> <td><input id="jiudianId" name="jiudianId"  class="easyui-validatebox"/></div></td>
	         </tr>
	         <tr>
	            <td><div class="fitem">入住时间：</td> <td><input name="ruzhutime" class="easyui-datebox"></div></td> <td><div class="fitem">入住天数：</td> <td><input name="ruzhuDay" class="easyui-validatebox"></div></td>
	         </tr>
	           <tr>
	            <td><div class="fitem">支付方式：</td> <td><input name="zhifufangshi" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=33',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td> <td><div class="fitem">请选择卡号：</td> <td><input name="kahao" class="easyui-validatebox"></div></td>
	         </tr>
	           <tr>
	            <td><div class="fitem">货币单位：</td> <td><input name="huobi" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=5',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td> <td><div class="fitem">汇率：</td> <td><input name="huilv" class="easyui-validatebox"></div></td>
	         </tr>
	          <tr>
	            <td><div class="fitem">预计保留日：</td> <td><input name="yudingDay" class="easyui-datebox"></div></td> <td><div class="fitem">操作人：</td> <td><input name="" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=12',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td> 
	         </tr>
	         <tr>
	            <td><div class="fitem">操作情况：</td> <td><input name="caozuoqingkuang" class="easyui-validatebox"></div></td> <td><div class="fitem">总价：</td> <td><input name="zongjia" class="easyui-validatebox"></div></td>
	         </tr>
	         <tr>
	            <td><div class="fitem">备注：</td> <td colspan="3"><input name="beizhu" class="easyui-validatebox"></div></td>
	         </tr>
	         <tr>
                <td colspan="4" align="center"><a href="javascript:addDingfang()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
                                <a href="javascript:closedupdateDingfang()" class="easyui-linkbutton" iconCls="icon-undo">取消</a></td>
             </tr>
	      </table>
	   </form>
	   </div>
         
         <div id="updateDingfang" class="easyui-dialog" title="修改订房" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:600px;height:500px;padding:10px;">
	   <form id="updateDingfangForm">
	      <table align="center">
	         <tr>
	            <td><div class="fitem">旅游团号：</td><td><input name="id" class="easyui-validatebox" hidden="true"><input name="tuanNo" class="easyui-validatebox"></div></td> <td><div class="fitem">团名：</td> <td><input name="tuanName" class="easyui-validatebox"></div></td>
	         </tr>
	         <tr>
	            <td><div class="fitem">国家：</td> <td><input name="cfgj" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=7',
					valueField:'dicNo',
					textField:'dicName',
					method:'get',
					panelHeight:'auto'" ></div></td> 
					<td><div class="fitem">城市：</td> <td><input name="chengshiId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
	         </tr>
	         <tr>
	            <td><div class="fitem">星级标准：</td> <td><input name="jdbzNo" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=16',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td> <td><div class="fitem">酒店名称：</td> <td><input id="jiudianId" name="jiudianId"  class="easyui-validatebox"/> </div></td>
	         </tr>
	         <tr>
	            <td><div class="fitem">入住时间：</td> <td><input name="ruzhutime" class="easyui-datebox"></div></td> <td><div class="fitem">入住天数：</td> <td><input name="ruzhuDay" class="easyui-validatebox"></div></td>
	         </tr>
	           <tr>
	            <td><div class="fitem">支付方式：</td> <td><input name="zhifufangshi" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=33',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td> <td><div class="fitem">请选择卡号：</td> <td><input name="kahao" class="easyui-validatebox"></div></td>
	         </tr>
	           <tr>
	            <td><div class="fitem">货币单位：</td> <td><input name="huobi" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=5',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td> <td><div class="fitem">汇率：</td> <td><input name="huilv" class="easyui-validatebox"></div></td>
	         </tr>
	          <tr>
	            <td><div class="fitem">预计保留日：</td> <td><input name="yudingDay" class="easyui-datebox"></div></td> <td><div class="fitem">操作人：</td> <td><input name="" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=12',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td> 
	         </tr>
	         <tr>
	            <td><div class="fitem">操作情况：</td> <td><input name="caozuoqingkuang" class="easyui-validatebox"></div></td> <td><div class="fitem">总价：</td> <td><input name="zongjia" class="easyui-validatebox"></div></td>
	         </tr>
	         <tr>
	            <td><div class="fitem">备注：</td> <td colspan="3"><input name="beizhu" class="easyui-validatebox"></div></td>
	         </tr>
	         <tr>
                <td colspan="4" align="center"><a href="javascript:saveUpdateDingfang()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
                                <a href="javascript:closedupdateDingfang()" class="easyui-linkbutton" iconCls="icon-undo">取消</a></td>
             </tr>
	      </table>
	   </form>
	</div>
<!-- 订房结束 -->         
         
         
          <div id="currencyDatagridtoolbar">
		     <a href="javascript:addDingfangOpen();" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>  
		     <a href="javascript:updateDingfang();" class="easyui-linkbutton" iconCls="icon-save"  plain="true">修改</a>
		       <a href="javascript:deleteDingfang();" class="easyui-linkbutton" iconCls="icon-cut" plain="true">删除</a>   
		  </div>
	<!--订房结束-->
	
	
	
	<!-- 付款window -->
	<div id="fukuantt">
        <a href="javascript:void(0)" class="icon-add" onclick="javascript:caozuozhongxinsave()"></a>
        
    </div>
	
	
    <div id="fukuan" class="easyui-window" title="应付款窗口" data-options="iconCls:'icon-save',tools:'#fukuantt',closed:true" style="width:500px;height:300px;padding:10px;">
        <form id="fukuanform" action="">
        	<table  style="width: 400px;">
        	<tr>
        		<td>应付款项： 
        		<input id="kxsm"   class="easyui-combotree"  data-options="url:'js/demo/combotree/fukuanTree.json',method:'get',required:true" style="width:200px;">
    			<input title="款项说明" type="hidden" id="kuanxiang" name="kxsm" class="easyui-validatebox">
    			</td>
        	</tr>
        	<tr>
        	<td>收款单位：<input name="khmc" class="easyui-validatebox" required style="width: 250px;" /></td>
        	</tr>
        	<tr>
        	<td>应付日期： <input id="fukuantime" name="fukuantime" type="text" class="easyui-datebox" required="required"></td>
        	</tr>
        	<tr>
        	<td>金&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;额：<input name="yfk" class="easyui-validatebox" height="50px" required style="width: 150px;" /></td>
        	</tr>
        	<tr>
        	<td>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：<input name="beizhu" class="easyui-validatebox" style="width: 150px;" /></td>
        	</tr>
        	
        	
        	<tr>
        	<td>
        	<input id="huituantime"  name="huituantime" class="easyui-validatebox" style="width: 150px;" />
        	<input id="shenfenid" type="hidden" name="shenfenid" value="3" class="easyui-validatebox" style="width: 150px;" />
        	<input id="shanchu" type="hidden" name="shanchu" value="1" class="easyui-validatebox" style="width: 150px;" />
        	<input id="fpxk" type="hidden" name="fpxk" value="0" class="easyui-validatebox" style="width: 150px;" />
			<input id="ykfp" type="hidden" name="ykfp" value="0" class="easyui-validatebox" style="width: 150px;" />
        	<input id="ykfp" type="hidden" name="ysyfid" value="2" class="easyui-validatebox" style="width: 150px;" />
        	<input id="caiwuid" type="hidden" name="caiwuid" value="1" class="easyui-validatebox" style="width: 150px;" />
        	<input id="team" type="hidden" name="team"  class="easyui-validatebox" style="width: 150px;" />
        	<input id="huilvid" type="hidden" name="huilvid" value="1" class="easyui-validatebox" style="width: 150px;" />
        	<input id="tuanduimc" name="tuanduimc" type="hidden" class="easyui-validatebox" >
        	</td>
        	</tr>
        	</table>
        </form>
        
    </div>
	<!-- END付款window ___________________________________________ -->
	
	    
	
	
	<div id="caozuomm" class="easyui-menu" style="width:120px;">
    <div onClick="xingchengmingxi()" data-options="iconCls:'icon-search'">查看行程</div>
    
    <div><span>设定</span>
    <div>
    <div onClick="dingfang()" data-options="iconCls:'icon-search'">订房</div>
    <div onClick="dingche()" data-options="iconCls:'icon-search'">订车</div>
    <div onClick="dingdaoyou()" data-options="iconCls:'icon-search'">订导游</div>
    <div onClick="gouwudianload()" data-options="iconCls:'icon-search'">订购物店</div>
    </div>
    </div>
    
  	 	 <div onclick="$('#fukuan').window('open')">
            <span>付款</span>
            
   		 </div>
    </div>
    <div id="mmjinzhan" class="easyui-menu" style="width:120px;">
		<input id="oid" style="display: none;" />
		<div data-options="iconCls:'icon-edit'" onClick="updatejinzhan(2)">全部完成</div>
		<div data-options="iconCls:'icon-edit'" onClick="updatejinzhan(3)">完成报价</div>
	</div>
	 
	 
	  
			<div id="beizhudlg"  class="easyui-dialog" title="备注明细"
		data-options="modal:true,closed:true,iconCls:'icon-save', modal:true,buttons: 
	 			[{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
                    savebeizhu();
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                    $('#beizhudlg').dialog('close');
                    }
                }]"
		style="width:600px;height:500px;padding:10px;">
		<textarea id="beizhutext" rows="25" cols="85"></textarea>
		</div>	
		
		
		
		<!-- 导游开始 -->
	
	<div id="adddaoyou" class="easyui-dialog" title="导游安排"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons: 
	 			[{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
                    savedaoyou();
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                    closewindow();
                    }
                }]"
		style="width:600px;height:240px;padding:10px;">
		<table id="dgDaoyou" class="easyui-datagrid"
			data-options="url:'fenghuang/daoyouSelect.do',border:true,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
			pagination="true">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'guojia'" width="80">国籍</th>
					<th data-options="field:'name'" width="80">姓名</th>
					<th data-options="field:'chengshi'" width="80">常驻地</th>
					<th data-options="field:'dinhua'" width="80">移动电话</th>
					<th data-options="field:'shouji'" width="80">手机</th>
					<th data-options="field:'email'" width="80">EMAIL</th>
					<th data-options="field:'bz'" width="80">备注</th>	
				</tr>
			</thead>
		</table>
        
		
	</div>
	<!-- 导游END -->
	
	<input id="xianid" type="hidden">
	<script type="text/javascript">
	var day = 0;
		function shedingcheliang(){
		var row = $('#richengdg').datagrid("getSelected");
			$('#riid').attr('value',row.riid);
		
			$('#dingchedg').datagrid({  
    			url:'fenghuang/dingcheSelect.do'
			});
	
		$('#xuanzechedlg').dialog('open');
		}
		function updaterichengche(){
			var riid = $('#riid').val();
			var row = $('#dingchedg').datagrid('getSelected');
			var url = "fenghuang/updatericheng.do?riid="+riid+"&cheid="+row.id;
			$.ajax({
   	      		url:url,
   	      		data:riid,
   	      		datatype:"json",
   	      		success:function(data){
   	      		$('#xuanzechedlg').dialog('close');
   	      		$.messager.alert("保存成功", "保存成功!", "info");
   	      			$("#richengdg").datagrid("reload");
   	      			day=0;
   	      		},
   	      		error : function() {
						$.messager.alert("修改失败", "服务器请求失败!", "error");
					}
   	      	
   	      	});
		}
	</script>
	
	<script type="text/javascript">
	
	function jinzhan(val,row){
	var jinzhan = "新派单";
	
	if(row.jinzhan==2){
		jinzhan = "全部完成";
	}
	if(row.jinzhan==3){
		jinzhan = "完成报价";
	}
	
	return '<div onclick="shoukeclick(event,\''+row.oid+'\')" style="width: auto;">'+jinzhan+'</div>';
	}
	function shoukeclick(e,oid){
   	      $('#oid').attr('value',oid);
   	         $('#mmjinzhan').menu('show', {
				left : e.pageX,
				top : e.pageY
			});
   	      }
	function updatejinzhan(jinzhan){
	var oid = $('#oid').val();
		var url = "fenghuang/updateOperate.do?oid="+oid+"&jinzhan="+jinzhan;
   	      	$.ajax({
   	      		url:url,
   	      		data:oid,
   	      		datatype:"json",
   	      		success:function(data){
   	      		
   	      			$("#caozuoliebiaodg").datagrid("reload");
   	      		},
   	      		error : function() {
						$.messager.alert("修改失败", "服务器请求失败!", "error");
					}
   	      	
   	      	});
	}
	
	
	
	
	
	
	function chakanbeizhu(val,row){
		return '<a href="javascript:openbeizhudlg('+row.oid+',\''+row.beizhu+'\');" style="text-align:center;font-size: 16px;text-decoration:none; width:auto;"><b>查看备注</b></a>';
	}
	function openbeizhudlg(oid,beizhu){
		$('#beizhudlg').dialog("open");
		if(beizhu == 'undefined'){
		beizhu='';
		}
		document.getElementById("beizhutext").innerHTML=beizhu;
	
		$('#oid').attr('value',oid);
		
	}
	//保存备注 
	function savebeizhu(){
		var oid = $('#oid').val();
		var beizhu = $('#beizhu').val();
		var url = "fenghuang/updateOperate.do?oid="+oid+"&beizhu="+beizhu;
   	      	$.ajax({
   	      		url:url,
   	      		data:oid,
   	      		datatype:"json",
   	      		success:function(data){
   	      		$('#beizhudlg').dialog('close');
   	      				$.messager.alert("保存成功", "保存成功!", "info");
   	      			$("#caozuoliebiaodg").datagrid("reload");
   	      		},
   	      		error : function() {
						$.messager.alert("修改失败", "服务器请求失败!", "error");
					}
   	      	
   	      	});
	}
	
	function caozuotuanName(val,row){
	//打开操作明细页面
		return '<a href="javascript:openCaozuomx(\''+row.tuanNo+'\','+row.oid+')">'+row.tuanName+'</a>';
	}
	function openCaozuomx(tuanNo,oid){
	var url = "Caozuo_mingxi.do?oid="+oid+"&tuanNo="+tuanNo;
	var tab = $('#tt').tabs('getSelected'); 
		if (tab){  
	                 var index = $('#tt').tabs('getTabIndex', tab); 
	                 $('#tt').tabs('close', index);  
	       } 
	       
	       $('#tt').tabs('add', {
				         title : "操作详情",
				         href : url,
				      //  closable : true,
				         });
   	      }
	
	
	function caozuoContextMenu(e, rowIndex, rowData){
	$('#oid').attr('value',rowData.oid);
	$('#tuanduimc').attr('value',rowData.tuanNo);
	$('#team').attr('value',rowData.tuanName);
	$('#chutuantime').attr('value',rowData.chutuantime);
	$('#huituantime').attr('value',rowData.huituantime);
	$('#xianid').attr('value',rowData.xianid);
	day=0;
	 e.preventDefault();
	  $('#caozuomm').menu('show', {
        left:e.pageX,
        top:e.pageY
    });  
	}
	function View(){
		$("#caozuoView").dialog("open");
		var node= $("#caozuoliebiaodg").datagrid("getSelected");
	$.ajax({
					data : node,
					dataType : "json",
					success : function(data) {
					alert(data);
		 $("#caozuoViewForm").dialog('load',data.rows[0]);
				
					},
				
	});
			
	}
	
	
    function dingcan(){
    $("#caozuodingcan").dialog("open");
    }
    
    function dingdaoyou(){
    $('#adddaoyou').dialog('open');
    }
    function dinggouwudian(){
    $("#caozuodinggouwudian").dialog("open");
    }





   	//添加	
		
		function caozuozhongxinsave() {
		var val = $('#kxsm').combotree('getText');
		$('#kuanxiang').val(val);
			$('#fukuanform').form('submit', {
				url : 'fenghuang/inserttuanbiao.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
						$.messager.alert("保存成功", "保存成功！", "info");
						$('#fukuan').dialog('close');
						$('#caozuoliebiaodg').datagrid('reload');
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#caozuoliebiaodg').datagrid('reload');
					}
				}
			});
		}
		
function operatetype(value,row){
							var type = null;
							if(row.operateType==1){type="单团";}
							if(row.operateType==2){type="散拼";}
							return type;
				}
function closewindow(){
		$('#dingfangwindow').window('close');
		$('#adddaoyou').dialog('close');
}
function savedaoyou(){
	var row = $('#dgDaoyou').datagrid("getSelected");
	var oid = $('#oid').val();
	var url = "fenghuang/updateOperate.do?oid="+oid+"&daoyou="+row.id;
   	      	$.ajax({
   	      		url:url,
   	      		data:oid,
   	      		datatype:"json",
   	      		success:function(data){
   	      		$('#adddaoyou').dialog('close');
   	      				$.messager.alert("保存成功", "保存成功!", "info");
   	      		},
   	      		error : function() {
						$.messager.alert("修改失败", "服务器请求失败!", "error");
					}
   	      	
   	      	});
	
}


//订房
function addDingfangOpen(){
	 $("#addDingfang").dialog("open");
	 
	  var row = $('#caozuoliebiaodg').datagrid('getSelected');
	   $('#addDingfangForm').form('load',row);
	}
	function addDingfang(){
	  $("#addDingfangForm").form('submit', {
				url : "fenghuang/addDingfang.do",				
				onSubmit : function() {
					return $(this).form('validate');
				},
			
				success : function(data) {
				//data 是一个字符串  $.ajax(success:function(data):是一个对象)
					//var result = val('(' + data + ')');//吧字符串转换为对象
				var result = $.parseJSON(data) ;
					if (result.success) {					
					  $("#addDingfang").dialog('close');
						$.messager.alert("保存成功", "保存成功！", "info"); 
						$("#caozuodingfangdg").datagrid('reload');
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$("#caozuodingfangdg").datagrid('reload');
					}
				}
			});
	  
	}
	function updateDingfang(){
	   $("#updateDingfang").dialog("open");
	   var row = $('#caozuodingfangdg').datagrid('getSelected');
	   $('#updateDingfangForm').form('load',row);
	}
	
	function saveUpdateDingfang(){
	$("#updateDingfangForm").form('submit', {
				url : "fenghuang/updateDingfang.do",				
				onSubmit : function() {
					return $(this).form('validate');
				},
			
				success : function(data) {
				//data 是一个字符串  $.ajax(success:function(data):是一个对象)
					//var result = val('(' + data + ')');//吧字符串转换为对象
				var result = $.parseJSON(data) ;
					if (result.success) {					
					  $("#updateDingfang").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
						$("#caozuodingfangdg").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#caozuodingfangdg").datagrid('reload');
					}
				}
			});
	  
	}
     function closedupdateDingfang(){
         $("#updateDingfang").dialog('close');
     }
function deleteDingfang(){
		 var row = $('#caozuodingfangdg').datagrid('getSelected');
		 if(row){
		     var param={
		      id:row.id
		      };
		      
		      if(confirm("确认要删除吗？")){
		      $.ajax({
		         url:'fenghuang/deleteDingfang.do',
		         data:param,
		         type:'post',
		         dataType:'json',
		         success:function(data){
		         if (data.success) {
						  $.messager.alert("删除成功", "删除成功！", "info");
		                  $("#caozuodingfangdg").datagrid('reload');
						} else {
							$.messager.alert("删除失败", "删除失败!", "error");
			              $("#caozuodingfangdg").datagrid('reload');
						}
		         }
		      });
		      }
		 }
		 
		}
 function xingchengmingxi(){
 	var xianid = $('#xianid').val();
 	var tuanName = $('#team').val();
 	var url = "Caozuo_xingcheng.do?xianid="+xianid;
	var tab = $('#tt').tabs('getSelected'); 
		if (tab){  
	                 var index = $('#tt').tabs('getTabIndex', tab); 
	                 $('#tt').tabs('close', index);  
	       } 
	       
	       $('#tt').tabs('add', {
				         title : tuanName+"行程详情",
				         href : url,
				      //  closable : true,
				         });
   	      }
 
	function dingfang(){
	var tuanNo = $('#tuanduimc').val();
	
	$('#caozuodingfangdg').datagrid({  
    url:'fenghuang/dingfangSelect.do?tuanNo='+tuanNo 
	});  
		$("#dingfangwindow").window("open");
	}
	function dingche1(){
	  
		$("#dingchedlg").dialog("open");
	}
	
	
	function dingche(){
	
	$("#dingchedlg").dialog("open");	
	var xianid = $('#xianid').val();
	$('#richengdg').datagrid({  
    url:"fenghuang/selectricheng.do?xianluid="+xianid 
	});  				    
	
	}
	
	function days(val,row){
		day++;
		return "第"+day+"天";
	}
	function saveDingche(){
	$('#dingcheform').form('submit', {
				url : 'fenghuang/dingcheAdd.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
						$.messager.alert("保存成功", "保存成功！", "info");
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
					}
				}
			});
	}
	function gouwudianload(){
	 var xianid = $('#xianid').val();
	$('#gouwurichengdg').datagrid({  
    url:"fenghuang/selectricheng.do?xianluid="+xianid 
	}); 
	$('#dinggouwudlg').dialog('open');
	}
	function gouwudianinfo(){
		var row = $('#gouwurichengdg').datagrid('getSelected');
		$('#riid').attr('value',row.riid);
		
		$('#gouwudlg').dialog('open');
		$('#gouwudg').datagrid({
    url:"fenghuang/gouwuSelect.do" 
	}); 
	}
	
	function updaterichenggouwu(){
			var riid = $('#riid').val();
			var row = $('#gouwudg').datagrid('getSelected');
			var url = "fenghuang/updatericheng.do?riid="+riid+"&gouwuid="+row.id;
			$.ajax({
   	      		url:url,
   	      		data:riid,
   	      		datatype:"json",
   	      		success:function(data){
   	      		$('#gouwudlg').dialog('close');
   	      		$.messager.alert("保存成功", "保存成功!", "info");
   	      			$("#gouwurichengdg").datagrid("reload");
   	      			day=0;
   	      		},
   	      		error : function() {
						$.messager.alert("修改失败", "服务器请求失败!", "error");
					}
   	      	
   	      	});
		}
	</script>
	
	
  </body>
</html>