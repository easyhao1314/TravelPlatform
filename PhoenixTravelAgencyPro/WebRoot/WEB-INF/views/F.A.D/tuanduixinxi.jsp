	<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ path + "/";
String a=(String)request.getParameter("team");

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title></title>
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


  
  <div id="tb1">
           <a
href="javascript:xinxisaveopen();" class="easyui-linkbutton"
iconCls="icon-add" plain="true">新增</a> <a
href="javascript:xinxidelectopen();" class="easyui-linkbutton"
iconCls="icon-cut" plain="true">删除</a>
<a href="javascript:xinxiupdateopen();" class="easyui-linkbutton"
iconCls="icon-save" plain="true">修改</a>
</div>
    <div class="easyui-panel" title="团队收款" style="height:290px;width: auto;">
    
     <div id="tb2">
<a
href="javascript:xxfksaveopen();" class="easyui-linkbutton"
iconCls="icon-add" plain="true">新增</a> <a
href="javascript:xxfkdeleteopen();" class="easyui-linkbutton"
iconCls="icon-cut" plain="true">删除</a>
<a href="javascript:xxfkupdateopen();" class="easyui-linkbutton"
iconCls="icon-save" plain="true">修改</a>
</div>
    
  
<table id="xinxidg" class="easyui-datagrid"
data-options="url:'fenghuang/caiwutuanduifeiyong.do?tuanduimc=${param.tuanduimc}&&ysyfid=1&&shenfenid=4',border:false,singleSelect:true,fit:true,fitColumns:true, onClickRow: onClickRow,pageSize:20"
pagination="true" toolbar="#tb1">
<thead>
<tr>
                                  <th data-options="field:'id',editor:'text'" width="50">单号</th>
                                  <th data-options="field:'kxsm',editor:'text'" width="50">款项说明</th>
                                  <th data-options="field:'khmc',editor:'text'" width="50">客户名称</th>
                                  <th data-options="field:'yushoutime',editor:'text'" width="80">预收日期</th>
                                  <th data-options="field:'huilv',editor:'text'" width="50">汇率</th>
                                  <th data-options="field:'bizhong',editor:'text'" width="50">币种</th>
                                  <th data-options="field:'yingshou',editor:'text'" width="50">应收</th>
                                  <th data-options="field:'yishou',editor:'text'" width="50">已收</th>
                                  <th data-options="field:'weifu',formatter:caigoulirun" width="50">未付</th>	
                                  <th data-options="field:'ykfp',formatter:xinxiykfp" width="50">已开发票</th>
                                  <th data-options="field:'fpxk',formatter:xinxifpxk" width="50">发票许可</th>
                                  <th data-options="field:'a',editor:'numberbox'" width="50">销售确认</th>
                                  <th data-options="field:'confirmed',formatter:xinxiconfirmed" width="50">财务确认</th>
                                  <th data-options="field:'beizhu',editor:'numberbox'" width="50">备注</th>
                                  <th data-options="field:'fuzeren',editor:'numberbox'" width="50">责任人</th>
                                 
</tr>
</thead>
</table>
</div>	


 <div class="easyui-panel" title="团队付款" style="height:290px;width: auto;">
