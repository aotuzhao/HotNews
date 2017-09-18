package com.hotnews.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.hotnews.entity.News;
import com.hotnews.page.Pager;
import com.hotnews.page.PagerHelper;
import com.hotnews.service.NewsDao;
import com.opensymphony.xwork2.ActionSupport;


public class ShowNewsAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	@Override
	public String execute() throws Exception {
		int i = Integer.parseInt(request.getParameter("n_id"));
		News news=NewsDao.queryNewsByID(i);
		List<News> ListNews = NewsDao.quryNewsByType(news.getN_type(), 1);
		if (news!=null) {
			request.setAttribute("typeNews", ListNews);
		}
		request.setAttribute("news", news);
		return SUCCESS;
		
	}
	
}
