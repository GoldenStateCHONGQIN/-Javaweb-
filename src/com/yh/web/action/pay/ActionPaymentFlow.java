package com.yh.web.action.pay;

import java.util.LinkedList;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import util.Constant;
import util.DateUtil;
import util.FieldUtil;
import util.MessageUtil;
import util.Page;
import util.SearchParamBean;
import util.StringUtil;

import com.opensymphony.xwork2.ModelDriven;
import com.yh.entity.Card;
import com.yh.entity.Payment;
import com.yh.entity.PaymentFlow;
import com.yh.entity.main.SimpleUser;
import com.yh.web.service.impl.BizService;

import common.action.struts.BaseAction;
 
@ParentPackage("struts-default")
@Namespace("/sys")
@Component
//生活缴费
public class ActionPaymentFlow extends BaseAction implements ModelDriven<PaymentFlow> {
	@Autowired
	private BizService service;

	private int uid;
	private PaymentFlow bean = new PaymentFlow();

	@Action(value = "add2PaymentFlow", results = { @Result(name = "add2", location = "/WEB-INF/jsp/pay/addPaymentFlow.jsp") })
	public String add2() {
		List list = service.findAll(Payment.class);
		putRequestValue("list", list); 
		return "add2";
	}

	@Action(value = "getPaymentFlow", results = { @Result(name = "getOne", location = "/WEB-INF/jsp/pay/modifyPaymentFlow.jsp") })
	public String get() {
		try {
			PaymentFlow temp = (PaymentFlow) service.get(PaymentFlow.class, uid);
			putRequestValue("modifybean", temp);
			
			List list = service.findAll(Payment.class);
			putRequestValue("list", list); 
			
			return "getOne";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	@Action(value = "deletePaymentFlow")
	public String delete() {
		try {
			service.delete(PaymentFlow.class, ids);
			MessageUtil.addRelMessage(getHttpServletRequest(), "删除信息成功.", "mainquery");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "删除失败");
			return ERROR;
		}
	}

	@Action(value = "updatePaymentFlow")
	public String update() {
		try {
			service.update(bean);
			MessageUtil.addMessage(getHttpServletRequest(), "更新成功.");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "更新失败");
			return ERROR;
		}
	}

	@Action(value = "addPaymentFlow")
	public String add() {
		try {
			SimpleUser user = (SimpleUser) getSessionUser();
			Card card = service.getUserBankCard(user.getId());
			if(card.getBalance()<bean.getMoney()){
				MessageUtil.addMessage(getRequest(), "余额不足,不能缴费");
				return ERROR;
			}
			bean.setCard(card);
			bean.setAddDate(DateUtil.getCurrentTime());
			service.addPaymentFlow(bean);
			MessageUtil.addMessage(getHttpServletRequest(), "缴费成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(getRequest(), "缴费失败");
			return ERROR;
		}
	}

	@Action(value = "queryPaymentFlow", results = { @Result(name = "queryList", location = "/WEB-INF/jsp/pay/listPaymentFlow.jsp") })
	public String query() {
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
							parmvalues.add(FieldUtil.format(PaymentFlow.class, name, fieldValue));
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
			page = service.find(p, PaymentFlow.class);

			getHttpSession().setAttribute(Constant.SESSION_PAGE, page);
			return "queryList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public PaymentFlow getModel() {
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