<table id="tuanduixinxidg" class="easyui-datagrid"
data-options="url:'fenghuang/caiwutuanduifeiyong.do?tuanduimc=${param.tuanduimc}&&ysyfid=2&&shenfenid=3',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
pagination="true" toolbar="#tb2">
<thead>
<tr>
                       <th data-options="field:'id',editor:'text'" width="50">单号</th>
                       <th data-options="field:'kxsm',editor:'text'" width="50">款项说明</th>
                       <th data-options="field:'khmc',editor:'text'" width="50">供应商名称</th>
                       <th data-options="field:'fukuantime',editor:'text'" width="80">预付日期</th>
                       <th data-options="field:'huilv',editor:'text'" width="50">汇率</th>
                       <th data-options="field:'bizhong',editor:'text'" width="50">币种</th>
                       <th data-options="field:'yfk',editor:'text'" width="50">应付</th>
                       <th data-options="field:'yifu',editor:'text'" width="50">已付</th>
                       <th data-options="field:'a',formatter:lirun" width="50">未付</th>	
                       <th data-options="field:'ykfp',formatter:xinxiykfp" width="50">已开发票</th>
                       <th data-options="field:'fpxk',formatter:xinxifpxk" width="50">发票许可</th>
                       <th data-options="field:'a',editor:'numberbox'" width="50">销售确认</th>
                       <th data-options="field:'yujilirun',formatter:xinxiconfirmed" width="50">财务确认</th>
                       <th data-options="field:'beizhu',editor:'numberbox'" width="50">备注</th>
                       <th data-options="field:'fuzeren',editor:'numberbox'" width="50">责任人</th>
                      
</tr>
</thead>
</table>
</div>

<!--***************************************收款添加******************************************************-->
<div id="tdxxsaveid" class="easyui-dialog" title="团队信息添加"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
			text:'确定',
			iconCls:'icon-search',
			handler:function(){
			$('#tdxxsaveid').dialog('close');
			xinxisave();
			}
			},
			{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#tdxxsaveid').dialog('close');
		
			}
			}
		]"
		style="width:500px;height:250px;padding:10px;">
		<form id="tdxxsaveform" action="">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>应付款项:</label>
					</td>
					<td><input id="kxsm"  name="kxsm" class="easyui-combobox" data-options="url:'fenghuang/caiwushoukuanxiangxiala.do',
					valueField:'name',
					textField:'name',
					panelHeight:'auto',
					editable:false" required="true">
						</div></td>
						<td><div class="fitem">
							<label>收款账户:</label>
					</td>
					<td>
					<input id="zhanghaoid"  name="zhanghaoid" class="easyui-combobox" data-options="url:'fenghuang/caiwusfkzhwhselect.do',
					valueField:'id',
					textField:'zhanghaoming',
					panelHeight:'auto',
					editable:false" required="true">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>收款单位:</label>
					</td>
					<td>
						<input id="khmc" name="khmc" required="true"
						class="easyui-validatebox" >
						</div></td>
						<td><div class="fitem">
							<label>应收日期:</label>
					</td>
					<td>
					<input id="yushoutime" name="yushoutime" type="text" class="easyui-datebox" required="required">
						</div></td>
				</tr>
				
				<tr>
					<td><div class="fitem">
							<label>金额:</label>
					</td>
					<td>
					<input id="yingshou" name="yingshou" required="true"
						class="easyui-validatebox" >
						</div></td>
						<td><div class="fitem">
							<label>单位:</label>
					</td>
					<td><input id="huilvid"  name="huilvid" class="easyui-combobox" data-options="url:'fenghuang/caiwuhuilvxiala.do',
					valueField:'id',
					textField:'bizhong',
					panelHeight:'auto',
					editable:false" required="true">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>备注:</label>
					</td>
					<td>
					<input id="beizhu" name="beizhu" 
						class="easyui-validatebox">
						</div></td>
					
				</tr>
				<tr>
				
					<td> 
					<input id="caiwuid" name="caiwuid"  value="6" hidden="true"
						class="easyui-validatebox">
						</div></td>
						
					<td>
					<input id="shanchu" name="shanchu" value="1" hidden="true"
						class="easyui-validatebox">
						</div></td>
				</tr>
				<tr>
				
					<td> 
					<input id="shenfenid" name="shenfenid" value="1" hidden="true"
						class="easyui-validatebox">
						</div></td>
						
					<td>
					<input id="fpxk" name="fpxk"  value="0" hidden="true" hidden="true"
						class="easyui-validatebox">
						</div></td>
				</tr>
					<tr>
					
					<td> 
					<input id="team" name="team" hidden="true"
						class="easyui-validatebox">
						</div></td>
						
					<td>
					<input id="tuanduimctest" name="tuanduimc" hidden="true"
						class="easyui-validatebox">
						</div></td>
				</tr>
					<tr>
				<td>
							<!-- 已开发票: -->
					
					<input id="ykfp" name="ykfp" value="0"  hidden="true"
						class="easyui-validatebox">
						</div></td>
						
							<!-- YSYFID  hidden="true"-->
					
					<td> 
					<input id="ysyfid" name="ysyfid" value="1" hidden="true"
						class="easyui-validatebox">
						</div></td>
				
				</tr>
			</table>
			
		</form>
	</div>
