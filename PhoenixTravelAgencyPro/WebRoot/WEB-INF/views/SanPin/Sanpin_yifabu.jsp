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
				<th data-options="field:'tuanNo',formatter:xingcheng" width="50">团号</th>
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
	
	<div id="sanpinshenpiwindow" class="easyui-window" title="提交审批申请" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:700px;height:400px;padding:10px;">
        <form id="sanpinshenpiform" action="">
        	<input id="tuanNo" name="tuanNo" type="hidden" class="easyui-validatebox">
        	备注说明：<br>
        	<textarea id="beizhu" name="beizhu" rows="20" cols="100%"></textarea>
        	
        </form>
    <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="javascript:sanpinshenpiwindowsubmit();">提交</a>
                <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="javascript:$('#sanpinshenpiwindow').window('close');">取消</a>
    </div>
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
   	  		if(row.length==0){return;}
   	  		$('#tuanNo').attr('value',row.tuanNo);
   	  		$('#sanpinshenpiwindow').window('open');
   	  }
   	  function sanpinshenpiwindowsubmit(){
   	  	$('#sanpinshenpiform').form('submit', {
				url : 'fenghuang/addsanpinshenpi.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
						$('#sanpinshenpiwindow').window('close');
						$.messager.alert("保存成功", "保存成功！", "info");
					   
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
					
					}
				}
			});
   	  }
   	  
   	  function baoming(val,row){
   	  return '<a href="javascript:yifabubaoming(\''+row.tuanNo+'\')" style="text-decoration:none;">'+row.tuanName+'</a>';
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
   	    function xingcheng(val,row){
   	    return '<a href="javascript:openSanpinDetail(\''+row.tuanNo+'\',\''+row.tuanName+'\',\''+row.xlid+'\' )" style="text-decoration:none;">'+row.tuanNo+'</a>';
   	    }
   	    function openSanpinDetail(tuanNo,tuanName,xlid){
   				var url= "Sanpin_mingxi.do?tuanNo="+tuanNo+"&tuanName="+tuanName+"&xianid="+xlid;
   				window.open (url, 'newwindow', 'height=100, width=400, top=0,left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no'); 
   				return;
       var tab = $('#tt').tabs('getSelected'); 
		if (tab){  
	                 var index = $('#tt').tabs('getTabIndex', tab); 
	                 $('#tt').tabs('close', index);  
	       } 
	       
	       $('#tt').tabs('add', {
				         title : tuanName+"详细信息",
				         href : url,
				      //  closable : true,
				         }); 
   			}
	</script>
  </body>
</html>
