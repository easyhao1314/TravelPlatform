<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>散拼团列表</title>
    
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

   <div id="tb">
		<a href="javascript:void(0);" onclick="javascript:$('#searchDic').dialog('open');" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">查询</a>
		<a href="javascript:sanpinupdate();" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true">修改</a>
		<a href="javascript:UpdateSanpinstate();" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true">正式收客</a>
		<a href="javascript:DeleteSanpin();" class="easyui-linkbutton"
			iconCls="icon-cut" plain="true">删除</a>
	</div>
<table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/Sanpinliebiao.do?fabustate=1&master=${sessionScope.userId}',border:false,singleSelect:true,fit:true,fitColumns:true, onClickRow: onClickRow,onRowContextMenu: sanpincaozuoMenu"
		pagination="true" toolbar="#tb">
		<thead>
			<tr>
				<th data-options="field:'tuanNo'" width="50">团号</th>
				<th data-options="field:'tuanName',formatter:onOperateSanpinList" width="50" >团名/路线</th>
				<th data-options="field:'groupdate'" width="50">出团日期</th>
				<th data-options="field:'Tourdate'" width="50">回团日期</th>
				<th data-options="field:'chufa'" width="50">出发城市</th>
				<th data-options="field:'tonghang'" width="50">同行价</th>
				<th data-options="field:'zhikejia'" width="50">直客价</th>
				<th data-options="field:'numbermaster'" width="50">预收人数</th>
				<th data-options="field:'productbrand',hidden:true" width="50">产品品牌_隐藏的</th>
			</tr>
		</thead>
	</table>
	<div id="searchDic" class="easyui-dialog" title="查询业务字段"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;"><div align="left"> 
		</div><form id="selectFrome" method="post"><div align="left"> 
			</div><table align="left">
				<tr>
					<td><div class="fitem"><div align="left"> 
							<label>出团日期:</label></div>
					</td>
					<td><input id="searchgroupdate" name="groupdate" class="easyui-datebox" ></input>
						</div></td>
					<td><div class="fitem">
							<label>回团日期:</label>
					</td>
					<td><input id="searchTourdate" name="Tourdate" class="easyui-datebox" ></input>
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>关键字:</label>
					</td>
					<td><input id="searchtuanName" name="tuanName"
						class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>产品品牌:</label>
					</td>
					<td><input id="searchproductbrand" class="easyui-combobox" 
			name="productbrand"
			data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=32',
					valueField:'dicId',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	">
						</td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:searchFormSubmit();" class="easyui-linkbutton"
						iconCls="icon-ok">查询</a> <a href="javascript:closedSearch();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
						
						</td>
				</tr>
			</table>
			<input id="searchDicType" name="dicType" type="hidden">
		</form>
		 <div id="sanpincaozuott">
        <a href="javascript:addjidiao()" title="提交到计调报价" class="icon-add" ></a>
    	 </div>
		
	</div>
	<div id="sanpincaozuowindow" class="easyui-window" title="选择计调" data-options="iconCls:'icon-save',closed:true,minimizable:false,tools:'#sanpincaozuott'" style="width:650px;height:400px;padding:10px;">
	<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'west',split:true" style="width:307px;">
				<div class="easyui-accordion" style="width:300px;">
	<div title="选择员工" data-options="iconCls:'icon-help'" >
			<div style="height: 311px; ">
        <table id="dgUsers"   class="easyui-datagrid"
		data-options="url:'fenghuang/getUsers.do',border:true,singleSelect:true,fit:true,fitColumns:true,pageSize:10,onClickRow: onClickRow,view:groupview,
          groupField:'departName',
          groupFormatter:function(value,rows){
           return '所属部门:'+value + ' - ' + rows.length + '名员工';
          }"
		pagination="true" toolbar="#tbUsers">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'userName',editor:'text'" width="10">姓名</th>
				<th data-options="field:'departmentId',formatter:function(value,row){
							return row.departName;
						},editor:{
					type:'combobox',
							options:{
								valueField:'id',
								textField:'departName',
								url:'fenghuang/getDepartmentComboboxs.do'
							}
				}"
					width="10">部门</th>
			</tr>
		</thead>
	</table>
	</div> 		
	</div>
	</div>
			</div>
			<div data-options="region:'center'" style="padding:10px">
			<form id="zhuanjidiaoForm" action="">
				填写备注说明：<br /><textarea name="beizhu" style="height:120px; width: 290px" > </textarea>
				<input id="tuanNo" title="团号" type="hidden" name="tuanNo" class="easyui-validatebox" style="width: 290px;" >
				<input id="tuanName" title="团名" type="hidden" name="tuanName" class="easyui-validatebox" style="width: 290px;" >
				<input id="chutime" title="出团时间" type="hidden" name="chutuantime" class="easyui-validatebox" style="width: 290px;" >
				<input id="huitime" title="回团时间" type="hidden" name="huituantime" class="easyui-validatebox" style="width: 290px;" >
				<input id="userId" title="提交人" type="hidden" name="userId" class="easyui-validatebox" style="width: 290px;" >
				<input id="shenpiren" title="审批人" type="hidden" name="shenpiren" class="easyui-validatebox" style="width: 290px;" >
				<input id="operateType" title="操作类型" type="hidden" name="operateType" class="easyui-validatebox" style="width: 290px;" >
				</form>
			</div>
		</div>
	
	
	</div>
	<div id="xianludialog" class="easyui-dialog" title="选择线路" data-options="modal:true,closed:true,iconCls:'icon-save',buttons: 
	 			[{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
                    savexianlusanpin();
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                    $('#xianludialog').dialog('close');
                    }
                }]" style="width:500px;height:600px;padding:10px;">
    <table id="xianludg" class="easyui-datagrid"
		data-options="border:true,singleSelect:true,fit:true,fitColumns:true,pageSize:10"
		pagination="true" toolbar="#currencyDatagridtoolbar">
		<thead>
			<tr>
				<th data-options="field:'xianid'" width="50px">编号</th>
				<th data-options="field:'xianluname'" width="50px">线路名称</th>
				<th data-options="field:'guojia'" width="50px">国家数</th>
				<th data-options="field:'tianshu'" width="50px">天数</th>
				<th data-options="field:'userName'" width="50px">维护人</th>
			</tr>
		</thead>
	</table>
	<input id="xlid" type="hidden">
    </div>
	
	
    <input id="xianid" type="hidden">
	<div id="mmsanpincaozuo" class="easyui-menu" style="width:120px;">
		<!-- <div data-options="iconCls:'icon-edit'" onClick="zhuanjidiao()">转到计调报价</div>
		<div data-options="iconCls:'icon-search'"  onClick="chajidiao()">查看订单进度</div> -->
		<div><span>行程</span>
    <div>
    <div onClick="shedingxingcheng()" data-options="iconCls:'icon-add'">生成行程</div>
    <div onClick="daoruxingcheng()" data-options="iconCls:'icon-search'">导入行程</div>
    <div onClick="diaoyongxingcheng()" data-options="iconCls:'icon-search'">调用行程</div>
    <input id="numberday" type="hidden">
    </div>
    </div>
	</div>
	<script type="text/javascript">
	
	function savexianlusanpin(){
		var xlid = $('#xlid').val();
		var row = $('#xianludg').datagrid("getSelected");
		$.ajax({
					url :"fenghuang/savesanpinxingcheng.do?xlid="+xlid+"&xianluname="+row.xianluname+"&guojia="+row.guojia+"&tianshu="+row.tianshu+"&xianid="+row.xianid,
					data :xlid,
					dataType : "json",
					success : function(data) {
					
					$.messager.alert("成功", " 保存成功!", "info");
					$('#xianludialog').dialog('close');
					},
					error : function() {
						$.messager.alert("保存失败", "保存失败!", "error");
					}
				});
	}
	function diaoyongxingcheng(){
		var xianid = $('#xianid').val();
		$.ajax({
					url :"fenghuang/selectricheng.do?xianluid="+xianid,
					data :xianid,
					dataType : "json",
					success : function(data) {
					if(data.rows.length!=0){
					$.messager.alert("发送失败", " 该团已设定行程!", "error");
					}else{
								$('#xianludialog').dialog('open');
					
					}
					
					},
					error : function() {
						
					}
				});

						$('#xianludg').datagrid({  
    					url:'fenghuang/xianluinfo.do?xingchengku=1'
						});
						

	}
	function daoruxingcheng(){
	var xianid = $('#xianid').val();
		$.ajax({
					url :"fenghuang/selectricheng.do?xianluid="+xianid,
					data :xianid,
					dataType : "json",
					success : function(data) {
					if(data.rows.length!=0){
					$.messager.alert("发送失败", " 该团已设定行程!", "error");
					}else{
					window.open('uploadXingcheng.do?xianid='+xianid,'上传文档','height=400,width=480,top=200,left=200,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
					}
					
					},
					error : function() {
						
					}
				});
	
	
	}
	function shedingxingcheng(){
	var xianid = $('#xianid').val();
	var numberday = $('#numberday').val();
		$.ajax({
					url :"fenghuang/selectricheng.do?xianluid="+xianid,
					data :xianid,
					dataType : "json",
					success : function(data) {
					if(data.rows.length!=0){
					$.messager.alert("发送失败", " 该团已设定行程!", "error");
					}else{
					 	$.messager.confirm('提示', '系统 会根据散拼行程天数生成新的日程，是否继续?', function(r){
							if (r){
					$.ajax({
					url :"fenghuang/shengchengricheng.do?xianid="+xianid+"&numberday="+numberday,
					data :xianid,
					dataType : "json",
					success : function(data) {
					$.messager.alert("消息", "生成线路日程成功!", "info");
					}
					
					});
					
								   }
						});
					
					}
					
					},
					error : function() {
						
					}
				});
	}
	
	function upfabustate(){
   	  	var tuanNo=$('#tuanNo').val();
   	  	alert(tuanNo);
         var  url = "fenghuang/upsanpin.do?tuanNo="+tuanNo+"&fabustate="+0;
           $.ajax({
					url :url,
					data : tuanNo,
					dataType : "json",
					success : function(data) {
					$("#sanpinliebiaodg").datagrid("reload");
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
   	      }
	
	function chajidiao(){
		var tuanNo = $('#tuanNo').val();
		var tuanName = $('#tuanName').val();
		var xianid = $('#xianid').val();
      var url= "Sanpin_jidiao.do?tuanNo="+tuanNo+"&tuanName="+tuanName+"&xianid="+xianid;
       var tab = $('#tt').tabs('getSelected'); 
		if (tab){  
	                 var index = $('#tt').tabs('getTabIndex', tab); 
	                 $('#tt').tabs('close', index);  
	       } 
	       
	       $('#tt').tabs('add', {
				         title : "计调订单进度",
				         href : url,
				      //  closable : true,
				         });
	}
	function sanpinupdate(){
		var row = $("#dg").datagrid("getSelected");	
		if(row==null){return;}
		var url= "SanPin_new.do?tuanNo="+row.tuanNo;
        var tab = $('#tt').tabs('getSelected'); 
		if (tab){  
	                 var index = $('#tt').tabs('getTabIndex', tab); 
	                 $('#tt').tabs('close', index);  
	       } 
	       
	       $('#tt').tabs('add', {
				         title : "散拼修改",
				         href : url,
				         closable : true,
				         });
	}
	
	
	
	
	function addjidiao(){
		var row = $("#dgUsers").datagrid("getSelected");
			if(row==null){return;}
				$('#shenpiren').attr('value',row.id);
				$('#zhuanjidiaoForm').form('submit', {
				url : 'fenghuang/addOperate.do',
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
	
	
	function sanpincaozuoMenu(e, rowIndex, rowData){
	$('#tuanNo').attr('value',rowData.tuanNo);
	$('#chutime').attr('value',rowData.groupdate);
	$('#huitime').attr('value',rowData.Tourdate);
	$('#tuanName').attr('value',rowData.tuanName);
	$('#userId').attr('value','${sessionScope.userId}');
	$('#operateType').attr('value',2);
	$('#numberday').attr('value',rowData.numberday);
	$('#xianid').attr('value',rowData.xlid);
	$('#xlid').attr('value',rowData.xlid);
		 e.preventDefault();
         $('#mmsanpincaozuo').menu('show', {
        left:e.pageX,
        top:e.pageY
    }); 
	}
	function zhuanjidiao(){
	var tuanNo=$('#tuanNo').val();
		$.ajax({
					url :"fenghuang/Operateinfo.do?tuanNo="+tuanNo,
					data :tuanNo,
					dataType : "json",
					success : function(data) {
					if(data.rows.length!=0){
					$.messager.alert("发送失败", " 该团已发送计调!", "error");
					}else{
					$('#sanpincaozuowindow').window('open');
					}
					
					},
					error : function() {
						
					}
				});
		
	}
	
	
	
	
		function onOperateSanpinList(val,row) {
      return '<a href="javascript:openSanpinDetai(\''+row.tuanNo+'\')">'+row.tuanName+'</a>';
		}
		function openSanpinDetai(tuanNo){
		 var row = $("#dg").datagrid("getSelected");
		
      var url= "Xingcheng_mx.do?xianid="+row.xlid;
       var tab = $('#tt').tabs('getSelected'); 
		if (tab){  
	                 var index = $('#tt').tabs('getTabIndex', tab); 
	                 $('#tt').tabs('close', index);  
	       } 
	       
	       $('#tt').tabs('add', {
				         title : "散拼行程详细信息",
				         href : url,
				      //  closable : true,
				         });
				        			         
	      }
		function closedSearch() {
			$('#searchDic').dialog('close');
		}
		function onClickRow(index) {
			if (editIndex != index) {
				if (endEditing()) {
					$('#dg').datagrid('selectRow', index).datagrid('beginEdit',
							index);
					editIndex = index;
				} else {
					$('#dg').datagrid('selectRow', editIndex);
				}
			}
		}
		function searchFormSubmit() {
			$("#searchDic").dialog("close");
			$("#dg").datagrid("load", {
				tuanName : $("#searchtuanName").val(),
				groupdate : $("#searchgroupdate").datebox('getValue'),
				Tourdate : $("#searchTourdate").datebox('getValue'),
				productbrand : $("#searchproductbrand").combobox('getValue')
			});

		}
	function UpdateSanpinstate(){
	var row = $("#dg").datagrid("getSelected");
	var yingshou = row.numbermaster*row.zhikejia;
	 $.messager.confirm('My Title', '将“'+row.tuanName+'”为正式收客?', function(r){
		if (r){
		
 	$.ajax({
					url :"fenghuang/upsanpin.do?tuanNo="+row.tuanNo+"&fabustate="+2,
					data :row.tuanNo,
					dataType : "json",
					success : function(data) {
					$.ajax({
					url :"fenghuang/inserttuanbiao.do?team="+row.tuanName+"&tuanduimc="+row.tuanNo+"&chutuantime="+row.groupdate+"&huituantime="+row.Tourdate+"&renshu="+row.numbermaster+"&yingshou="+yingshou+"&shenfenid="+4+"&ysyfid="+1+"&shanchu="+1+"&huilvid="+1+"&caiwuid="+6+"&xiaoshou="+row.jiantuanren,
					data :row.tuanNo,
					dataType : "json",
					success : function(data) {
					$.messager.alert("保存成功", "保存成功!", "info");
					},
					error : function() {
						
					}
				});
					$("#dg").datagrid("reload");
					},
					error : function() {
						
					}
				});
		}
	});
	
 }
 function DeleteSanpin(){
 	var row = $('#dg').datagrid('getSelected');
 		$.messager.confirm('提示', '是否删除“'+row.tuanName+'”?，继续将会删除之前所有做过的形成！！', function(r){
			if (r){
				$.ajax({
					url :"fenghuang/deletesanpin.do?tuanNo="+row.tuanNo+"&xianluid="+row.xlid,
					data :row.tuanNo,
					dataType : "json",
					success : function(data) {
					$.messager.alert("消息", "删除成功!", "info");
					$('#dg').datagrid('reload');
					},
					error : function() {
					$.messager.alert("消息", "删除失败!", "error");
					}
				});
				
			}
		});
 }
 
 
 
	</script>

  </body>
</html>