<!-- ************************************************************************************************* -->
<!--***************************************收款修改******************************************************-->
<div id="tdxxupdateid" class="easyui-dialog" title="团队信息修改"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
			text:'确定',
			iconCls:'icon-search',
			handler:function(){
			$('#tdxxupdateid').dialog('close');
			xinxiupdate();
			}
			},
			{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#tdxxupdateid').dialog('close');
		
			}
			}
		]"
		style="width:500px;height:250px;padding:10px;">
		<form id="tdxxupdateform" action="">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>应付款项:</label>
					</td>
					<td><input id="kxsm"  name="kxsm" class="easyui-combobox" data-options="url:'fenghuang/caiwushoukuanxiangxiala.do',
					valueField:'name',
					textField:'name',
					panelHeight:'auto',
					editable:false" required="true">
						</div></td>
						<td><div class="fitem">
							<label>收款账户:</label>
					</td>
					<td>
					<input id="zhanghaoid"  name="zhanghaoid" class="easyui-combobox" data-options="url:'fenghuang/caiwusfkzhwhselect.do',
					valueField:'id',
					textField:'zhanghaoming',
					panelHeight:'auto',
					editable:false">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>收款单位:</label>
					</td>
					<td>
						<input id="khmc" name="khmc" 
						class="easyui-validatebox" required="true">
						</div></td>
						<td><div class="fitem">
							<label>应收日期:</label>
					</td>
					<td>
					<input id="yushoutime" name="yushoutime" type="text" class="easyui-datebox" required="required">
						</div></td>
				</tr>
				
				<tr>
					<td><div class="fitem">
							<label>金额:</label>
					</td>
					<td>
					<input id="yingshou" name="yingshou" 
						class="easyui-validatebox" required="true">
						</div></td>
						<td><div class="fitem">
							<label>单位:</label>
					</td>
					<td><input id="huilvID"  name="huilvID" class="easyui-combobox" data-options="url:'fenghuang/caiwuhuilvxiala.do',
					valueField:'id',
					textField:'bizhong',
					panelHeight:'auto',
					editable:false">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>备注:</label>
					</td>
					<td>
					<input id="beizhu" name="beizhu" 
						class="easyui-validatebox">
						</div></td>
					
					<td>
					<input id="id" name="id" hidden="true"
						class="easyui-validatebox">
						</div></td>
						<td>
					<input id="yfk" name="yfk" hidden="true"
						class="easyui-validatebox">
						</div></td>
					
				</tr>
			</table>
		</form>
	</div>
	
	
	
	<!--***************************************付款添加******************************************************-->
