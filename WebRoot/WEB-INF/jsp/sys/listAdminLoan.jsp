<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<form id="pagerForm" method="post" action="${ctx}/sys/queryAdminLoan.action">
	<input type="hidden" name="pageNum" value="" />
</form>
<!-- 管理员 信用卡管理 -贷款审核管理jsp -->
<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/sys/queryAdminLoan.action" method="post">
	<div class="searchBar">
		<ul class="searchContent">
			 <li>
				<label>日期：</label>
				<input type="text" value="" name="s_addDate" readonly="readonly" class="date"/>
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
			<li><a title="确实要审核通过贷款申请吗?" target="selectedTodo" rel="ids" postType="string" href="${ctx}/sys/checkLoan.action" class="edit" warn="请选择需要审核的信息"><span>审批通过</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="3%"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="70">卡号</th>
				<th width="70">金额</th>
				<th width="70">时间</th>
				<th width="70">类别</th>
				<th width="70">贷款原因</th>
				<th width="70">贷款期限</th>
				<th width="70">是否批准</th>
				<th width="70">申请人姓名</th>
				<th width="70">证件类型</th>
				<th width="70">证件号码</th>
				<th width="70">信用额度</th>
				<th width="70">信用卡余额</th>
				<th width="70">信用卡积分</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${SESSION_PAGE.list}" var="item">
			<tr target="sid_select" rel="${item.id }">
				<td><input name="ids" value="${item.id }" type="checkbox"></td>
				<td>${item.card.sid}</td>
				<td <c:if test="${item.type=='转出'}">align="right"</c:if>  > <c:if test="${item.type=='转出'}">-</c:if> ${item.money}</td>
				<td>${item.addDate}</td>
				<td>${item.type}</td>
				<td>${item.reasons}</td>
				<td>${item.loanyears}</td>
				<td>${item.checked}</td>
				<td>${item.card.apply.name}</td>
				<td>${item.card.apply.idtype}</td>
				<td>${item.card.apply.dicard}</td>
				<td>${item.card.credits}</td>
				<td>${item.card.balance}</td>
				<td>${item.card.points}</td>
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
