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
	 <div class="easyui-panel" title="成团明细"
		style="height:500px;padding:10px;"
		data-options="closable:false,tools:'#searchpanel'" align="center">

		<form id="chengtuanMingxi" >
			<table align="center">
<tr>
<td><div class="fitem"><label>客户名称:</label></td><td><input name="khId" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>团号:</label></td><td><input name="tuanNO" class="easyui-validatebox" required="true"></div></td>
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
<td><div class="fitem"><label>团名：</label></td><td><input name="tdm" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>团对状态：</label></td><td><input name="tdzt" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=3',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>出访人数：</label></td><td><input name="cfrs" class="easyui-numberbox" required="true"></div></td>
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
<td><div class="fitem"><label>出访天数：</label></td><td><input id="cfts" name="cfts" class="easyui-numberbox" required="true"></div></td>
<!-- CountryState 国家所属州 --> 
<td><div class="fitem"><label>旅游区域：</label></td><td><input name="lyqy" class="easyui-combobox"
 data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=6',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	"></div></td>
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
<td><div class="fitem"><label>签证类型：</label></td><td><input name="qzlx" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=14',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>需办签证：</label></td><td><input name="xbqz" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>需办邀请：</label></td><td><input name="xbyq" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<!-- HotleStardictionary 酒店-星级字典维护 --> 
<td><div class="fitem"><label>酒店标准：</label></td><td><input name="jdbzNo" class="easyui-combobox"
  data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=16',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false 
	"></div></td>
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
<td><div class="fitem"><label>车型：</label></td><td><input name="bssdNo" class="easyui-combobox" data-options="
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
<td><div class="fitem"><label>其他地接要求：</label></td><td colspan="3"><input name="qtdjDesc" class="easyui-validatebox" required="true" size="80"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>特殊要求：</label></td><td colspan="3"><input name="tsDesc" class="easyui-validatebox" required="true" size="80"></div></td>
</tr>
			</table>
	
		</form>
	</div>
	

	<script type="text/javascript">

		//按id查询
	 $(document).ready(function() { 
       
				var param = {
				"updateTuanNO" : '${param.tuanNo}' 
				};
				
				$.ajax({
					url : "fenghuang/DantuanSelectId.do",
					data : param,
					dataType : "json",
					success : function(data) {
					   $('#chengtuanMingxi').form('load',data.rows[0]);
				
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
		});
		
	</script>
</body>
</html>
