<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<h2 class="contentTitle">信用卡信息</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/activeCard.action" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this)">
		<input type="hidden" value="${modifybean.id}" name="id"/>
		<div class="pageFormContent" layoutH="97">
			<table>
					<tr>
						<td colspan="2"><dl>
							<dt>卡号：</dt>
							<dd>${modifybean.sid}</dd>
							</dl></td>
					</tr>
					<tr>
						<td ><dl>
							<dt>姓名：</dt>
							<dd>${modifybean.apply.name }</dd>
							</dl></td>
						<td ><dl>
							<dt>证件类型：</dt>
							<dd>${modifybean.apply.idtype }</dd>
							</dl></td>
					</tr>
					<tr>
						<td ><dl>
							<dt>证件号码：</dt>
							<dd>${modifybean.apply.dicard }</dd>
							</dl></td>
						<td ><dl>
							<dt>性别：</dt>
							<dd>${modifybean.apply.gender }</dd>
							</dl></td>
					</tr>
					 
					<tr>
						<td colspan="2"><dl>
							<dt>申请状态：</dt>
							<dd>${modifybean.apply.checkStatus }</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>信用卡状态：</dt>
							<dd>${modifybean.cardStatus }</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>余额：</dt>
							<dd>${modifybean.balance }</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>积分：</dt>
							<dd>${modifybean.points }</dd>
							</dl></td>
					</tr>
					<c:if test="${modifybean.cardStatus=='未激活' }">
						<tr>
						<td colspan="2"><dl class="nowrap">
							<dt>密码：</dt>
							<dd> 
								<input name="password"   id="w_validation_pwd" type="password"  class="required alphanumeric" minlength="6" maxlength="20"/>
								<span class="info"> (输入密码,激活信用卡)</span>
							</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>密码确认：</dt>
							<dd><input name="repassword"    type="password" class="required" equalto="#w_validation_pwd"/></dd>
							</dl></td>
					</tr>
					</c:if>
					<c:if test="${modifybean.cardStatus=='正常' }">
						<tr>
						<td colspan="2"><dl class="nowrap">
							<dt>密码：</dt>
							<dd> 
								<input name="password"   id="w_validation_pwd" type="password"  class=" alphanumeric" minlength="6" maxlength="20"/>
								<span class="info"> (修改密码)</span>
							</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>密码确认：</dt>
							<dd><input name="repassword"    type="password" class="" equalto="#w_validation_pwd"/></dd>
							</dl></td>
					</tr>
					</c:if>
				</table>
		</div>
		<div class="formBar">
			<c:if test="${(modifybean.cardStatus=='正常') }">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="reset" class="reset">重置</button></div></div></li>
			</ul>
			</c:if>
			<c:if test="${(modifybean.cardStatus=='未激活')}">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="reset" class="reset">重置</button></div></div></li>
			</ul>
			</c:if>
		</div>
	</form>
</div>
