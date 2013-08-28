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

	<div class="easyui-panel" title="添加订车"
		style="height:115px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<form id="DingcheForm"> 
		<table> 
			<tr> 
				<td><div class="fitem"> 
						<label>车公司:</label> 
				</td> 
				<td><input id="tuanNo" name="tuanNo" class="easyui-validatebox" required="true"><input id="cheName" name="cheName" class="easyui-validatebox"></td> 
				<td><div class="fitem"> 
						<label>车牌:</label> 
				</td> 
				<td><input id="chePaihao" name="chePaihao" class="easyui-validatebox"> 
					</div> 
				</td> 
				<td><div class="fitem"> 
						<label>车信息:</label> 
				</td> 
				<td><input id="cheXinxi" name="cheXinxi" class="easyui-validatebox"> 
				</div>	 
				</td> 
	     	   </tr> 
		        <tr> 
				<td><div class="fitem"> 
					<label> 司机:</label> 
				  </td> 
				<td><input id="siji" name="siji" class="easyui-validatebox"></div></td> 
				<td><div class="fitem"> 
						<label>天数:</label> 
				</td> 
				<td><input id="tianshu" name="tianshu" class="easyui-validatebox"> 
					</div> 
				</td> 
				<td><div class="fitem"> 
						<label>座位数:</label> 
				</td> 			 
				<td><input id="zuoweishu" name="zuoweishu" class="easyui-validatebox"></div></td> 
				<td><div class="fitem"> 
						<label>总价:</label> 
				</td> 			 
				<td><input id="zongjiage" name="zongjiage" class="easyui-validatebox"></td> 
			</div>
					</tr> 
				<tr> 
				<td colspan="6"> 
					<a href="javascript:SaveDingche();" class="easyui-linkbutton" iconcls="icon-ok">添加订车</a> 
						<a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-undo" onclick="$('#DingcheForm').form('clear')">重置</a> 
				</td> 
			</tr> 
		</table> 
		</form> 
	</div>
		
	
		 
		<div class="easyui-panel" title="订车列表" style="height:480px;width: auto;">
		<table id="dgDingche" class="easyui-datagrid"
			data-options="url:'fenghuang/dingcheSelect.do',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
			pagination="true" toolbar="#currencyDatagridtoolbar">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'chengshi'" width="80">车公司</th>
					<th data-options="field:'id'" width="80">车牌</th>
					<th data-options="field:'name'" width="80">座位数</th>
					<th data-options="field:'tianshu'" width="80">天数</th>
					<th data-options="field:'chuanzhen'" width="80">总价</th>
					<th data-options="field:'shouji'" width="80">司机</th>
					<th data-options="field:'hzjb'" width="80">团号</th>
			
				</tr>
			</thead>
		</table>
		<div id="currencyDatagridtoolbar">
		    <a href="javascript:;" class="easyui-linkbutton" iconCls="icon-save"  plain="true">修改</a>
		     <a href="javascript:canyinDelete();" class="easyui-linkbutton" iconCls="icon-cut" plain="true">删除</a>  
		</div>
	</div>
<script type="text/javascript">

    //这个方法是格式化是否可用列的，0：为不使用，1：为使用
     $(document).ready(function() {
            var tuanNo=${param.tuanNo};
			$("#tuanNo").val(tuanNo);    
      })
			function SaveDingche(){
						$('#DingcheForm').form('submit', {
				url : 'fenghuang/dingcheAdd.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
					$('#addDingche').dialog('close');
						$.messager.alert("添加成功", "添加成功！", "info");
						 $('#dgDingche').datagrid('reload'); 
					} else {
						$.messager.alert("添加失败", "添加失败!", "error");
						$('#dgDingche').datagrid('reload');
					}
				}
			});
		} 
	//删除操作要执行的方法
	function canyinDelete(){
	  var row = $("#dgCanyin").datagrid("getSelected");
			if (row) {
				var param = {
					"id" :  row.id
				};
				if(confirm("确认要删除名称为 “ "+row.name+" ”的供应商吗？")){
				$.ajax({
					url : "fenghuang/canyinDelete.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("删除成功", "删除成功！", "info");
							$("#dgCanyin").datagrid('reload');
						} else {
							$.messager.alert("删除失败", "删除失败!", "error");
						}
					},
					error : function() {
						$.messager.alert("删除失败", "服务器请求失败!", "error");
					}
				});
				}
			}
	}
	//按id查询
		function canyinSelectId() {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window 
			$("#updateCanyin").dialog("open");
			//准备回显的数据
			var row = $("#dgCanyin").datagrid("getSelected");
			//alert(row.tuanNO);
		
			if(row){
				var param = {
					"id" : row.id
				};
				
				$.ajax({
					url : "fenghuang/canyinSelectId.do",
					data : param,
					dataType : "json",
					success : function(data) {
		
					   $('#updateCanyinForm').form('load',data.rows[0]);
				
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
		}
		}
		 //修改
		function canyinUpdate() {
			$("#updateCanyinForm").form('submit', {
				url : 'fenghuang/canyinUpdate.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {//data 是一个字符串  $.ajax(success:function(data):是一个对象)

					//var result = val('(' + data + ')');//吧字符串转换为对象
					var result = $.parseJSON(data) ;

					if (result.success) {
					  $("#updateCanyin").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
	
						$("#dgCanyin").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#dgCanyin").datagrid('reload');
					}
				}
			});
		}
		
		//关闭
		function closedupdateCanyin() {
			$('#updateCanyin').dialog('close');
		}
	
	</script>



</body>
</html>

	



</body>
</html>
