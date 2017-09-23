package com.yh.web.action.pay;

import java.util.LinkedList;
import java.util.Set;
import java.util.Map.Entry;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import util.Constant;
import util.FieldUtil;
import util.Page;
import util.SearchParamBean;
import util.StringUtil;

import com.yh.entity.News;
import com.yh.web.service.impl.BizService;

import common.action.struts.BaseAction;

@ParentPackage("json-default")
@Namespace("/com")
@Component
public class FrontAction extends BaseAction {
	@Autowired
	private BizService service;

	private int uid;
	private String type;

	@Action(value = "getNews", results = { @Result(name = "one", type = "redirect", location = "/web/detailNews.jsp") })
	public String getNews() {
		log.info(uid);
		News item = (News) service.get(News.class, uid);
		log.info(item.getTitle());
		getHttpSession().setAttribute("newsItem", item);
		return "one";
	}

	@Action(value = "queryNews", results = { @Result(name = "queryList", type = "redirect", location = "/web/listNews.jsp") })
	public String query() {
		try {
			int pageNum = 0;
			String t = getHttpServletRequest().getParameter("pageNum");
			if (StringUtil.notEmpty(t)) {
				pageNum = Integer.valueOf(t);
			}
			Page p = (Page) getHttpSession().getAttribute(Constant.SESSION_PAGE + "_WEB");
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
							parmvalues.add(FieldUtil.format(News.class, name, fieldValue));
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
			page = service.find(p, News.class);

			getHttpSession().setAttribute(Constant.SESSION_PAGE + "_WEB", page);
			return "queryList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public BizService getService() {
		return service;
	}

	public void setService(BizService service) {
		this.service = service;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
