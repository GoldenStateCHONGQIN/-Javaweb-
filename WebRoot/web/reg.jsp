<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>${appTitle }</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="http://www.5imoban.net/download/jquery/jquery-1.8.3.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- start menu -->
<script src="js/simpleCart.min.js"> </script>
<!-- start menu -->
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>
	$(document).ready(function() {
		$(".memenu").memenu();
		var temp = "${regErrorMessage}";
		if(temp !== ""){
			alert(temp);
		}
		
	});
</script>
<%session.removeAttribute("regErrorMessage"); %>
<!-- /start menu -->
</head>
<body> 
<!--header-->	
<div class="top_bg">
	<div class="container">
		<div class="header_top-sec">
			<div class="top_right">
				<ul>
<!-- 					<li><a href="#">help</a></li>| -->
<!-- 					<li><a href="contact.html">Contact</a></li>| -->
<!-- 					<li><a href="login.html">Track Order</a></li> -->
				</ul>
			</div>
			<div class="top_left">
				<ul>
<!-- 					<li class="top_link">Email:<a href="mailto:info@example.com">mail@example.com</a></li>| -->
					<c:if test="${not empty SESSION_BEAN}">
					<li class="top_link"><a href="login.html">${SESSION_BEAN.user.user.userName }</a></li>
				</c:if>				
				<c:if test="${empty SESSION_BEAN}">
					<li class="top_link"><a href="${ctx }/index.jsp">后台登陆</a></li>
				</c:if>							
				</ul>
			</div>
				<div class="clearfix"> </div>
		</div>
	</div>
</div>
<div class="header-top">
	 <div class="header-bottom">
		 <div class="container">			
				<div class="logo">
					<a href="${ctx}/web/index.jsp"><h1>${appTitle }</h1></a>
				</div>
			 <!---->
		 
			 <div class="top-nav">
				<ul class="memenu skyblue">
					<li class="grid"><a href="${ctx}/web/index.jsp">首页</a></li>
					<li class="grid"><a href="${ctx}/com/queryNews.action">业务信息</a></li>
					<li class="active"><a href="${ctx}/web/reg.jsp">信用卡申请</a></li>
					<li class="grid"><a href="${ctx}/web/lost.jsp">挂失</a></li>
				</ul>
				<div class="clearfix"> </div>
			 </div>
			 <!---->
			 <div class="clearfix"> </div>
			 <!---->			 
			 </div>
			<div class="clearfix"> </div>
	  </div>
