<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	<div id="fabutb">
		<a href="javascript:quxiaofabu();" class="easyui-linkbutton"
			iconCls="icon-cut" plain="true">取消发布该团</a>
		
	</div>
    <table id="sanpinyifabudg" class="easyui-datagrid"
		data-options="url:'fenghuang/Sanpinliebiao.do?fabustate=2&master=${sessionScope.userId}',border:false,singleSelect:true,fit:true,fitColumns:true"
		pagination="true" toolbar="#fabutb" >
		<thead>
			<tr>
				<th data-options="field:'tuanNo'" width="50">团号</th>
				<th data-options="field:'tuanName',formatter:baoming" width="50">团名/路线</th>
				<th data-options="field:'groupdate'" width="50">出团日期</th>
				<th data-options="field:'Tourdate'" width="50">回团日期</th>
				<th data-options="field:'chufa'" width="50">出发城市</th>
				<th data-options="field:'tonghang'" width="50">同行价</th>
				<th data-options="field:'zhikejia'" width="50">直客价</th>
				<th data-options="field:'numbermaster',formatter:yushouyishou"  width="50">预收/已收</th>
				<th data-options="field:'shoukestate',formatter:openshouke" width="50">收客状态</th>
				<th data-options="field:'productbrand',hidden:true" width="50">产品品牌_隐藏的</th>
			</tr>
		</thead>
	</table>
	<div id="mmfabushouke" class="easyui-menu" style="width:120px;">
		<input id="shoukeinput" style="display: none;" />
		<div data-options="iconCls:'icon-edit'" onClick="updateshouke(1)">在收客</div>
		<div data-options="iconCls:'icon-edit'" onClick="updateshouke(2)">已封团</div>
		<div data-options="iconCls:'icon-edit'" onClick="updateshouke(3)">已下单</div>
		<div data-options="iconCls:'icon-edit'" onClick="updateshouke(4)">已出团</div>
		<div data-options="iconCls:'icon-edit'" onClick="updateshouke(5)">已回团</div>
	</div>
	<script type="text/javascript">
	function updateshouke(shoukeid){
   	      	var tuanNo = $('#shoukeinput').val();
   	      	var url = "fenghuang/upsanpin.do?tuanNo="+tuanNo+"&shoukestate="+shoukeid;
   	      	$.ajax({
   	      		url:url,
   	      		data:tuanNo,
   	      		datatype:"json",
   	      		success:function(data){
   	      			$("#sanpinyifabudg").datagrid("reload");
   	      		},
   	      		error : function() {
						$.messager.alert("修改失败", "服务器请求失败!", "error");
				}
   	      	
   	      	});
   	      }
	 function yushouyishou(val,row){
   	      
   	      	return row.numbermaster+"/"+row.yishourenshu;
   	      }
   	 function openshouke(val,row){
		   var shouke=null;
		   	 if(row.shoukestate==1){shouke="在收客";}
		   	 if(row.shoukestate==2){shouke="已封团";}
		   	 if(row.shoukestate==3){shouke="已下单";}
		   	 if(row.shoukestate==4){shouke="已出团";}
		   	 if(row.shoukestate==5){shouke="已回团";}
		     return '<div onclick="shoukeclick(event,\''+row.tuanNo+'\')" style="width: auto;">'+shouke+'</div>';
		   }
		   //收客状态列表
		  function shoukeclick(e,tuan){
   	      $('#shoukeinput').attr('value',tuan);
   	         $('#mmfabushouke').menu('show', {
				left : e.pageX,
				top : e.pageY
			});   
   	      }
   	  function quxiaofabu(){
   	  		var row = $('#sanpinyifabudg').datagrid('getSelected');
   	  $.messager.confirm('提示', '是否要取消发布“'+row.tuanName+'”?！！', function(r){
			if (r){
   	  		var url = "fenghuang/upsanpin.do?tuanNo="+row.tuanNo+"&fabustate="+4;
   	      	$.ajax({
   	      		url:url,
   	      		data:row.tuanNo,
   	      		datatype:"json",
   	      		success:function(data){
   	      			$("#sanpinyifabudg").datagrid("reload");
   	      		},
   	      		error : function() {
						$.messager.alert("修改失败", "服务器请求失败!", "error");
					}
   	      	
   	      	});
   	      	}
   	      	});
   	  }
   	  function baoming(val,row){
   	  return '<a href="javascript:yifabubaoming(\''+row.tuanNo+'\')">'+row.tuanName+'</a>';
   	  }
   	  function yifabubaoming(tuanNo){
   	   var url= "Sanpin_yibufabaoming.do?tuanNo="+tuanNo;
       var tab = $('#tt').tabs('getSelected'); 
		if (tab){  
	                 var index = $('#tt').tabs('getTabIndex', tab); 
	                 $('#tt').tabs('close', index);  
	       } 
	       
	       $('#tt').tabs('add', {
				         title : "团队报名",
				         href : url,
				      //  closable : true,
				         });
   	      }
	</script>
  </body>
</html>
