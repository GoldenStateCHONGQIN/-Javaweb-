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
					- <li class="grid"><a href="${ctx}/web/index.jsp">首页</a></li>
					<li class="active"><a href="${ctx}/com/queryNews.action">业务信息</a></li>
					<li class="grid"><a href="${ctx}/web/reg.jsp">信用卡申请</a></li>
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
		  <li class="active">业务信息</li>
		 </ol>
	  		<div class="col-md-6" style="width:100%">
					<div class="list-group list-group-alternate" style="width:100%">
					<c:forEach items="${SESSION_PAGE_WEB.list}" var="item">
						<a href="${ctx}/com/getNews.action?uid=${item.id}" class="list-group-item"><span class="badge">${item.addDate }</span> <i class="ti ti-email"></i> ${item.title } </a> 
					</c:forEach>
					</div>
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
