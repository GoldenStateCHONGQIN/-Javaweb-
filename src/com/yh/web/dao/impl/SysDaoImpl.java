package com.yh.web.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.yh.entity.main.User;
import com.yh.web.dao.ISysDao;
import common.dao.hibernate.BaseHibernateDao;

@Repository
public class SysDaoImpl extends BaseHibernateDao implements ISysDao {
	public void saveUser(User user) {
		save(user);
	}

	public Object queryUser(String type, String userid, String pwd) {
		if("SysUser".equals(type)){
			return unique("from " + type + " where user.uname='" + userid + "' and user.userPassword='" + pwd + "'" );
		}else{
		return unique("from " + type + " where user.uname='" + userid + "' and user.userPassword='" + pwd + "' and "
				+ "user.userId  in (select user.userId from SimpleUser  where id not in"
				+ " (select user.id from Card where cardStatus ='黑名单' or cardStatus = '申请挂失' or cardStatus = '冻结'))"
				 );
		}
	}

	public User queryUser(String userid) {
		return unique("from User where userid=?", userid);
	}

	public List queryByHQLLimit(final String hql, final int start, final int max) {

		try {

			List resultList = getHibernateTemplate().executeFind(

			new HibernateCallback() {

				public Object doInHibernate(Session arg0)

				throws HibernateException, SQLException {

					Query query = arg0.createQuery(hql);

					query.setFirstResult(start);

					query.setMaxResults(max);

					return query.list();

				}

			});

			return resultList;

		} catch (RuntimeException re) {

			throw re;

		}

	}

}
