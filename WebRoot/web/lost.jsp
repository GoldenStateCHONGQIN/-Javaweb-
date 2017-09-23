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
					<li class="grid"><a href="${ctx}/web/reg.jsp">信用卡申请</a></li>
					<li class="active"><a href="${ctx}/web/lost.jsp">挂失</a></li>
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
		  <li class="active">挂失</li>
		 </ol>
	 <div class="registration">
		  
		 <div class="registration_left">
			 <h2>遗失或遗忘卡号时，申请挂失</h2>
			 <h4 style="color:blue">${addLostErrorMessage }</h4>
			 <%session.removeAttribute("addLostErrorMessage"); %>
			 <div class="registration_form">
			 <!-- Form -->
				<form id="registration_form" action="${ctx }/com/addLost.action" method="post">
					<div class="sky_form1">
							<ul>
								<li><label class="radio left"><input type="radio" name="logintype" checked="" value="银行卡"><i></i>银行卡</label></li>
								<li><label class="radio"><input type="radio" name="logintype" value="信用卡"><i></i>信用卡</label></li>
								<div class="clearfix"></div>
							</ul>
					</div>	
					<div>
						<label>
							<input placeholder="证件号码:" name="loginid" value="" type="text" tabindex="3" required>
						</label>
					</div>
					<div>
						<label>
							<input placeholder="卡号密码:" name="password" value="" type="password" tabindex="3" required>
						</label>
					</div>
					<div>
						<label>
							<input placeholder="手机号码:" name="phone" value="" type="text" tabindex="3" required>
						</label>
					</div>
					<div>
						<input type="submit" value="申请挂失" id="register-submit">
					</div>
				</form>
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
