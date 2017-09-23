<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<form id="pagerForm" method="post" action="${ctx}/sys/queryMyLoan.action">
	<input type="hidden" name="pageNum" value="" />
</form>
<!-- 用户：贷款还款记录查询jsp -->
<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/sys/queryMyLoan.action" method="post">
	<div class="searchBar">
		<ul class="searchContent">
			 <li>
				<label>总贷款：</label>
				<input type="text" value="${totalLoan}" readonly="readonly"/>
			</li>
			<li>
				<label>已还款：</label>
				<input type="text" value="${totalBack}" readonly="readonly"/>
			</li>
			<li>
				<label>待还款：</label>
				<input type="text" value="${totalElse}" readonly="readonly"/>
			</li>
			利息：<input type="text" value="${interest}" readonly="readonly"/>
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
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="70">卡号</th>
				<th width="70">金额</th>
				<th width="70">时间</th>
				<th width="70">类别</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${SESSION_PAGE.list}" var="item">
			<tr target="sid_select" rel="${item.id }">
				<td>${item.card.sid}</td>
				<td <c:if test="${item.type=='转出'}">align="right"</c:if>  > <c:if test="${item.type=='转出'}">-</c:if> ${item.money}</td>
				<td>${item.addDate}</td>
				<td>${item.type}</td>
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
