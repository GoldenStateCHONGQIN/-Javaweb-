<%@ page pageEncoding="UTF-8"%>
<div class="accordion" fillSpace="sideBar">
	<div class="accordionHeader">
		<h2><span>Folder</span>网上支付管理</h2>
	</div>
	<div class="accordionContent">
		<ul class="tree">
			  <li><a href="${pageContext.request.contextPath}/sys/queryUserCardBank.action" target="navTab" rel="mainquery">我的银行卡</a></li>
			 <li><a href="${pageContext.request.contextPath}/sys/add2saveBank.action" target="navTab" rel="mainquery">存款</a></li>
			 <li><a href="${pageContext.request.contextPath}/sys/queryTransferLocal.action" target="navTab" rel="mainquery">本行转账</a></li>
			 <li><a href="${pageContext.request.contextPath}/sys/queryTransferRemote.action" target="navTab" rel="mainquery">跨行转帐</a></li>
			 <li><a href="${pageContext.request.contextPath}/sys/queryPaymentFlow.action" target="navTab" rel="mainquery">生活缴费</a></li>
		</ul>
	</div>
</div>
