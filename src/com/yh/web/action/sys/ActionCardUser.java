package com.yh.web.action.sys;

import java.util.LinkedList;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import util.Constant;
import util.FieldUtil;
import util.MessageUtil;
import util.Page;
import util.SearchParamBean;
import util.StringUtil;

import com.opensymphony.xwork2.ModelDriven;
import com.yh.entity.Card;
import com.yh.entity.CardFlow;
import com.yh.entity.LoanFlow;
import com.yh.entity.main.SimpleUser;
import com.yh.web.service.impl.BizService;
import common.action.struts.BaseAction;

@ParentPackage("struts-default")
@Namespace("/sys")
@Component
//用户登录后我的信用卡模块action,网上支付模块银行卡信息查询、存款
public class ActionCardUser extends BaseAction implements ModelDriven<Card> {
	@Autowired
	private BizService service;

	private int uid;
	private Card bean = new Card();

	@Action(value = "add2save", results = { @Result(name = "add2", location = "/WEB-INF/jsp/sys/saveMoney.jsp") })
	public String add2save() {
		return "add2";
	}
	//跳转到银行卡存款jsp
	@Action(value = "add2saveBank", results = { @Result(name = "add2", location = "/WEB-INF/jsp/sys/saveMoneyBank.jsp") })
	public String add2saveBank() {
		return "add2";
	}
    //快速贷款跳转
	@Action(value = "add2Loan", results = { @Result(name = "add2", location = "/WEB-INF/jsp/sys/addLoan.jsp") })
	public String add2Loan() {
		return "add2";
	}
    //跳转到还款jsp
	@Action(value = "add2LoanReturn", results = { @Result(name = "add2", location = "/WEB-INF/jsp/sys/addLoanReturn.jsp") })
	public String add2LoanReturn() {
		return "add2";
	}

