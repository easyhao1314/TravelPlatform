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
		data-options="url:'fenghuang/Operateinfo.do',border:false,singleSelect:true,fit:true,fitColumns:true,onRowContextMenu: caozuoContextMenu,pageSize:20"
		pagination="true">
		<thead>
			<tr>
				<th data-options="field:'oid',hidden:true" width="20">编号</th>
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
    <div onClick="View()" data-options="iconCls:'icon-search'">查看</div>
    <div onClick="dingfang()" data-options="iconCls:'icon-search'">订房</div>
    <div onClick="dingche1()" data-options="iconCls:'icon-search'">订车</div>
    <div onClick="dingcan()" data-options="iconCls:'icon-search'">订餐</div>
    <div onClick="dingdaoyou()" data-options="iconCls:'icon-search'">订导游</div>
    <div onClick="dinggouwudian()" data-options="iconCls:'icon-search'">订购物店</div>
  	 	 <div onclick="$('#fukuan').window('open')">
            <span>付款</span>
            
   		 </div>
    </div>
    <div id="mmjinzhan" class="easyui-menu" style="width:120px;">
		<input id="oid" style="display: none;" />
		<div data-options="iconCls:'icon-edit'" onClick="updatejinzhan(2)">全部完成</div>
		<div data-options="iconCls:'icon-edit'" onClick="updatejinzhan(3)">完成报价</div>
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
			<div id="beizhudlg"  class="easyui-dialog" title="订车明细"
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
		<textarea id="beizhu" rows="25" cols="85"></textarea>
		</div>	
		
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
		return '<a href="javascript:openbeizhudlg('+row.oid+',\''+row.beizhu+'\');" style=" text-align:center;font-size: 16px;text-decoration:none; width:auto;"><b>查看备注</b></a>';
	}
	function openbeizhudlg(oid,beizhu){
		var a=document.getElementById("beizhu");
		a.value=beizhu;
		$('#oid').attr('value',oid);
		$('#beizhudlg').dialog('open');
		
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
		return '<a href="javascript:openCaozuomx('+row.tuanNo+')">'+row.tuanName+'</a>';
	}
	function caozuoContextMenu(e, rowIndex, rowData){
	
	$('#tuanduimc').attr('value',rowData.tuanNo);
	$('#team').attr('value',rowData.tuanName);
	alert($('#team').val());
	$('#chutuantime').attr('value',rowData.chutuantime);
	$('#huituantime').attr('value',rowData.huituantime);
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
	function dingche1(){
	  	var row = $("#caozuoliebiaodg").datagrid("getSelected");
      var url= "Caozuo_dingche.do?tuanNo="+row.tuanNo;
       var tab = $('#tt').tabs('getSelected'); 
		if (tab){  
	                 var index = $('#tt').tabs('getTabIndex', tab); 
	                 $('#tt').tabs('close', index);  
	       } 
	       	       
	       $('#tt').tabs('add', {
				         title : "订车行程详细信息",
				         href : url,
				         });
	}
	
	function dingche(){
	$("#beizhudlg").dialog("open");					    
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
	}
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




	</script>
	
	
  </body>
</html>
