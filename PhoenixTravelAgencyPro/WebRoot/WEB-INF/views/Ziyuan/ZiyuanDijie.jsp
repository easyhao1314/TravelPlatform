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
	<div class="easyui-panel" title="地接供应查询"
		style="height:80px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<table>
			<tr>
				<td><div class="fitem">
						<label>供应商编号:</label>
				</td>
				<td><input name="currencyName" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>供应商名称:</label>
				</td>
				<td><input name="currencyShort" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>英文名称:</label>
				</td>
				<td><input name="currencyShort" class="easyui-validatebox">
					</div>
				</td>
			</tr>
				<tr>
				<td><div class="fitem">
						<label>合作级别:</label>
				</td>
				<td><input name="currencyName" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>报价联系人:</label>
				</td>
				<td><input name="currencyShort" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>所属城市:</label>
				</td>
				<td><input name="currencyShort" class="easyui-validatebox">
					</div>
				</td>
			</tr>
				<tr>
				<td><div class="fitem">
						<label>联系电话:</label>
				</td>
				<td><input name="currencyName" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>传真:</label>
				</td>
				<td><input name="currencyShort" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>EMAIL:</label>
				</td>
				<td><input name="currencyShort" class="easyui-validatebox">
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div id="searchpanel">
		<a href="javascript:void(0)" iconCls="icon-search"
			onclick="javascript:alert('查询')"></a> <a href="javascript:void(0)"
			iconCls="icon-undo" onclick="javascript:alert('重置')"></a>
	</div>
		<div class="easyui-panel" title="地接社供应商列表"
		style="height:480px;width: auto;">
		<table id="dg" class="easyui-datagrid"
			data-options="url:'fenghuang/ZiyuanDijie.do',border:false,singleSelect:false,fit:true,fitColumns:true,pageSize:20"
			pagination="true" toolbar="#currencyDatagridtoolbar">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'id'" width="80">编号</th>
					<th data-options="field:'chengshiId'" width="80">所属城市</th>
					<th data-options="field:'name'" width="80">供应商名称</th>
					<th data-options="field:'lianxiren'" width="80">联系人</th>
					<th data-options="field:'dianhua'" width="80">移动电话</th>
					<th data-options="field:'chuanzhen'" width="80">传真</th>
					<th data-options="field:'shouji'" width="80">手机</th>
					<th data-options="field:'hzjbId'" width="80">合作级别</th>
					<th data-options="field:'lianxiren'" width="80">联系人</th>
					<th data-options="field:' bz'" width="80">备注</th>
					<th data-options="field:'8',formatter:onOperateStyle" width="80">操作</th>
				</tr>
			</thead>
		</table>
		<div id="currencyDatagridtoolbar">
		     <a href="javascript:addJingdian();" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>  
		</div>
	</div>
     <div id="addJingdian" class="easyui-dialog" title="景点新增"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:800px;height:500px;padding:10px;">
		<form id="addForm" method="post">
			<table align="center">
				<tr>
<td><div class="fitem"><label>供应商编号:</label></td><td><input name="id" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>供应商名称:</label></td><td><input name="name" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>供应商英文名称:</label></td><td><input name="ywname" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>所属城市：</label></td><td><input name="chengshiId" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>具体地址：</label></td><td><input name="dizhi" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>合作级别:</label></td><td><input name="hzjbId" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>联系人：</label></td><td><input name="lianxiren" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>电话：</label></td><td><input name="dianhua" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>手机:</label></td><td><input name="shouji" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>传真：</label></td><td><input name="chuanzhen" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>Email：</label></td><td><input name="email" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>SKYPE:</label></td><td><input name="skype" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>MSN：</label></td><td><input name="msn" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>YAHOO：</label></td><td><input name="yahoo" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>网址:</label></td><td><input name="wangzhi" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>代理人开户银：</label></td><td><input name="kaihu" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>代理人账号：</label></td><td><input name="dlrzh" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>银行地址:</label></td><td><input name="yhdz" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>收款人账号：</label></td><td><input name="skrzh" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>收款人名称：</label></td><td><input name="skrxm" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>收款人地址:</label></td><td><input name="skrdz" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>业务覆盖区域：</label></td><td><input name="ywqyId" class="easyui-validatebox" ></div></td>
<td></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>地接描述：</label></td><td><input name="djsms" class="easyui-validatebox" ></div></td>
<td></td><td></td>
</tr>
<tr>
<td><div class="fitem"><label>性价比：</label></td><td><input name="xjb" class="easyui-validatebox" ></div></td>
<td></td><td></td>
</tr>
<tr>
<td><div class="fitem"><label>优势：</label></td><td><input name="youshi" class="easyui-validatebox" ></div></td>
<td></td><td></td>
</tr>
<tr>
<td><div class="fitem"><label>备注：</label></td><td><input name=" bz" class="easyui-validatebox" ></div></td>
<td></td><td></td>
</tr>
<tr>
<tr><td colspan="4s" align="center"><a href="javascript:SaveJingdian();" class="easyui-linkbutton" iconCls="icon-ok">保存</a> <input  type="reset" value="重置"></td>
</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
     

	<script type="text/javascript">
    //这个方法是格式化操作列的函数
    function onOperateStyle(val,row){
       var returnStyleValue='<img alt="修改" src="js/themes/icons/pencil.png" onclick="onOperateUpdate('+row.id+');">';
       returnStyleValue+='<img alt="删除" src="js/themes/icons/cancel.png" onclick="onOperateDelete('+row.id+');">';
       return returnStyleValue;
    }
    //这个方法是格式化是否可用列的，0：为不使用，1：为使用
	function onIsUesStyle(val,row){
	  if(val =='1'){
	      return "使用";
	  }else{
	     return "不使用";
	  }
	  
	}
	//更新操作要执行的方法
	function onOperateUpdate(id){
	 alert("更新操作");
	
	}
	//删除操作要执行的方法
	function onOperateDelete(id){
	  alert("删除操作");
	}
	  //新增
		function addJingdian() {
			$("#addJingdian").dialog("open");
			$("#addFrome").form("clear");
		}
         
		function SaveJingdian() {
			$('#addForm').form('submit', {
				url : 'fenghuang/.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
					$('#addJingdian').dialog('close');
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
			$('#addJingdian').dialog('close');
		} 
	
	
	
	</script>



</body>
</html>
