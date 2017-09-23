<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<form id="pagerForm" method="post" action="${ctx}/sys/queryTransferRemote.action">
	<input type="hidden" name="pageNum" value="" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/sys/queryTransferRemote.action" method="post">
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				<label>日期：</label>
				<input type="text" name="s_addDate" value="" class="date"/>
			</li>
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${ctx}/sys/add2TransferRemote.action" target="navTab"  rel="baseAdd" title="跨行转账"> <span>跨行转账</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="100">转账人姓名</th>
				<th width="100">转账人卡号</th>
				<th width="100">收款人姓名</th>
				<th width="100">收款人卡号</th>
				<th width="100">收款人银行</th>
				<th width="100">转账日期</th>
				<th width="100">转账金额</th>
				<th width="100">手续费</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${SESSION_PAGE.list}" var="item">
			<tr target="sid_select" rel="${item.id }">
				<td>${item.fromCard.user.user.userName}</td>
				<td>${item.fromCard.sid}</td>
				<td>${item.toName}</td>
				<td>${item.tobankid}</td>
				<td>${item.bank.name}</td>
				<td>${item.addDate}</td>
				<td>${item.money}</td>
				<td>${item.poundMoney}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>共${SESSION_PAGE.totalNumber}条</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="${SESSION_PAGE.totalNumber}" numPerPage="${SESSION_PAGE.itemsPerPage}" pageNumShown="10" currentPage="${SESSION_PAGE.currentPageNumber}"></div>
	</div>
</div>
<%@ include file="../common/clear.jsp"%>
