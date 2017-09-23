package com.yh.web.action.pay;

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
import util.DateUtil;
import util.FieldUtil;
import util.MessageUtil;
import util.Page;
import util.SearchParamBean;
import util.StringUtil;

import com.opensymphony.xwork2.ModelDriven;
import com.yh.entity.Card;
import com.yh.entity.TransferLocal;
import com.yh.entity.main.SimpleUser;
import com.yh.web.service.impl.BizService;

import common.action.struts.BaseAction;

@ParentPackage("struts-default")
@Namespace("/sys")
@Component
//同行转账action
public class ActionTransferLocal extends BaseAction implements ModelDriven<TransferLocal> {
	@Autowired
	private BizService service;

	private int uid;
	private TransferLocal bean = new TransferLocal();

	@Action(value = "add2TransferLocal", results = { @Result(name = "add2", location = "/WEB-INF/jsp/pay/addTransferLocal.jsp") })
	public String add2() {
		return "add2";
	}

	@Action(value = "addTransferLocal")
	public String add() {
		try {
			SimpleUser user = (SimpleUser) getSessionUser();
			Card card = service.getUserBankCard(user.getId());
			if (card.getBalance() < bean.getMoney()) {
				MessageUtil.addMessage(getRequest(), "余额不足,不能转账");
				return ERROR;
			}

			Card c2 = service.findCardBySid(bean.getToCard().getSid());
			if (c2 == null) {
				MessageUtil.addMessage(getRequest(), "收款人卡号不存在");
				return ERROR;
			}

			bean.setToCard(c2);
			bean.setFromCard(card);
			bean.setAddDate(DateUtil.getCurrentTime());
			service.addTransferLocal(bean);
			MessageUtil.addMessage(getHttpServletRequest(), "转账成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(getRequest(), "转账失败");
			return ERROR;
		}
	}

	@Action(value = "queryTransferLocal", results = { @Result(name = "queryList", location = "/WEB-INF/jsp/pay/listTransferLocal.jsp") })
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
							parmvalues.add(FieldUtil.format(TransferLocal.class, name, fieldValue));
						}
					}
				}
				SimpleUser user = (SimpleUser) getSessionUser();
				parmnames.add("fromCard.user.id");
				parmvalues.add(user.getId());

				SearchParamBean sbean = new SearchParamBean();
				sbean.setParmnames(parmnames);
				sbean.setParmvalues(parmvalues);

				p.setConditonObject(sbean);
			} else {
				p.setCurrentPageNumber(pageNum);
			}
			Page page = null;
			page = service.find(p, TransferLocal.class);

			getHttpSession().setAttribute(Constant.SESSION_PAGE, page);
			return "queryList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public TransferLocal getModel() {
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
