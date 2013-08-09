<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<link rel="stylesheet" type="text/css"
	href="js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="js/demo/demo.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/jquery.json.js"></script>
</head>

<body>
	<div class="easyui-panel" title="客户共享/转移"
		style="height:140px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
        <form id="ff" method="post"> 
            <table>  
            <tr>
               <td>客户名称:</td>  
               <td><input class="easyui-validatebox" type="text" id="name" name="name" /></td>             
               <td>联系人:</td>  
               <td><input class="easyui-validatebox" type="text" id="lxr" name="lxr" /></td>
               </tr>
               <tr> 
                <td>城市:</td>  
               <td><input class="easyui-validatebox" type="text" id="city" name="city" /></td>  
               <td>销售/维护人:</td>  
               <td><input class="easyui-validatebox" type="text" id="xiaoshou" name="xiaoshou" /></td>       
               <td>创建时间:</td>  
               <td><input class="easyui-validatebox" type="text" id="cjtime" name="cjtime" />
               <a href="javascript:kehuSelectLike();" 
								class="easyui-linkbutton" iconCls="icon-ok">查询客户</a>
						<a href="javascript:void(0)" class="easyui-linkbutton"
							iconCls="icon-undo" onclick="$('#ff').form('clear')">重置</a>
               </td>                                             
             </table>
          </form>
            
        </div>  
   
    
    <!-- 查询结果展示 -->
		<div class="easyui-panel" title="客户共享/转移" style="height:480px;width: auto;">
	   <table id="dg" class="easyui-datagrid"
			data-options="url:'fenghuang/customInfoList.do',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
			pagination="true" toolbar="#currencyDatagridtoolbar">
			<thead>
				<tr>
				   <th data-options="field:'ck',checkbox:true"></th>
					 <!--<th data-options="field:'city',align:'right'" width="80">城市</th>-->
					<th data-options="field:'name',align:'right'" width="100">客户名称</th>
					<th data-options="field:'telePhone',align:'right'" width="100">电话</th>
					<th data-options="field:'chuanzhen',align:'right'" width="100" >传真</th>
					<th data-options="field:'xiaoshou',align:'right'" width="100" >销售顾问</th>
					<th data-options="field:'lxrs',align:'right'" width="60" >联系人数</th>
					<th data-options="field:'zhtime',align:'right'" width="80" >最后联系日期</th>
					<th data-options="field:'cjtime',align:'right'" width="80" >创建时间</th>
				</tr>
		</thead>
	</table>
	<!-- 查询结果展示 -->
	<div id="currencyDatagridtoolbar">
		     <a href="javascript:editMianBan();" class="easyui-linkbutton" iconCls="icon-save"  plain="true">转移给销售</a>
		     <a href="javascript:addMianBanMoshi();" class="easyui-linkbutton" iconCls="icon-add" plain="true">共享给销售</a>   
		</div>
	</div>
	
	
	<!-- 选择要转移的销售 -->
	<div id="zhuanyi" class="easyui-dialog" title="选择要转移的销售"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:800px;height:300px;padding:10px;">
		<form id="zhuanyiForm" method="post">
			<table align="center">
				<tr>
					<td><div class="fitem">
							<label>销售人员:</label>
					</td>
					<td>
					<input name="id"  class="easyui-validatebox">
					<input name="xiaoshou" class="easyui-validatebox" required="true" size="70">
						</div></td>
				</tr>
				
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:mainBanMoshiUpdate();" class="easyui-linkbutton"
						iconCls="icon-ok">转移</a> <a href="javascript:closeaddMianBan();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 选择要转移的销售-->
	
	
	<!-- 选择要共享的销售 -->
	<div id="gongxiang" class="easyui-dialog" title="选择要共享的销售"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:800px;height:300px;padding:10px;">
		<form id="gongxiangForm" method="post">
			<table id="updateTable" align="center" >
				<tr>
					<td><div class="fitem">
							<label>销售:</label>
					</td>
					<td colspan="3"><input name="xiaoshou" class="easyui-validatebox"
						required="true" size="70">
						</div></td>
				</tr>
				
				<tr>
					<td colspan="4" align="center"><a
						href="javascript:mainBanMoshiSave();" class="easyui-linkbutton"
						iconCls="icon-ok">共享</a> <a href="javascript:closeupdateMianBan();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 选择要共享的销售-->
	
	
	
	
	
	
   <script type="text/javascript">
   		
		/**
          * 查询按钮
          */
		function kehuSelectLike(){
		console.info($('#dg').datagrid('options'));
		var opts = $('#dg').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				name: $("#name").val(),
				lxr : $("#lxr").val(),
				city: $("#city").val(),
				xiaoshou: $("#xiaoshou").val(),
				zhtime: $("#zhtime").val(),
				page:  opts.pageNumber ,
				rows:  opts.pageSize
			};
		
				$.ajax({
					url : 'fenghuang/customInfoList.do' ,
					data :  param,
					type : 'POST' ,
					dataType : 'json' ,
					success : function(data){
						$('#dg').datagrid('loadData',data);
					}
				});
		}
		
	
		//弹出共享客户信息面板
		function addMianBanMoshi() {
			$("#gongxiang").dialog("open");
				$("#gongxiangForm").form("clear");
			}
				//点击面板共享
		function mainBanMoshiSave() {
			$("#gongxiangForm").form('submit', {
				url : 'fenghuang/addCustom.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {
					var result = eval('(' + data + ')');//吧字符串转换为可执行代码
					if (result.success) {
						$.messager.alert("保存成功", "保存成功！", "info");
						$("#gongxiang").dialog('close');
						$("#dg").datagrid('reload');
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$("#dg").datagrid('reload');
					}
				}
			});
		}
		
		
		
		//关闭共享面板
		function closeaddMianBan() {
			$("#gongxiang").dialog('close');
		} 
		
		//弹出转移客户信息面板
		function editMianBan() {
			$("#zhuanyi").dialog("open");			
			//准备回显的数据
				var row = $("#dg").datagrid('getSelected') ;
				//alert(row.id);
				if(row){
				var param = {
					"updateId" : row.id 
				};
				$.ajax({
					url : "fenghuang/preparedCustomInfo.do",
					data : param,
					dataType : "json",
					success : function(data) {
					   $('#zhuanyiForm').form('load',data.rows[0]);
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
			}
			}
		
	
		//点击面板转移
		function mainBanMoshiUpdate() {
			$("#zhuanyiForm").form('submit', {
				url : 'fenghuang/updateXiaoshou.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {
					var result = eval('(' + data + ')');//吧字符串转换为可执行代码
					if (result.success) {
						$.messager.alert("修改成功", "修改成功！", "info");
						$("#zhuanyi").dialog('close');
						$("#dg").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#dg").datagrid('reload');
					}
				}
			});
		}
		//关闭转移面板
		function closeupdateMianBan(){
			$("#zhuanyi").dialog('close');
		} 
		//点击删除按钮
		function shanchu() {
			var row = $("#dg").datagrid("getSelected");
			if (row) {
				var param = {
					"deleteRow" : row.id
				};
				$.messager.confirm('删除确认','您确定要删除此项纪录吗？',function(r){
					if(r){
						$.ajax({
					url : "fenghuang/deleteCustomInfo.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("删除成功", "删除成功！", "info");
							$("#dg").datagrid('reload');
						} else {
							$.messager.alert("删除失败", "删除失败!", "error");
						}
					},
					error : function() {
						$.messager.alert("删除失败", "服务器请求失败!", "error");
					}
				});
					}
				});
				
			}
		}
   </script>
    	
    
</body>
</html>
