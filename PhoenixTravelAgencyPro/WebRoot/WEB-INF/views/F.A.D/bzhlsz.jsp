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
	<!-- 如果在正式开发环境下 url可以为后台的请求，地址 -->
      <table>
	    		<tr>
	    		   	<td>团号:<input class="easyui-validatebox" type="text" name="team" id="team"></input></td>
	    		   <td>
	    		   	<div style="padding:5px;border:0px solid #ddd;">
		<a href="javascript:cwfkspselect()" class="easyui-linkbutton" data-options="toggle:true,group:'g1'">搜索</a>
	             </div>
	    		   </td>
	    		   	</tr>
	  </table>
	  
	  <div id="tb">
		<a
			href="javascript:bzhlszsaveopen();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">新增</a>&nbsp;&nbsp;| <a
			href="javascript:bzhlszdelectopen();" class="easyui-linkbutton"
			iconCls="icon-cut" plain="true">删除</a>
		<a href="javascript:bzhlszupdateopen();" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">修改</a>
	</div>
     <div class="easyui-panel" title="团队费用"
		style="height:500px;width: auto;" toolbar="#currencyDatagridtoolbar">	
	   <table id="bzhlszdg" class="easyui-datagrid"
		data-options="url:'fenghuang/bizhonghuilv.do',border:false,singleSelect:false,fit:true,fitColumns:true, onClickRow: onClickRow,pageSize:20"
		pagination="true" toolbar="#tb">
		<thead>
		
			<tr>
			    <th data-options="field:'id',editor:'text'" width="50">id</th>
				<th data-options="field:'bizhong',editor:'text'" width="50">币种</th>
				<th data-options="field:'riqi',editor:'text'" width="50">日期</th>
				<th data-options="field:'huilv',editor:'text'" width="50">汇率</th>
				<th data-options="field:'danwei',editor:'text'" width="50">单位</th>
				<th data-options="field:'xianjinhuilv',editor:'text'" width="50">现金收款/换汇汇率</th>
				<th data-options="field:'gongshou',editor:'text'" width="50">对公收款/换汇汇率</th>
				<th data-options="field:'zhonghang',editor:'text'" width="50">中行折算价/基准价</th>
				<th data-options="field:'zuidihuilv',editor:'text'" width="50">公司最低汇率标准</th>		
			</tr>
		</thead>
	</table>
	</div>
	<div id="bzhlszid" class="easyui-dialog" title="汇率添加"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="bzhlszform" method="post">
			<table align="left">
				<tr>
					<td><div class="fitem">
							<label>币种:</label>
					</td>
					<td><input name="bizhong" class="easyui-validatebox"
						required="true">
						</div></td>
					<td><div class="fitem">
							<label>日期:</label>
					</td>
					<td><input id="htsj" name="riqi" type="text" class="easyui-datebox" required="required">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>汇率:</label>
					</td>
					<td><input name="huilv" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>单位:</label>
					</td>
					<td><input name="danwei" class="easyui-numberbox"
						required="true">
						</div></td>
				</tr>
					<tr>
					<td><div class="fitem">
							<label>现金收款/换汇汇率:</label>
					</td>
					<td><input name="xianjinhuilv" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>对公收款/换汇汇率:</label>
					</td>
					<td><input name="gongshou" class="easyui-numberbox"
						required="true">
						</div></td>
				</tr>
					<tr>
					<td><div class="fitem">
							<label>中行折算价/基准价:</label>
					</td>
					<td><input name="zhonghang" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>公司最低汇率标准:</label>
					</td>
					<td><input name="zuidihuilv" class="easyui-numberbox"
						required="true">
						</div></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:bzhlszsave();" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> <a href="javascript:closeEditDic();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
<!-- **********************************************************************删除****************************************************************************** -->
<div id="bzhlszdeleteid" class="easyui-dialog" title="汇率添加"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="bzhlszdeleteform" method="post">
			<table align="left">
			<tr>
			<td><input name="id" class="easyui-validatebox" onfocus=this.blur() hidden="true"
						required="true">
						</div></td>
			</tr>
				<tr>
					<td><div class="fitem">
							<label>币种:</label>
					</td>
					<td><input name="bizhong" class="easyui-validatebox" onfocus=this.blur()
						required="true">
						</div></td>
					<td><div class="fitem">
							<label>日期:</label>
					</td>
					<td><input id="htsj" name="riqi" type="text" class="easyui-datebox" required="required" onfocus=this.blur()>
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>汇率:</label>
					</td>
					<td><input name="huilv" class="easyui-validatebox" onfocus=this.blur()>
						</div></td>
					<td><div class="fitem">
							<label>单位:</label>
					</td>
					<td><input name="danwei" class="easyui-numberbox" onfocus=this.blur()
						required="true">
						</div></td>
				</tr>
					<tr>
					<td><div class="fitem">
							<label>现金收款/换汇汇率:</label>
					</td>
					<td><input name="xianjinhuilv" class="easyui-validatebox" onfocus=this.blur()>
						</div></td>
					<td><div class="fitem">
							<label>对公收款/换汇汇率:</label>
					</td>
					<td><input name="gongshou" class="easyui-numberbox" onfocus=this.blur()
						required="true">
						</div></td>
				</tr>
					<tr>
					<td><div class="fitem">
							<label>中行折算价/基准价:</label>
					</td>
					<td><input name="zhonghang" class="easyui-validatebox" onfocus=this.blur()>
						</div></td>
					<td><div class="fitem">
							<label>公司最低汇率标准:</label>
					</td>
					<td><input name="zuidihuilv" class="easyui-numberbox" onfocus=this.blur()
						required="true">
						</div></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:bzhlszdelect();" class="easyui-linkbutton"
						iconCls="icon-ok">确认删除</a> <a href="javascript:closeEditDic();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
