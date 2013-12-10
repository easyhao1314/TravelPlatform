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
<div id="bzhlszsousuo" class="easyui-dialog" title="查询"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
			text:'查询',
			iconCls:'icon-search',
			handler:function(){
			$('#bzhlszsousuo').dialog('close');
			cwfkspselect();
			}
			},
			{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#bzhlszsousuo').dialog('close');
		
			}
			}
		]"
		style="width:300px;height:180px;padding:10px;">
	<!-- 如果在正式开发环境下 url可以为后台的请求，地址 -->
      <table>
	    		<tr>
	    		   	<td>团号:<input class="easyui-validatebox" type="text" name="team" id="team" style="width:200px"></input></td>
	    		   	</tr>
	  </table>
	  </div>
	  <div id="bzhlszdgtb">	
		<a
			href="javascript:bzhlszsaveopen();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">新增</a>&nbsp;&nbsp; <a
			href="javascript:bzhlszdelectopen();" class="easyui-linkbutton"
			iconCls="icon-cut" plain="true">删除</a>
		<a href="javascript:bzhlszupdateopen();" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">修改</a>
	</div>
	   <table id="bzhlszdg" class="easyui-datagrid"
		data-options="url:'fenghuang/bizhonghuilv.do',border:false,singleSelect:false,fit:true,fitColumns:true, onClickRow: onClickRow,pageSize:20"
		pagination="true" toolbar="#bzhlszdgtb">
		<thead>	
			<tr>
			  
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
	<div id="bzhlszid" class="easyui-dialog" title="汇率添加"
		data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
			text:'确定',
			iconCls:'icon-search',
			handler:function(){
			$('#bzhlszid').dialog('close');
			bzhlszsave();
			}
			},
			{
			text:'关闭',
			iconCls:'icon-cancel',
			handler:function(){
			$('#bzhlszid').dialog('close');
		
			}
			}
		]"
		style="width:500px;height:250px;padding:10px;">
		<form id="bzhlszform" method="post">
			<table align="left">
				<tr>
					<td>
							<label>币种:</label>
					</td>
					<td><input name="bizhong" id="bizhong" class="easyui-validatebox"
						required="true">
					</td>
					<td>
							<label>日期:</label>
					</td>
					<td><input id="htsj" name="riqi" type="text" class="easyui-datebox" required="required">
				</td>
				</tr>
				<tr>
					<td>
							<label>汇率:</label>
					</td>
					<td><input name="huilv" class="easyui-validatebox">
					</td>
					<td>
							<label>单位:</label>
					</td>
					<td><input name="danwei" class="easyui-numberbox"
						required="true">
				</td>
				</tr>
					<tr>
					<td>
							<label>现金收款/换汇汇率:</label>
					</td>
					<td><input name="xianjinhuilv" class="easyui-validatebox">
					</td>
					<td>
							<label>对公收款/换汇汇率:</label>
					</td>
					<td><input name="gongshou" class="easyui-numberbox"
						required="true">
					</td>
				</tr>
					<tr>
					<td>
							<label>中行折算价/基准价:</label>
					</td>
					<td><input name="zhonghang" class="easyui-validatebox">
					</td>
					<td>
							<label>公司最低汇率标准:</label>
					</td>
					<td><input name="zuidihuilv" class="easyui-numberbox"
						required="true">
					</td>
						
				</tr>
				<tr>
				<td><input name="id" id="id" class="easyui-numberbox"  hidden="true">
				</td>
				</tr>
			</table>
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
/*******************************************修改********************************************************/
           function bzhlszupdateopen() {
            var row = $("#bzhlszdg").datagrid("getSelected");
           if(row!=null){
              $("#bzhlszid").dialog("open");
             $('#id').attr('value','');
            $('#bzhlszform').form('load', row);
           }
              }
              
/*****************************************************************************************************/   
			//添加		
		function bzhlszsaveopen() {
			$("#bzhlszid").dialog("open");
			$("#bzhlszform").form("clear");
		}
        function closeEditDic() {
			$("#bzhlszid").dialog("close");
		} 
		function bzhlszsave() {
		      var a = $("#id").val();
		      var dizhi;
		      if(a==null||""==a){
		       dizhi='fenghuang/bizhonghuilvinsert.do';
		      }
		      else{
		     dizhi='fenghuang/bizhonghuilvupdate.do';
		      }
			$('#bzhlszform').form('submit', {
				url : dizhi,
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
            var row = $("#bzhlszdg").datagrid("getSelected");
            if(row!=null){
              $("#bzhlszdeleteid").dialog("open");
              $('#id').attr('value','');
              $('#bzhlszform').form('load', row);
               $.messager.confirm('消息', '是否将币种为：'+row.bizhong+'删除?',
			    function(r){  
			    if (r){                  
			                  $.ajax({
			           url:'fenghuang/bizhonghuilvdelete.do?id='+row.id,
			           date:row.id,
			           dateType:"json",
			           success:function(data){
			           $('#bzhlszdg').datagrid("reload");
			           $.messager.alert('消息','删除成功');	
			          }
			          });    			              
			           }          
			                });
			                
			                return;
           }
              }
	</script>
</body>
</html>
