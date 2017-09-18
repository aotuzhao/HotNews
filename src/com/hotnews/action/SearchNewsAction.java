package com.hotnews.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.hotnews.entity.News;
import com.hotnews.service.NewsDao;
import com.opensymphony.xwork2.ActionSupport;

public class SearchNewsAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	@Override
	public String execute() throws Exception {
		request.setCharacterEncoding("UTF-8");
		String keywords=new String(request.getParameter("keywords").getBytes("UTF-8"), "UTF-8");
		int status = Integer.parseInt(request.getParameter("status"));
		List<News> newsList=NewsDao.quryNewsByKeyWords(keywords, status);
		request.setAttribute("newsList", newsList);
		request.setAttribute("keywords", keywords);
		return SUCCESS;
	}
}
