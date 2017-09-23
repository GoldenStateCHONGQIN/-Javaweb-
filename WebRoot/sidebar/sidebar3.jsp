<%@ page pageEncoding="UTF-8"%>
<div class="accordion" fillSpace="sideBar">
	<div class="accordionHeader">
		<h2><span>Folder</span>系统管理</h2>
	</div>
	<div class="accordionContent">
		<ul class="tree">
			 <li><a href="${pageContext.request.contextPath}/sys/queryNews.action" target="navTab" rel="mainquery">业务信息管理</a></li>
			 <li><a href="${pageContext.request.contextPath}/sys/queryBank.action" target="navTab" rel="mainquery">银行管理</a></li>
			 <li><a href="${pageContext.request.contextPath}/sys/queryPayment.action" target="navTab" rel="mainquery">生活缴费分类</a></li>
		</ul>
	</div>
</div>
