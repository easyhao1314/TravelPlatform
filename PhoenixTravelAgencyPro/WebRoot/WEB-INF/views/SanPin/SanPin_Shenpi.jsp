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
   <div id="sanpinshenpitb">
		<a href="javascript:Selectshenhe(2);" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">已审核</a>
		<a href="javascript:Selectshenhe(1);" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">未审核</a>
	</div>
    <table id="sanpinshenpidg" class="easyui-datagrid"
		data-options="url:'fenghuang/Sanpinshenpiinfo.do',border:false,singleSelect:true,fit:true,fitColumns:true"
		pagination="true" toolbar="#sanpinshenpitb">
		<thead>
			<tr>
				<th data-options="field:'id',hidden:true" width="50">ID</th>
				<th data-options="field:'tuanNo'" width="50">团号</th>
				<th data-options="field:'tuanName'" width="50">团名</th>
				<th data-options="field:'jiantuanren'" width="50">建单人</th>
				<th data-options="field:'shenpi'" width="50">状态</th>
				<th data-options="field:'shenhejieguo'" width="50">审核结果</th>
				<th data-options="field:'beizhu',formatter:beizhudiv" width="50">备注</th>
				<th data-options="field:'caozuo',formatter:caozuo" width="50">操作</th>
			</tr>
		</thead>
	</table>
	<div id="beizhuwindow" class="easyui-window" title="备注" data-options="iconCls:'icon-save',closed:true" style="width:500px;height:300px;padding:10px;">
	<div id="beizhu" style=" word-wrap:break-word; word-break:normal; width: 470px;">
	</div>
    </div>
    
    
    <div id="shenpiyijiandlg" class="easyui-dialog" title="审批意见说明" style="width:480px;height:320px;padding:10px"
            data-options="
                iconCls: 'icon-save',closed:true,
                buttons: [{
                    text:'通过',
                    iconCls:'icon-ok',
                    handler:function(){
                     shenhe(1);
                    }
                },{
                    text:'失败',
                    iconCls:'icon-cancel',
                    handler:function(){
                      shenhe(2);
                    }
                }]
            ">
        	<textarea id="yijian" style="width: 445px; height: 225px;"></textarea>
    </div>
    
    
    
    <!--  <div id="shenheyijianwindow" class="easyui-window" title="审核意见" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:700px;height:400px;padding:10px;">
        <form id="sanpinshenpiform" action="">
        	<input id="id" name="id" type="hidden" class="easyui-validatebox">
        	<input id="userid" type="hidden" value="${sessionScope.userId}" class="easyui-validatebox">
        	<input id="shenpituanNo" type="hidden"  class="easyui-validatebox">
        	审核意见：<br>
        	<textarea id="yijian" name="yijian" rows="20" cols="100%"></textarea>
        	
        </form>
    <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
                <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="javascript:shenhe(1);">审核通过</a>
                <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="javascript:shenhe(2);">审核失败</a>
    </div>
    </div>
    -->
    <script type="text/javascript">
    function beizhudiv(val,row){
    return '<div onclick="showdiv(\''+row.beizhu+'\')" style="width:100%;">'+row.beizhu+'</div>';
    
    }
    function showdiv(beizhu){
    	document.getElementById("beizhu").innerHTML=beizhu;
   	      $('#beizhuwindow').window('open');  
   	}
   	function caozuo(val,row){
   		if(row.shenpizhuangtai==1){
   			return '<a href="javascript:void(0);" onClick="javascript:shenheyijian('+row.id+');" class="easyui-linkbutton" >审核意见</a>';
   		}
   	} 
   	function shenheyijian(id){
   	$('#yijian').val("");
   		$('#shenpiyijiandlg').dialog('open');
   		$('#id').attr('value',id);
   	}
   	function shenhe(shenhe){
   	var row = $('#sanpinshenpidg').datagrid('getSelected');
   	var yijian = $('#yijian').val();
   	
   	
   		var url = "fenghuang/upsanpinshenpi.do?id="+row.id+"&yijian="+yijian+"&jieguo="+shenhe+"&tuanNo="+row.tuanNo;
   	      	$.ajax({
   	      		url:url,
   	      		data:row.id,
   	      		datatype:"json",
   	      		success:function(data){
   	      			$("#sanpinshenpidg").datagrid("reload");
   	      			$.messager.alert("保存成功", "保存成功!", "info");
   	      			$('#shenpiyijiandlg').dialog('close');
   	      		},
   	      		error : function() {
						$.messager.alert("修改失败", "服务器请求失败!", "error");
				}
   	      	
   	      	});
   	
   	}
   	function Selectshenhe(status){
   	$("#sanpinshenpidg").datagrid("load", {
				shenhezhuangtai : status
			});
   	}
   	
    </script>
  </body>
</html>