	@Action(value = "getUserCard", results = { @Result(name = "getOne", location = "/WEB-INF/jsp/sys/modifyUserCard.jsp") })
	public String getUserCard() {
		try {
			Card temp = (Card) service.get(Card.class, uid);
			putRequestValue("modifybean", temp);
			return "getOne";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
//用户--信用卡信息修改提交
	@Action(value = "activeCard")
	public String activeCard() {
		try {
			Card card = (Card) service.get(Card.class, bean.getId());
			if (card.getCardStatus().equals("黑名单")) {
				MessageUtil.addMessage(getRequest(), "信用卡已经被锁定,不能操作");
				return ERROR;
			}
			service.updateActiveCard(bean);
			MessageUtil.addMessage(getHttpServletRequest(), "操作成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(getRequest(), "操作失败");
			return ERROR;
		}
	}
//信用卡-- 存款方法
	@Action(value = "addSave")
	public String addSave() {
		try {
			SimpleUser user = (SimpleUser) getSessionUser();
			service.addSave(bean.getBalance(), user);
			MessageUtil.addMessage(getHttpServletRequest(), "操作成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(getRequest(), "操作失败");
			return ERROR;
		}
	}
	//银行卡存款action
	@Action(value = "addSaveBank")
	public String addSaveBank() {
		try {
			SimpleUser user = (SimpleUser) getSessionUser();
			service.addSaveBank(bean.getBalance(), user);
			MessageUtil.addMessage(getHttpServletRequest(), "操作成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(getRequest(), "操作失败");
			return ERROR;
		}
	}
  //贷款申请action
	@Action(value = "addUserLoan")
	public String addUserLoan() {
		try {
			SimpleUser user = (SimpleUser) getSessionUser();
			service.addUserLoan(bean.getBalance(),bean.getReason(),bean.getLoanyear(), user);
			MessageUtil.addMessage(getHttpServletRequest(), "操作成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(getRequest(), "操作失败");
			return ERROR;
		}
	}
   //还贷款action
	@Action(value = "addUserLoanReturn")
	public String addUserLoanReturn() {
		try {
			SimpleUser user = (SimpleUser) getSessionUser();
			double totalLoan = service.getUserTotalLoan(user);
			double totalBack = service.getUserTotalBack(user);
			if (bean.getBalance() > (totalLoan - totalBack)) {
				MessageUtil.addMessage(getRequest(), "金额有误,当前需还款金额: " + (totalLoan - totalBack));
				return ERROR;
			}
			service.addUserLoanReturn(bean.getBalance(), user);
			MessageUtil.addMessage(getHttpServletRequest(), "操作成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(getRequest(), "操作失败");
			return ERROR;
		}
	}
//我的信用卡信息查询
	@Action(value = "queryUserCard", results = { @Result(name = "queryList", location = "/WEB-INF/jsp/sys/listUserCard.jsp") })
	public String queryUserCard() {
		try {
			int pageNum = 0;
			String t = getHttpServletRequest().getParameter("pageNum");
			if (StringUtil.notEmpty(t)) {
				pageNum = Integer.valueOf(t);
			}
			Page p = (Page) getHttpSession().getAttribute(Constant.SESSION_PAGE);
			if (pageNum == 0 || p == null) {
				p = new Page();
				p.setCurrentPageNumber(1);
				p.setTotalNumber(0l);
				p.setItemsPerPage(Constant.SESSION_PAGE_NUMBER);

				// 字段名称集合
				LinkedList<String> parmnames = new LinkedList<String>();
				// 字段值集合
				LinkedList<Object> parmvalues = new LinkedList<Object>();
				// 页面参数集合
				Set parm = getHttpServletRequest().getParameterMap().entrySet();
				for (Object o : parm) {
					Entry<String, Object> e = (Entry<String, Object>) o;
					String name = e.getKey();// 页面字段名称
					if (name.startsWith("s_")) {
						String fieldValue = getHttpServletRequest().getParameter(name);// 页面字段值
						if (StringUtil.notEmpty(fieldValue)) {
							name = name.substring(2, name.length());// 实体字段名称
							parmnames.add(name);
							parmvalues.add(FieldUtil.format(Card.class, name, fieldValue));
						}
					}
				}
				SimpleUser user = (SimpleUser) getSessionUser();
				parmnames.add("user.id");
				parmvalues.add(user.getId());
				parmnames.add("type");
				parmvalues.add("信用卡");

				SearchParamBean sbean = new SearchParamBean();
				sbean.setParmnames(parmnames);
				sbean.setParmvalues(parmvalues);

				p.setConditonObject(sbean);
			} else {
				p.setCurrentPageNumber(pageNum);
			}
			Page page = null;
			page = service.find(p, Card.class);

			getHttpSession().setAttribute(Constant.SESSION_PAGE, page);
			return "queryList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	//我的银行卡信息查询
	@Action(value = "queryUserCardBank", results = { @Result(name = "queryList", location = "/WEB-INF/jsp/sys/listUserCardBank.jsp") })
	public String queryUserCardBank() {
		try {
			int pageNum = 0;
			String t = getHttpServletRequest().getParameter("pageNum");
			if (StringUtil.notEmpty(t)) {
				pageNum = Integer.valueOf(t);
			}
			Page p = (Page) getHttpSession().getAttribute(Constant.SESSION_PAGE);
			if (pageNum == 0 || p == null) {
				p = new Page();
				p.setCurrentPageNumber(1);
				p.setTotalNumber(0l);
				p.setItemsPerPage(Constant.SESSION_PAGE_NUMBER);
				
				// 字段名称集合
				LinkedList<String> parmnames = new LinkedList<String>();
				// 字段值集合
				LinkedList<Object> parmvalues = new LinkedList<Object>();
				// 页面参数集合
				Set parm = getHttpServletRequest().getParameterMap().entrySet();
				for (Object o : parm) {
					Entry<String, Object> e = (Entry<String, Object>) o;
					String name = e.getKey();// 页面字段名称
					if (name.startsWith("s_")) {
						String fieldValue = getHttpServletRequest().getParameter(name);// 页面字段值
						if (StringUtil.notEmpty(fieldValue)) {
							name = name.substring(2, name.length());// 实体字段名称
							parmnames.add(name);
							parmvalues.add(FieldUtil.format(Card.class, name, fieldValue));
						}
					}
				}
				SimpleUser user = (SimpleUser) getSessionUser();
				parmnames.add("user.id");
				parmvalues.add(user.getId());
				parmnames.add("type");
				parmvalues.add("银行卡");
				
				SearchParamBean sbean = new SearchParamBean();
				sbean.setParmnames(parmnames);
				sbean.setParmvalues(parmvalues);
				
				p.setConditonObject(sbean);
			} else {
				p.setCurrentPageNumber(pageNum);
			}
			Page page = null;
			page = service.find(p, Card.class);
			
			getHttpSession().setAttribute(Constant.SESSION_PAGE, page);
			return "queryList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
//信用卡--资金流动记录查询方法
	@Action(value = "queryMyCardFlow", results = { @Result(name = "queryList", location = "/WEB-INF/jsp/sys/listUserCardFlow.jsp") })
	public String queryMyCardFlow() {
		try {
			int pageNum = 0;
			String t = getHttpServletRequest().getParameter("pageNum");
			if (StringUtil.notEmpty(t)) {
				pageNum = Integer.valueOf(t);
			}
			Page p = (Page) getHttpSession().getAttribute(Constant.SESSION_PAGE);
			if (pageNum == 0 || p == null) {
				p = new Page();
				p.setCurrentPageNumber(1);
				p.setTotalNumber(0l);
				p.setItemsPerPage(Constant.SESSION_PAGE_NUMBER);

				// 字段名称集合
				LinkedList<String> parmnames = new LinkedList<String>();
				// 字段值集合
				LinkedList<Object> parmvalues = new LinkedList<Object>();
				// 页面参数集合
				Set parm = getHttpServletRequest().getParameterMap().entrySet();
				for (Object o : parm) {
					Entry<String, Object> e = (Entry<String, Object>) o;
					String name = e.getKey();// 页面字段名称
					if (name.startsWith("s_")) {
						String fieldValue = getHttpServletRequest().getParameter(name);// 页面字段值
						if (StringUtil.notEmpty(fieldValue)) {
							name = name.substring(2, name.length());// 实体字段名称
							parmnames.add(name);
							parmvalues.add(FieldUtil.format(CardFlow.class, name, fieldValue));
						}
					}
				}
				SimpleUser user = (SimpleUser) getSessionUser();
				parmnames.add("card.user.id");
				parmvalues.add(user.getId());

				SearchParamBean sbean = new SearchParamBean();
				sbean.setParmnames(parmnames);
				sbean.setParmvalues(parmvalues);

				p.setConditonObject(sbean);
			} else {
				p.setCurrentPageNumber(pageNum);
			}
			Page page = null;
			page = service.find(p, CardFlow.class);

			getHttpSession().setAttribute(Constant.SESSION_PAGE, page);
			return "queryList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
   //贷款/还款记录查询
	@Action(value = "queryMyLoan", results = { @Result(name = "queryList", location = "/WEB-INF/jsp/sys/listUserLoanFlow.jsp") })
	public String queryMyLoan() {
		SimpleUser user = (SimpleUser) getSessionUser();
		try {
			int pageNum = 0;
			String t = getHttpServletRequest().getParameter("pageNum");
			if (StringUtil.notEmpty(t)) {
				pageNum = Integer.valueOf(t);
			}
			Page p = (Page) getHttpSession().getAttribute(Constant.SESSION_PAGE);
			if (pageNum == 0 || p == null) {
				p = new Page();
				p.setCurrentPageNumber(1);
				p.setTotalNumber(0l);
				p.setItemsPerPage(Constant.SESSION_PAGE_NUMBER);

				// 字段名称集合
				LinkedList<String> parmnames = new LinkedList<String>();
				// 字段值集合
				LinkedList<Object> parmvalues = new LinkedList<Object>();
				// 页面参数集合
				Set parm = getHttpServletRequest().getParameterMap().entrySet();
				for (Object o : parm) {
					Entry<String, Object> e = (Entry<String, Object>) o;
					String name = e.getKey();// 页面字段名称
					if (name.startsWith("s_")) {
						String fieldValue = getHttpServletRequest().getParameter(name);// 页面字段值
						if (StringUtil.notEmpty(fieldValue)) {
							name = name.substring(2, name.length());// 实体字段名称
							parmnames.add(name);
							parmvalues.add(FieldUtil.format(LoanFlow.class, name, fieldValue));
						}
					}
				}

				parmnames.add("card.user.id");
				parmvalues.add(user.getId());

				SearchParamBean sbean = new SearchParamBean();
				sbean.setParmnames(parmnames);
				sbean.setParmvalues(parmvalues);

				p.setConditonObject(sbean);
			} else {
				p.setCurrentPageNumber(pageNum);
			}
			Page page = null;
			page = service.find(p, LoanFlow.class);
           /*totalLoan表示贷款总额，totalBack表示还款总额，totalElse表示待还款
            * getUserTotalLoan()方法根据userid在数据库查询贷款成功的sum(money)
            * getUserTotalBack()方法根据userid在数据库查询出还款成功的sum(money)
            * putRequestValue()方法将这些变量发给JSP页面
            * */
			double totalLoan = service.getUserTotalLoan(user);
			double totalBack = service.getUserTotalBack(user);
			double interest  = totalLoan*0.05;
			double totalElse = totalLoan + interest - totalBack;
			

			putRequestValue("totalLoan", totalLoan);
			putRequestValue("totalBack", totalBack);
			putRequestValue("interest", interest);
			putRequestValue("totalElse", totalElse);

			getHttpSession().setAttribute(Constant.SESSION_PAGE, page);
			return "queryList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public Card getModel() {
		return bean;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	private String ids;

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

}