<div id="tdxxfkid" class="easyui-dialog" title="团队信息添加"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
			text:'确定',
			iconCls:'icon-search',
			handler:function(){
			$('#tdxxfkid').dialog('close');
			xxfksave();
			}
			},
			{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#tdxxfkid').dialog('close');
		
			}
			}
		]"
		style="width:500px;height:250px;padding:10px;">
		<form id="tdxxfkform" action="">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>应付款项:</label>
					</td>
					<td><input id="kxsmtree"   class="easyui-combotree"  data-options="url:'js/demo/combotree/fukuanTree.json',method:'get',required:true">
    			<input title="款项说明" type="hidden" id="kuanxiang" name="kxsm" class="easyui-validatebox">
						</div></td>
						<td><div class="fitem">
							<label>收款单位:</label>
					</td>
					<td>
					<input id="khmc" name="khmc" 
						class="easyui-validatebox">
						</div></td>
				</tr>
				<tr>
						<td><div class="fitem">
							<label>应付日期:</label>
					</td>
					<td>
					<input id="fukuantime" name="fukuantime" type="text" class="easyui-datebox" required="required">
						</div></td>
				</tr>
				
				<tr>
					<td><div class="fitem">
							<label>金额:</label>
					</td>
					<td>
					<input id="yfk" name="yfk" required="true"
						class="easyui-validatebox" >
						</div></td>
						<td><div class="fitem">
							<label>单位:</label>
					</td>
					<td><input id="huilvid"  name="huilvid" class="easyui-combobox" data-options="url:'fenghuang/caiwuhuilvxiala.do',
					valueField:'id',
					textField:'bizhong',
					panelHeight:'auto',
					editable:false" required="true">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>备注:</label>
					</td>
					<td>
					<input id="beizhu" name="beizhu" 
						class="easyui-validatebox">
						</div></td>
					
				</tr>
				<tr>
				
					<td> 
					<input id="caiwuid" name="caiwuid"  value="1" hidden="true"
						class="easyui-validatebox">
						</div></td>
						
					<td>
					<input id="shanchu" name="shanchu" value="1" hidden="true"
						class="easyui-validatebox">
						</div></td>
				</tr>
				<tr>
				
					<td> 
					<input id="shenfenid" name="shenfenid" value="3" hidden="true"
						class="easyui-validatebox">
						</div></td>
						
					<td>
					<input id="fpxk" name="fpxk"  value="0" hidden="true" hidden="true"
						class="easyui-validatebox">
						</div></td>
				</tr>
					<tr>
					
					<td> 
					<input id="teamatest" name="team" hidden="true"
						class="easyui-validatebox">
						</div></td>
						 
					<td><input id="tuandui" name="tuanduimc" hidden="true" class="easyui-validatebox">
						</div></td>
				</tr>
					<tr>
				<td>
							<!-- 已开发票: -->
					
					<input id="ykfp" name="ykfp" value="0"  hidden="true"
						class="easyui-validatebox">
						</div></td>
						
							<!-- YSYFID  hidden="true"-->
					
					<td> 
					<input id="ysyfid" name="ysyfid" value="2"hidden="true"
						class="easyui-validatebox">		
						</div></td>
				
				</tr>
			</table>
			
		</form>
	</div>
<!-- ************************************************************************************************* -->		
<!--***************************************付款修改******************************************************-->
<div id="tdxxfkxiugaiid" class="easyui-dialog" title="团队信息修改"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
			text:'确定',
			iconCls:'icon-search',
			handler:function(){
			$('#tdxxfkxiugaiform').dialog('close');
			xxfkupdate();
			}
			},
			{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#tdxxfkxiugaiform').dialog('close');
		
			}
			}
		]"
		style="width:500px;height:250px;padding:10px;">
		<form id="tdxxfkxiugaiform" action="">
			<table align="left">
			
			<tr>
			  <td>
					<input id="id" name="id"   hidden="true"
						class="easyui-validatebox">
						<input id="zhanghaoid" name="zhanghaoid"  hidden="true"
						class="easyui-validatebox">
						</div></td>
			</tr>
				<tr>
				
					<td><div class="fitem">
							<label>应付款项:</label>
					</td>
					<td><input id="kxsm"  name="kxsm" class="easyui-combobox" data-options="url:'fenghuang/caiwufukuanxiangxiala.do',
					valueField:'name',
					textField:'name',
					panelHeight:'auto',
					editable:false" required="true">
						</div></td>
						<td><div class="fitem">
							<label>收款单位:</label>
					</td>
					<td>
					<input id="khmc" name="khmc" 
						class="easyui-validatebox">
						</div></td>
				</tr>
				<tr>
						<td><div class="fitem">
							<label>应收日期:</label>
					</td>
					<td>
					<input id="fukuantime" name="fukuantime" type="text" class="easyui-datebox" required="required">
						</div></td>
				</tr>
				
				<tr>
					<td><div class="fitem">
							<label>金额:</label>
					</td>
					<td>
					<input id="yfk" name="yfk" required="true"
						class="easyui-validatebox" >
						</div></td>
						<td><div class="fitem">
							<label>单位:</label>
					</td>
					<td><input id="huilvID"  name="huilvID" class="easyui-combobox" data-options="url:'fenghuang/caiwuhuilvxiala.do',
					valueField:'id',
					textField:'bizhong',
					panelHeight:'auto',
					editable:false" required="true">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>备注:</label>
					</td>
					<td>
					<input id="beizhu" name="beizhu" 
						class="easyui-validatebox">
						</div></td>
				</tr>
			</table>
		</form>
	</div>
