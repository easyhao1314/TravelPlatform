<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title></title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link rel="stylesheet" type="text/css" href="js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="js/demo/demo.css">
<script type="text/javascript" src="js/jquery.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/jquery.json.js" charset="UTF-8"></script>
</head>

<body>
<div style="margin:10px 0px;"></div>  
    <div class="easyui-panel" title="客户所属区域查询" style="width:1000px">  
        <div style="padding:0px">  
        <form id="ff" method="post"> 
            <table>  
            <tr>
               <td>关键字:</td>  
               <td><input class="easyui-validatebox" type="text" name="kw" /></td>
               <td>
               		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">查询</a>
               		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
               </td>
             </tr>         
             </table>
          </form>
            
    </div>  
    </div>
    <!-- 查询结果展示 -->
    <div style="width:900px;height:540px;">
	   <table id="queryResult"></table>
	</div>
	<!-- 查询结果展示 -->
	
   <script type="text/javascript">
   	 	var editIndex = undefined;
   		$("#queryResult").datagrid({
   			url : 'fenghuang/customerAreaWeihu.do' ,
   			border : false ,
   			singleSelect : true ,
   			fit : true ,
   			fitColumns : true ,
   			toolbar : '#tb' ,
   			pagination: true,
			checkOnSelect : true,
			pageSize : 10 ,
			pageList : [10,20,50]  ,
			onClickRow : function(rowIndex,rowData){
				if(editIndex == undefined){
					$("#queryResult").datagrid('beginEdit',rowIndex);
					editIndex = rowIndex ; 
				}else{
					if(rowIndex != editIndex){
						$("#queryResult").datagrid('endEdit',editIndex);
						$("#queryResult").datagrid('beginEdit',rowIndex);
						editIndex = rowIndex ; 
					}
				}
			},
			columns : [[{
						field : 'id',
						title : '编号',
						width : 100 ,
					},{
						field : 'name',
						title : '名称',
						width : 100 ,
						editor : {
							type : 'text'
						}
					}
			]],
			toolbar : [ {
				text : '增加',
				iconCls : 'icon-save',
				handler : function() {
					if(editIndex != undefined){//表示有某一行正在编辑
						//关闭编辑状态
						$('#queryResult').datagrid('endEdit',editIndex);
					}else{
						$('#queryResult').datagrid('insertRow', {
							index : 0,
							row : {
							}
						});
						$('#queryResult').datagrid('beginEdit', 0);
						editIndex = 0 ;
					}
				}
			}, '-', {
				text : '刪除',
				iconCls : 'icon-remove',
				handler : function() {
					var rows = $('#queryResult').datagrid('getSelected');
					if(rows){
						$.messager.confirm("请确认","您确定要删除吗？",function(result){
							if(result){
								var param = {
									"deleteRow" : rows.id
								};
								console.info(param);
								$.ajax({
									url : 'fenghuang/deleteCustomerArea.do',
									data : param ,
									dataType : 'json',
									type : 'POST' ,
									success : function(data){
										if(data.success){
											$.messager.alert("提示信息","删除成功！","info");
											$("#queryResult").datagrid('reload');
										}else{
											$.messager.alert("提示信息","删除失败！","info");
										}
									}
								});
							}
						});
					}else{
						$.messager.alert("提示信息","请选择要删除的记录","error");
					}
				}
			}, '-',  {
				text : '保存修改',
				iconCls : 'icon-save',
				handler : function() {
					$('#queryResult').datagrid('endEdit',editIndex);//有验证功能。验证成功后执行onAfterEdit
				}	
			},'-',{
				text : '取消编辑',
				iconCls : 'icon-redo',
				handler : function() {
					$('#queryResult').datagrid('rejectChanges');//取消编辑，回滚
					editIndex = undefined ;
				}	
			}  ],
			
			onAfterEdit : function(rowIndex, rowData, changes){//保存修改之后调用此方法
				var inserted = $('#queryResult').datagrid('getChanges','inserted');
				var updated = $('#queryResult').datagrid('getChanges','updated');
				if(inserted != ""){
					$.ajax({
						url : 'fenghuang/addCustomerArea.do',
						data : $.toJSON(rowData) ,
						dataType : 'json',
						type : 'POST' ,
						contentType : 'application/json;charset=UTF-8',
						success : function(data){
							if(data.success){
								$.messager.alert("提示信息","添加成功","info");
								$("#queryResult").datagrid('reload');
								editIndex = undefined ;
							}else{
								$.messager.alert("提示信息","添加失败","info");
							}
						}
					});
				}
				if(updated != ""){
				console.info(updated[0]);
					$.ajax({
						url : 'fenghuang/updateCustomerArea.do',
						data : $.toJSON(updated[0]) ,
						dataType : 'json',
						type : 'POST' ,
						contentType : 'application/json;charset=UTF-8',
						success : function(data){
							if(data.success){
								$.messager.alert("提示信息","修改成功","info");
								$("#queryResult").datagrid('reload');
								editIndex = undefined ;
							}else{
								$.messager.alert("提示信息","修改失败","info");
							}
						}
					});
				}
				//console.info(rowData);
				editIndex = undefined ;
			} ,
		});
		
		//保存修改
		function getChanges() {
			$('#queryResult').datagrid('endEdit', editIndex);
			var row = $("#queryResult").datagrid("getChanges");
			//console.info(encodeURI($.toJSON(row)));
			if (row) {
				var param = {
					"updateRow" : encodeURI($.toJSON(row),"UTF-8")
				};
				$.ajax({
					url : "fenghuang/updateCustomVIP.do",
					data : param,
					dataType : "json",
					contentType : "application/json;charset=UTF-8",
					success : function(data) {
						if (data.success) {
							$.messager.alert("修改成功", "修改成功！", "info");
							$("#queryResult").datagrid('reload');
							editIndex = undefined;
						} else {
							$.messager.alert("修改失败", "修改失败!", "error");
						}
					},
					error : function() {
						$.messager.alert("修改失败", "服务器请求失败!", "error");
					}
				});
			}

		}
   </script>
    	
    
</body>
</html>
