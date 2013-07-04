<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'DantuanAdd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/jquery.json.js"></script>

  <body> 
	<div id="addDt" >
		<form id="addForm" method="post">
			<table align="left">
				<tr>
<td><div class="fitem"><label>客户名称:</label></td><td><input name="khId" class="easyui-validatebox" required="true"></div>
     <a href="javascript:addKehu();" class="easyui-linkbutton" iconCls="icon-ok">新增客户</a></td>
<td><div class="fitem"><label>团号:</label></td><td><input name="tuanNO" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>团队操作类型：</label></td><td><input name="tdczlx" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>团队级别：</label></td><td><input name="tdjb" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>团名：</label></td><td><input name="tdm" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>团对状态：</label></td><td><input name="tdzt" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>出访人数：</label></td><td><input name="cfrs" class="easyui-validatebox" required="true"></div></td>
<!-- CountrySettingDictionary 旅游国家 -->
<td><div class="fitem"><label>出访国家：</label></td><td><input  name="cfgj" class="easyui-combobox"
 data-options="url:'fenghuang/CountrySetting.do',valueField:'csdNo',textField:'csdName'"></td>
</tr>
<tr>
<td><div class="fitem"><label>出访天数：</label></td><td><input id="cfts" name="cfts" type="text" class="easyui-numberbox" required="true"></div></td>
<!-- CountryState 国家所属州 --> 
<td><div class="fitem"><label>旅游区域：</label></td><td><input name="lyqy" class="easyui-combobox"
 data-options="url:'fenghuang/CountryState.do',valueField:'id',textField:'csName'"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>出团时间：</label></td><td><input  id="ctsj" name="ctsj" type="text" class="easyui-datebox"></div></td>
<td><div class="fitem"><label>回团时间：</label></td><td><input disabled="true" editable="false" id="htsj" name="htsj" type="text" class="easyui-datebox" required="required"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>销售：</label></td><td><input name="xsNo" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>计调：</label></td><td><input name="jdNo" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>客户经理：</label></td><td><input name="khjlNo" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>签证类型：</label></td><td><input name="qzlx" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>需办签证：</label></td><td><input name="xbqz" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>需办邀请：</label></td><td><input name="xbyq" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<!-- HotleStardictionary 酒店-星级字典维护 --> 
<td><div class="fitem"><label>酒店标准：</label></td><td><input name="jdbzNo" class="easyui-combobox"
  data-options="url:'fenghuang/HotleStar.do',valueField:'hsdNo',textField:'hsbName'"></div></td>
<td><div class="fitem"><label>酒店报价标准：</label></td><td><input name="jdbjNo" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>早餐标准：</label></td><td><input name="zcNo" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>午餐标准：</label></td><td><input name="zhongcNo" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>晚餐标准：</label></td><td><input name="wcNo" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>用餐报价标准：</label></td><td><input name="ycbjNo" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>巴士司导：</label></td><td><input name="bssdNo" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>巴士报价标准：</label></td><td><input name="bsbjNo" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>车型：</label></td><td><input name="bssdNo" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>导游报价标准：</label></td><td><input name="dybjNo" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>其他地接要求：</label></td><td colspan="3"><input name="qtdjDesc" class="easyui-validatebox" required="true" size="80"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>特殊要求：</label></td><td colspan="3"><input name="tsDesc" class="easyui-validatebox" required="true" size="80"></div></td>
</tr>
<tr>
<tr><td colspan="4s" align="center"><a href="javascript:dantuanSave();" class="easyui-linkbutton" iconCls="icon-ok">保存</a> <input  type="reset" value="重置"></td>
</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
	
<div id="addKehu" class="easyui-dialog" title="新增客户"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:300px;padding:10px;">
		<form id="addForm" method="post">
			<table align="center">
				<table align="center">
				<tr>
					<td><div class="fitem">
							<label>客户公司名称:</label>
					</td>
					<td colspan="3"><input name="name" class="easyui-validatebox"
						required="true" size="60">
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
					<td  colspan="3"><input name="address" class="easyui-validatebox"
						required="true" size="60">
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
						href="javascript:kehuSave();" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> <a href="javascript:closeaddMianBan();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
	<script type="text/javascript">
	$("#cfts").numberbox({
				required : true ,
				editable : false ,
				//onSelect: function(date){
						//		console.info((date.getFullYear()+":"+(date.getMonth()+1)+":"+date.getDate()));
						//	},
				onChange : function(newValue, oldValue){
					var ctsjValue = $("#ctsj").datebox("getValue");
					var param = {
						ctsj : ctsjValue ,
						cfts : newValue
					};
					
					$.ajax({
						url : 'fenghuang/getHtsjDate.do' ,
						data : param ,
						dateType:'json' ,
						success : function(date){
						//	console.info(date[0].htsj);
							$("#htsj").datebox('setValue',date[0].htsj);
						}
					});
				}
			});
	    
			$("#ctsj").datebox({
				required : true ,
				editable : false ,
				//onSelect: function(date){
						//		console.info((date.getFullYear()+":"+(date.getMonth()+1)+":"+date.getDate()));
						//	},
				onChange : function(newValue, oldValue){
					var cftsValue = $("#cfts").val();
					var param = {
						cfts : cftsValue ,
						ctsj : newValue
					};
					
					$.ajax({
						url : 'fenghuang/getHtsjDate.do' ,
						data : param ,
						dateType:'json' ,
						success : function(date){
							console.info(date[0].htsj);
							$("#htsj").datebox('setValue',date[0].htsj);
						}
					});
				}
			});
			function caclHtsj(){
				console.info($("#ctsj").datetimebox('options'));
				//var ctsj = $("#ctsj").val();
				//var cfts = $("#cfts").val();
				//alert("出团时间:"+ctsj+"---出访天数："+cfts);
			}
			
			function dantuanSave() {
			$('#addForm').form('submit', {
				url : 'fenghuang/DantuanAdd.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
			
						$.messager.alert("保存成功", "保存成功！", "info");
					   // $('#addDt').dialog('close');
					   var tab = $('#tt').tabs('getSelected');
					   
					if (tab){  
		                   var index = $('#tt').tabs('getTabIndex', tab);  
		                   $('#tt').tabs('close', index);  
		                } 
						$('#tt').tabs('add', {
							title : "询价列表",
							href : "DantuanXunjia.do",
							closable : true
						});
					   
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
					
					}
				}
			});
		}
		 //新增
		function addKehu() {
			$("#addKehu").dialog("open");
			$("#addForm").form("clear");
		}
         
		function kehuSave() {
			$('#addForm').form('submit', {
				url : 'fenghuang/.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
					$('#addKehu').dialog('close');
						$.messager.alert("保存成功", "保存成功！", "info");
						 $('#dg').datagrid('reload'); 
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#dg').datagrid('reload');
					}
				}
			});
		}
			//关闭
		function closeEditDic() {
			$('#addKehu').dialog('close');
		} 
		
	</script>
</body>
</html>
