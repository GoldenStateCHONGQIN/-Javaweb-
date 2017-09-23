package com.yh.web.action.pay;

import java.io.IOException;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import util.DateUtil;

import com.yh.entity.Card;
import com.yh.entity.CardFlow;
import com.yh.web.service.impl.BizService;

import common.action.struts.BaseAction;

@ParentPackage("json-default")
@Namespace("/com")
@Component
public class WebAction extends BaseAction {
	@Autowired
	private BizService service;

	private int price;
	private String type, idcard, password;

	@Action(value = "webBuy")
	public String userLogin() {
		String msg = null;
		log.info("积分:" + price);
		do {
			try {
				Card card = service.getCard(idcard, password);
				if (card == null) {
					msg = "卡号或者密码错误";
					break;
				}
				if (type.equals("积分") && card.getType().equals("银行卡")) {
					msg = "积分购买请用信用卡";
					break;
				}
				if (type.equals("积分")) {
					log.info("积分购买");
					log.info(card.getPoints());
					if (card.getPoints() < price) {
						msg = "积分不够";
						break;
					} else {
						card.setPoints(card.getPoints() - price);
						service.update(card);
						msg = "购买成功";
						break;
					}
				} else {
					if (card.getType().equals("信用卡")) {
						card.setBalance(card.getBalance() - price);
						card.setPoints(card.getPoints() + (price / 10));
						service.update(card);
						CardFlow cf = new CardFlow();
						cf.setAddDate(DateUtil.getCurrentTime(DateUtil.FULL));
						cf.setCard(card);
						cf.setMoney(price);
						cf.setNote("购买商品");
						cf.setType("转出");
						service.add(cf);
						msg = "购买成功";
						break;
					} else {
						if (card.getBalance() < price) {
							msg = "余额不够";
							break;
						} else {
							card.setBalance(card.getBalance() - price);
							service.update(card);
							msg = "购买成功";
							break;
						}
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		} while (false);
		String retmsg = "{\"msg\":\"" + msg + "\"}";
		try {
			getHttpServletResponse().getWriter().write(retmsg);
			getHttpServletResponse().getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public BizService getService() {
		return service;
	}

	public void setService(BizService service) {
		this.service = service;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
