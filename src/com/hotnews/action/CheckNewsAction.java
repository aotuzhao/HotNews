package com.hotnews.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.hotnews.service.NewsDao;
import com.opensymphony.xwork2.ActionSupport;

public class CheckNewsAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	@Override
	public String execute() throws Exception {
		int i = Integer.parseInt(request.getParameter("n_id"));
		NewsDao.postNews(i);
		return SUCCESS;
		
	}
}
