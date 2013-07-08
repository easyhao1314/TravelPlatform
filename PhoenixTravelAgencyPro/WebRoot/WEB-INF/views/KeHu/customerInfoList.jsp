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
	<div style="margin:10px 0px;"></div>  
    <div class="easyui-panel" title="客户列表" style="width:900px">  
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
    <script>  
        function submitForm(){  
           $.post("fenghuang/customInfoList.do", $("#ff").serialize(),function(data){
           		$("#queryResult").datagrid('loadData',data);
           },"json");
        }  
          function clearForm(){  
            $('#ff').form('clear');  
        }  
    </script>  
    </div>
    
    <!-- 查询结果展示 -->
    <div style="width:900px;height:505px;">
	   <table id="queryResult"
			data-options="url:'fenghuang/customInfoList.do'" border="false" singleSelect="true" 
			fit="true" fitColumns="true" pagination="true" toolbar="#tb" >
			<thead>
				<tr>
					<th data-options="field:'cityName',align:'right'" width="80">城市</th>
					<th data-options="field:'name',align:'right'" width="100">客户名称</th>
					<th data-options="field:'moblePhone',align:'right'" width="100">电话</th>
					<th data-options="field:'fax',align:'right'" width="100" >传真</th>
					<th data-options="field:'htsj1',align:'right'" width="100" >销售顾问</th>
					<th data-options="field:'htsj2',align:'right'" width="60" >联系人数</th>
					<th data-options="field:'htsj3',align:'right'" width="80" >最后联系日期</th>
					<th data-options="field:'htsj4',align:'right'" width="80" >创建时间</th>
					<th data-options="field:'htsj5',align:'right'" width="80" >交易统计</th>
				</tr>
		</thead>
	</table>
	<!-- 查询结果展示 -->
	</div>
	
	<div id="tb">
			<a
			href="javascript:addMianBanMoshi();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">新增</a>&nbsp;&nbsp;|
			<a
			href="javascript:editMianBan();" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true">修改</a>&nbsp;&nbsp;| 
			<a
			href="javascript:shanchu();" class="easyui-linkbutton"
			iconCls="icon-cut" plain="true">删除</a>
	</div>
	<!-- 新增客户信息 -->
	<div id="addCustom" class="easyui-dialog" title="新增客户信息"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:800px;height:300px;padding:10px;">
		<form id="addForm" method="post">
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
							<label>所在省份:</label>
					</td>
					<td><input id="shengfen" name="province" class="easyui-combobox" 
						required="true">
						</div></td>
					<td><div class="fitem">
							<label>所在城市:</label>
					</td>
					<td><input id="chengshi" name="city" class="easyui-combobox" 
						required="true">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>联系人:</label>
					</td>
					<td><input name="contact" class="easyui-validatebox" required="true">
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
							<label>座机:</label>
					</td>
					<td><input name="telePhone" class="easyui-numberbox"
						>
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
					<td><input name="msn" class="easyui-validatebox"
						>
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
					<td><input name="fax" class="easyui-numberbox"
						>
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
	<div id="updateCustom" class="easyui-dialog" title="修改客户信息"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:800px;height:300px;padding:10px;">
		<form id="updateForm" method="post">
			<table id="updateTable" align="center" >
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
							<label>所在省份:</label>
					</td>
					<td><input id="updateshengfen" name="province" class="easyui-combobox" 
						required="true">
						</div></td>
					<td><div class="fitem">
							<label>所在城市:</label>
					</td>
					<td><input id="updatechengshi" name="city" class="easyui-combobox" 
						required="true">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>联系人:</label>
					</td>
					<td><input name="contact" class="easyui-validatebox" required="true">
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
							<label>座机:</label>
					</td>
					<td><input name="telePhone" class="easyui-numberbox"
						>
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
					<td><input name="msn" class="easyui-validatebox"
						>
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
					<td><input name="fax" class="easyui-numberbox"
						>
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
		//弹出增加客户信息面板
		function addMianBanMoshi() {
			$("#addCustom").dialog("open");
			var url = "fenghuang/findCustomAndCityName.do";
			$.getJSON(url,function(data1){
		     	//查询所有省份名称
				 $("#shengfen").combobox({  
				 data: data1.provinceNames,
			     valueField:"id",   
			     textField:"pcdName" ,
			     filter: function(q, row){
						var opts = $(this).combobox('options');
						return row[opts.textField].indexOf(q) != -1;
					}
			     });
			     //查询所有城市名称
				 $("#chengshi").combobox({  
				 data: data1.cityNames,
			     valueField:"id",   
			     textField:"cityName" ,
			     filter: function(q, row){
						var opts = $(this).combobox('options');
						return row[opts.textField].indexOf(q) != -1;
					}
			     }); 
			     }); 
				$("#addForm").form("clear");
			}
		
		//弹出修改客户信息面板
		function editMianBan() {
			$("#updateCustom").dialog("open");
				var url = "fenghuang/findCustomAndCityName.do";
				$.getJSON(url,function(data1){
		     	//查询所有省份名称
				 $("#updateshengfen").combobox({  
				 data: data1.provinceNames,
			     valueField:"id",   
			     textField:"pcdName" ,
			     filter: function(q, row){
						var opts = $(this).combobox('options');
						return row[opts.textField].indexOf(q) != -1;
					}
			     }); 
			     
			     //查询所有城市名称
				 $("#updatechengshi").combobox({  
				 data: data1.cityNames,
			     valueField:"id",   
			     textField:"cityName",
			     filter: function(q, row){
						var opts = $(this).combobox('options');
						return row[opts.textField].indexOf(q) != -1;
					}
			     }); 
			     });
			//准备回显的数据
				var row = $("#queryResult").datagrid('getSelected') ;
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
					   $('#updateForm').form('load',data.rows[0]);
					},
					error : function() {
						$.messager.alert("删除失败", "服务器请求失败!", "error");
					}
				});
			}
			$("#updateCustom").form("clear");
			}
		
		
		
		//关闭保存面板
		function closeaddMianBan() {
			$("#addCustom").dialog('close');
		} 
		//关闭修改面板
		function closeupdateMianBan(){
			$("#updateCustom").dialog('close');
		} 
		//点击面板保存
		function mainBanMoshiSave() {
			$("#addForm").form('submit', {
				url : 'fenghuang/addCustom.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {
					var result = eval('(' + data + ')');//吧字符串转换为可执行代码
					if (result.success) {
						$.messager.alert("保存成功", "保存成功！", "info");
						$("#addCustom").dialog('close');
						$("#queryResult").datagrid('reload');
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$("#queryResult").datagrid('reload');
					}
				}
			});
		}
		
		
		//点击面板修改
		function mainBanMoshiUpdate() {
			$("#updateForm").form('submit', {
				url : 'fenghuang/updateCustom.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {
					var result = eval('(' + data + ')');//吧字符串转换为可执行代码
					if (result.success) {
						$.messager.alert("修改成功", "修改成功！", "info");
						$("#updateCustom").dialog('close');
						$("#queryResult").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#queryResult").datagrid('reload');
					}
				}
			});
		}
		//点击删除按钮
		function shanchu() {
			var row = $("#queryResult").datagrid("getSelected");
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
							$("#queryResult").datagrid('reload');
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
