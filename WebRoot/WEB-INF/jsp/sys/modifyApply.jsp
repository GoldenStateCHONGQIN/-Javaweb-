<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<!-- 管理员： 信用卡申请 -申请状态修改 -->
<h2 class="contentTitle">信用卡申请信息</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/checkApply.action" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this)">
		<input type="hidden" value="${modifybean.id}" name="id"/>
		<div class="pageFormContent" layoutH="97">
			<table>
					<tr>
						<td ><dl>
							<dt>姓名：</dt>
							<dd>${modifybean.name }</dd>
							</dl></td>
						<td ><dl>
							<dt>证件类型：</dt>
							<dd>${modifybean.idtype }</dd>
							</dl></td>
					</tr>
					<tr>
						<td ><dl>
							<dt>证件号码：</dt>
							<dd>${modifybean.dicard }</dd>
							</dl></td>
						<td ><dl>
							<dt>性别：</dt>
							<dd>${modifybean.gender }</dd>
							</dl></td>
					</tr>
					<tr>
						<td ><dl>
							<dt>出生日期：</dt>
							<dd>${modifybean.birth }</dd>
							</dl></td>
						<td ><dl>
							<dt>婚否：</dt>
							<dd>${modifybean.marrage }</dd>
							</dl></td>
					</tr>
					<tr>
						<td ><dl>
							<dt>教育程度：</dt>
							<dd>${modifybean.education }</dd>
							</dl></td>
						<td ><dl>
							<dt>户籍：</dt>
							<dd>${modifybean.address }</dd>
							</dl></td>
					</tr>
					<tr>
						<td ><dl>
							<dt>手机号码：</dt>
							<dd>${modifybean.phone }</dd>
							</dl></td>
						<td ><dl>
							<dt>邮箱：</dt>
							<dd>${modifybean.email }</dd>
							</dl></td>
					</tr>
					<tr>
						<td ><dl>
							<dt>工作地址：</dt>
							<dd>${modifybean.workAddress }</dd>
							</dl></td>
						<td ><dl>
							<dt>工作单位：</dt>
							<dd>${modifybean.workCompany }</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>年收入：</dt>
							<dd>${modifybean.yearIncome }</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>申请状态：</dt>
							<dd>${modifybean.checkStatus }</dd>
							</dl></td>
					</tr>
					 
					 
					<tr>
						<td colspan="2"><dl>
							<dt>审核状态：</dt>
							<dd>
								<select name="checkStatus">
									<option value="审核中">审核中</option>
									<option value="审核通过">审核通过</option>
									<option value="审核失败">审核失败</option>
								</select>
							</dd>
							</dl></td>
					</tr>
					 
				</table>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">更新审核结果</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="reset" class="reset">重置</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
