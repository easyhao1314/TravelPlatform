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
<!-- 添加easyui样式 -->
<link rel="stylesheet" type="text/css"
	href="js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="js/demo/demo.css">
<!-- 这里主要是jquery的js文件  -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>
</head>

<body class="easyui-layout">
	<!-- north 是上面的，背景颜色有赵阳来处理-->
	<div data-options="region:'north'" style="height:25px;background:#666;"
		border="false">
		<!-- 在这里可以添加相应的登录信息，比如用户信息 -->
	</div>
	<!-- south 是下面的，背景颜色有赵阳他们来确定 -->
	<div data-options="region:'south'" style="height:25px;background:#666;"
		border="false">
		<!-- 在这里可以添加 版权之类的东西 -->
	</div>
	<!-- 在这里配置 左侧菜单项  split  这说明页面中带分割条 可以用鼠标拖动-->
	<div data-options="region:'west',split:true" title="菜单"
		style="width:150px;">
		<!-- 在这里添加菜单的样式和菜单的数据，子菜单 等等 -->
		<ul class="easyui-tree">
			<li iconCls="icon-base"><span>自我管理</span>
				<ul>
					<li iconCls="icon-gears"><a href="javascript:open1('personManage');">个人基本信息</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>

	<div data-options="region:'center',title:'操作管理'">
		<div id="tt" class="easyui-tabs" fit="true" border="false"
			plain="true">
			<div title="欢迎页面">
				<h2>欢迎使用凤凰旅行社 erp 系统</h2>

			</div>
		</div>
	</div>
	<script type="text/javascript">
		function open1(plugin) {
			if ($('#tt').tabs('exists', plugin)) {
				$('#tt').tabs('select', plugin);
			} else {
				$('#tt').tabs('add', {
					title : plugin,
					href :'indexTest1.jsp',
					closable : true
				});
			}
		}
	</script>
</body>
</html>
