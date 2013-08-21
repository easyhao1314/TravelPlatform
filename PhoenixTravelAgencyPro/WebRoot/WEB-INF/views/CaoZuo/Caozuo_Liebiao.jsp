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
    
    <table id="caozuoliebiaodg" class="easyui-datagrid"
		data-options="url:'fenghuang/Operateinfo.do',border:false,singleSelect:true,fit:true,fitColumns:true,onRowContextMenu: caozuoContextMenu"
		pagination="true">
		<thead>
			<tr>
				<th data-options="field:'oid',hidden:true" width="20">编号</th>
				<th data-options="field:'tuanNo'" width="20">团号</th>
				<th data-options="field:'tuanName',formatter:caozuotuanName" width="20">团名</th>
				<th data-options="field:'beizhu',formatter:chakanbeizhu" width="20">备注</th>
				<th data-options="field:'kehuName'" width="20">客户名称</th>
				<th data-options="field:'chutuantime'" width="20">出团日期</th>
				<th data-options="field:'huituantime'" width="20">回团日期</th>
				<th data-options="field:'paidanren'" width="20">派单人</th>
				<th data-options="field:'jiedanren'" width="20">接单人</th>
				<th data-options="field:'jinzhan'" width="20">进展</th>
				<th data-options="field:'paidantime'" width="20">派单日期</th>
				<th data-options="field:'operateType'" width="20">操作类型</th>
				<th data-options="field:'operatestate'" width="20">操作状态</th>
			</tr>
		</thead>
	</table>
	<!-- 付款window -->
    <div id="fukuan" class="easyui-window" title="应付款窗口" data-options="iconCls:'icon-save'" style="width:500px;height:200px;padding:10px;">
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
        	<td>金额：<input name="yfk" class="easyui-validatebox" height="50px" required style="width: 150px;" /></td>
        	</tr>
        	<tr>
        	<td>备注：<input name="beizhu" class="easyui-validatebox" style="width: 150px;" /></td>
        	</tr>
        	<tr>
        	<td>团名：<input id="team" name="team" value="oooo" class="easyui-validatebox" style="width: 150px;" /></td>
        	</tr>
        	<tr>
        	<td>团队名称：<input id="tuanduimc" name="tuanduimc" class="easyui-validatebox" style="width: 150px;" /></td>
        	</tr>
        	<tr>
        	<td>发团时间<input id="chutuantime" name="chutuantime" class="easyui-validatebox" style="width: 150px;" /></td>
        	</tr>
        	<tr>
        	<td>回团时间：<input id="huituantime" name="huituantime" class="easyui-validatebox" style="width: 150px;" /></td>
        	</tr>
        	<tr>
        	<td>身份ID：<input id="shenfenid" name="shenfenid" value="3" class="easyui-validatebox" style="width: 150px;" /></td>
        	</tr>
        	<tr>
        	<td>删除：<input id="shanchu" name="shanchu" value="1" class="easyui-validatebox" style="width: 150px;" /></td>
        	</tr>
        	<tr>
        	<td>发票许可：<input id="fpxk" name="fpxk" value="0" class="easyui-validatebox" style="width: 150px;" /></td>
        	</tr>
        	<tr>
        	<td>已开发票：<input id="ykfp" name="ykfp" value="0" class="easyui-validatebox" style="width: 150px;" /></td>
        	</tr>
        	<tr>
        	<td>应收应付id：<input id="ykfp" name="ysyfid" value="2" class="easyui-validatebox" style="width: 150px;" /></td>
        	</tr>
        	<tr>
        	<td>财务id：<input id="caiwuid" name="caiwuid" value="1" class="easyui-validatebox" style="width: 150px;" />
        	<a href="javascript:void(0);" style="font-size: 16px;text-decoration:none; text-align:center;"><b>备注</b></a>
        	</td>
        	</tr>
        	<tr>
					<td colspan="4s" align="center"><a
						href="javascript:caozuozhongxinsave();" class="easyui-linkbutton"
						iconCls="icon-ok">确认</a> <a href="javascript:closedSearch();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
        	</table>
        </form>
        
    </div>
	<!-- END付款window ___________________________________________ -->
	
	
	
	
	<div id="caozuomm" class="easyui-menu" style="width:120px;">
    <div onClick="View()" data-options="iconCls:'icon-search'">查看</div>
    <div onClick="dingfang()" data-options="iconCls:'icon-search'">订房</div>
    <div onClick="dingche()" data-options="iconCls:'icon-search'">订车</div>
    <div onClick="dingcan()" data-options="iconCls:'icon-search'">订餐</div>
    <div onClick="dingdaoyou()" data-options="iconCls:'icon-search'">订导游</div>
    <div onClick="dinggouwudian()" data-options="iconCls:'icon-search'">订购物店</div>
  	 	 <div onclick="$('#fukuan').window('open')">
            <span>付款</span>
            
   		 </div>
    </div>
    
	 
	  <div id="caozuodingche"  class="easyui-dialog" title="订车明细"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:500px;padding:10px;"> 
		<div id="days"></div>
		
		  <form id="caozuodingcheForm" method="post">
		    <table>
		      <tr>
		         <td>日期</td><td>行程线路</td><td>人数</td><td>车型</td><td>活动</td><td>司机酒店</td><td>客人酒店</td>
		      </tr>
		      
		    </table>
		  </form>
	    
	</div>
		
	<script type="text/javascript">
	function chakanbeizhu(){
		return '<a href="javascript:void(0);" style=" text-align:center;font-size: 16px;text-decoration:none; width:auto;"><b>备注</b></a>';
	}
	
	
	
	
	function caozuotuanName(val,row){
	//打开操作明细页面
		return '<a href="javascript:openCaozuomx('+row.tuanNo+')">'+row.tuanName+'</a>';
	}
	function caozuoContextMenu(e, rowIndex, rowData){
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
	function dingfang(){
	  	var row = $("#caozuoliebiaodg").datagrid("getSelected");
      var url= "Caozuo_dingfang.do?tuanNo="+row.tuanNo;
       var tab = $('#tt').tabs('getSelected'); 
		if (tab){  
	                 var index = $('#tt').tabs('getTabIndex', tab); 
	                 $('#tt').tabs('close', index);  
	       } 
	       
	       $('#tt').tabs('add', {
				         title : "订房行程详细信息",
				         href : url,
				      //  closable : true,
				         });
	}
	
	function dingche(){
	$("#caozuodingche").dialog("open");
					    
	var param = {
					"xianluid" : "41"
				};
     $.ajax({
                    url :'fenghuang/selectricheng.do',
					data :param,
					dataType : "json",
					success : function(data) {
					    alert(data.rows.length);
					    var days = "";
					    document.getElementById("days").innerHTML="";
					    for ( var int = 0; int < data.rows.length; int++) {
					     var d = parseInt(int+1);
							 days += '<input type="checkbox"  >D'+d+'';
						}
						$('#days').append('选择日程：'+days);
						days = "";
					}
	});
    function dingcan(){
    $("#caozuodingcan").dialog("open");
    }
    function dingdaoyou(){
      var row = $("#caozuoliebiaodg").datagrid("getSelected");
      var url= "Caozuo_dingdaoyou.do?tuanNo="+row.tuanNo;
       var tab = $('#tt').tabs('getSelected'); 
		if (tab){  
	                 var index = $('#tt').tabs('getTabIndex', tab); 
	                 $('#tt').tabs('close', index);  
	       } 
	       
	       $('#tt').tabs('add', {
				         title : "订导游行程详细信息",
				         href : url,
				      //  closable : true,
				         });
    }
    function dinggouwudian(){
    $("#caozuodinggouwudian").dialog("open");
    }
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
		





	</script>
	
	<script type="text/javascript">
	
	</script>
  </body>
</html>
