<%@ page pageEncoding="UTF-8"%>
<div class="accordion" fillSpace="sideBar">
	<div class="accordionHeader">
		<h2><span>Folder</span>信用卡</h2>
	</div>
	<div class="accordionContent">
		<ul class="tree">
			 <li><a href="${pageContext.request.contextPath}/sys/queryUserCard.action" target="navTab" rel="mainquery">我的信用卡</a></li>
			 <li><a href="${pageContext.request.contextPath}/sys/add2save.action" target="navTab" rel="mainquery">存款</a></li>
			 <li><a href="${pageContext.request.contextPath}/sys/queryMyCardFlow.action" target="navTab" rel="mainquery">资金流动记录</a></li>
			 <li><a href="${pageContext.request.contextPath}/sys/add2Loan.action" target="navTab" rel="mainquery">快速贷款</a></li>
			 <li><a href="${pageContext.request.contextPath}/sys/add2LoanReturn.action" target="navTab" rel="mainquery">还款</a></li>
			 <li><a href="${pageContext.request.contextPath}/sys/queryMyLoan.action" target="navTab" rel="mainquery">贷款/还款记录</a></li>
		</ul>
	</div>
</div>
