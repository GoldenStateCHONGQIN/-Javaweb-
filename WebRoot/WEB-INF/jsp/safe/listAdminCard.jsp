<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<form id="pagerForm" method="post" action="${ctx}/sys/queryAdminCard.action">
	<input type="hidden" name="pageNum" value="" />
</form>
<!-- 管理员：保险系统管理--银行卡挂失、冻结查询jsp -->
<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/sys/queryAdminCard.action" method="post">
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
			<li><a class="edit" href="${ctx}/sys/getAdminCardStatus.action?uid={sid_select}" target="navTab" rel="baseAdd" warn="请选择一条信息,点击需要修改的行" title="信用卡信息"><span>管理</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="100">姓名</th>
				<th width="100">证件类型</th>
				<th width="100">证件号码</th>
				<th width="70">审核状态</th>
				<th width="70">卡号</th>
				<th width="70">余额</th>
				<th width="70">积分</th>
				<th width="70">状态</th>
				<th width="70">信用额度</th>
				<th width="70">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${SESSION_PAGE.list}" var="item">
			<tr target="sid_select" rel="${item.id }">
				<td>${item.apply.name}</td>
				<td>${item.apply.idtype}</td>
				<td>${item.apply.dicard}</td>
				<td>${item.apply.checkStatus}</td>
				<td>${item.sid}</td>
				<td>${item.balance}</td>
				<td>${item.points}</td>
				<td>${item.cardStatus}</td>
				<td>${item.credits}</td>
				<td width="70">
					<a title="信用卡信息"  href="${ctx}/sys/getAdminCardStatus.action?uid=${item.id}" class="btnEdit" target="navTab" rel="baseAdd">信用卡信息</a>
				</td>
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
