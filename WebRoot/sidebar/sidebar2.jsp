<%@ page pageEncoding="UTF-8"%>
<div class="accordion" fillSpace="sideBar">
	<div class="accordionHeader">
		<h2><span>Folder</span>系统管理</h2>
	</div>
	<div class="accordionContent">
		<ul class="tree">
			 <li><a href="${pageContext.request.contextPath}/sys/queryApply.action" target="navTab" rel="mainquery">信用卡申请</a></li>
			 <li><a href="${pageContext.request.contextPath}/sys/queryAdminCard.action" target="navTab" rel="mainquery">信用卡管理</a></li>
			 <li><a href="${pageContext.request.contextPath}/sys/queryAdminLoan.action" target="navTab" rel="mainquery">贷款申请管理</a></li>
		</ul>
	</div>
</div>