</div>
<div class="container">
	  <ol class="breadcrumb">
		  <li><a href="${ctx}/web/index.jsp">首页</a></li>
		  <li class="active">信用卡申请</li>
		 </ol>
	 <div class="registration">
		 <div class="registration_left">
			 <h2>新用户? <span> 申请一张信用卡</span></h2>
			 <!-- [if IE] 
				< link rel='stylesheet' type='text/css' href='ie.css'/>  
			 [endif] -->  
			  
			 <!-- [if lt IE 7]>  
				< link rel='stylesheet' type='text/css' href='ie6.css'/>  
			 <! [endif] -->  
			 <script>
				(function() {
			
				// Create input element for testing
				var inputs = document.createElement('input');
				
				// Create the supports object
				var supports = {};
				
				supports.autofocus   = 'autofocus' in inputs;
				supports.required    = 'required' in inputs;
				supports.placeholder = 'placeholder' in inputs;
			
				// Fallback for autofocus attribute
				if(!supports.autofocus) {
					
				}
				
				// Fallback for required attribute
				if(!supports.required) {
					
				}
			
				// Fallback for placeholder attribute
				if(!supports.placeholder) {
					
				}
				
				// Change text inside send button on submit
				var send = document.getElementById('register-submit');
				if(send) {
					send.onclick = function () {
						this.innerHTML = '...Sending';
					}
				}
			
			 })();
			 </script>
			 <div class="registration_form" >
			 <!-- Form -->
				<form id="registration_form" action="${ctx}/com/regApply.action" method="post">
					<div>
						<label>
							<input placeholder="姓名:" name="apply.name" type="text" tabindex="1" required autofocus>
						</label>
					</div>
					<div>
						<label>
							<input placeholder="证件类型:" name="apply.idtype" type="text" tabindex="2" required autofocus>
						</label>
					</div>
					<div>
						<label>
							<input placeholder="证件号码:"  name="apply.dicard" type="text" tabindex="3" required>
						</label>
					</div>
					<div>
						<label>
							<input placeholder="出生日期"  name="apply.birth" type="date" tabindex="3" required>
						</label>
					</div>					
						<div class="sky_form1">
							<ul>
								<li><label class="radio left"><input type="radio" name="apply.gender" checked="" value="男"><i></i>男</label></li>
								<li><label class="radio"><input type="radio" name="apply.gender" value="女"><i></i>女</label></li>
								<div class="clearfix"></div>
							</ul>
						</div>					
						<div class="sky_form1">
							<ul>
								<li><label class="radio left"><input type="radio" name="apply.marrage" checked="" value="已婚"><i></i>已婚</label></li>
								<li><label class="radio"><input type="radio" name="apply.marrage" value="未婚"><i></i>未婚</label></li>
								<div class="clearfix"></div>
							</ul>
						</div>					
					<div>
						<label>
							<input placeholder="教育程度"  name="apply.education" type="text" tabindex="4" required>
						</label>
					</div>						
					<div>
						<label>
							<input placeholder="户籍地址"  name="apply.address" type="text" tabindex="4" required>
						</label>
					</div>						
					<div>
						<label>
							<input placeholder="手机号码"  name="apply.phone" type="text" tabindex="4" required>
						</label>
					</div>						
					<div>
						<label>
							<input placeholder="Email"  name="apply.email" type="text" tabindex="4" required>
						</label>
					</div>						
					<div>
						<label>
							<input placeholder="单位地址"  name="apply.workAddress" type="text" tabindex="4" required>
						</label>
					</div>						
					<div>
						<label>
							<input placeholder="单位名称"  name="apply.workCompany" type="text" tabindex="4" required>
						</label>
					</div>						
					<div>
						<label>
							<input placeholder="年收入"  name="apply.yearIncome" type="text" tabindex="4" required>
						</label>
					</div>						
					 
					<div>
						<input type="submit" value="提交申请" id="register-submit">
					</div>
				</form>
				<!-- /Form -->
				 
			 </div>
		 </div>
		 <div class="registration_left">
			 <h2>已经申请,输入证件号码查询审核进度</h2>
			 <h4 style="color:blue">${queryErrorMessage }</h4>
			 <c:if test="${queryApplyStatus=='审核通过' }">
			 	<h5 style="color:red"><a href="${ctx }/index.jsp">点击使用身份证登录后台进行信用卡激活</a>. 默认密码:123456</h5>
			 </c:if>
			 <%session.removeAttribute("queryErrorMessage"); %>
			 <%session.removeAttribute("queryApplyStatus"); %>
			 <div class="registration_form">
			 <!-- Form -->
				<form id="registration_form" action="${ctx }/com/queryApplyStatus.action" method="post">
					<div>
						<label>
							<input placeholder="证件号码:" name="loginid" value="${queryIdcard }" type="text" tabindex="3" required>
						</label>
					</div>
					<div>
						<input type="submit" value="查询进度" id="register-submit">
					</div>
				</form>
			 <%session.removeAttribute("queryIdcard"); %>
			 <!-- /Form -->
			 </div>
		 </div>
		 <div class="clearfix"></div>
	 </div>
</div>
<!---->
 
<!---->
<div class="shoping">
	 
</div>
<!---->
 <div class="copywrite">
	 <div class="container">
			 <p>Copyright ${appTitle }</p>
		 </div>
</div>		 
</body>
</html>
