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
	<link rel="stylesheet" type="text/css" href="styles.css"   readonly="readonly">
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
<td><div class="fitem"><label>客户名称:</label></td><td><input id="khId" name="khId" class="easyui-combobox" data-options="
					url:'fenghuang/findAllCustomName.do',
					valueField:'id',
					textField:'name',
					panelHeight:'auto',
					editable:false 
	"></div>
     <a href="javascript:addKehu();" class="easyui-linkbutton" iconCls="icon-ok">新增客户</a></td>
<td><div class="fitem"><label>团号:</label></td><td><input name="tuanNO" class="easyui-validatebox"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>团队操作类型：</label></td><td><input name="tdczlx"   class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=1',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	"></div></td>
<td><div class="fitem"><label>团队级别：</label></td><td><input name="tdjb"  class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=2',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>团名：</label></td><td><input name="tuanName" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>团对状态：</label></td><td><input name="tdzt" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=3',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>出访人数：</label></td><td><input name="cfrs" class="easyui-numberbox"></div></td>
<!-- CountrySettingDictionary 旅游国家 -->
<td><div class="fitem"><label>出访国家：</label></td><td><input  name="cfgj" class="easyui-combobox"
data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=7',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	"></td>
</tr>
<tr>
<td><div class="fitem"><label>出访天数：</label></td><td><input id="cfts" name="cfts" class="easyui-numberbox" required="false"></div></td>
<!-- CountryState 国家所属州 --> 
<td><div class="fitem"><label>旅游区域：</label></td><td><input name="lyqy" class="easyui-combobox"
 data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=6',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
</tr>
<tr>
<td><div class="fitem"><label>出团时间：</label></td><td><input id="ctsj" name="ctsj" type="text" class="easyui-datebox" required="required"></div></td>
<td><div class="fitem"><label>回团时间：</label></td><td><input id="htsj" name="htsj" type="text" class="easyui-datebox" required="required"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>销售：</label></td><td><input name="xsNo" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=11',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	"></div></td>
<td><div class="fitem"><label>计调：</label></td><td><input name="jdNo" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=12',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>客户经理：</label></td><td><input name="khjlNo" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=13',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	"></div></td>
	<td><div class="fitem"><label>需办邀请：</label></td><td><input name="xbyq" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=9',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	"></div></td>
</tr>
<!-- 
<tr>
<td><div class="fitem"><label>需办签证：</label></td><td><input name="xbqz" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>签证类型：</label></td><td><input name="qzlx" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=14',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	"></div></td>
</tr> --> 
<tr>
<!-- HotleStardictionary 酒店-星级字典维护 --> 
<td><div class="fitem"><label>酒店标准：</label></td><td><input name="jdbzNo" class="easyui-combobox"
  data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=16',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>
<td><div class="fitem"><label>酒店报价标准：</label></td><td><input name="jdbjNo" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=17',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>早餐标准：</label></td><td><input name="zcNo" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=22',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	"></div></td>
<td><div class="fitem"><label>午餐标准：</label></td><td><input name="zhongcNo" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=23',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>晚餐标准：</label></td><td><input name="wcNo" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=24',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	"></div></td>
<td><div class="fitem"><label>用餐报价标准：</label></td><td><input name="ycbjNo" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=21',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
</tr>
<tr>
<td><div class="fitem"><label>巴士司导：</label></td><td><input name="bssdNo" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=19',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
<td><div class="fitem"><label>巴士报价标准：</label></td><td><input name="bsbjNo" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=20',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>车型：</label></td><td><input name="cheXingNo" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=18',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	"></div></td>
<td><div class="fitem"><label>导游报价标准：</label></td><td><input name="dybjNo" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=15',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>其他地接要求：</label></td><td colspan="3"><input name="qtdjDesc" class="easyui-validatebox" size="80"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>特殊要求：</label></td><td colspan="3"><input name="tsDesc" class="easyui-validatebox" size="80"></div></td>
</tr>
<tr>
<tr><td colspan="4" align="center"><a href="javascript:dantuanSave();" class="easyui-linkbutton" iconCls="icon-ok">保存</a> <input  type="reset" value="重置"></td>
</tr>
			</table>
	
		</form>
	</div>
	
<div id="addKehu" class="easyui-dialog" title="新增客户信息"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:800px;height:300px;padding:10px;">
		<form id="addKehuForm" method="post">
			<table align="center">
				<tr>
					<td><div class="fitem">
							<label>客户名称:</label>
					</td>
					<td><input id="kehuname"  name="name" class="easyui-validatebox" size="70">
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
					<td><input name="post" >
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>通讯地址:</label>
					</td>
					<td><input name="address" class="easyui-validatebox" size="70">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>手机:</label>
					</td>
					<td><input name="moblePhone"  class="easyui-numberbox" validType="minLength[11]">
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
					<td><input name="qq"  class="easyui-numberbox">
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
						href="javascript:kehuSave();" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> <a href="javascript:closeaddMianBan();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
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
						ctsj : ctsjValue,
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
			$("#addKehuForm").form("clear");
		}
		
		//验证客户名称是否存在
		$("#kehuname").blur(function(){
		var name=$("#kehuname").val();
		var param={
		  "name":name
		 }
		   $.ajax({
		      url:"fenghuang/customInfoList.do?",
		     data :  param,
			 type : 'POST',
			 dataType : 'json' ,
			 
		      success:function(data){
		        if(data.rows[0].name!=null){
		         alert("客户已存在,请重新输入");
		        }
		      },
		   });
		
		});
		
         
		function kehuSave() {
			$('#addKehuForm').form('submit', {
				url : 'fenghuang/addCustom.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
					$('#addKehu').dialog('close');					
						$.messager.alert("保存成功", "保存成功！", "info");
						 var  kehuname=$("#kehuname").val();
					
					     $("#khId").combobox('setValue', kehuname); 
					
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
					
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
