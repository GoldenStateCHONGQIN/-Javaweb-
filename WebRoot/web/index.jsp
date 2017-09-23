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
<script>$(document).ready(function(){$(".memenu").memenu();});</script>	
<!-- /start menu -->
<link type="text/css" rel="stylesheet" href="${ctx }/layer/skin/layer.css" />
<script type="text/javascript" src="${ctx }/layer/layer.min.js"></script>
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
					<li class="active"><a href="${ctx}/web/index.jsp">首页</a></li>
					<li class="grid"><a href="${ctx}/com/queryNews.action">业务信息</a></li>
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
<!---->
<div class="banner">
	 <div class="container">
	 </div>
</div>
<!---->
<div class="welcome">
	 <div class="container">
		 <div class="col-md-3 welcome-left">
			 <h2>欢迎使用${appTitle }</h2>
		 </div>
		 <div class="col-md-9 welcome-right">
			 <h3>何日君再来，再到金利来.</h3>
			 <p>生活的好芳邻－－好又多敞开便利之门 万里传送真情 湖南邵阳万里购物广场 东百商场:东方人的本色,百姓家的向往!生活的好芳邻－－好又多敞开便利之门 万里传送真情</p>
		 </div>
	 </div>
</div>
<!---->
 
<!---->
<div class="featured">
	 <div class="container">
		 <h3>网上商城</h3>
		 <div class="feature-grids">
			 <div class="col-md-3 feature-grid jewel">
				 <a href="javascript:;"><img src="images/f1.jpg" alt=""/>	
					 <div class="arrival-info">
						 <h4>Jewellerys #1</h4>
						 <p>￥ 500</p>
					 </div>
					 <div class="viw">
						<a href="javascript:;"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
					 </div>
					 <div class="shrt">
						<a href="javascript:;" onclick="tobuy('500','人民币')"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>购买</a>
					 </div></a>
			 </div>
			 <div class="col-md-3 feature-grid">
				 <a href="javascript:;"><img src="images/f2.jpg" alt=""/>	
					 <div class="arrival-info">
						 <h4>Jewellerys #1</h4>
						 <p>￥ 400</p>
					 </div>
					 <div class="viw">
						<a href="javascript:;"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
					 </div>
					 <div class="shrt">
						<a href="javascript:;" onclick="tobuy('800','人民币')"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>购买</a>
					 </div></a>
			 </div>
			 <div class="col-md-3 feature-grid jewel">
				 <a href="javascript:;"><img src="images/f3.jpg" alt=""/>	
					 <div class="arrival-info">
						 <h4>Wedding Ceramic Pot </h4>
						 <p>￥ 300</p>
					 </div>
					 <div class="viw">
						<a href="javascript:;"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
					 </div>
					 <div class="shrt">
						<a href="javascript:;" onclick="tobuy('300','人民币')"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>购买</a>
					 </div></a>
			 </div>
			 <div class="col-md-3 feature-grid">
				 <a href="javascript:;"><img src="images/f4.jpg" alt=""/>	
					 <div class="arrival-info">
						 <h4>Jewellerys #1</h4>
						 <p>￥ 200</p>
					 </div>
					 <div class="viw">
					 <a href="javascript:;"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
					 </div>
					 <div class="shrt">
						<a href="javascript:;" onclick="tobuy('200','人民币')"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>购买</a>
					 </div></a>
			 </div>
			 <div class="clearfix"></div>
		 </div>
		 <div class="feature-grids">
			 <div class="col-md-3 feature-grid jewel">
				 <a href="javascript:;"><img src="images/p7.jpg" alt=""/>	
					 <div class="arrival-info">
						 <h4>Jewellerys #1</h4>
						 <p>￥ 100</p>
					 </div>
					 <div class="viw">
						<a href="javascript:;"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
					 </div>
					 <div class="shrt">
						<a href="javascript:;" onclick="tobuy('100','人民币')"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>购买</a>
					 </div></a>
			 </div>
			 <div class="col-md-3 feature-grid">
				 <a href="javascript:;"><img src="images/p11.jpg" alt=""/>	
					 <div class="arrival-info">
						 <h4>Jewellerys #1</h4>
						 <p>￥ 111</p>
					 </div>
					 <div class="viw">
						<a href="javascript:;"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
					 </div>
					 <div class="shrt">
						<a href="javascript:;" onclick="tobuy('111','人民币')"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>购买</a>
					 </div></a>
			 </div>
			 <div class="col-md-3 feature-grid jewel">
				 <a href="javascript:;"><img src="images/p12.jpg" alt=""/>	
					 <div class="arrival-info">
						 <h4>Jewellerys #1</h4>
						 <p>￥ 12000</p>
					 </div>
					 <div class="viw">
						<a href="javascript:;"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
					 </div>
					 <div class="shrt">
						<a href="javascript:;" onclick="tobuy('12000','人民币')"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>购买</a>
					 </div></a>
			 </div>
			 <div class="col-md-3 feature-grid">
				 <a href="javascript:;"><img src="images/f2.jpg" alt=""/>	
					 <div class="arrival-info">
						 <h4>Jewellerys #1</h4>
						 <p>￥ 123</p>
					 </div>
					 <div class="viw">
						<a href="javascript:;"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
					 </div>
					 <div class="shrt">
						<a href="javascript:;" onclick="tobuy('123','人民币')"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>购买</a>
					 </div></a>
			 </div>
			 <div class="clearfix"></div>
		 </div>
	<div class="" id="buydiv" style="display: none">
			 <h4 style="color:blue">${queryErrorMessage }</h4>
			 <div class="registration_form">
			 <!-- Form -->
				<form id="" action="${ctx }/com/queryApplyStatus.action" method="post" style="margin-left: 100px">
					<input type="hidden" value="" id="buyPrice"/>
					<input type="hidden" value="" id="buyType"/>
					<div>
						<label id="showpricelabel">花费800积分</label>
					</div>
					<div>
						<label>
							<input placeholder="信用卡或者银行卡号:" size="40" name="idcard" id="idcard" type="text" tabindex="3">
						</label>
					</div>
					<div>
						<label>
							<input placeholder="密码" size="40" name="password" id="password" type="password" tabindex="3">
						</label>
					</div>
					<div>
						<input type="button" value="购买" onclick="dobuy()" id="register-submit">
					</div>
				</form>
			 <!-- /Form -->
			 </div>
		 </div>
	 </div>
