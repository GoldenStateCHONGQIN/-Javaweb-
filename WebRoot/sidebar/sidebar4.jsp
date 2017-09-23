<%@ page pageEncoding="UTF-8"%>
<div class="accordion" fillSpace="sideBar">
	<div class="accordionHeader">
		<h2><span>Folder</span>账号安全</h2>
	</div>
	<div class="accordionContent">
		<ul class="tree">
			 <li><a href="${pageContext.request.contextPath}/sys/queryLostCardAdmin.action" target="navTab" rel="mainquery">银行卡挂失列表</a></li>
			 <li><a href="${pageContext.request.contextPath}/sys/queryLockCardAdmin.action" target="navTab" rel="mainquery">已冻结银行卡列表</a></li>
		</ul>
	</div>
	<div class="accordionHeader">
		<h2><span>Folder</span>交易处理</h2>
	</div>
	<div class="accordionContent">
		<ul class="tree">
			 <li><a href="${pageContext.request.contextPath}/sys/queryInsuranceType.action" target="navTab" rel="mainquery">保险种类列表</a></li>
			 <li><a href="${pageContext.request.contextPath}/sys/add2Insurance.action" target="navTab" rel="mainquery">新契约投保</a></li>
			 <li><a href="${pageContext.request.contextPath}/sys/queryInsurance.action" target="navTab" rel="mainquery">保单列表</a></li>
		</ul>
	</div>
</div>
