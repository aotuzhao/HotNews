package com.hotnews.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.hotnews.entity.News;
import com.hotnews.service.NewsDao;
import com.opensymphony.xwork2.ActionSupport;

public class LastNewsAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	@Override
	public String execute() throws Exception {
		request.setCharacterEncoding("UTF-8");
		List<News> ListNews = NewsDao.quryNewsByType("国际", 1);
		if (ListNews!=null) {
			request.setAttribute("indexNews", ListNews);
		}
		return SUCCESS;
	}
}
