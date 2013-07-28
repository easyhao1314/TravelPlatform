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
	<div class="easyui-panel" title= "客户信息查询"
		style="height:140px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
        <form id="ff" method="post"> 
            <table>  
             <tr>
               <td>团号:</td>
               <td><input class="easyui-validatebox" type="text" id="tuanNo" name="tuanNo" /></td>
               <td>团队类型:</td>
               <td><input class="easyui-validatebox" type="text" id="type" name="type" /></td>                      
               <td></td>  
               <td></td>               
               </tr>
              
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
		<div class="easyui-panel" title="客户列表" style="height:480px;width: auto;">
	   <table id="dgCustomer" class="easyui-datagrid"
			data-options="url:'fenghuang/customInfoList.do',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
			pagination="true" toolbar="#currencyDatagridtoolbar">
			<thead>
				<tr>
				   <th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'dicName',align:'right'" width="80">城市</th>
					<th data-options="field:'tuanNo',formatter:onOperateKehu" width="100">团号</th>
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
	<div id="addCustomer" class="easyui-dialog" title="新增客户信息"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:800px;height:450px;padding:10px;">
		<form id="addCustomerForm" method="post">
			<table align="center">
			<tr>
               <td>团号:</td>
               <td><input class="easyui-validatebox" type="text"  name="tuanNo" /></td>
               <td>团队类型:</td>
               <td><input class="easyui-validatebox" type="text"  name="type" /></td>                                   
               </tr>
				<tr>
					<td><div class="fitem">
							<label>客户公司名称:</label>
					</td>
					<td colspan="3"><input name="name" class="easyui-validatebox" size="60">
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
					<td><input name="lxr" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>职位:</label>
					</td>
					<td><input name="post" class="easyui-validatebox">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>年龄:</label>
					</td>
					<td><input name="age" class="easyui-validatebox" >
						</div></td>
					<td><div class="fitem">
							<label>性别:</label>
					</td>
					<td><input name="sex" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=10',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
				</tr>
				<tr>
					<td><div class="fitem">
							<label>身份证号:</label>
					</td>
					<td colspan="3"><input name="sfzn" class="easyui-validatebox" size="60">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>通讯地址:</label>
					</td>
					<td colspan="3"><input name="address" class="easyui-validatebox" size="60">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>集团:</label>
					</td>
					<td colspan="3"><input name="jituan" class="easyui-validatebox" size="60">
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
					<td><div class="fitem">
							<label>销售/维护人:</label>
					</td>
					<td><input name="xiaoshou" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=11',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
					<td><div class="fitem">
							<label>合作级别:</label>
					</td>
					<td><input name="hzjb" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=4',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
				</tr>
				<tr>
					<td><div class="fitem">
							<label>联系人数:</label>
					</td>
					<td><input name="lxrs" class="easyui-validatebox" validType="email">
						</div></td>
					<td><div class="fitem">
							<label>团队类型:</label>
					</td>
					<td><input name="type" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=25',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
						</div></td>
				</tr>
					<tr>
					<td><div class="fitem">
							<label>备注:</label>
					</td>
					<td colspan="3"><input name="bz" class="easyui-validatebox" size="60">
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
	<div id="updateCustomer" class="easyui-dialog" title="修改客户信息"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:800px;height:450px;padding:10px;">
		<form id="updateCustomerForm" method="post">
			<table align="center">
			<tr>
					<td><div class="fitem">
							<label>团号:</label>
					</td>
					<td><input name="tuanNo" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>团队类型:</label>
					</td>
					<td><input name="type" class="easyui-validatebox">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>客户公司名称:</label>
					</td>
					<td colspan="3"><input name="name" class="easyui-validatebox" size="60">
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
					<td><input name="lxr" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>职位:</label>
					</td>
					<td><input name="post" class="easyui-validatebox">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>年龄:</label>
					</td>
					<td><input name="age" class="easyui-validatebox" >
						</div></td>
					<td><div class="fitem">
							<label>性别:</label>
					</td>
					<td><input name="sex" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=10',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
				</tr>
				<tr>
					<td><div class="fitem">
							<label>身份证号:</label>
					</td>
					<td colspan="3"><input name="sfzn" class="easyui-validatebox" size="60">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>通讯地址:</label>
					</td>
					<td colspan="3"><input name="address" class="easyui-validatebox" size="60">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>集团:</label>
					</td>
					<td colspan="3"><input name="jituan" class="easyui-validatebox" size="60">
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
					<td><div class="fitem">
							<label>销售/维护人:</label>
					</td>
					<td><input name="xiaoshou" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=11',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
					<td><div class="fitem">
							<label>合作级别:</label>
					</td>
					<td><input name="hzjb" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=4',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
				</tr>
				<tr>
					<td><div class="fitem">
							<label>联系人数:</label>
					</td>
					<td><input name="lxrs" class="easyui-validatebox" validType="email">
						</div></td>
					<td><div class="fitem">
							<label>团队类型:</label>
					</td>
					<td><input name="type" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=25',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
						</div></td>
				</tr>
					<tr>
					<td><div class="fitem">
							<label>备注:</label>
					</td>
					<td colspan="3"><input name="bz" class="easyui-validatebox" size="60">
						</div></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:mainBanMoshiSave();" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> <a href="javascript:closeaddMianBan();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input type="hidden" name="id" />
		</form>
	</div>
	<!-- 修改客户信息 -->
		<!-- 查看客户信息 -->
	<div id="updateCustomerkehu" class="easyui-dialog" title="客户信息"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:800px;height:450px;padding:10px;">
		<form id="updateCustomerkehuForm" method="post">
			<table align="center">
				<tr>
					<td><div class="fitem">
							<label>客户公司名称:</label>
					</td>
					<td colspan="3"><input name="name" class="easyui-validatebox" size="60">
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
					<td><input name="lxr" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>职位:</label>
					</td>
					<td><input name="post" class="easyui-validatebox">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>年龄:</label>
					</td>
					<td><input name="age" class="easyui-validatebox" >
						</div></td>
					<td><div class="fitem">
							<label>性别:</label>
					</td>
					<td><input name="sex" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=10',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
				</tr>
				<tr>
					<td><div class="fitem">
							<label>身份证号:</label>
					</td>
					<td colspan="3"><input name="sfzn" class="easyui-validatebox" size="60">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>通讯地址:</label>
					</td>
					<td colspan="3"><input name="address" class="easyui-validatebox" size="60">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>集团:</label>
					</td>
					<td colspan="3"><input name="jituan" class="easyui-validatebox" size="60">
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
					<td><div class="fitem">
							<label>销售/维护人:</label>
					</td>
					<td><input name="xiaoshou" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=11',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
					<td><div class="fitem">
							<label>合作级别:</label>
					</td>
					<td><input name="hzjb" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=4',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
				</tr>
				<tr>
					<td><div class="fitem">
							<label>联系人数:</label>
					</td>
					<td><input name="lxrs" class="easyui-validatebox" validType="email">
						</div></td>
					<td><div class="fitem">
							<label>团队类型:</label>
					</td>
					<td><input name="type" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=25',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
						</div></td>
				</tr>
					<tr>
					<td><div class="fitem">
							<label>备注:</label>
					</td>
					<td colspan="3"><input name="bz" class="easyui-validatebox" size="60">
						</div></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:mainBanMoshiSave();" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> <a href="javascript:closeaddMianBan();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input type="hidden" name="id" />
		</form>
	</div>
	<!-- 查看客户信息 -->
	<!-- 查看联系人信息 -->
	<div id="updateCustomerlxr" class="easyui-dialog" title="联系人信息"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:800px;height:450px;padding:10px;">
		<form id="updateCustomerlxrForm" method="post">
			<table align="center">
				<tr>
					<td><div class="fitem">
							<label>客户公司名称:</label>
					</td>
					<td colspan="3"><input name="name" class="easyui-validatebox" size="60">
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
					<td><input name="lxr" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>职位:</label>
					</td>
					<td><input name="post" class="easyui-validatebox">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>年龄:</label>
					</td>
					<td><input name="age"   class="easyui-numberbox">
						</div></td>
					<td><div class="fitem">
							<label>性别:</label>
					</td>
					<td><input name="sex" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=10',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
				</tr>
				<tr>
					<td><div class="fitem">
							<label>身份证号:</label>
					</td>
					<td colspan="3"><input name="sfzn" class="easyui-validatebox" size="60">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>通讯地址:</label>
					</td>
					<td colspan="3"><input name="address" class="easyui-validatebox" size="60">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>集团:</label>
					</td>
					<td colspan="3"><input name="jituan" class="easyui-validatebox" size="60">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>手机:</label>
					</td>
					<td><input name="moblePhone"   class="easyui-numberbox">
						</div></td>
					<td><div class="fitem">
							<label>电话:</label>
					</td>
					<td><input name="telePhone"   class="easyui-numberbox">
						</div></td>
				</tr>
				
				<tr>
					<td><div class="fitem">
							<label>QQ:</label>
					</td>
					<td><input name="qq"   class="easyui-numberbox">
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
					<td><div class="fitem">
							<label>销售/维护人:</label>
					</td>
					<td><input name="xiaoshou" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=11',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
					<td><div class="fitem">
							<label>合作级别:</label>
					</td>
					<td><input name="hzjb" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=4',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
				</tr>
				<tr>
					<td><div class="fitem">
							<label>联系人数:</label>
					</td>
					<td><input name="lxrs"   class="easyui-numberbox">
						</div></td>
					<td><div class="fitem">
							<label>团队类型:</label>
					</td>
					<td><input name="type" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=25',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
						</div></td>
				</tr>
					<tr>
					<td><div class="fitem">
							<label>备注:</label>
					</td>
					<td colspan="3"><input name="bz" class="easyui-validatebox" size="60">
						</div></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:mainBanMoshiSave();" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> <a href="javascript:closeaddMianBan();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input type="hidden" name="id" />
		</form>
	</div>
	<!-- 查看联系人信息 -->
	
	
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
		console.info($('#dgCustomer').datagrid('options'));
		var opts = $('#dgCustomer').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
			    tuanNo:$("#tuanNo").val(),
			    type:$("#type").val,
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
						$('#dgCustomer').datagrid('loadData',data);
					}
				});
		}
		
	
		//弹出增加客户信息面板
		function addMianBanMoshi() {
			$("#addCustomer").dialog("open");
				$("#addCustomerForm").form("clear");
			}
		
		//弹出修改客户信息面板
		function editMianBan() {		
			//准备回显的数据
				var row = $("#dgCustomer").datagrid('getSelected') ;
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
					   $('#updateCustomerForm').form('load',data.rows[0]);
					   	$("#updateCustomer").dialog("open");	
					},
					error : function() {
						$.messager.alert("删除失败", "服务器请求失败!", "error");
					}
				});
			}
			$("#updateCustomer").form("clear");
			}
		
		
		
		//关闭保存面板
		function closeaddMianBan() {
			$("#addCustomer").dialog('close');
		} 
		//关闭修改面板
		function closeupdateMianBan(){
			$("#updateContact").dialog('close');
		} 
		//点击面板保存
		function mainBanMoshiSave() {
			$("#addCustomerForm").form('submit', {
				url : 'fenghuang/addCustom.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {
					var result = eval('(' + data + ')');//吧字符串转换为可执行代码
					if (result.success) {
						$.messager.alert("保存成功", "保存成功！", "info");
						$("#addCustomer").dialog('close');
						$("#dgCustomer").datagrid('reload');
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$("#dgCustomer").datagrid('reload');
					}
				}
			});
		}
		
		
		//点击面板修改
		function mainBanMoshiUpdate() {
			$("#updateCustomerForm").form('submit', {
				url : 'fenghuang/updateCustom.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {
					var result = eval('(' + data + ')');//吧字符串转换为可执行代码
					if (result.success) {
						$.messager.alert("修改成功", "修改成功！", "info");
						$("#updateCustomer").dialog('close');
						$("#dgCustomer").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#dgCustomer").datagrid('reload');
					}
				}
			});
		}
		//点击删除按钮
		function shanchu() {
			var row = $("#dgCustomer").datagrid("getSelected");
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
			var row = $("#dgCustomer").datagrid("getSelected");
			if(row){
				var param = {
					"updateId" : row.id
				};
			
				$.ajax({
					url : "fenghuang/preparedCustomInfo.do",
					data : param,
					dataType : "json",
					success : function(data) {
		
					   $('#updateCustomerkehuForm').form('load',data.rows[0]);
				       $("#updateCustomerkehu").dialog("open");
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
			var row = $("#dgCustomer").datagrid("getSelected");
			if(row){
				var param = {
					"updateId" : row.id
				};
			
				$.ajax({
					url : "fenghuang/preparedCustomInfo.do",
					data : param,
					dataType : "json",
					success : function(data) {
		
					   $('#updateCustomerlxrForm').form('load',data.rows[0]);
				       $("#updateCustomerlxr").dialog("open");
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
