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
    <div class="easyui-panel" title="团队查询" style="width:900px">  
        <div style="padding:10px 0 10px 60px">  
        <form id="ff" method="post">  
            <table>  
                <tr>  
                    <td>时间:</td>  
                    <td>从：<input class="easyui-datebox" name="startTime" editable="false"/>&nbsp;  到：<input class="easyui-datebox" name="endTime"  editable="false"/>  </td>  
                    <td>团号:</td>  
                    <td><input class="easyui-validatebox" type="text" name="tuanhao" /></td>  
                    <td>团名:</td>  
                    <td><input class="easyui-validatebox" type="text" name="tuanming" /></td>  
                </tr>
             </table>
          </form>  
             <div style="text-align:center;padding:5px">  
	            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">查询</a>  
	            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>  
        	</div>  
        	<div>
        		
        	</div>
    </div>  
    <script>  
        function submitForm(){  
           $.post("fenghuang/operTeamQueryCon.do", $("#ff").serialize(),function(data){
           		$("#queryResult").datagrid('loadData',data); 
           		$("#queryResult").datagrid('options').url = "fenghuang/operTeamQueryCon.do"; 
           },"json");
        }  
        
        function clearForm(){  
            $('#ff').form('clear');  
        }  
    </script>  
    </div>
    
    <!-- 查询结果展示 -->
    <div style="width:900px;height:400px;">
	   <table id="queryResult" class="easyui-datagrid"
			data-options="url:'',border:false,singleSelect:true,fit:true,fitColumns:true">
			<thead>
				<tr>
					<th data-options="field:'tuanNO'" width="30">团号</th>
					<th data-options="field:'ctsj',align:'right'" width="40">出团时间</th>
					<th data-options="field:'htsj',align:'right'" width="40">回团时间</th>
					<th data-options="field:'tdm',align:'right'" width="50">团队名称</th>
					<th data-options="field:'tdjb',align:'right'" width="40">团队级别</th>
					<th data-options="field:'tdzt',align:'right'" width="40">团队状态</th>
				</tr>
		</thead>
	</table>
	</div>
   <script type="text/javascript">
   		$("#queryResult").datagrid({
			pagination : true,
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