<!-- *********************************************************************************************** -->
<script type="text/javascript">

   function xinxiykfp(val,row){
		   var shouke=null;
		   	 if(row.ykfp==0){shouke="未开发票";}
		   	 if(row.ykfp==1){shouke="已开发票";}
		     return '<div onclick="shoukeclick(event,'+row.tuanNo+')" style="width: auto;">'+shouke+'</div>';
		   }
   function xinxiconfirmed(val,row){
		   var shouke=null;
		   	 if(row.confirmed==1){shouke="未确认";}
		   	 if(row.confirmed==2){shouke="已确认";}
		     return '<div onclick="shoukeclick(event,'+row.tuanNo+')" style="width: auto;">'+shouke+'</div>';
		   }  
 function xinxifpxk(val,row){
		   var shouke=null;
		   	 if(row.fpxk==0){shouke="未开发票";}
		   	 if(row.fpxk==1){shouke="已开发票";}
		     return '<div onclick="shoukeclick(event,'+row.tuanNo+')" style="width: auto;">'+shouke+'</div>';
		   }
//销售利润
function lirun(val,row){
var a=parseInt(row.yfk);
var b=parseInt(row.yifu);
var c=(a-b);
return '<div style="width: auto;">'+c+'</div>';
}
//采购利润
function caigoulirun(val,row){
var a=parseInt(row.yingshou);
var b=parseInt(row.yishou);
var c=(a-b);
return '<div style="width: auto;">'+c+'</div>';
}
function shenfen(val,row){
     var a=parseString(row[0].tuanduimc);
     return 
}
/***Jquery读取input id action 读取 name/
/*************************************************添加*****************************************************/
 function closeEditDic() {
			$("#tdxxsaveid").dialog("close");
		} 
	      function xinxisaveopen() {    
	      var team='${param.team}';
		  var tuanduimc='${param.tuanduimc}';
		  $("#tdxxsaveid").dialog("open");
		  $('#tdxxsaveform').form('load',{"team":team,"tuanduimc":tuanduimc});			
		}
       
		function xinxisave() {
			$('#tdxxsaveform').form('submit', {
				url : 'fenghuang/inserttuanbiao.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
						$.messager.alert("保存成功", "保存成功！", "info");
						$('#tdxxsaveid').dialog('close');
						$('#xinxidg').datagrid('reload');
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#xinxidg').datagrid('reload');
					}
				}
			});
		}
/*******************************************************************************************************/


/*******************************************删除********************************************************/
         //按id查询
		function xinxidelectopen(id) {
	    var row = $("#xinxidg").datagrid("getSelected");
		$.messager.confirm('消息', '是否将团名：'+row.team+'确认删除?',
	    function(r){  
	    if (r){                  
		$.ajax({
		url:'fenghuang/updateqrfk.do?shanchu='+2+'&id='+row.id,
		date:row.id,
        dateType:"json",
		success:function(data){
		$('#xinxidg').datagrid("reload");
	    $.messager.alert('消息','删除成功');
	    }
		} );     
		}          
		});	                
		 return;		
		}
		
