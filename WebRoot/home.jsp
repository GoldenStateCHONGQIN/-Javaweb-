<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>平安网上银行系统主页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Walkabout Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<script src="js/jquery.min.js"></script>
<!--start-smoth-scrolling-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
		</script>
<!--start-smoth-scrolling-->
<!--pop-up-box-->
<script type="text/javascript" src="js/modernizr.custom.53451.js"></script>  
<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
	<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
	 <script>
			$(document).ready(function() {
			$('.popup-with-zoom-anim').magnificPopup({
				type: 'inline',
				fixedContentPos: false,
				fixedBgPos: true,
				overflowY: 'auto',
				closeBtnInside: true,
				preloader: false,
				midClick: true,
				removalDelay: 300,
				mainClass: 'my-mfp-zoom-in'
			});																
			});
	</script>	
	<!--pop-up-box-->
<!--script-->
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
		    <script type="text/javascript">
			    $(document).ready(function () {
			        $('#horizontalTab').easyResponsiveTabs({
			            type: 'default', //Types: default, vertical, accordion           
			            width: 'auto', //auto or any width like 600px
			            fit: true   // 100% fit in a container
			        });
			    });
				
</script>	
<!--script-->
				
</script>	
</head>
<body>
	<!--header-starts-->
	<div class="header" id="home">
		<div class="container">
			<div class="logo">
				<a href="home.jsp"><h1>平安网银</h1></a>
			</div>
			<div class="navigation">
			 <span class="menu"></span> 
				<ul class="navig">
					<li><a href="home.jsp">主页</a><span> </span></li>
					<li><a href="#about" class="scroll">关于我们</a><span> </span></li>
					<li><a href="#services" class="scroll">业务</a><span> </span></li>
					<li><a href="#gallery" class="scroll">企业文化</a><span> </span></li>
					<li><a href="#promotions" class="scroll">宣传推广</a><span> </span></li>
					<li><a href="#contact" class="scroll">联系我们</a><span> </span></li>
					<li><a href="index.jsp">登录</a><span> </span></li>
					<li><a href="reg.jsp">注册</a><span> </span></li>
				</ul>
			</div>
				 <!-- script-for-menu -->
		 <script>
				$("span.menu").click(function(){
					$(" ul.navig").slideToggle("slow" , function(){
					});
				});
		 </script>
		 <!-- script-for-menu -->
		</div>
	</div>
	<!--header-end-->
	<!--banner-starts-->
	<div class="banner">
		<div class="container">
			<div class="banner-top">
				<h2>PingAn e-Bank</h2>
				<p>Your side of the trusted online banking platform, is committed to the development of online banking system of a variety of business, choose us, you are the choice of trust, choose us, you are to choose a convenient choice</p>				
				<div class="video">
					<img src="images/b1.jpg" alt="" />
					<a class="play-icon popup-with-zoom-anim" href="#small-dialog5"><span> </span></a><br />										
				</div>
			</div>
		</div>
	</div>
	<!--banner-end-->
	<!--video-->
	<div id="small-dialog5" class="mfp-hide">
		<iframe src="https://player.vimeo.com/video/127205608" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
	</div>			  
	<!--fea-video-->
	<!--bnr-starts-->
	<div class="bnr">
		<div class="col-md-3 bnr-left">
			<h3>欢迎加入我们！</h3>
		</div>
		<div class="col-md-3 bnr-left">
			<h4>储蓄卡业务</h4>
			<p>平安网上银行系统储蓄卡业务有存款，取款，同行转账，跨行转账，生活缴费等业务功能。</p>
		</div>
		<div class="col-md-3 bnr-left">
			<h4>信用卡业务</h4>
			<p>平安网上银行系统信用卡业务有存款，贷款，取款，同行转账，跨行转账，生活缴费等业务功能。.</p>
		</div>
		<div class="col-md-3 bnr-left">
			<h4>银行网点</h4>
			<p>平安网上银行系统联通中国银行，中国建设银行等十余家银行的涉及全国300多家银行网点。</p>
		</div>
		<div class="clearfix"></div>
	</div>
	<!--bnr-end-->
	<!--welcome-starts-->
	<div class="welcome" id="about">
		<div class="container">
			<div class="welcome-top heading">
				<h3>关于我们</h3>
				<p>足不出户享受7x24小时安全、优惠丰富、便捷的金融服务，从平安网上银行开始</p>
			</div>	
			<div class="welcome-bottom">
				<div class="col-md-6 welcome-left">
					<div class="col-md-6 w-left">
						<img src="images/w11.png" alt=""/>							
					</div>
					<div class="col-md-6 w-left">
						<img src="images/w22.jpg" alt="" />
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-6 welcome-right">
					<h4>平安网上银行系统简介及成长历程.</h4>
					<p>平安网上银行是中国国际化和多元化程度最高的银行，在中国内地及46个国家和地区为客户提供全面的金融服务。主要经营商业银行业务，包括公司金融业务、个人金融业务和金融市场业务，
					并通过全资子公司中银国际控股有限公司开展投资银行业务，通过全资子公司中银集团保险有限公司及中银保险有限公司经营保险业务，通过全资子公司中银集团投资有限公司经营直接投资和投资管理业务，
					通过全资子公司中银航空租赁私人有限公司经营飞机租赁业务。</p>
					<p>在一百多年的发展历程中，中国银行始终秉承追求卓越的精神，将爱国爱民作为办行之魂，将诚信至上作为立行之本，将改革创新作为强行之路，将以人为本作为兴行之基，
					树立了卓越的品牌形象，得到了业界和客户的广泛认可和赞誉。面对新的历史机遇，中国银行将积极承担社会责任，努力做最好的银行，为实现中华民族伟大复兴的中国梦做出新的更大贡献。
                           </p>
				</div>             
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--welcome-end-->
	<!--why-starts-->
	<div class="why">
		<div class="container">
			<div class="why-top heading">
				<h3>为什么选择我们？</h3>
			</div>
			<div class="why-bottom">
				<div class="col-md-4 why-left">
					<div class="why-one">
						<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
						<h4>方便</h4>
						<p>足不出户享受7x24小时安全、优惠丰富、便捷的金融服务，从平安网上银行开始。</p>
					</div>
				</div>
				<div class="col-md-4 why-left">
					<div class="why-one">
						<span class="glyphicon glyphicon-tree-deciduous" aria-hidden="true"></span>
						<h4>安全</h4>
						<p>足不出户享受7x24小时安全、优惠丰富、便捷的金融服务，从平安网上银行开始。</p>
					</div>
				</div>
				<div class="col-md-4 why-left">
					<div class="why-one">
						<span class="glyphicon glyphicon-piggy-bank" aria-hidden="true"></span>
						<h4>快捷</h4>
						<p>足不出户享受7x24小时安全、优惠丰富、便捷的金融服务，从平安网上银行开始。</p>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--why-end-->
    <div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>
	<!--services-starts-->
	<div class="services" id="services">
		<div class="container">
			<div class="services-top heading">
				<h3>我们的服务</h3>
			</div>
			<div class="services-bottom">
				<div class="col-md-3 services-left">
					<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
					<h4>银行卡业务</h4>
					<p>平安网上银行系统银行卡业务有存款，取款，同行转账，跨行转账，生活缴费等业务功能。</p>
				</div>
				<div class="col-md-6 services-middle">
					<img src="images/s23.jpg" alt="" />
				</div>
				<div class="col-md-3 services-left">
					<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
					<h4>信用卡业务</h4>
					<p>平安网上银行系统信用卡业务有存款，，贷款，取款，同行转账，跨行转账，生活缴费等业务功能。</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--services-end-->
	<!--gallery-starts-->
	<div class="gallery" id="gallery">
		<div class="gallery-top heading">
			<h3>丰富多彩的企业文化</h3>
			<p>平安网上银行公司有5000多员工，我们致力于给予公司员工最好的福利待遇，生活不只是只有工作，还需要有更丰富多彩的生活，所以我们有更多彩的企业文化。</p>
		</div>	
		<div class="gallery-bottom">	
		<div class="sap_tabs">
			<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
				<ul class="resp-tabs-list">
					<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>员工培训</span></li>
					<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>员工活动</span></li>
					<div class="clearfix"></div>
				</ul>				  	 
				<div class="resp-tabs-container">
					<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
						<div class="tab_img grid">
							<div class="col-md-3 img-top ">
					   		  	<a href="images/g11.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
									<figure class="effect-apollo">				
										<img src="images/g11.jpg" alt="" />		
										<figcaption>	
										</figcaption>									
									</figure>
								</a>	
							</div>
							<div class="col-md-3 img-top ">
								<a href="images/g22.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
									<figure class="effect-apollo">				
										<img src="images/g22.jpg" alt="" />		
										<figcaption>	
										</figcaption>									
									</figure>
								</a>
							</div>
							<div class="col-md-3 img-top ">
					   		  	<a href="images/g33.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
									<figure class="effect-apollo">				
										<img src="images/g33.jpg" alt="" />		
										<figcaption>	
										</figcaption>									
									</figure>
								</a>
							</div>
							<div class="col-md-3 img-top ">
					   		  	<a href="images/g44.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
									<figure class="effect-apollo">				
										<img src="images/g44.jpg" alt="" />		
										<figcaption>	
										</figcaption>									
									</figure>
								</a>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="tab_img grid">
							<div class="col-md-3 img-top ">
					   		  	<a href="images/g55.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
									<figure class="effect-apollo">				
										<img src="images/g55.jpg" alt="" />		
										<figcaption>	
										</figcaption>									
									</figure>
								</a>
							</div>
							<div class="col-md-3 img-top ">
								<a href="images/g66.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
									<figure class="effect-apollo">				
										<img src="images/g66.jpg" alt="" />		
										<figcaption>	
										</figcaption>									
									</figure>
								</a>
							</div>
							<div class="col-md-3 img-top ">
					   		  	<a href="images/g77.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
									<figure class="effect-apollo">				
										<img src="images/g77.jpg" alt="" />		
										<figcaption>	
										</figcaption>									
									</figure>
								</a>
							</div>
							<div class="col-md-3 img-top ">
					   		  	<a href="images/g88.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
									<figure class="effect-apollo">				
										<img src="images/g88.jpg" alt="" />		
										<figcaption>	
										</figcaption>									
									</figure>
								</a>
							</div>
							<div class="clearfix"></div>
						</div>							
					</div>
					<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
					<div class="tab_img grid">
							<div class="col-md-3 img-top ">
					   		  	<a href="images/a1.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
									<figure class="effect-apollo">				
										<img src="images/a1.jpg" alt="" />		
										<figcaption>	
										</figcaption>									
									</figure>
								</a>
							</div>
							<div class="col-md-3 img-top ">
								<a href="images/a2.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
									<figure class="effect-apollo">				
										<img src="images/a2.jpg" alt="" />		
										<figcaption>	
										</figcaption>									
									</figure>
								</a>
							</div>
							<div class="col-md-3 img-top ">
					   		  	<a href="images/a3.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
									<figure class="effect-apollo">				
										<img src="images/a3.jpg" alt="" />		
										<figcaption>	
										</figcaption>									
									</figure>
								</a>
							</div>
							<div class="col-md-3 img-top ">
					   		  	<a href="images/a4.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
									<figure class="effect-apollo">				
										<img src="images/a4.jpg" alt="" />		
										<figcaption>	
										</figcaption>									
									</figure>
								</a>
							</div>
							<div class="clearfix"></div>
						</div>						
						<div class="tab_img grid">
							<div class="col-md-3 img-top">
								<a href="images/a5.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
									<figure class="effect-apollo">				
										<img src="images/a5.jpg" alt="" />		
										<figcaption>	
										</figcaption>									
									</figure>
								</a>
							</div>
							<div class="col-md-3 img-top ">
					   		  	<a href="images/a6.jpg" rel="title" class="b-link-stripe b-animate-go  thickbox">
									<figure class="effect-apollo">				
										<img src="images/a6.jpg" alt="" />		
										<figcaption>	
										</figcaption>									
									</figure>
								</a>
								
							</div>	
						<div class="clearfix"></div>							
					</div>							
                </div>
			</div>
		</div>
        </div>
	</div>
	</div>
	<!--gallery-end-->
	<script src="js/jquery.chocolat.js"></script>
		<link rel="stylesheet" href="css/chocolat.css" type="text/css" media="screen" charset="utf-8">
		<!--light-box-files -->
		<script type="text/javascript" charset="utf-8">
		$(function() {
			$('.img-top a').Chocolat();
		});
		</script>
	<!--top-starts-->
	<div class="top" id="promotions">
		<div class="container">
			<div class="top-top heading">
				<h3>宣传推广活动</h3>
			</div>
			<div class="top-bottom">
				<div class="col-md-3 top-left wow bounceIn animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
					<a href="#">
						<img class="img-responsive" src="images/t1.jpg" alt="">
						<div class="captn">
							<h4>北京宣传活动</h4>
							<p>公司员工给耐心讲解公司的新业务及注意事项</p>
						</div>
					</a>
					<div class="top-text">
						<div class="t-left">
							<span class="glyphicon glyphicon-send" aria-hidden="true"></span>
							<p>北京</p>
						</div>
						<div class="t-left t-right">
							<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
							<p>海淀区</p>
						</div>
					</div>
				</div>					
				<div class="col-md-3 top-left wow bounceIn animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
					<a href="#">
						<img class="img-responsive" src="images/t2.jpg" alt="">
						<div class="captn">
							<h4>上海宣传活动</h4>
							<p>公司员工加大宣传推广力度，在街头摆摊不辞辛苦耐心为群众办理各项业务。</p>
						</div>
					</a>
					<div class="top-text">
						<div class="t-left">
							<span class="glyphicon glyphicon-send" aria-hidden="true"></span>
							<p>上海</p>
						</div>
						<div class="t-left t-right">
							<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
							<p>浦东</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 top-left wow bounceIn animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
					<a href="#">
						<img class="img-responsive" src="images/t3.jpg" alt="">
						<div class="captn">
							<h4>南京推广活动</h4>
							<p>公司员工给耐心讲解公司的新业务及注意事项</p>
						</div>
					</a>
					<div class="top-text">
						<div class="t-left">
							<span class="glyphicon glyphicon-send" aria-hidden="true"></span>
							<p>南京</p>
						</div>
						<div class="t-left t-right">
							<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
							<p>雨花台</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 top-left wow bounceIn animated" data-wow-delay=".5s" style="visibility: visible; -webkit-animation-delay: .5s;">
					<a href="#">
						<img class="img-responsive" src="images/t4.jpg" alt="">
						<div class="captn">
							<h4>徐州推广活动</h4>
							<p>公司员工加大宣传推广力度，在街头摆摊不辞辛苦耐心为群众办理各项业务。</p>
						</div>
					</a>
					<div class="top-text">
						<div class="t-left">
							<span class="glyphicon glyphicon-send" aria-hidden="true"></span>
							<p>徐州</p>
						</div>
						<div class="t-left t-right">
							<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
							<p>云龙区</p>
						</div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
        </div>
	</div>
	<!--top-end-->
	<!--address-starts-->
	<div class="address" id="contact">
		<div class="container">
			<div class="address-top">
				<div class="col-md-4 adrs-left">
					<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
					<p><label>平安网上银行系统.</label>
						丽水路2号, 新城区
						徐州市, 江苏省，中国</p>
				</div>
				<div class="col-md-4 adrs-left">
					<span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>
					<p>+0516 8265 8888 , +0516 8266 6666</p>
				</div>
				<div class="col-md-4 adrs-left">
					<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
					<p><a href="mailto:example@email.com">pinganWY@example.com</a></p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--address-end-->
	<!--footer-bottom-starts-->
	<div class="f-bottom">
		<div class="container">
			<div class="footer-text">
				<p>Copyright &copy; 2017.PingAn e-Bank All rights reserved.</p>
			</div>
		</div>
		<script type="text/javascript">
									$(document).ready(function() {
										/*
										var defaults = {
								  			containerID: 'toTop', // fading element id
											containerHoverID: 'toTopHover', // fading element hover id
											scrollSpeed: 1200,
											easingType: 'linear' 
								 		};
										*/
										
										$().UItoTop({ easingType: 'easeOutQuart' });
										
									});
								</script>
		<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	</div>
	<!--footer-bottom-end-->
</body>
</html>