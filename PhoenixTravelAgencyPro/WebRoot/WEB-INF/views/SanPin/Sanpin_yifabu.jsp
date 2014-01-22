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
	<link href="pirobox/css_pirobox/style_1/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="pirobox/css/css.css"/>
<link rel="stylesheet" type="text/css" href="pirobox/content/css/default.css"/>
<link rel="stylesheet" type="text/css" href="pirobox/css/sansation/stylesheet.css"/>
<script type="text/javascript" src="pirobox/js/jquery.min.js"></script>
<script type="text/javascript" src="pirobox/js/jquery-ui-1.8.2.custom.min.js"></script>
<script type="text/javascript" src="pirobox/js/pirobox_extended.js"></script>
<script type="text/javascript">

</script>
  </head>
  
  <body>
	<div id="fabutb">
		<a href="javascript:quxiaofabu();" class="easyui-linkbutton"
			iconCls="icon-cut" plain="true">取消发布该团</a>&nbsp;&nbsp;|
		<a href="javascript:fukuandialogopen();" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true">请求付款</a>
		
	</div>
    <table id="sanpinyifabudg" class="easyui-datagrid"
		data-options="url:'fenghuang/Sanpinliebiao.do?fabustate=2&master=${sessionScope.userId}',border:false,singleSelect:true,fit:true,fitColumns:true"
		pagination="true" toolbar="#fabutb" >
		<thead>
			<tr>
				<th data-options="field:'tuanNo',formatter:xingcheng" width="57">团号</th>
				<th data-options="field:'tuanName',formatter:baoming" width="57">团名/路线</th>
				<th data-options="field:'groupdate'" width="50">出团日期</th>
				<th data-options="field:'Tourdate'" width="50">回团日期</th>
				<th data-options="field:'chufa'" width="50">出发城市</th>
				<th data-options="field:'tonghang'" width="50">同行价</th>
				<th data-options="field:'zhikejia'" width="50">直客价</th>
				<th data-options="field:'numbermaster',formatter:yushouyishou"  width="50">预收/已收</th>
				<th data-options="field:'prand'" width="50">产品品牌</th>
				<th data-options="field:'shoukestate',formatter:openshouke" width="50">收客状态</th>
				
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
	<div id="shenpitijiaodlg" class="easyui-dialog" title="提交备注说明" style="width:480px;height:320px;padding:10px"
            data-options="
                iconCls: 'icon-save',closed:true,
                buttons: [{
                    text:'提交',
                    iconCls:'icon-ok',
                    handler:function(){
                     sanpinshenpiwindowsubmit();
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $('#shenpitijiaodlg').dialog('close');
                    }
                }]
            ">
        	<textarea id="shenpibeizhu" style="width: 445px; height: 225px;"></textarea>
    </div>
	
	
	
	
	
    
    
	<!-- 应付款窗口 -->
	
	<div id="fukuan" class="easyui-dialog" title="应付款窗口" data-options="iconCls:'icon-save',modal:true,closed:true,buttons: [{
                    text:'提交',
                    iconCls:'icon-ok',
                    handler:function(){
                        caozuozhongxinsave();
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $('#fukuan').dialog('close');
                    }
                }]" style="width:500px;height:300px;padding:10px;">
                <div class="demo-info">
        <div class="demo-tip icon-tip"></div>
        <div>提示：应付款最大金额为100万</div>
    </div>
        <form id="fukuanform" action="">
        	<table  style="width: 400px;">
        	<tr>
        		<td>应付款项： 
        		<input id="kxsm"   class="easyui-combotree"  data-options="url:'js/demo/combotree/fukuanTree.json',method:'get',required:true" style="width:320px;">
    			<input title="款项说明" type="hidden" id="kuanxiang" name="kxsm" class="easyui-validatebox">
    			</td>
        	</tr>
        	<tr>
        	<td>收款单位：<input name="khmc" class="easyui-validatebox" required style="width:320px;"  /></td>
        	</tr>
        	<tr>
        	<td>应付日期： <input id="fukuantime" name="fukuantime" type="text" class="easyui-datebox" required="required" style="width:320px;"></td>
        	</tr>
        	<tr>
        	<td>金&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;额：<input  name="yfk" class="easyui-numberspinner" min="0" max="1000000"    data-options="required:true" style="width:320px;" ></input></td>
        	</tr>
        	<tr>
        	<td>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：<input name="beizhu" class="easyui-validatebox" style="width: 320px;" /></td>
        	</tr>
        	<tr>
        	<td> <a href="javascript:void(0)"  class="easyui-linkbutton" onclick="tupianfujiandialogopen()">打开图片附件选择窗口</a></td>
        	</tr>
        	
        	
        	<tr>
        	<td>
        	<input id="huituantime"  name="huituantime" class="easyui-validatebox" type="hidden" style="width: 150px;" />
        	<input id="shenfenid" type="hidden" name="shenfenid" value="3" class="easyui-validatebox" style="width: 150px;" />
        	<input id="shanchu" type="hidden" name="shanchu" value="1" class="easyui-validatebox" style="width: 150px;" />
        	<input id="fpxk" type="hidden" name="fpxk" value="0" class="easyui-validatebox" style="width: 150px;" />
			<input id="ykfp" type="hidden" name="ykfp" value="0" class="easyui-validatebox" style="width: 150px;" />
        	<input id="ykfp" type="hidden" name="ysyfid" value="2" class="easyui-validatebox" style="width: 150px;" />
        	<input id="caiwuid" type="hidden" name="caiwuid" value="1" class="easyui-validatebox" style="width: 150px;" />
        	<input id="team" type="hidden" name="team"  class="easyui-validatebox" style="width: 150px;" />
        	<input id="huilvid" type="hidden" name="huilvid" value="1" class="easyui-validatebox" style="width: 150px;" />
        	<input id="tuanduimc" name="tuanduimc" type="hidden" class="easyui-validatebox" >
        	<input id="tupiandizhi" name="tupiandizhi" type="hidden"  class="easyui-validatebox" >
        	<input  name="xiaoshou" value="${sessionScope.userId}" type="hidden" class="easyui-validatebox" >
        	</td>
        	</tr>
        	</table>
        </form>
        
    </div>
	<!-- 应付款窗口END -->
	
	<!-- 图片选择窗口 -->
	<div id="tupianfujian" class="easyui-dialog" title="图片附件选择窗口" data-options="modal:true,closed:true,buttons: 
	 			[{
                    text:'确定',
                    iconCls:'icon-ok',
                    handler:function(){
                    tupianxuanze();
                    
                    }
                }]" style="width:500px;height:650px;padding:10px">
		        <table id="dgPicManage" class="easyui-datagrid" 
		data-options="url:'fenghuang/getPicManages.do',border:true,singleSelect:true,fit:true,fitColumns:true,pageSize:10"
		pagination="true" toolbar="#dgPicToolbar">
		<thead>
			<tr>
				<th data-options="field:'url',formatter:onOperateStyle" width="80">图片</th>
			    <th data-options="field:'searchName'" width="80">图片名称</th>
			</tr>
		</thead>
	</table>
    </div>	
    
	<div id="tupianfujiantb">
      <input id="tupiansearchName" name="searchName" class="easyui-validatebox" ><a href="javascript:void(0)" class="easyui-linkbutton" onclick="searchtupianfujian()">Submit</a>
        </div>
	
	
	
	 <div id="tupianchaxundlg" class="easyui-dialog" title="查询窗口" data-options="iconCls:'icon-search',modal:true,closed:true,buttons: 
	 			[{
                    text:'搜索',
                    iconCls:'icon-search',
                    handler:function(){
                    searchDepartment();
                    searchDepartmentReset();
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                    $('#tupianchaxundlg').dialog('close');
                    }
                }]" style="width:400px;height:200px;padding:10px">
    <div class="demo-info">
        <div class="demo-tip icon-tip"></div>
        <div>在此处搜索图片的名字,已关键字为准进行模糊查找。</div>
    </div>
        <input id="searchName" name="searchName" class="easyui-validatebox" style="width: 300px; text-align: center; margin-left: 30px;">
    </div>
		<div id="dgPicToolbar">
			 <a href="javascript:void(0);" onclick="javascript:$('#tupianchaxundlg').dialog('open');" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>  
 
		</div>
	<script type="text/javascript">
	
