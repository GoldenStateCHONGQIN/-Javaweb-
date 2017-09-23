package com.yh.web.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import util.Constant;
import util.DateUtil;
import util.MD5;
import util.MessageUtil;
import util.StringUtil;

import com.yh.entity.Apply;
import com.yh.entity.Card;
import com.yh.entity.SessionBean;
import com.yh.entity.main.SimpleUser;
import com.yh.entity.main.SysUser;
import com.yh.entity.main.User;
import com.yh.web.service.impl.BizService;
import common.action.struts.BaseAction;

@ParentPackage("struts-default")
@Namespace("/com")
@Component
public class SignAction extends BaseAction {
	@Autowired
	private BizService service;
	private SimpleUser regbean;
	private Apply apply;

	public SimpleUser getRegbean() {
		return regbean;
	}

	public void setRegbean(SimpleUser regbean) {
		this.regbean = regbean;
	}

	@Action(value = "/addLost", results = { @Result(name = "register", type = "redirect", location = "/web/lost.jsp"), })
	public String addLost() throws Exception {
		String msg = "";
		try {
			Card card = service.findCard(loginid, password, phone,logintype);
			if (card == null) {
				msg = "没有查询到银行卡信息";
			}else{
				card.setCardStatus("申请挂失");
				service.update(card);
				msg = "您的银行卡已经成功挂失";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "申请失败";
		}
		getHttpSession().setAttribute("addLostErrorMessage", msg);
		return "register";
	}

	@Action(value = "/regApply", results = { @Result(name = "register", type = "redirect", location = "/web/reg.jsp"), })
	public String regApply() throws Exception {
		String msg = "";
		try {
			apply.setAddDate(DateUtil.getCurrentTime());
			apply.setCheckStatus("待审核");
			service.add(apply);
			msg = "申请成功";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "申请失败";
		}
		getHttpSession().setAttribute("regErrorMessage", msg);
		return "register";
	}

	@SuppressWarnings("rawtypes")
	@Action(value = "/queryApplyStatus", results = { @Result(name = "register", type = "redirect", location = "/web/reg.jsp"), })
	public String queryApplyStatus() throws Exception {
		String msg = "";
		try {
			List list = service.queryByHQL("from Apply where dicard=?", loginid);
			if (list == null || list.size() <= 0) {
				msg = "没有查询到申请信息";
			} else {
				Apply temp = (Apply) list.get(0);
				msg = "当前审核状态: " + temp.getCheckStatus();
				getHttpSession().setAttribute("queryApplyStatus", temp.getCheckStatus());
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "查询失败";
		}
		getHttpSession().setAttribute("queryErrorMessage", msg);
		getHttpSession().setAttribute("queryIdcard", loginid);
		return "register";
	}

	@Action(value = "/reg", results = { @Result(name = "register", type = "redirect", location = "/home.jsp"), })
	public String reg() throws Exception {
		String msg = "";
		try {
			service.addSimpleUser(regbean);
			msg = "注册成功";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "注册失败";
		}
		getHttpSession().setAttribute("regErrorMessage", msg);
		return "register";
	}
   //登录校验action
	@Action(value = "/login", results = { @Result(name = "index", type = "redirect", location = "/index.jsp"),
			@Result(name = "main", location = "/WEB-INF/jsp/main.jsp") })
	public String login() throws Exception {
		//输出日志
		log.info(loginid + " " + password + " " + logintype);
		String errorMessage = null;
		try {
			//goole的验证码
			String code = (String) getHttpSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
			if (code == null) {
				getHttpServletRequest().getSession(false).invalidate();
				return "index";
			} else {
			}
			//tolowerCase()将所有英文字符转换为小写
			//检查checkcode是否为null，不为null返回checkcode，否则返回null
			checkcode = StringUtil.stringVerification(checkcode);
			if (code.toLowerCase().equals(checkcode.toLowerCase())) {
				loginid = StringUtil.stringVerification(loginid).toLowerCase();
				MD5 md = new MD5();
				password = md.getMD5ofStr(password);
				//根据查询条件返回唯一一条记录给user
				Object user = service.findUser(logintype, loginid, password);
				if (user != null) {

					SessionBean sb = new SessionBean();
					sb.setUser(user);

					getHttpSession().setAttribute(Constant.SESSION_BEAN, sb);

					log.info("登录成功:" + loginid);

				} else {
					errorMessage = "登录帐号或者密码错误";
				}
			} else {
				errorMessage = "验证码错误";
			}
			if (errorMessage == null) {
				return "main";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (errorMessage == null) {
			errorMessage = "登录失败,请稍候重试";
		}
		getHttpSession().setAttribute("signErrorMessage", errorMessage);
		return "index";
	}

	@Action(value = "toSelf", results = { @Result(name = "modifySelf", location = "/WEB-INF/jsp/modifySelf.jsp") })
	public String toSelf() {
		return "modifySelf";
	}

	private User bean;

	@Action(value = "modifySelf")
	public String modifySelf() {
		try {
			User sessionUser = null;
			SessionBean sb = (SessionBean) getSessionValue(Constant.SESSION_BEAN);
			Object sbuser = sb.getUser();
			if (SysUser.class.getSimpleName().equals(sb.getRole())) {
				sessionUser = ((SysUser) sbuser).getUser();
			} else if (SimpleUser.class.getSimpleName().equals(sb.getRole())) {
				sessionUser = ((SimpleUser) sbuser).getUser();
			}
			bean.setUserId(sessionUser.getUserId());
			bean.setUname(sessionUser.getUname());
			if (StringUtil.notEmpty(bean.getUserPassword())) {
				MD5 md = new MD5();
				String password = md.getMD5ofStr(bean.getUserPassword());
				bean.setUserPassword(password);
			} else {
				bean.setUserPassword(sessionUser.getUserPassword());
			}
			service.update(bean);

			sessionUser.setUserAddress(bean.getUserAddress());
			sessionUser.setUserBirth(bean.getUserBirth());
			sessionUser.setUserEmail(bean.getUserEmail());
			sessionUser.setUserGender(bean.getUserGender());
			sessionUser.setUserName(bean.getUserName());
			sessionUser.setUserPhone(bean.getUserPhone());

			MessageUtil.addMessage(getHttpServletRequest(), "修改成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(getHttpServletRequest(), "修改失败.");
			return ERROR;
		}
	}

	@Action(value = "logout", results = { @Result(name = "logout", type = "redirect", location = "/index.jsp") })
	public String logout() {
		getHttpSession().invalidate();
		return "logout";
	}

	public User getBean() {
		return bean;
	}

	public void setBean(User bean) {
		this.bean = bean;
	}

	private String loginid;
	private String password;
	private String logintype;
	private String checkcode;
	private String phone;
	

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getLoginid() {
		return loginid;
	}

	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLogintype() {
		return logintype;
	}

	public void setLogintype(String logintype) {
		this.logintype = logintype;
	}

	public String getCheckcode() {
		return checkcode;
	}

	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}

	public BizService getService() {
		return service;
	}

	public void setService(BizService service) {
		this.service = service;
	}

	public Apply getApply() {
		return apply;
	}

	public void setApply(Apply apply) {
		this.apply = apply;
	}

}
