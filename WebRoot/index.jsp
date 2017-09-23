<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<% String title = "网上银行系统e"; %>
<title><%=title %></title> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script type="text/javascript" src="login/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="login/images/login.js"></script>
<link href="login/css/login2.css" rel="stylesheet" type="text/css" />
<script src="login/bootstrap.min.js" type="text/javascript"></script> 
</head>
<body>
<h1><%=title %><sup>2017</sup></h1>

<div class="login" style="margin-top:50px;">
    
    <div class="header">
        <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">登录</a>
        </div>
    </div>    
  
    
 <div class="web_qr_login" id="web_qr_login" style="display: block;">    

         <!--登录-->
         <div class="web_login" id="web_login">
            <div class="login-box">
	<div class="login_form">
	<form action="${pageContext.request.contextPath}/com/login.action" name="loginform" id="loginform" accept-charset="utf-8" id="login_form" class="loginForm" method="post">
             <div class="uinArea" id="uinArea">
              <label class="input-tips" for="u">帐号：</label>
              <div class="inputOuter" id="uArea">
                  <input type="text" name="loginid" id="username" value="admin" class="inputstyle" rel="tooltip" data-original-title="请输入您的登陆账号" data-placement="button"/>
              </div>
             </div>
             <div class="pwdArea" id="pwdArea">
		<label class="input-tips" for="p">密码：</label> 
		<div class="inputOuter" id="pArea">
			<input type="password" name="password" id="password" value="123456" rel="tooltip" data-original-title="请输入您的登录密码" class="inputstyle" data-placement="button"/>
		</div>
             </div>
             <div class="uinArea" id="uinArea">
              <label class="input-tips" for="u">角色：</label>
              <div class="inputOuter" id="uArea">
                  <select name="logintype" class="selectstyle">
                  	<option value="SysUser">管理人员</option>
                  	<option value="SimpleUser">客户</option>
                  </select>
              </div>
             </div>
             <div class="uinArea" id="uinArea">
              <label class="input-tips" for="u">验证码:</label>
              <div class="inputOuter" id="uArea">
                 <a href="javascript:void(0);"><img style="border: 0px; float: right" width="110px" height="40px" src="${pageContext.request.contextPath }/checkcode" alt="验证码" align="left" onclick="this.src = '${pageContext.request.contextPath }/checkcode?' + Math.random();" /></a>
                 <input type="text" id="captcha-code" name="checkcode" class="codestyle" rel="tooltip" data-original-title="请输入验证码" data-placement="button"/>
              </div>
             </div>
             <c:if test="${not empty signErrorMessage }">
				<div class="alert alert-error"><strong>提示：</strong><br /><i class="icon-exclamation-sign"></i> ${signErrorMessage }</div>
			</c:if>
			<%session.removeAttribute("signErrorMessage"); %>
             <div style="padding-left:50px;margin-top:20px;"><input type="submit" value="登 录" style="width:150px;" class="button_blue"/></div>
           </form>
    </div>
    </div>
    </div>
         <!--登录end-->
</div>

  <!--注册-->
    <div class="qlogin" id="qlogin" style="display: none; ">
   
    <div class="web_login">
           
    
    </div>
   
    
    </div>
    <!--注册end-->
</div>
<script type="text/javascript">
	$("[rel=tooltip]").tooltip();
	$("#captcha-code").keyup(function() {
		if (this.value.match(/[^a-zA-Z0-9 ]/g)) this.value = this.value.replace(/[^a-zA-Z0-9 ]/g, '');
	});
	$("#loginform").submit(function() {
		if($("#username").val().length<2 || $("#username").val().length>18) {
			$("#usernamecontrol").addClass("error");
			$("#username").focus();
			return false;
		} else $("#usernamecontrol").removeClass("error");
		if($("#password").val().length<4 || $("#password").val().length>30) {
			$("#passwordcontrol").addClass("error");
			$("#password").focus();
			return false;
		} else $("#passwordcontrol").removeClass("error");
		if($("#captcha-code").val().length!=4) {
			$("#captcha-codecontrol").addClass("error");
			$("#captcha-code").tooltip("show");
			$("#captcha-code").focus();
			return false;
		} else $("#captcha-codecontrol").removeClass("error");
		return true;
	});
	function toreg(){
		window.location="./reg.jsp";
	}
</script>
</body></html>