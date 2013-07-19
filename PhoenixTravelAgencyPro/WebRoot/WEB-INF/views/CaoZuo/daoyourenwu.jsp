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
	<div style="margin:10px 0px;"></div>  
    <div class="easyui-panel" title="分类查询" style="width:900px">  
        <div style="padding:0px">  
        <form id="ff" method="post"> 
            <table>  
            <tr>
               <td>派单:</td>  
               <td>从：<input class="easyui-datebox" name="paidanStartTime" size="13" editable="false"/>&nbsp;  
               <td>到：</td>
               <td><input class="easyui-datebox" name="paidanEndTime" size="13"  editable="false"/>  </td>  
               <td>出团:</td>  
               <td>从：<input class="easyui-datebox" name="chutuanStartTime" size="13" editable="false"/>&nbsp;  
               <td>到：</td>
               <td><input class="easyui-datebox" name="chutuanEndTime" size="13"  editable="false"/>  </td>  
               <td>关键字:</td>  
               <td><input class="easyui-validatebox" type="text" name="kw" /></td>
               <td>
               	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">查询</a>
               </td>
             </tr>         
             </table>
          </form>
            
    </div>  
    <script>  
        function submitForm(){  
           $.post("fenghuang/dingFangRenWu.do", $("#ff").serialize(),function(data){
           		$("#queryResult").datagrid('loadData',data);
           		//获取options对象中的url，还包括pageSize,pageNumber
           		$("#queryResult").datagrid('options').url = "fenghuang/dingFangRenWu.do";
           },"json");
        }  
    </script>  
    </div>
    
    <!-- 查询结果展示 -->
    <div style="width:900px;height:505px;">
	   <table id="queryResult" class="easyui-datagrid"
			data-options="url:''" border="false" singleSelect="true" 
			fit="true" fitColumns="true" pagination="true" toolbar="#tb" >
			<thead>
				<tr>
					<th data-options="field:'tuanNO',align:'right'" width="80">团号</th>
					<th data-options="field:'tdm',align:'right'" width="100">团名</th>
					<th data-options="field:'name',align:'right'" width="120">客户</th>
					<th data-options="field:'ctsj',align:'right'" width="100" >出团时间</th>
					<th data-options="field:'htsj',align:'right'" width="100" >回团时间</th>
					<!-- 表还没确定。
					<th data-options="field:'aaa',align:'right'" width="100">派单人</th>
					<th data-options="field:'aa',align:'right'" width="100">接单人</th>
					<th data-options="field:'aa',align:'right'" width="80">进展</th>
					<th data-options="field:'aa',align:'right'" width="120">派单日期</th>
					 -->
				</tr>
		</thead>
	</table>
	</div>
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
		
   </script>
    	
    
</body>
</html>
