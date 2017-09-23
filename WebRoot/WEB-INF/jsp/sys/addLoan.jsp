<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<!-- 贷款申请jsp -->
<h2 class="contentTitle">贷款申请</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/addUserLoan.action" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this)">
		<div class="pageFormContent" layoutH="97">
			<table>
					<tr>
						<td colspan="2"><dl>
							<dt>贷款金额：</dt>
							<dd><input name="balance"  type="text"  class="required number" min=1/></dd>
							</dl></td>
						<td colspan="2"><dl>
							<dt>贷款年限：</dt>
							<dd>
								<select name="loanyear">
									<option value="三年">三年</option>
									<option value="五年">五年</option>
									<option value="十年">十年</option>
								</select>
							</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>申请材料（收入证明、抵押资产等）：</dt>
							<dd>
								<textarea class="editor" name="reason" rows="20" cols="100" tools="simple" 
								upImgUrl="${ctx}/sys/imageUpload.action" upImgExt="jpg,jpeg,gif,png,bmp,pdf,pptx" ></textarea>
							</dd>
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
