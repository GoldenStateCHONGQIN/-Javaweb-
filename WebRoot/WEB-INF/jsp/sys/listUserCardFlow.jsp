<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<form id="pagerForm" method="post" action="${ctx}/sys/queryMyCardFlow.action">
	<input type="hidden" name="pageNum" value="" />
</form>
<!-- 用户：我的信用卡模块资金流动记录查询 -->
<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/sys/queryMyCardFlow.action" method="post">
	<div class="searchBar">
		<ul class="searchContent">
			 
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
				<th width="70">备注</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${SESSION_PAGE.list}" var="item">
			<tr target="sid_select" rel="${item.id }">
				<td>${item.card.sid}</td>
				<td <c:if test="${item.type=='转出'}">align="right"</c:if>  > <c:if test="${item.type=='转出'}">-</c:if> ${item.money}</td>
				<td>${item.addDate}</td>
				<td>${item.type}</td>
				<td>${item.note}</td>
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