/*************************************************修改*****************************************************/
   //按id查询
		function xinxiupdateopen(id) {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window 
			
			//获取选中 数据
			var row = $("#xinxidg").datagrid("getSelected");
			//alert(row.id);
		if(row!=null){
		$("#tdxxupdateid").dialog("open");
		//清空ID
		//$('#id').attr('value','');
		//填充{"id":row.id}
		 $('#tdxxupdateform').form('load',row);
		}
		}
		
		
		//修改
			function xinxiupdate() {
		   var huilvID=$("#huilvID").combobox('getValue');
			$("#tdxxupdateform").form('submit', {
				url : 'fenghuang/caiwutdfylbupdate.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {//data 是一个字符串  $.ajax(success:function(data):是一个对象
					//var result = val('(' + data + ')');//吧字符串转换为对象
					var result = $.parseJSON(data) ;

					if (result.success) {
					  $("#tdxxupdateid").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
						$("#xinxidg").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#xinxidg").datagrid('reload');
					}
				}
			});
		}
		
/*******************************************************************************************************/





/*************************************************付款添加*****************************************************/
	function xxfksaveopen() {
	var team='${param.team}';
	    var tuanduimc='${param.tuanduimc}';
        $("#tdxxfkid").dialog("open");
	    $('#tdxxfkform').form('load',{"team":team,"tuanduimc":tuanduimc});		
		}
        function closeEditDic() {
			$("#tdfkinsertid").dialog("close");
		} 
		function xxfksave() {
		var val = $('#kxsmtree').combotree('getText');
		$('#kuanxiang').val(val);
			$('#tdxxfkform').form('submit', {
				url : 'fenghuang/inserttuanbiao.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
						$.messager.alert("保存成功", "保存成功！", "info");
						$('#tdxxfkid').dialog('close');
						$('#tuanduixinxidg').datagrid('reload');
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#tuanduixinxidg').datagrid('reload');
					}
				}
			});
		}
/*******************************************************************************************************/







/*******************************************付款删除********************************************************/
         //按id查询
		function xxfkdeleteopen(id) {
	    var row = $("#tuanduixinxidg").datagrid("getSelected");
	    $.messager.confirm('消息', '是否将团名：'+row.team+'确认删除?',
	    function(r){  
	    if (r){                  
		$.ajax({
		url:'fenghuang/updateqrfk.do?shanchu='+2+'&id='+row.id,
		date:row.id,
        dateType:"json",
		success:function(data){
		$('#tuanduixinxidg').datagrid("reload");
	    $.messager.alert('消息','删除成功');
	    }
		} );     
		}          
		});	                
		 return;		
		}		
/*****************************************************************************************************/
/************************************************付款修改*****************************************************/
        //按id查询
		function xxfkupdateopen(id) {
		var row = $("#tuanduixinxidg").datagrid("getSelected");
		 
		if(row!=null){
		$("#tdxxfkxiugaiid").dialog("open");
		 $('#tdxxfkxiugaiform').form('load',row);
		}
		}
			
		//修改
			function xxfkupdate() {
			$("#tdxxfkxiugaiform").form('submit', {
				url : 'fenghuang/caiwutdfylbupdate.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {//data 是一个字符串  $.ajax(success:function(data):是一个对象
					//var result = val('(' + data + ')');//吧字符串转换为对象
					var result = $.parseJSON(data) ;

					if (result.success) {
					  $("#tdxxfkxiugaiid").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
						$("#tuanduixinxidg").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#tuanduixinxidg").datagrid('reload');
					}
				}
			});
		}
/*******************************************************************************************************/

</script>
  </body>
</html>