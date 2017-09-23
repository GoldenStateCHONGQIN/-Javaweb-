package com.yh.web.action.safe;

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
import com.yh.entity.Apply;
import com.yh.entity.Card;
import com.yh.entity.LoanFlow;
import com.yh.entity.main.SimpleUser;
import com.yh.web.service.impl.BizService;

import common.action.struts.BaseAction;

@ParentPackage("struts-default")
@Namespace("/sys")
@Component
//管理员登录银行卡挂失、冻结管理
public class ActionCardAdminSafe extends BaseAction implements ModelDriven<Card> {
	@Autowired
	private BizService service;

	private int uid;
	private Card bean = new Card();
    /*Result注解用于定义一个Result映射，该注解包含四个参数,name:可选参数，用于指定Result的逻辑名，默认值为success
	Action：Action注解对应于struts.xml文件中的action元素。该注解可用于Action类上，也可用于方法上。这个注解包含一下的几个属性：
	1）value：可选参数，表示Action的名字
	2）results：可选参数，表示Action的多个Result映射。该属性用于定义一组Result映射
     * */
	@Action(value = "getAdminCardStatus", results = { @Result(name = "getOne", location = "/WEB-INF/jsp/safe/modifyAdminCard.jsp") })
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
 

	@Action(value = "upadateCardStatus")
	public String upadateCardStatus() {
		try {
			service.upadateCardStatus(bean);
			MessageUtil.addMessage(getHttpServletRequest(), "操作成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(getRequest(), "操作失败");
			return ERROR;
		}
	}

	@Action(value = "queryLostCardAdmin", results = { @Result(name = "queryList", location = "/WEB-INF/jsp/safe/listAdminCard.jsp") })
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
							parmvalues.add(FieldUtil.format(Card.class, name, fieldValue));
						}
					}
				}
				
				parmnames.add("cardStatus");
				parmvalues.add("申请挂失");
				
				SearchParamBean sbean = new SearchParamBean();
				sbean.setParmnames(parmnames);
				sbean.setParmvalues(parmvalues);

				p.setConditonObject(sbean);
			} else {
				p.setCurrentPageNumber(pageNum);
			}
			Page page = null;
			page = service.find(p, Card.class);
            //将page的返回值保存在session会话中，名称为Constant.SESSION_PAGE
			getHttpSession().setAttribute(Constant.SESSION_PAGE, page);
			return "queryList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	@Action(value = "queryLockCardAdmin", results = { @Result(name = "queryList", location = "/WEB-INF/jsp/safe/listAdminCard.jsp") })
	public String queryLockCardAdmin() {
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
				parmnames.add("cardStatus");
				parmvalues.add("冻结");
				
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
