package com.yh.web.action.safe;

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
import util.FieldUtil;
import util.MessageUtil;
import util.Page;
import util.SearchParamBean;
import util.StringUtil;

import com.opensymphony.xwork2.ModelDriven;
import com.yh.entity.Insurance;
import com.yh.entity.InsuranceType;
import com.yh.web.service.impl.BizService;
import common.action.struts.BaseAction;

@ParentPackage("struts-default")
@Namespace("/sys")
@Component
public class ActionInsurance extends BaseAction implements ModelDriven<Insurance> {
	@Autowired
	private BizService service;

	private int uid;
	private Insurance bean = new Insurance();

	@Action(value = "add2Insurance", results = { @Result(name = "add2", location = "/WEB-INF/jsp/safe/addInsurance.jsp") })
	public String add2() {
		List list = service.findAll(InsuranceType.class);
		putRequestValue("list", list);
		return "add2";
	}

	@Action(value = "getInsurance", results = { @Result(name = "getOne", location = "/WEB-INF/jsp/safe/modifyInsurance.jsp") })
	public String get() {
		try {
			Insurance temp = (Insurance) service.get(Insurance.class, uid);
			putRequestValue("modifybean", temp);
			List list = service.findAll(InsuranceType.class);
			putRequestValue("list", list);
			
			return "getOne";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	@Action(value = "deleteInsurance")
	public String delete() {
		try {
			service.delete(Insurance.class, ids);
			MessageUtil.addRelMessage(getHttpServletRequest(), "删除信息成功.", "mainquery");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "删除失败");
			return ERROR;
		}
	}

	@Action(value = "updateInsurance")
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

	@Action(value = "addInsurance")
	public String add() {
		try {
			service.addInsurance(bean);
			MessageUtil.addMessage(getHttpServletRequest(), "添加成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(getRequest(), "添加失败");
			return ERROR;
		}
	}

	@Action(value = "queryInsurance", results = { @Result(name = "queryList", location = "/WEB-INF/jsp/safe/listInsurance.jsp") })
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
							parmvalues.add(FieldUtil.format(Insurance.class, name, fieldValue));
						}
					}
				}

				SearchParamBean sbean = new SearchParamBean();
				sbean.setParmnames(parmnames);
				sbean.setParmvalues(parmvalues);

				p.setConditonObject(sbean);
			} else {
				p.setCurrentPageNumber(pageNum);
			}
			Page page = null;
			page = service.find(p, Insurance.class);

			getHttpSession().setAttribute(Constant.SESSION_PAGE, page);
			return "queryList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public Insurance getModel() {
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
