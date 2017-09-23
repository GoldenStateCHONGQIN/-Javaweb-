<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<h2 class="contentTitle">修改 保险单据</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/updateInsurance.action" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this)">
		<input type="hidden" value="${modifybean.id}" name="id"/>
		<div class="pageFormContent" layoutH="97">
			<table>
					<tr>
						<td colspan="2"><dl>
							<dt>保险单号：</dt>
							<dd>${modifybean.sid }
							</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>保险种类：</dt>
							<dd>
							<select name="insuranceType.id" class="">
								<c:forEach items="${list }" var="item">
									<option value="${item.id }">${item.name }</option>
								</c:forEach>
							</select>
							</dd>
							</dl></td>
					</tr>
					 
					<tr>
						<td colspan="2"><dl>
							<dt>投保人姓名：</dt>
							<dd><input name="name1" value="${modifybean.name1}" type="text"  class="required"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>投保人身份证：</dt>
							<dd><input name="idcard1" value="${modifybean.idcard1}" type="text"  class="required"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>被保险人姓名：</dt>
							<dd><input name="name2" value="${modifybean.name2}" type="text"  class="required"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>被保险人身份证：</dt>
							<dd><input name="idcard2" value="${modifybean.idcard2}" type="text"  class="required"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>开始日期：</dt>
							<dd><input name="startDate" value="${modifybean.startDate}" type="text" readonly="readonly" class="date required"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>截至日期：</dt>
							<dd><input name="endDate" value="${modifybean.endDate}" type="text" readonly="readonly" class="required date"/></dd>
							</dl></td>
					</tr>
					 
				</table>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="reset" class="reset">重置</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