<!-- ************************************************************************************************************************************************************* -->
<!-- ******************************************************************修改*************************************************************************************** -->
<div id="bzhlszupdateid" class="easyui-dialog" title="汇率修改"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:500px;height:200px;padding:10px;">
		<form id="bzhlszupdateform" method="post">
		
			<table align="left">
			     <tr>
					
					<td><input name="id" class="easyui-validatebox" hidden="true"
						required="true">
						</div></td>
					
				</tr>
				<tr>
					<td><div class="fitem">
							<label>币种:</label>
					</td>
					<td><input name="bizhong" class="easyui-validatebox"
						required="true">
						</div></td>
					<td><div class="fitem">
							<label>日期:</label>
					</td>
					<td><input id="htsj" name="riqi" type="text" class="easyui-datebox" required="required">
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>汇率:</label>
					</td>
					<td><input name="huilv" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>单位:</label>
					</td>
					<td><input name="danwei" class="easyui-numberbox"
						required="true">
						</div></td>
				</tr>
					<tr>
					<td><div class="fitem">
							<label>现金收款/换汇汇率:</label>
					</td>
					<td><input name="xianjinhuilv" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>对公收款/换汇汇率:</label>
					</td>
					<td><input name="gongshou" class="easyui-numberbox"
						required="true">
						</div></td>
				</tr>
					<tr>
					<td><div class="fitem">
							<label>中行折算价/基准价:</label>
					</td>
					<td><input name="zhonghang" class="easyui-validatebox">
						</div></td>
					<td><div class="fitem">
							<label>公司最低汇率标准:</label>
					</td>
					<td><input name="zuidihuilv" class="easyui-numberbox"
						required="true">
						</div></td>
				</tr>
				<tr>
					<td colspan="4s" align="center"><a
						href="javascript:bzhlszupdate();" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> <a href="javascript:closeEditDic();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
<!-- ************************************************************************************************************************************************************ -->	
	<script type="text/javascript">
	
		function onClickRow(index) {
			if (editIndex != index) {
				if (endEditing()) {
					$('#bzhlszdg').datagrid('selectRow', index).datagrid('beginEdit',
							index);
					editIndex = index;
				} else {
					$('#bzhlszdg').datagrid('selectRow', editIndex);
				}
			}
		}
		
		
			//添加	
		
		function bzhlszsaveopen() {
			$("#bzhlszid").dialog("open");
			$("#bzhlszform").form("clear");
		}
        function closeEditDic() {
			$("#bzhlszid").dialog("close");
		} 
		function bzhlszsave() {
			$('#bzhlszform').form('submit', {
				url : 'fenghuang/bizhonghuilvinsert.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
						$.messager.alert("保存成功", "保存成功！", "info");
						$('#bzhlszid').dialog('close');
						$('#bzhlszdg').datagrid('reload');
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#bzhlszdg').datagrid('reload');
					}
				}
			});
		}
		
/*******************************************删除********************************************************/
           //按id查询
           function bzhlszdelectopen() {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window



           //获取选中 数据
            var row = $("#bzhlszdg").datagrid("getSelected");

           //alert(row.id);
           if(row!=null){
              $("#bzhlszdeleteid").dialog("open");
               //清空ID
             $('#id').attr('value','');
             //填充
            $('#bzhlszdeleteform').form('load', row);

           }
              }
           //修改
           function bzhlszdelect() {
          $("#bzhlszdeleteform").form('submit', {
             url : 'fenghuang/bizhonghuilvdelete.do',
                   onSubmit : function() {
               return $(this).form('validate');
              },
               success : function(data) {//data 是一个字符串 $.ajax(success:function(data):是一个对象)
               console.info(data);
            //var result = val('(' + data + ')');//吧字符串转换为对象
             var result = $.parseJSON(data) ;

               if (result.success) {
               $("#bzhlszdeleteid").dialog('close');
                 $.messager.alert("修改成功", "修改成功！", "info");
                $("#bzhlszdg").datagrid('reload');
               } else {
                  $.messager.alert("修改失败", "修改失败!", "error");
                 $("#bzhlszdg").datagrid('reload');
                  }
}
});
}


/*****************************************************************************************************/


/*******************************************修改********************************************************/
           //按id查询
           function bzhlszupdateopen() {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window



           //获取选中 数据
            var row = $("#bzhlszdg").datagrid("getSelected");

           //alert(row.id);
           if(row!=null){
              $("#bzhlszupdateid").dialog("open");
               //清空ID
             $('#id').attr('value','');
             //填充
            $('#bzhlszupdateform').form('load', row);

           }
              }
           //修改
           function bzhlszupdate() {
          $("#bzhlszupdateform").form('submit', {
             url : 'fenghuang/bizhonghuilvupdate.do',
                   onSubmit : function() {
               return $(this).form('validate');
              },
               success : function(data) {//data 是一个字符串 $.ajax(success:function(data):是一个对象)
               console.info(data);
            //var result = val('(' + data + ')');//吧字符串转换为对象
             var result = $.parseJSON(data) ;

               if (result.success) {
               $("#bzhlszupdateid").dialog('close');
                 $.messager.alert("修改成功", "修改成功！", "info");
                $("#bzhlszdg").datagrid('reload');
               } else {
                  $.messager.alert("修改失败", "修改失败!", "error");
                 $("#bzhlszdg").datagrid('reload');
                  }
}
});
}


/*****************************************************************************************************/
		

	</script>
</body>
</html>
