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
	<div class="easyui-panel" title="联系人信息查询"
		style="height:140px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
        <form id="ff" method="post"> 
            <table>  
            
              
               <tr> 
               <td>联系人:</td>
               <td><input class="easyui-validatebox" type="text" id="lxr" name="lxr" /></td>                    
               <td>手机:</td>
               <td><input class="easyui-validatebox" type="text" id="moblePhone" name="moblePhone" /></td>
               <td>电话:</td> 
               <td><input class="easyui-validatebox" type="text" id="telePhone" name="telePhone" /></td>
               </tr>  
                                          
               <tr>
               <td>QQ:</td>
               <td><input class="easyui-validatebox" type="text" id="qq" name="qq" /></td>
               <td>MSN:</td>
               <td><input class="easyui-validatebox" type="text" id="msn" name="msn" /></td>                      
               <td>维护日期:</td>  
               <td><input class="easyui-validatebox" type="text" id="zhtime" name="zhtime" />             
               </td>               
               </tr>
                 
               <tr>
               <td>客户名称:</td>  
               <td><input class="easyui-validatebox" type="text" id="name" name="name" /></td>                                  
               <td>城市:</td>  
               <td><input id="city" name="city" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>		
                <td>销售/维护人:</td>  
               <td><input class="easyui-validatebox" type="text" id="xiaoshou" name="xiaoshou" />
                <a href="javascript:lxrSelectLike();" 
								class="easyui-linkbutton" iconCls="icon-ok">查询</a>
						<a href="javascript:void(0)" class="easyui-linkbutton"
							iconCls="icon-undo" onclick="$('#ff').form('clear')">重置</a>
               </td>                         
               </tr>              
             </table>
          </form>
            
        </div>  
   
    
    <!-- 查询结果展示 -->
		<div class="easyui-panel" title="联系人列表" style="height:480px;width: auto;">
	   <table id="dgContact" class="easyui-datagrid"
			data-options="url:'fenghuang/customInfoList.do',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
			pagination="true" toolbar="#currencyDatagridtoolbar">
			<thead>
				<tr>
				   <th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'dicName',align:'right'" width="80">城市</th>
					<th data-options="field:'name',formatter:onOperateKehu" width="100">对应客户</th>
					<th data-options="field:'lxr',formatter:onOperateKehulxr" width="100">联系人</th>
					<th data-options="field:'moblePhone',align:'right'" width="100">手机</th>					
					<th data-options="field:'telePhone',align:'right'" width="100">电话</th>
					<th data-options="field:'chuanzhen',align:'right'" width="100" >传真</th>
					<th data-options="field:'qq',align:'right'" width="100" >QQ</th>
					<th data-options="field:'msn',align:'right'" width="100" >MSN</th>						
					<th data-options="field:'xiaoshou',align:'right'" width="100" >销售顾问</th>
					<th data-options="field:'lxrs',align:'right'" width="60" >共享人</th>
					<th data-options="field:'cjtime',align:'right'" width="80" >创建时间</th>
				</tr>
		</thead>
	</table>
	<!-- 查询结果展示 -->
	<div id="currencyDatagridtoolbar">
		     <a href="javascript:addMianBanMoshi();" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>  
		     <a href="javascript:editMianBan();" class="easyui-linkbutton" iconCls="icon-save"  plain="true">修改</a>
		     <a href="javascript:shanchu();" class="easyui-linkbutton" iconCls="icon-cut" plain="true">删除</a>  
		</div>
	</div>
	
	
	<!-- 新增客户信息 -->
	<div id="addContact" class="easyui-dialog" title="新增联系人信息"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:800px;height:300px;padding:10px;">
		<form id="addContactForm" method="post">
			<table align="center">
				<tr>
					<td><div class="fitem">
							<label>客户公司名称:</label>
					</td>
					<td><input name="name" class="easyui-validatebox"
						required="true" size="70">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>所属大区:</label>
					</td>
					<td><input id="daqu" name="daqu" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=6',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
					<td><div class="fitem">
							<label>所在城市:</label>
					</td>
					<td><input id="city" name="city" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
				</tr>
				<tr>
					<td><div class="fitem">
							<label>联系人:</label>
					</td>
					<td><input name="lxr" class="easyui-validatebox" required="true">
						</div></td>
					<td><div class="fitem">
							<label>职位:</label>
					</td>
					<td><input name="post" >
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>通讯地址:</label>
					</td>
					<td><input name="address" class="easyui-validatebox"
						required="true" size="70">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>手机:</label>
					</td>
					<td><input name="moblePhone" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>电话:</label>
					</td>
					<td><input name="telePhone" class="easyui-numberbox">
						</div></td>
				</tr>
				
				<tr>
					<td><div class="fitem">
							<label>QQ:</label>
					</td>
					<td><input name="qq" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>MSN:</label>
					</td>
					<td><input name="msn" class="easyui-validatebox">
						</div></td>
				</tr>
				
				<tr>
					<td><div class="fitem">
							<label>邮箱:</label>
					</td>
					<td><input name="email" class="easyui-validatebox" validType="email">
						</div></td>
					<td><div class="fitem">
							<label>传真:</label>
					</td>
					<td><input name="chuanzhen" class="easyui-numberbox">
						</div></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:mainBanMoshiSave();" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> <a href="javascript:closeaddMianBan();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 新增客户信息 -->
	
	
	<!-- 修改客户信息 -->
	<div id="updateContact" class="easyui-dialog" title="修改联系人信息"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:800px;height:300px;padding:10px;">
		<form id="updateContactForm" method="post">
			<table id="updateTable" align="center" >
				<tr>
					<td><div class="fitem">
							<label>客户公司名称:</label>
					</td>
					<td colspan="3"><input name="name" class="easyui-validatebox"
						required="true" size="70">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>所属大区:</label>
					</td>
					<td><input id="daqu" name="daqu" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=6',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
					<td><div class="fitem">
							<label>所在城市:</label>
					</td>
					<td><input id="city" name="city" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
				</tr>
				<tr>
					<td><div class="fitem">
							<label>联系人:</label>
					</td>
					<td><input name="lxr" class="easyui-validatebox" required="true">
						</div></td>
					<td><div class="fitem">
							<label>职位:</label>
					</td>
					<td><input name="post" >
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>身份证号:</label>
					</td>
					<td colspan="3"><input name="sfzn" class="easyui-validatebox"
						size="70">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>通讯地址:</label>
					</td>
					<td colspan="3"><input name="address" class="easyui-validatebox"
						size="70">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>手机:</label>
					</td>
					<td><input name="moblePhone" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>电话:</label>
					</td>
					<td><input name="telePhone" class="easyui-numberbox">
						</div></td>
				</tr>
				
				<tr>
					<td><div class="fitem">
							<label>QQ:</label>
					</td>
					<td><input name="qq" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>MSN:</label>
					</td>
					<td><input name="msn" class="easyui-validatebox">
						</div></td>
				</tr>
				
				<tr>
					<td><div class="fitem">
							<label>邮箱:</label>
					</td>
					<td><input name="email" class="easyui-validatebox" validType="email">
						</div></td>
					<td><div class="fitem">
							<label>传真:</label>
					</td>
					<td><input name="chuanzhen" class="easyui-numberbox">
						</div></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:mainBanMoshiUpdate();" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> <a href="javascript:closeupdateMianBan();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input type="hidden" name="id" />
		</form>
	</div>
	<!-- 修改客户信息 -->
	
	<div id="updateKehu" class="easyui-dialog" title="客户信息"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:800px;height:300px;padding:10px;">
		<form id="updateKehuForm" method="post">
			<table id="updateTable" align="center" >
				<tr>
					<td><div class="fitem">
							<label>客户公司名称:</label>
					</td>
					<td colspan="3"><input name="name" class="easyui-validatebox"
						required="true" size="70">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>所属大区:</label>
					</td>
					<td><input id="daqu" name="daqu" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=6',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
					<td><div class="fitem">
							<label>所在城市:</label>
					</td>
					<td><input id="city" name="city" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
				</tr>
				<tr>
					<td><div class="fitem">
							<label>联系人:</label>
					</td>
					<td><input name="lxr" class="easyui-validatebox" required="true">
						</div></td>
					<td><div class="fitem">
							<label>职位:</label>
					</td>
					<td><input name="post" >
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>身份证号:</label>
					</td>
					<td colspan="3"><input name="sfzn" class="easyui-validatebox"
						size="70">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>通讯地址:</label>
					</td>
					<td colspan="3"><input name="address" class="easyui-validatebox"
						size="70">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>手机:</label>
					</td>
					<td><input name="moblePhone" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>电话:</label>
					</td>
					<td><input name="telePhone" class="easyui-numberbox">
						</div></td>
				</tr>
				
				<tr>
					<td><div class="fitem">
							<label>QQ:</label>
					</td>
					<td><input name="qq" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>MSN:</label>
					</td>
					<td><input name="msn" class="easyui-validatebox">
						</div></td>
				</tr>
				
				<tr>
					<td><div class="fitem">
							<label>邮箱:</label>
					</td>
					<td><input name="email" class="easyui-validatebox" validType="email">
						</div></td>
					<td><div class="fitem">
							<label>传真:</label>
					</td>
					<td><input name="chuanzhen" class="easyui-numberbox">
						</div></td>
				</tr>
				<tr>
					<td colspan="4" align="center"><a
						href="javascript:mainBanMoshiUpdate();" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> <a href="javascript:closeupdateMianBan();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input type="hidden" name="id" />
		</form>
	</div>
	<div id="updateKehulxr" class="easyui-dialog" title="联系人信息"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:800px;height:300px;padding:10px;">
		<form id="updateKehulxrForm" method="post">
			<table id="updateTable" align="center" >
				<tr>
					<td><div class="fitem">
							<label>客户公司名称:</label>
					</td>
					<td colspan="3"><input name="name" class="easyui-validatebox"
						required="true" size="70">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>所属大区:</label>
					</td>
					<td><input id="daqu" name="daqu" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=6',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
					<td><div class="fitem">
							<label>所在城市:</label>
					</td>
					<td><input id="city" name="city" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
				</tr>
				<tr>
					<td><div class="fitem">
							<label>联系人:</label>
					</td>
					<td><input name="lxr" class="easyui-validatebox" required="true">
						</div></td>
					<td><div class="fitem">
							<label>职位:</label>
					</td>
					<td><input name="post" >
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>身份证号:</label>
					</td>
					<td colspan="3"><input name="sfzn" class="easyui-validatebox"
						size="70">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>通讯地址:</label>
					</td>
					<td colspan="3"><input name="address" class="easyui-validatebox"
						size="70">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>手机:</label>
					</td>
					<td><input name="moblePhone" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>电话:</label>
					</td>
					<td><input name="telePhone" class="easyui-numberbox">
						</div></td>
				</tr>
				
				<tr>
					<td><div class="fitem">
							<label>QQ:</label>
					</td>
					<td><input name="qq" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>MSN:</label>
					</td>
					<td><input name="msn" class="easyui-validatebox">
						</div></td>
				</tr>
				
				<tr>
					<td><div class="fitem">
							<label>邮箱:</label>
					</td>
					<td><input name="email" class="easyui-validatebox" validType="email">
						</div></td>
					<td><div class="fitem">
							<label>传真:</label>
					</td>
					<td><input name="chuanzhen" class="easyui-numberbox">
						</div></td>
				</tr>
				<tr>
					<td colspan="4" align="center"><a
						href="javascript:mainBanMoshiUpdate();" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> <a href="javascript:closeupdateMianBan();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input type="hidden" name="id" />
		</form>
	</div>
	
	
	
   <script type="text/javascript">
   		$("#queryResult").datagrid({
   			pagination: true,
			checkOnSelect : true,
			onRowContextMenu : onRowContextMenu,
		});
		
		function onRowContextMenu(e, rowIndex, rowData) {
			e.preventDefault();
			var selected = $("#queryResult").datagrid('getRows'); //获取所有行集合对象
			selected[rowIndex].id; //index为当前右键行的索引，指向当前行对象
			$('#mm').menu('show', {
				left : e.pageX,
				top : e.pageY
			});
		}
		
		/**
          * 查询按钮
          */
		function lxrSelectLike(){
		console.info($('#dgContact').datagrid('options'));
		var opts = $('#dgContact').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				lxr: $("#lxr").val(),
				moblePhone: $("#moblePhone").val(),
				telePhone : $("#telePhone").val(),
				qq: $("#qq").val(),
				msn: $("#msn").val(),
				zhtime : $("#zhtime").val(),
				name: $("#name").val(),
				city: $("#city").combobox('getValue'),
				xiaoshou : $("#xiaoshou").val(),
				page:  opts.pageNumber ,
				rows:  opts.pageSize
			};
		
				$.ajax({
					url : 'fenghuang/customInfoList.do' ,
					data :  param,
					type : 'POST' ,
					dataType : 'json' ,
					success : function(data){
						$('#dgContact').datagrid('loadData',data);
					}
				});
		}
		
	
		//弹出增加客户信息面板
		function addMianBanMoshi() {
			$("#addContact").dialog("open");
				$("#addContactForm").form("clear");
			}
		
		//弹出修改客户信息面板
		function editMianBan() {
			$("#updateContact").dialog("open");			
			//准备回显的数据
				var row = $("#dgContact").datagrid('getSelected') ;
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
					   $('#updateContactForm').form('load',data.rows[0]);
					},
					error : function() {
						$.messager.alert("删除失败", "服务器请求失败!", "error");
					}
				});
			}
			$("#updateContact").form("clear");
			}
		
		
		
		//关闭保存面板
		function closeaddMianBan() {
			$("#addContact").dialog('close');
		} 
		//关闭修改面板
		function closeupdateMianBan(){
			$("#updateContact").dialog('close');
		} 
		//点击面板保存
		function mainBanMoshiSave() {
			$("#addContactForm").form('submit', {
				url : 'fenghuang/addCustom.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {
					var result = eval('(' + data + ')');//吧字符串转换为可执行代码
					if (result.success) {
						$.messager.alert("保存成功", "保存成功！", "info");
						$("#addContact").dialog('close');
						$("#dgContact").datagrid('reload');
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$("#dgContact").datagrid('reload');
					}
				}
			});
		}
		
		
		//点击面板修改
		function mainBanMoshiUpdate() {
			$("#updateContactForm").form('submit', {
				url : 'fenghuang/updateCustom.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {
					var result = eval('(' + data + ')');//吧字符串转换为可执行代码
					if (result.success) {
						$.messager.alert("修改成功", "修改成功！", "info");
						$("#updateContact").dialog('close');
						$("#dgContact").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#dgContact").datagrid('reload');
					}
				}
			});
		}
		//点击删除按钮
		function shanchu() {
			var row = $("#dgContact").datagrid("getSelected");
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
		
		
		function	onOperateKehu(val,row){
        return '<a href="javascript:openKehu('+row.id+')">'+row.id+'</a>';
        }
   
         function openKehu(id){  	
			//准备回显的数据
			var row = $("#dgContact").datagrid("getSelected");
			if(row){
				var param = {
					"updateId" : row.id
				};
			
				$.ajax({
					url : "fenghuang/preparedCustomInfo.do",
					data : param,
					dataType : "json",
					success : function(data) {
		
					   $('#updateKehuForm').form('load',data.rows[0]);
				       $("#updateKehu").dialog("open");
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
		      }
		   }	
		   
		   	function	onOperateKehulxr(val,row){
        return '<a href="javascript:openKehulxr('+row.id+')">'+row.id+'</a>';
        }
   
         function openKehulxr(id){  	
			//准备回显的数据
			var row = $("#dgContact").datagrid("getSelected");
			if(row){
				var param = {
					"updateId" : row.id
				};
			
				$.ajax({
					url : "fenghuang/preparedCustomInfo.do",
					data : param,
					dataType : "json",
					success : function(data) {
		
					   $('#updateKehulxrForm').form('load',data.rows[0]);
				       $("#updateKehulxr").dialog("open");
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
		      }
		   }			
   </script>
    	
    
</body>
</html>
