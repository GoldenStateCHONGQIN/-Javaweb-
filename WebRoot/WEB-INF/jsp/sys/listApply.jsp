<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<form id="pagerForm" method="post" action="${ctx}/sys/queryApply.action">
	<input type="hidden" name="pageNum" value="" />
</form>
<!-- 管理员 ：信用卡申请jsp -->
<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/sys/queryApply.action" method="post">
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				<label>证件号码：</label>
				<input type="text" name="s_dicard" value=""/>
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
			<li><a class="edit" href="${ctx}/sys/getApply.action?uid={sid_select}" target="navTab" rel="baseAdd" warn="请选择一条信息,点击需要修改的行" title="审核申请"><span>审核申请</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="100">姓名</th>
				<th width="100">证件类型</th>
				<th width="100">证件号码</th>
				<th width="100">出生日期</th>
				<th width="100">性别</th>
				<th width="100">婚否</th>
				<th width="100">教育程度</th>
				<th width="70">户籍</th>
				<th width="70">手机号码</th>
				<th width="70">邮箱</th>
				<th width="70">工作地址</th>
				<th width="70">工作单位</th>
				<th width="70">年收入</th>
				<th width="70">申请日期</th>
				<th width="70">审核状态</th>
				<th width="70">操作</th>
			</tr>
		</thead>
		<tbody>
		<%--c:forEach标签：循环控制 。items:要进行迭代的集合，var:迭代参数的名称--%>
			<c:forEach items="${SESSION_PAGE.list}" var="item">
			<tr target="sid_select" rel="${item.id }">
				<td>${item.name}</td>
				<td>${item.idtype}</td>
				<td>${item.dicard}</td>
				<td>${item.birth}</td>
				<td>${item.gender}</td>
				<td>${item.marrage}</td>
				<td>${item.education}</td>
				<td>${item.address}</td>
				<td>${item.phone}</td>
				<td>${item.email}</td>
				<td>${item.workAddress}</td>
				<td>${item.workCompany}</td>
				<td>${item.yearIncome}</td>
				<td>${item.addDate}</td>
				<td>${item.checkStatus}</td>
				<td width="70">
					<a title="审核申请"  href="${ctx}/sys/getApply.action?uid=${item.id}" class="btnEdit" target="navTab" rel="baseAdd">审核申请</a>
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
