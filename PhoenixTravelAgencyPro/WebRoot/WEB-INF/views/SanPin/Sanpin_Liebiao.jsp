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
	</div>
<table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/Sanpinliebiao.do?fabustate=1',border:false,singleSelect:true,fit:true,fitColumns:true"
		pagination="true" toolbar="#tb">
		<thead>
			<tr>
				<th data-options="field:'tuanNo',formatter:onOperateSanpinList1" width="50">团号</th>
				<th data-options="field:'tuanName',formatter:onOperateSanpinList" width="50">团名/路线</th>
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
		style="width:500px;height:200px;padding:10px;">
		<form id="selectFrome" method="post">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>出团日期:</label>
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
						</div></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:searchFormSubmit();" class="easyui-linkbutton"
						iconCls="icon-ok">查询</a> <a href="javascript:closedSearch();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input id="searchDicType" name="dicType" type="hidden">
		</form>
		
		
	</div>
		<div id="mm" class="easyui-menu" style="width:120px;">
    <div onClick="view(this)" data-options="iconCls:'icon-search'">查看</div>
    <div onClick="add()" data-options="iconCls:'icon-add'">新增</div>
    <div onClick="edit()" data-options="iconCls:'icon-edit'">编辑</div>
    <div onClick="del()" data-options="iconCls:'icon-remove'">删除</div>
    <div class="menu-sep"></div>
    <div onClick="print()" data-options="iconCls:'icon-print'">打印</div>
    <div onClick="reload()" data-options="iconCls:'icon-reload'">刷新</div>
		</div>
		
		
		
		
		
	<div id="mmtest" class="easyui-menu" style="width:120px;">
		<input id="hideinput" style="display: none;" />
		<div data-options="iconCls:'icon-remove'" onClick="upfabustate()">取消发布状态</div>
		<div data-options="iconCls:'icon-edit'" onClick="tuanduibaoming()">团队报名</div>
		<div onClick="testView(3)">查看3</div>
		<div onClick="testView(4)">查看4</div>
		<div onClick="testView(5)">查看5</div>
	</div>
	<script type="text/javascript">
	
	
		function Select() {
			$("#searchDic").dialog("open");
			$("#searchForm").form("clear");
		}
		function closedSearch() {
			$('#searchDic').dialog('close');
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
		 function	onOperateSanpinList(val,row){
      return '<a href="javascript:openSanpinDetail('+row.tuanNo+')">'+row.tuanName+'</a>';
   
   }
   function openSanpinbaoming(tuanNo){  	
      var url= "Sanpin_mingxi.do?tuanNo="+tuanNo;
       var tab = $('#tt').tabs('getSelected'); 
		if (tab){  
	                 var index = $('#tt').tabs('getTabIndex', tab); 
	                 $('#tt').tabs('close', index);  
	       } 
	       
	       $('#tt').tabs('add', {
				         title : "散拼详细信息",
				         href : url,
				      //  closable : true,
				         });   
			        
				$.ajax({
					url : "fenghuang/Sanpinliebiao.do?tuanNo="+tuanNo,
					data : tuanNo,
					dataType : "json",
					success : function(data) {
					$('#jibenForm').form('load',{"tuanNo":data.rows[0].tuanNo});
					//$('#mingxiForm').form('load',data.rows[0]);
					//alert(data.rows[0].tuanNo);
					
					   //$('#mingxiForm').form('load',rows[0]);

					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
		   }		
		   
		   
		   function onOperateSanpinList1(val,row){
		     return '<span onclick="testOnclick(event,'+row.tuanNo+')" style="width: 20px">'+row.tuanNo+'</span>';
		   }
   	      function testOnclick(e,tuan){
   	      $('#hideinput').attr('value',tuan);
   	         $('#mmtest').menu('show', {
				left : e.pageX,
				top : e.pageY
			});   
   	      }
   	      //取消发布状态功能
   	      function upfabustate(){
   	  	var tuanNo=$('#hideinput').val();
         var  url = "fenghuang/upsanpin.do?tuanNo="+tuanNo+"&fabustate="+2;
           $.ajax({
					url :url,
					data : tuanNo,
					dataType : "json",
					success : function(data) {
					$("#dg").datagrid("reload");
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
   	      }
   	      function tuanduibaoming(){
   	      	var tuanNo=$('#hideinput').val();
   	      	var url= "SanPin_baoming.do?tuanNo="+tuanNo;
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
   	      
   	      /* 
   	      //右键菜单
   	     function onRowContextMenu(e, rowIndex, rowData){
   e.preventDefault();
	
    
    $('#mm').menu('show', {
        left:e.pageX,
        top:e.pageY
    });       
		}
		function view(index){
			var row = $("#dg").datagrid("getSelected");
			alert(row.tuanNo);
		}
	*/
	</script>
 
  
  
	
  </body>
</html>
