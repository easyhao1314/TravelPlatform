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
<script type="text/javascript" src="js/jquery.json.js"></script>
<script type="text/javascript" src="js/datagrid-groupview.js"></script>
</head>

<body class="easyui-layout">
	<!-- north 是上面的，背景颜色有赵阳来处理-->
	<div data-options="region:'north'" style="height:25px;background:#666;"
		border="false">
		<!-- 在这里可以添加相应的登录信息，比如用户信息 -->
	</div>
	<!-- south 是下面的，背景颜色有赵阳他们来确定 -->
	<div data-options="region:'south'" style="height:20px;background:#666;"
		border="false">
		<!-- 在这里可以添加 版权之类的东西 -->
	</div>
	<!-- 在这里配置 左侧菜单项  split  这说明页面中带分割条 可以用鼠标拖动-->
	<div data-options="region:'west',split:true"
		style="width:200px;">
		<!-- 在这里添加菜单的样式和菜单的数据，子菜单 等等 -->
		<ul class="easyui-tree">
			<li iconCls="icon-base" state="closed"><span>自我管理</span>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('个人基本信息','');">个人基本信息</a>
					</li>
				</ul>
				<ul>

				</ul></li>
				<li iconCls="icon-base" state="closed"><span>财务中心</span>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('付款审批','a.do');">付款审批</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('应付款统计','yfktj.do');">应付款统计</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('应收款统计','ysktj.do');">应收款统计</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('退款返佣审核','tuikuanshenhe.do');">退款返佣审核</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('付款方式设置','fkfssz.do');">付款方式设置</a>
					</li>
				</ul>
					<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('付款审核','fukuanshenhe.do');">付款 审核</a>
					</li>
				</ul>
				
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('散团费用列表','sanpin.do');">散团费用列表</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('单团费用列表','sanpin.do');">单团费用列表</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('团队费用列表','sanpin.do');">团队费用列表</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('币种汇率设置	','bzhlsz.do');">币种汇率设置</a>
					</li>
				</ul>
					<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('费用项大类维护','fydxwh.do');">费用项大类维护</a>
					</li>
				</ul>
				
					<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('未收未付款查询','wswfcx.do');">未收未付款查询</a>
					</li>
				</ul>
				
				
					<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('付款确认','querenfukuan.do');">付款确认</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('收款确认','shoukuan.do');">收款确认</a>
					</li>
				</ul>
				<ul>

				</ul></li>
				
				<li iconCls="icon-base" state="closed"><span>散拼中心</span>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('新建散拼','SanPin_new.do');">新建散拼</a>
					</li>
					<li iconCls="icon-gears"><a
						href="javascript:open1('散拼操作','SanPin_caozuo.do');">散拼操作</a>
					</li>
					<li iconCls="icon-gears"><a
						href="javascript:open1('报名确认受理','SanPin_baoming.do');">报名确认受理</a>
					</li>
					<li iconCls="icon-gears"><a
						href="javascript:open1('散拼团列表','SanPin_liebiao.do');">散拼团列表</a>
					</li>
					<li iconCls="icon-gears"><a
						href="javascript:open1('我的退团申请','SanPin_tuituan.do');">我的退团申请</a>
					</li>
				</ul>
				<ul>

				</ul></li>
			<li iconCls="icon-base"><span>行程库维护</span>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('日行程库维护','Xingcheng_ri.do');">日行程库维护</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('线路/行程维护','Xingcheng_weihu.do');">线路/行程维护</a>
					</li>
				</ul>
			</li>
			<li iconCls="icon-base" state="closed"><span>系统管理</span>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('系统功能管理','functionMenu.do');">系统功能管理</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('部门管理','department.do');">部门管理</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('角色管理','role.do');">系统角色管理</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('公司管理','company.do');">公司管理</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('系统用户管理','users.do');">系统用户管理</a>
					</li>
				</ul>
			</li>
			<li iconCls="icon-base" state="closed"><span>系统基础设置管理</span>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('团队进展状态字典','dictionaryDesc.do?dicType=8');">团队进展状态字典</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('酒店-星级字典维护','dictionaryDesc.do?dicType=9');">酒店-星级字典维护</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('巴士-用车性质字典','dictionaryDesc.do?dicType=1');">巴士-用车性质字典</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('交通-乘车类型字典','dictionaryDesc.do?dicType=2');">交通-乘车类型字典</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('早餐-餐标字典维护','dictionaryDesc.do?dicType=3');">早餐-餐标字典维护</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('午餐-餐标字典维护','dictionaryDesc.do?dicType=4');">午餐-餐标字典维护</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('晚餐-餐标字典维护','dictionaryDesc.do?dicType=5');">晚餐-餐标字典维护</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('导游-服务类型字典','dictionaryDesc.do?dicType=6');">导游-服务类型字典</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('导游-导游类型字典','dictionaryDesc.do?dicType=7');">导游-导游类型字典</a>
					</li>
				</ul>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('币种使用维护','currencyList.do');">币种使用维护</a></li>
				</ul></li>
			<li iconCls="icon-base"><span>单团中心</span>
				<ul>
					<li iconCls="icon-gears">
					<a href="javascript:open1('新增询价','DantuanAdd.do?dicType=1');">新增询价</a></li>
				</ul>
				 <ul>
			      <li iconCls="icon-gears">
			        <a href="javascript:open1('询价列表','DantuanXunjia.do?dicType=2');">询价列表</a>
			      </li>
			   </ul>
			    <ul>
			      <li iconCls="icon-gears">
			        <a href="javascript:open1('成团列表','DantuanChengtuan.do?dicType=3');">成团列表</a>
			      </li>
			   </ul>
			    <ul>
			      <li iconCls="icon-gears">
			        <a href="javascript:open1('报价团列表','DantuanBaojia.do?dicType=4');">报价团列表</a>
			      </li>
			   </ul>
			    <ul>
			      <li iconCls="icon-gears">
			        <a href="javascript:open1('待审批报价团','DantuanDaishen.do');">待审批报价团</a>
			      </li>
			   </ul>
			</li>
			<li iconCls="icon-base"><span>资源中心 </span>
				<ul>
					<li iconCls="icon-gears"><a
						href="javascript:open1('酒店供应商','ZiyuanJiudian.do?dicType=1');">酒店供应商</a></li>
				</ul>
				<ul>
				   <li iconCls="icon-gears">
				     <a href="javascript:open1('交通供应商','ZiyuanJiaotong.do?dicType=2');">交通供应商</a></li>
				</ul>
				<ul>
				   <li iconCls="icon-gears">
				     <a href="javascript:open1('航空公司','ZiyuanHangkong.do?dicType=3');">航空公司</a></li>
				</ul>
				<ul>
				   <li iconCls="icon-gears">
				     <a href="javascript:open1('餐饮供应商','ZiyuanCanyin.do?dicType=4');">餐饮供应商</a></li>
				</ul>
				<ul>
				   <li iconCls="icon-gears">
				     <a href="javascript:open1('导游供应商','ZiyuanDy.do?dicType=5');">导游供应商</a></li>
				</ul>
				<ul>
				   <li iconCls="icon-gears">
				     <a href="javascript:open1('景点供应商','ZiyuanJingdian.do?dicType=6');">景点供应商</a></li>
				</ul>
				<ul>
				   <li iconCls="icon-gears">
				     <a href="javascript:open1('地接社供应商','ZiyuanDijie.do?dicType=7');">地接社供应商</a></li>
				</ul>
				<ul>
				   <li iconCls="icon-gears">
				     <a href="javascript:open1('购物点','ZiyuanGouwu.do?dicType=8');">购物点</a></li>
				</ul>
				<ul>
				   <li iconCls="icon-gears">
				     <a href="javascript:open1('邀请函成本维护','ZiyuanYaoqing.do?dicType=9');">邀请函成本维护</a></li>
				</ul>
				<ul>
				   <li iconCls="icon-gears">
				     <a href="javascript:open1('自费节目维护','ZiyuanZifei.do?dicType=10');">自费节目维护</a></li>
				</ul>
			</li>
			<!--陈家海的配置 -->
		<li iconCls="icon-base"><span>操作中心</span>
				<ul>
					<li iconCls="icon-gears">
					<a href="javascript:open1('操作团队查询','operTeamQuery.do');">操作团队查询</a></li>
				</ul>
				 <ul>
			      <li iconCls="icon-gears">
			        <a href="javascript:open1('我派的订房任务','dingfangrenwu.do');">我派的订房任务</a>
			      </li>
			   </ul>
			   <ul>
			      <li iconCls="icon-gears">
			        <a href="javascript:open1('我派的订车任务','dingcherenwu.do');">我派的订车任务</a>
			      </li>
			   </ul>
			    <ul>
			      <li iconCls="icon-gears">
			        <a href="javascript:open1('我派的导游任务','daoyourenwu.do');">我派的导游任务</a>
			      </li>
			   </ul>
			    <ul>
			      <li iconCls="icon-gears">
			        <a href="javascript:open1('我派的购物店任务单','gouwudianrenwu.do');">我派的购物店任务单</a>
			      </li>
			   </ul>
		</li>
		<li iconCls="icon-base"><span>客户中心</span>
			    <ul>
			      <li iconCls="icon-gears">
			        <a href="javascript:open1('客户信息列表','customerInfoList.do');">客户信息列表</a>
			      </li>
			   </ul>
			    <ul>
			      <li iconCls="icon-gears">
			        <a href="javascript:open1('联系人信息列表','contactInfoList.do');">联系人信息列表</a>
			      </li>
			   </ul>
			    <ul>
			      <li iconCls="icon-gears">
			        <a href="javascript:open1('客户VIP字典','customerVIPDic.do?wordprefix=100001003');">客户VIP字典</a>
			      </li>
			   </ul>
			     <ul>
			      <li iconCls="icon-gears">
			        <a href="javascript:open1('客户资信字典','customerZiXinDic.do?wordprefix=100001005');">客户资信字典</a>
			      </li>
			   </ul>
			     <ul>
			      <li iconCls="icon-gears">
			        <a href="javascript:open1('客户价值字典','customerZiXinDic.do?wordprefix=100001004');">客户价值字典</a>
			      </li>
			   </ul>
			   <ul>
			      <li iconCls="icon-gears">
			        <a href="javascript:open1('客户合作级别','customerCoperLevel.do?wordprefix=100001001');">客户合作级别</a>
			      </li>
			   </ul>
			    <ul>
			      <li iconCls="icon-gears">
			        <a href="javascript:open1('客户区域维护','customerAreaWeihu.do');">客户区域维护</a>
			      </li>
			   </ul>
		</li>
		</ul>
		
	</div>
	<div data-options="region:'center'">
		<div id="tt" class="easyui-tabs" fit="true" border="false"
			plain="true">
			<div title="欢迎页面">
				<h2>欢迎使用凤凰旅行社 erp 系统</h2>

			</div>
		</div>
	</div>
	<script type="text/javascript">
		function open1(plugin, url) {
			if ($('#tt').tabs('exists', plugin)) {
				$('#tt').tabs('select', plugin);
			} else {
				var tab = $('#tt').tabs('getSelected');
				if (tab) {
					var index = $('#tt').tabs('getTabIndex', tab);
					$('#tt').tabs('close', index);
				}
				$('#tt').tabs('add', {
					title : plugin,
					href : url,
					closable : true
				});
			}
		}
	</script>
</body>
</html>
