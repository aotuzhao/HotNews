package com.hotnews.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hotnews.sessionFactory.HibernateSessionFactory;

import com.hotnews.entity.News;
import com.hotnews.entity.User;
import com.hotnews.page.Pager;

public class NewsDao {
	private static Session session = null;
	private static Transaction transaction = null;
	private static String sql = null;
	private static boolean is = false;

	// 发布新闻
	public static boolean insertNews(News n, User user) {
		User user2 = UserDao.querUserByUser(user);
		try {
			session = HibernateSessionFactory.getSession();
			transaction = session.beginTransaction();
			n.getUsers().add(user2);
			session.save(n);
			transaction.commit();
			is = true;
		} catch (Exception e) {
			System.err.println("=====insertNews 异常=====");
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return is;
	}

	// 审核新闻
	public static boolean postNews(int n_id) {
		News news = NewsDao.queryNewsByID(n_id);
		if (news == null) {
			is = false;
			System.out.println("审核的新闻不存在！");
		} else {
			try {
				session = HibernateSessionFactory.getSession();
				transaction = session.beginTransaction();
				if(news.getN_status()==0) {
					news.setN_status(1);
				}else if(news.getN_status()==1) {
					news.setN_status(0);
				}
				
				session.update(news);
				transaction.commit();
				is = true;
			} catch (Exception e) {
				System.err.println("=====postNews 异常=====");
				if (transaction != null)
					transaction.rollback();
				e.printStackTrace();
			} finally {
				HibernateSessionFactory.closeSession();
			}
		}
		return is;
	}

	// 删除新闻
	public static boolean deleteNews(int n_id) {
		News news = NewsDao.queryNewsByID(n_id);
		if (news == null) {
			is = false;
			System.out.println("删除的新闻不存在！");
		} else {
			try {
				session = HibernateSessionFactory.getSession();
				transaction = session.beginTransaction();
				session.delete(news);
				transaction.commit();
				is = true;
			} catch (Exception e) {
				System.err.println("=====deleteNews 异常=====");
				if (transaction != null)
					transaction.rollback();
				e.printStackTrace();
			} finally {
				HibernateSessionFactory.closeSession();
			}
		}
		return is;
	}
	// 查询所有新闻
	public static List<News> quryAllNews( int status) {
		List<News> listNews = new ArrayList<News>();
		try {
			session = HibernateSessionFactory.getSession();
			transaction = session.beginTransaction();
			sql = "select * from news where n_status ="+ status ;
			listNews = session.createSQLQuery(sql).addEntity(News.class).list();
			if (listNews.isEmpty()) {
				listNews = null;
				System.out.println("=====quryNewsByType查询结果为空=====");
			}
			transaction.commit();
		} catch (Exception e) {
			System.err.println("=====quryNewsByType 异常=====");
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}

		return listNews;
	}
	// 管理员分页查询所有新闻
		public static List<News> quryAllNewsAdmin(Pager page) {
			List<News> listNews = new ArrayList<News>();
			try {
				session = HibernateSessionFactory.getSession();
				transaction = session.beginTransaction();
				sql = "select * from news";
				listNews = session.createSQLQuery(sql).addEntity(News.class)
						.setFirstResult(page.getStartRow())	
						.setMaxResults(page.getPageSize())
						.list();
				if (listNews.isEmpty()) {
					listNews = null;
					System.out.println("=====quryNewsAll查询结果为空=====");
				}
				transaction.commit();
			} catch (Exception e) {
				System.err.println("=====quryNewsAll 异常=====");
				if (transaction != null)
					transaction.rollback();
				e.printStackTrace();
			} finally {
				HibernateSessionFactory.closeSession();
			}

			return listNews;
		}
	// 按类型查询
	public static List<News> quryNewsByType(String type, int status) {
		List<News> listNews = new ArrayList<News>();
		try {
			session = HibernateSessionFactory.getSession();
			transaction = session.beginTransaction();
			sql = "select * from news where n_type like '%" + type + "%'" + "and n_status=" + status + " order by n_id desc";
			listNews = session.createSQLQuery(sql).addEntity(News.class).list();
			if (listNews.isEmpty()) {
				System.out.println("=====quryNewsByType查询结果为空=====");
			}
			transaction.commit();
		} catch (Exception e) {
			System.err.println("=====quryNewsByType 异常=====");
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}

		return listNews;
	}

	// 关键字查询
	public static List<News> quryNewsByKeyWords(String keywords,int status) {
		List<News> listNews = new ArrayList<News>();
		try {
			session = HibernateSessionFactory.getSession();
			transaction = session.beginTransaction();
			sql = "select * from news where n_keywords like '%" + keywords + "%'"+ "and n_status=" + status;
			listNews = session.createSQLQuery(sql).addEntity(News.class).list();
			if (listNews.isEmpty()) {
				System.out.println("=====quryNewsByType查询结果为空=====");
			}
			transaction.commit();
		} catch (Exception e) {
			System.err.println("=====quryNewsByType 异常=====");
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}

		return listNews;
	}

	// ID查询
	public static News queryNewsByID(int n_id) {
		News news = new News();
		try {
			session = HibernateSessionFactory.getSession();
			transaction = session.beginTransaction();
			sql = "select * from news where n_id=?";
			List<News> list = session.createSQLQuery(sql).addEntity(News.class).setParameter(0, n_id).list();
			if (list.isEmpty()) {
				news = null;
			} else {
				for (Iterator<News> iterator = list.iterator(); iterator.hasNext();) {
					news = (News) iterator.next();
				}
			}
			transaction.commit();

		} catch (Exception e) {
			System.err.println("=====queryUserByID 异常=====");
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return news;
	}
	
	
	

	public static int getTotalRows() {
		Session session = HibernateSessionFactory.getSession();
		int totalRows = 0;
		String strHql = "select count(*) from News";
		Object obj = session.createQuery(strHql).iterate().next();
		if (obj != null)
			totalRows = Integer.parseInt(obj.toString());
		HibernateSessionFactory.closeSession();
		return totalRows;
	}
}
