<%@ page pageEncoding="UTF-8"%>
<div class="accordion" fillSpace="sideBar">
	<div class="accordionHeader">
		<h2><span>Folder</span>系统管理</h2>
	</div>
	<div class="accordionContent">
		<ul class="tree  ">
			 <li><a href="${pageContext.request.contextPath}/sys/querySysUser.action" target="navTab" rel="mainquery">管理员列表</a></li>
			 <li><a href="${pageContext.request.contextPath}/sys/querySimpleUser.action" target="navTab" rel="mainquery">用户列表</a></li>
		</ul>
	</div>
</div>
