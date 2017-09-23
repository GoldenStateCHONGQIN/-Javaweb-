package com.yh.web.service.impl;

import java.awt.image.BandCombineOp;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import util.DateUtil;
import util.MD5;
import util.NumberUtil;
import util.Page;
import util.StringUtil;

import com.yh.entity.Apply;
import com.yh.entity.Card;
import com.yh.entity.CardFlow;
import com.yh.entity.Insurance;
import com.yh.entity.LoanFlow;
import com.yh.entity.PaymentFlow;
import com.yh.entity.TransferLocal;
import com.yh.entity.TransferRemote;
import com.yh.entity.main.SimpleUser;
import com.yh.entity.main.SysUser;
import com.yh.entity.main.User;
import com.yh.web.dao.ISysDao;

import common.service.BaseService;

@Service("bizService")
@Repository
public class BizService extends BaseService {

	@Autowired
	private ISysDao dao;

	public List queryByHQL(String hql, Object... values) {
		return dao.queryByHQL(hql, values);
	}

	public void addSimpleUser(SimpleUser obj) {
		User user = obj.getUser();
		MD5 md = new MD5();
		user.setUserPassword(md.getMD5ofStr(user.getUserPassword()));
		dao.save(user);
		dao.save(obj);
	}

	public void updateSimpleUser(SimpleUser obj) {
		SimpleUser temp = (SimpleUser) dao.get(SimpleUser.class, obj.getId());
		User user = temp.getUser();
		user.setUserAddress(obj.getUser().getUserAddress());
		user.setUserBirth(obj.getUser().getUserBirth());
		user.setUserEmail(obj.getUser().getUserEmail());
		user.setUserGender(obj.getUser().getUserGender());
		user.setUserName(obj.getUser().getUserName());
		user.setUserPhone(obj.getUser().getUserPhone());
		if (StringUtils.isNotBlank(obj.getUser().getUserPassword())) {
			MD5 md = new MD5();
			user.setUserPassword(md.getMD5ofStr(obj.getUser().getUserPassword()));
		}
		dao.merge(user);
		obj.setUser(user);
		dao.merge(obj);

	}

	/**
	 * 添加对象
	 * 
	 * @param obj
	 */
	public void add(Object obj) {
		dao.save(obj);
	}

	/**
	 * 修改对象
	 * 
	 * @param obj
	 */
	public void update(Object obj) {
		dao.merge(obj);
	}