function tupianxuanze(){
	var tupianrow = $('#dgPicManage').datagrid('getSelected');
	$('#tupiandizhi').attr('value',tupianrow.url);
	$('#tupianfujian').dialog('close');
}

function searchDepartment(){
searchName:$("#searchName").val();
	$('#dgPicManage').datagrid('load',{
		searchName:$("#searchName").val()	
	});
	
}
	function searchDepartmentReset(){
		searchName:$("#searchName").val();
}
	function tupianfujiandialogopen(){
		$('#tupianfujian').dialog('open');
	}
	
	
	
	
	
	
	
		function onOperateStyle(val,row,index){
       var returnStyleValue='<img alt="修改" src="'+row.url+'" width="100px" height="100px">';
		   
       return returnStyleValue;
         }
         
         
         
         
         
         
         
         
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
   	  		$('#shenpibeizhu').val("");
   	  		$('#shenpitijiaodlg').dialog('open');
   	  }
   	  function sanpinshenpiwindowsubmit(){
   	  var row = $('#sanpinyifabudg').datagrid('getSelected');
   	  var shenpibeizhu = $('#shenpibeizhu').val();
   	  var url = "fenghuang/addsanpinshenpi.do?shenpituanNo="+row.tuanNo+"&shenpibeizhu="+shenpibeizhu;
   	      	$.ajax({
   	      		url:url,
   	      		data:row.tuanNo,
   	      		datatype:"json",
   	      		success:function(data){
   	      			$.messager.alert("保存成功", "保存成功!", "info");
   	      			$('#shenpitijiaodlg').dialog('close');
   	      		},
   	      		error : function() {
						$.messager.alert("修改失败", "服务器请求失败!", "error");
				}
   	      	
   	      	});
   	  
   	  return;
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
   	  return '<a href="javascript:yifabubaoming(\''+row.tuanNo+'\')" style="text-decoration:none;  ">'+row.tuanName+'</a>';
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
   	    //<a style="background-image: url('Image/tu.png'); width:140px; height:21px; padding-left: 10px ; display:block; " >TH-202022003332</a>
   	    return '<a href="javascript:openSanpinDetail(\''+row.tuanNo+'\',\''+row.tuanName+'\',\''+row.xlid+'\')" style="text-decoration:none;  ">'+row.tuanNo+'</a>';
   	    }
   	    function openSanpinDetail(tuanNo,tuanName,xlid){
   				var url= "Sanpin_mingxi.do?tuanNo="+tuanNo+"&tuanName="+tuanName+"&xianid="+xlid;
   				window.open (url, 'newwindow', 'height=100, width=400, top=0,left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no'); 
   				return;
   			}
   		function fukuandialogopen(){
   		var row = $('#sanpinyifabudg').datagrid('getSelected');
   	$('#tuanduimc').attr('value',row.tuanNo);
	$('#team').attr('value',row.tuanName);
	$('#chutuantime').attr('value',row.chutuantime);
	$('#huituantime').attr('value',row.huituantime);
	
	
	
   				$('#fukuan').dialog('open');
   		}
   		
   		//付款保存
   		function caozuozhongxinsave() {
		
		var tupiandizhijs = $('#tupiandizhi').val();
		if(tupiandizhijs==''){
		 $.messager.confirm('提示', '没有选择图片，是否继续？', function(r){
                if (r){
                   fukuanformcomit(); 
                }
                else{
                	return;
                }
            });
		}
		if(tupiandizhijs!=''){
			fukuanformcomit();
		}
				}
	function fukuanformcomit(){
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
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
					}
				}
			});
        
	}
	</script>
  </body>
</html>