</div>
<script type="text/javascript">
var pageii;
function tobuy(price,type){
	$("#buyPrice").val(price);
	$("#buyType").val(type);
	$("#showpricelabel").html("花费:"+price+type);
	layer.close(pageii);
	pageii = $.layer({
	    type: 1,
	    title: '用户登录',
	    area: ['720', '240'],
	    border: [10, 0.3, '#000'],
	    shade: [0.3, '#000'],
	    closeBtn: [1, true],
	    shadeClose: true,
	    fadeIn: 300,
	    fix: true,
	    page: {dom: '#buydiv',},
	    close:function(){
	    }
	});
}
function dobuy(){
	var price = $("#buyPrice").val();
	var type = $("#buyType").val();
	var idcard = $("#idcard").val();
	var password = $("#password").val();
	if(idcard==""){
		alert("请输入卡号");return false;
	}
	if(password==""){
		alert("请输入密码");return false;
	}
	$.ajax({
     		url:"${ctx}/com/webBuy.action",
     		contentType:"application/x-www-form-urlencoded;charset=UTF-8",
     		type:"post",
     		dataType:"json",
     		data:{"price":price,"type":type,"idcard":idcard,"password":password},//window.encodeURI(中文值)：对字符串进行编码
     		success:function(json){
     				alert(json.msg);
     				if(json.msg=='购买成功'){
     					layer.close(pageii);
     				}
     		},
     		error:function(json){}
	});
}
</script>
<div class="featured">
	 <div class="container">
		 <h3>积分商城</h3>
		 <div class="feature-grids">
			 <div class="col-md-3 feature-grid jewel">
				 <a href="javascript:;"><img src="images/p8.jpg" alt=""/>	
					 <div class="arrival-info">
						 <h4>Jewellerys #1</h4>
						 <p>积分 800</p>
					 </div>
					 <div class="viw">
						<a href="javascript:;"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
					 </div>
					 <div class="shrt">
						<a href="javascript:;" onclick="tobuy('800','积分')"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>购买</a>
					 </div></a>
			 </div>
			 <div class="col-md-3 feature-grid">
				 <a href="javascript:;"><img src="images/p7.jpg" alt=""/>	
					 <div class="arrival-info">
						 <h4>Jewellerys #1</h4>
						 <p>积分 700</p>
					 </div>
					 <div class="viw">
						<a href="javascript:;"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
					 </div>
					 <div class="shrt">
						<a href="javascript:;" onclick="tobuy('700','积分')"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>购买</a>
					 </div></a>
			 </div>
			 <div class="col-md-3 feature-grid jewel">
				 <a href="javascript:;"><img src="images/p6.jpg" alt=""/>	
					 <div class="arrival-info">
						 <h4>Wedding Ceramic Pot </h4>
						 <p>积分 600</p>
					 </div>
					 <div class="viw">
						<a href="javascript:;"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
					 </div>
					 <div class="shrt">
						<a href="javascript:;" onclick="tobuy('600','积分')"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>购买</a>
					 </div></a>
			 </div>
			 <div class="col-md-3 feature-grid">
				 <a href="javascript:;"><img src="images/p5.jpg" alt=""/>	
					 <div class="arrival-info">
						 <h4>Jewellerys #1</h4>
						 <p>积分 500</p>
					 </div>
					 <div class="viw">
					 <a href="javascript:;"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
					 </div>
					 <div class="shrt">
						<a href="javascript:;" onclick="tobuy('500','积分')"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>购买</a>
					 </div></a>
			 </div>
			 <div class="clearfix"></div>
		 </div>
		 <div class="feature-grids">
			 <div class="col-md-3 feature-grid jewel">
				 <a href="javascript:;"><img src="images/p4.jpg" alt=""/>	
					 <div class="arrival-info">
						 <h4>Jewellerys #1</h4>
						 <p>积分 400</p>
					 </div>
					 <div class="viw">
						<a href="javascript:;"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
					 </div>
					 <div class="shrt">
						<a href="javascript:;" onclick="tobuy('400','积分')"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>购买</a>
					 </div></a>
			 </div>
			 <div class="col-md-3 feature-grid">
				 <a href="javascript:;"><img src="images/p3.jpg" alt=""/>	
					 <div class="arrival-info">
						 <h4>Jewellerys #1</h4>
						 <p>积分 300</p>
					 </div>
					 <div class="viw">
						<a href="javascript:;"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
					 </div>
					 <div class="shrt">
						<a href="javascript:;" onclick="tobuy('300','积分')"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>购买</a>
					 </div></a>
			 </div>
			 <div class="col-md-3 feature-grid jewel">
				 <a href="javascript:;"><img src="images/p2.jpg" alt=""/>	
					 <div class="arrival-info">
						 <h4>Jewellerys #1</h4>
						 <p>积分 200</p>
					 </div>
					 <div class="viw">
						<a href="javascript:;"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
					 </div>
					 <div class="shrt">
						<a href="javascript:;" onclick="tobuy('200','积分')"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>购买</a>
					 </div></a>
			 </div>
			 <div class="col-md-3 feature-grid">
				 <a href="javascript:;"><img src="images/p1.jpg" alt=""/>	
					 <div class="arrival-info">
						 <h4>Jewellerys #1</h4>
						 <p>积分 100</p>
					 </div>
					 <div class="viw">
						<a href="javascript:;"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
					 </div>
					 <div class="shrt">
						<a href="javascript:;" onclick="tobuy('100','积分')"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>购买</a>
					 </div></a>
			 </div>
			 <div class="clearfix"></div>
		 </div>
	 </div>
</div>
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
