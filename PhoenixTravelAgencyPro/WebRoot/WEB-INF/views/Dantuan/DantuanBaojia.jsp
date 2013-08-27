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
	<table id="dgCaiwu" class="easyui-datagrid"
		data-options="url:'fenghuang/DantuanXunjia.do',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
		pagination="true" toolbar="#currencyDatagridtoolbar">
		<thead>  
                    <tr>  
                      <th data-options="field:'ck',checkbox:true"></th>
                     <th data-options="field:'tdjb'" width="60">跟单进展</th> 
                     <!--点击团号进入客户信息  -->
                     <th id="tuanNo" data-options="field:'tuanNo'" width="40" >团号</th>  
                     <th data-options="field:'tdzt'" width="60"> 团队状态</th>  
                     <!--点击团队名称进入团队详情（新增页面） -->                     
                     <th data-options="field:'tuanName'" width="60">团队名称</th> 
                      <!--点击报价数进入客户信息  -->
                      <!-- <th data-options="field:'05'" width="40">报价数</th>  -->                                                             
                      <th data-options="field:'ctsj'" width="60">出团时间</th> 
                     <th data-options="field:'htsj'" width="60">回团时间</th>  
                    <th data-options="field:'xsNo'" width="60"> 销售编号</th>  
                     <th data-options="field:'jdNo'" width="60">计调编号</th> 
                     <th data-options="field:'lxr'" width="40">登记人</th>
                      <!--点击客户名称进入客户沟通列表 -->
                      <th data-options="field:'khId'" width="60"> 客户名称</th>  
                        <th data-options="field:'djrtime'" width="40">登记日</th> 
                          <th data-options="field:'03'" width="40">报价</th>
                    </tr>  
                </thead>  
	</table>
	 
			<div id="currencyDatagridtoolbar">
		     <a href="javascript:addCaiwu();" class="easyui-linkbutton" iconCls="icon-add" plain="true">提交财务</a>  
		</div>
	
	
<div id="addCaiwu" class="easyui-dialog" title="提交财务"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:240px;padding:10px;">
		<form id="addCaiwuForm" method="post">
			<table align="center">
<tr>
<td><div class="fitem"><label>团号:</label></td><td><input id="tuanduimc" name="tuanduimc" class="easyui-validatebox" disabled="true"></div></td>
<td><div class="fitem"><label>团名：</label></td><td><input id="team" name="team" class="easyui-validatebox" disabled="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>客户名称:</label></td><td colspan="3"><input id="khmc" name="khmc" class="easyui-validatebox" disabled="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>出访人数：</label></td><td><input id="renshu" name="renshu" class="easyui-validatebox" disabled="true"></div></td>
<td><div class="fitem"><label>销售：</label></td><td><input id="caozuo" name="caozuo" class="easyui-validatebox" disabled="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>出团时间：</label></td><td><input id="chutuantime" name="chutuantime" type="text" class="easyui-datebox" disabled="true"></div></td>
<td><div class="fitem"><label>回团时间：</label></td><td><input id="huituantime" name="huituantime" type="text" class="easyui-datebox" disabled="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>款项说明：</label></td><td><input id="kxsm" name="kxsm" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>总报价：</label></td><td><input id="yingshou" name="yingshou" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td colspan="4" align="center">
<a href="javascript:dantuanCauwu();" class="easyui-linkbutton" iconCls="icon-ok">确认提交</a>
<a href="javascript:closedSearch();" class="easyui-linkbutton" iconCls="icon-undo">取消</a></td>
</tr>
	</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>



	<script type="text/javascript">
   
    //这个方法是格式化是否可用列的，0：为不使用，1：为使用
	function onIsUesStyle(val,row){
	  if(val =='1'){
	      return "使用";
	  }else{
	     return "不使用";
	  }
	  
	}
        //新增
		function addCaiwu() {			
			var row = $("#dgCaiwu").datagrid("getSelected");			
		    $("#tuanduimc").val(row.tuanNo);
			$("#team").val(row.tuanName);
			$("#khmc").val(row.khId);
			$("#chutuantime").datebox('setValue',row.ctsj);
			$("#huituantime").datebox('setValue',row.htsj);
			$("#caozuo").val(row.xsNo);
			$("#renshu").val(row.cfrs);
			$("#addCaiwu").dialog("open");	
		}
         
		function dantuanCauwu() {
			$('#addCaiwuForm').form('submit', {
				url : 'fenghuang/inserttuanbiao.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
					$('#addCaiwu').dialog('close');
						$.messager.alert("提交成功", "提交成功！", "info");
						 $('#dgCaiwu').datagrid('reload'); 
					} else {
						$.messager.alert("提交失败", "提交失败!", "error");
						$('#dgCaiwu').datagrid('reload');
					}
				}
			});
		}
			//关闭
		function closeEditDic() {
			$('#addCaiwu').dialog('close');
		} 
	
		</script>



</body>
</html>
