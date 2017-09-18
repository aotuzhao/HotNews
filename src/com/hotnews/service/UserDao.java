package com.hotnews.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import com.hotnews.entity.User;
import com.hotnews.sessionFactory.*;

public class UserDao {
	private static Session session = null;
	private static Transaction transaction = null;
	private static String sql = null;
	private static boolean is = false;
	
	//查询所有用户
	public static List<User> queryAllUser() {
		List<User> users = new ArrayList<User>();

		try {
			session = HibernateSessionFactory.getSession();
			transaction = session.beginTransaction();
			sql = "select * from user";
			users = session.createSQLQuery(sql).addEntity(User.class).list();
			if (users.isEmpty()) {
				users = null;
				System.out.println("=====queryAllUser查询结果为空=====");
			}

			transaction.commit();
		} catch (Exception e) {
			System.err.println("=====queryAllUser 异常=====");
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}

		return users;

	}
	
	//查询用户
	public static User querUserByUser(User u) {

		try {
			session = HibernateSessionFactory.getSession();
			transaction = session.beginTransaction();
			String email = u.getU_email();
			sql = "select * from user where u_email=?";
			List<User> list = session.createSQLQuery(sql).addEntity(User.class)
					.setParameter(0, email).list();
			if (list.isEmpty()) {
				u = null;
			} else {
				for (Iterator<User> iterator = list.iterator(); iterator
						.hasNext();) {
					u = (User) iterator.next();
				}
			}
			transaction.commit();

		} catch (Exception e) {
			System.err.println("=====UserQuery 异常=====");
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return u;
	}
	
	//注册用户
	public static boolean saveUser(User u) {
		User user1 = querUserByUser(u);
		if (user1 != null) {
			is = false;
			System.out.println("UserSave时，经查询已存在User");
		} else {
			try {
				session = HibernateSessionFactory.getSession();
				transaction = session.beginTransaction();

				User user=new User(u.getU_status(),u.getU_email(),u.getU_name(),u.getU_password(),u.getU_icon());
				session.save(user);
				transaction.commit();

				is = true;

			} catch (Exception e) {
				System.err.println("=====UserSave 异常=====");
				if (transaction != null)
					transaction.rollback();
				e.printStackTrace();
			} finally {
				HibernateSessionFactory.closeSession();
			}
		}
		return is;

	}
	
	//修改用户信息
	public static boolean update(User u){
		User user1 = querUserByUser(u);
		if (user1==null) {
			is=false;
			System.out.println("UserUpdate时，经查询不存在User");
		} else {
			if(u.getU_name()=="") u.setU_name(user1.getU_name());
			if(u.getU_icon()=="") u.setU_icon(user1.getU_icon());
			if(u.getU_password()=="") u.setU_password(user1.getU_password());
			u.setU_status(user1.getU_status());
			u.setU_id(user1.getU_id());
			u.setU_email(user1.getU_email());
			try {
				session = HibernateSessionFactory.getSession();
				transaction = session.beginTransaction();

				session.update(u);	
				transaction.commit();
				
				is=true;
				
			} catch (Exception e) {
				System.err.println("=====UserUpdate 异常=====");
				if(transaction!=null)
					transaction.rollback();
				e.printStackTrace();
			}finally{
				HibernateSessionFactory.closeSession();
			}
		}
		return is;
	}
	
	//通过用户ID查询用户
	public static User queryUserByID(int u_id){
		User u = new User();
		try {
			session = HibernateSessionFactory.getSession();
			transaction = session.beginTransaction();
			sql = "select * from user where u_id=?";
			List<User> list = session.createSQLQuery(sql).addEntity(User.class).setParameter(0, u_id).list();
			if (list.isEmpty()) {
				u=null;
			}else {
				for (Iterator<User> iterator = list.iterator(); iterator.hasNext();) {
					u = (User) iterator.next();
				}
			}
			
			transaction.commit();
			
		} catch (Exception e) {
			System.err.println("=====queryUserByID 异常=====");
			if(transaction!=null)
				transaction.rollback();
			e.printStackTrace();
		}finally{
			HibernateSessionFactory.closeSession();
		}
		return u;
	}
	//冻结用户
	public static boolean freezeUser(int u_id) {
		User user = queryUserByID(u_id);
		if (user == null) {
			is = false;
			System.out.println("操作用户时，经查询不存在User");
		} else {
			if(user.getU_status()==1) {
				user.setU_status(2);
			}else if(user.getU_status()==2) {
				user.setU_status(1);
			}
			
			try {
				session = HibernateSessionFactory.getSession();
				transaction = session.beginTransaction();
				session.update(user);
				transaction.commit();
				is = true;
			} catch (Exception e) {
				System.err.println("=====freezeUser 异常=====");
				if (transaction != null)
					transaction.rollback();
				e.printStackTrace();
			} finally {
				HibernateSessionFactory.closeSession();
			}
		}
		return is;
	}
	
	//删除用户
	public static boolean deleteUser(int u_id) {
		User user1 = queryUserByID(u_id);
		if (user1==null) {
			is=false;
			System.out.println("删除用户时，经查询不存在User");
		} else {
			try {
				session = HibernateSessionFactory.getSession();
				transaction = session.beginTransaction();
				
				session.delete(user1);	
				transaction.commit();
				
				is=true;
				
			} catch (Exception e) {
				System.err.println("=====UserDelete 异常=====");
				if(transaction!=null)
					transaction.rollback();
				e.printStackTrace();
			}finally{
				HibernateSessionFactory.closeSession();
			}
		}
		return is;
	}
}