	/**
	 * 根据id获取对象
	 * 
	 * @param clazz
	 * @param id
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Object get(Class clazz, Serializable id) {
		return dao.get(clazz, id);
	}

	public void deleteUser(String ids) {
		dao.deleteByIds(User.class, ids);
	}

	public void delete(Class clazz, String ids) {
		dao.deleteByIds(clazz, ids);
	}

	public Object findUser(String type, String userid, String pwd) {
		return dao.queryUser(type, userid, pwd);
	}

	public User findUser(String userid) {
		return dao.queryUser(userid);
	}

	public Page findUser(Page page) {
		return dao.list(page, "User");
	}

	public Page find(Page page, Class clazz) {
		return dao.list(page, clazz.getSimpleName());
	}

	public List findAll(Class clazz) {
		return dao.queryByHQL("from " + clazz.getSimpleName());
	}

	public void addSysUser(SysUser obj) {
		User user = obj.getUser();
		MD5 md = new MD5();
		user.setUserPassword(md.getMD5ofStr(user.getUserPassword()));
		dao.save(user);
		dao.save(obj);
	}

	public void updateSysUser(SysUser obj) {
		SysUser temp = (SysUser) dao.get(SysUser.class, obj.getId());
		User user = temp.getUser();
		user.setUserAddress(obj.getUser().getUserAddress());
		user.setUserBirth(obj.getUser().getUserBirth());
		user.setUserEmail(obj.getUser().getUserEmail());
		user.setUserGender(obj.getUser().getUserGender());
		user.setUserName(obj.getUser().getUserName());
		user.setUserPhone(obj.getUser().getUserPhone());
		if (StringUtils.isNotBlank(obj.getUser().getUserPassword())) {
			MD5 md = new MD5();
			user.setUserPassword(md.getMD5ofStr(obj.getUser().getUserPassword()));
		}
		dao.merge(user);
		obj.setUser(user);
		dao.merge(obj);

	}

	public List findAll(Class clazz, Map<String, Object> params) {
		return dao.findAll(clazz, params);
	}

	public void updateApplyCheck(Apply bean) {
		Apply temp = (Apply) dao.get(Apply.class, bean.getId());
		log.info(bean.getId());
		temp.setCheckStatus(bean.getCheckStatus());
		dao.update(temp);

		if ("审核通过".equals(bean.getCheckStatus())) {
			MD5 md = new MD5();
			User user = new User();
			user.setUname(temp.getDicard());
			user.setUserPassword(md.getMD5ofStr("123456"));
			user.setUserGender(temp.getGender().equals("男") ? 1 : 0);
			user.setUserName(temp.getName());
			user.setUserPhone(temp.getPhone());
			user.setUserEmail(temp.getEmail());
			user.setUserAddress(temp.getAddress());
            user.setUserBirth(temp.getBirth());
			dao.save(user);
			SimpleUser suser = new SimpleUser();
			suser.setUser(user);
			dao.save(suser);

			Card c = new Card();
			c.setApply(temp);
			c.setBalance(0);
			c.setPoints(0);
			c.setSid(new Date().getTime() + "");
			c.setType("信用卡");
			c.setUser(suser);
			c.setCardStatus("未激活");
			dao.save(c);
		}
	}

	public void updateActiveCard(Card bean) {
		Card card = (Card) dao.get(Card.class, bean.getId());
		if (card.getCardStatus().equals("未激活")) {
			card.setPassword(bean.getPassword());
			card.setCardStatus("正常");
			card.setCredits(5000D);
		} else {
			if (StringUtils.isNotBlank(bean.getPassword())) {
				card.setPassword(bean.getPassword());
			}
		}
		dao.update(card);

		Card nc = new Card();
		nc.setApply(card.getApply());
		nc.setBalance(0d);
		nc.setCardStatus("正常");
		nc.setPassword(card.getPassword());
		nc.setSid("5" + new Date().getTime());
		nc.setType("银行卡");
		nc.setUser(card.getUser());

		dao.save(nc);

	}

	public void upadateAdminCard(Card bean) {
		Card card = (Card) dao.get(Card.class, bean.getId());
		if (StringUtils.isNotBlank(bean.getPassword())) {
			card.setPassword(bean.getPassword());
		}
		card.setCredits(bean.getCredits());
		card.setCardStatus(bean.getCardStatus());
		dao.update(card);	
	}

	public void addSave(double balance, SimpleUser user) {
		Card card = dao.unique("from Card where user.id=? and type='信用卡'", user.getId());
		CardFlow cf = new CardFlow();

		cf.setAddDate(DateUtil.getCurrentTime(DateUtil.FULL));
		cf.setCard(card);
		cf.setMoney(balance);
		cf.setNote("存款");
		cf.setType("存入");
		dao.save(cf);

		if (card.getBalance() < 0) {
			CardFlow cf1 = new CardFlow();

			cf1.setAddDate(DateUtil.getCurrentTime(DateUtil.FULL));
			cf1.setCard(card);
			cf1.setNote("自动还款");
			cf1.setType("转出");
			if (Math.abs(card.getBalance()) >= balance) {
				cf1.setMoney(balance);
			} else {
				cf1.setMoney(Math.abs(card.getBalance()));
			}
			dao.save(cf1);
		}

		card.setBalance(card.getBalance() + balance);
		dao.update(card);

	}

	public void addSaveBank(double balance, SimpleUser user) {
		Card card = dao.unique("from Card where user.id=? and type='银行卡'", user.getId());
		CardFlow cf = new CardFlow();

		cf.setAddDate(DateUtil.getCurrentTime(DateUtil.FULL));
		cf.setCard(card);
		cf.setMoney(balance);
		cf.setNote("存款");
		cf.setType("存入");
		dao.save(cf);

		card.setBalance(card.getBalance() + balance);
		dao.update(card);

	}

	public void addUserLoan(double balance,String reason,String loanyear, SimpleUser user) {
		Card card = dao.unique("from Card where user.id=? and type='信用卡'", user.getId());
		LoanFlow lf = new LoanFlow();
		lf.setAddDate(DateUtil.getCurrentTime());
		lf.setCard(card);
		lf.setChecked(false);
		lf.setMoney(balance);
		lf.setType("贷款");
        lf.setReasons(reason);
        lf.setLoanyears(loanyear);

		dao.save(lf);

	}

	public Card getUserCard1(int userid) {
		Card card = dao.unique("from Card where user.id=? and type='信用卡'", userid);
		return card;

	}

	public Card getUserBankCard(int userid) {
		Card card = dao.unique("from Card where user.id=? and type='银行卡'", userid);
		return card;

	}

	public double getUserTotalLoan(SimpleUser user) {
		Double temp = dao.unique("select sum(money) from LoanFlow where type='贷款' and card.user.id=? and checked=true", user.getId());
		if (temp == null) {
			return 0;
		}
		return temp;
	}

	public double getUserTotalBack(SimpleUser user) {
		Double temp = dao.unique("select sum(money) from LoanFlow where type='还款' and card.user.id=?", user.getId());
		if (temp == null) {
			return 0;
		}
		return temp;
	}

	public void addUserLoanReturn(double balance, SimpleUser user) {
		Card card = dao.unique("from Card where user.id=? and type='信用卡'", user.getId());
		LoanFlow lf = new LoanFlow();
		lf.setAddDate(DateUtil.getCurrentTime());
		lf.setCard(card);
		lf.setChecked(false);
		lf.setMoney(balance);
		lf.setType("还款");

		dao.save(lf);

	}

	public void updateLoanCheck(String ids) {
		if (ids != null) {

			String[] temp = ids.split(",");
			if (temp == null || temp.length <= 0) {
				throw new RuntimeException("ids error");
			}
			for (String str : temp) {
				if (!NumberUtil.isNumeric(str)) {
					throw new RuntimeException("ids error");
				}
			}
			String hql = "update LoanFlow set checked=true where id in(" + ids + ")";
			dao.updateByHQL(hql);
		}

	}

	public void addPaymentFlow(PaymentFlow bean) {
		Card card = (Card) dao.get(Card.class, bean.getCard().getId());
		dao.save(bean);
		card.setBalance(card.getBalance() - bean.getMoney());
		dao.update(card);

	}

	public Card findCardBySid(String sid) {
		return dao.unique("from Card where sid=? and cardStatus='正常'", sid);
	}

	public void addTransferLocal(TransferLocal bean) {
		Card from = (Card) dao.get(Card.class, bean.getFromCard().getId());
		Card to = (Card) dao.get(Card.class, bean.getToCard().getId());

		dao.save(bean);
		from.setBalance(from.getBalance() - bean.getMoney());
		dao.update(from);

		to.setBalance(to.getBalance() + bean.getMoney());
		dao.update(to);
	}

	public void addTransferRemote(TransferRemote bean) {
		Card from = (Card) dao.get(Card.class, bean.getFromCard().getId());
		dao.save(bean);

		from.setBalance(from.getBalance() - bean.getMoney() - bean.getPoundMoney());
		dao.update(from);
	}

	public void addInsurance(Insurance bean) {
		int id = (Integer) dao.save(bean);
		String sid = "BX" + StringUtil.format0String(6, id);
		dao.updateByHQL("update Insurance set sid=? where id=?", sid, id);
	}

	public Card findCard(String loginid, String password, String phone, String type) {
		return dao.unique("from Card where apply.dicard=? and password=? and user.user.userPhone=? and type=?", loginid, password, phone, type);
	}

	public void upadateCardStatus(Card bean) {
		Card card = (Card) dao.get(Card.class, bean.getId());
		card.setCardStatus(bean.getCardStatus());
		dao.update(card);

	}

	public Card getCard(String idcard, String password) {
		return dao.unique("from Card where sid=? and password=?", idcard, password);
	}

}
