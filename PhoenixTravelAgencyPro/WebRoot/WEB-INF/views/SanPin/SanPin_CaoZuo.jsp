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
  <!-- 下拉列表 -->
		

	
	
   <div id="tb">
		<a href="javascript:Select();" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">查询</a>
		<a href="javascript:sanpinupdate();" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true">修改</a>
	</div>
<table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/Sanpinliebiao.do?fabustate=1',border:false,singleSelect:true,fit:true,fitColumns:true, onClickRow: onClickRow,onRowContextMenu: sanpincaozuoMenu"
		pagination="true" toolbar="#tb">
		<thead>
			<tr>
				<th data-options="field:'tuanNo'" width="50">团号</th>
				<th data-options="field:'tuanName',formatter:onOperateSanpinList" width="50" >团名/路线</th>
				<th data-options="field:'groupdate'" width="50">出团日期</th>
				<th data-options="field:'Tourdate'" width="50">回团日期</th>
				<th data-options="field:'targetpopulation'" width="50">出发城市</th>
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
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=12',
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
	<div id="updatesanpinwindow" class="easyui-window" title="Modal Window" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:200px;padding:10px;">
        <form id="upsanpinform" action="">
        	<table>
        		<tr><td>团号</td><td><input name="tuanNo" class="easyui-validatebox" /></td><td>团名</td><td><input name="tuanName" class="easyui-validatebox" /></td></tr>
        		<tr><td>出团日期</td><td><input name="groupdate" class="easyui-validatebox" /></td><td>回团日期</td><td><input name="Tourdate" class="easyui-validatebox" /></td></tr>
        		<tr><td>出发城市</td><td><input name="" class="easyui-validatebox" /></td><td>终点城市</td><td><input name="" class="easyui-validatebox" /></td></tr>
        		<tr><td>目标人群</td><td><input name="" class="easyui-validatebox" /></td><td>航空公司</td><td><input name="" class="easyui-validatebox" /></td></tr>
        		<tr><td>地域类型</td><td><input name="" class="easyui-validatebox" /></td><td>目标人群</td><td><input name="" class="easyui-validatebox" /></td></tr>
        		<tr><td>去程航班</td><td><input name="" class="easyui-validatebox" /></td><td>回程航班</td><td><input name="" class="easyui-validatebox" /></td></tr>
        		<tr><td>产品类型</td><td><input name="" class="easyui-validatebox" /></td><td>产品品牌</td><td><input name="" class="easyui-validatebox" /></td></tr>
        		<tr><td>酒店标准</td><td><input name="" class="easyui-validatebox" /></td><td>用餐标准</td><td><input name="" class="easyui-validatebox" /></td></tr>
        	</table>
        </form>
    </div>
	
	
    
	<div id="mmsanpincaozuo" class="easyui-menu" style="width:120px;">
		<div data-options="iconCls:'icon-edit'" onClick="zhuanjidiao()">转到计调报价</div>
	</div>
	<script type="text/javascript">
	function sanpinupdate(){
		var row = $("#dg").datagrid("getSelected");	
		if(row==null){return;}
		$('#updatesanpinwindow').window('open');
		$('#upsanpinform').form('load',row);
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
		 e.preventDefault();
         $('#mmsanpincaozuo').menu('show', {
        left:e.pageX,
        top:e.pageY
    }); 
	}
	function zhuanjidiao(){
		$('#sanpincaozuowindow').window('open');
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
	</script>

  </body>
</html>
