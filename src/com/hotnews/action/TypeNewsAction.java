package com.hotnews.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.hotnews.entity.News;
import com.hotnews.service.NewsDao;
import com.opensymphony.xwork2.ActionSupport;

public class TypeNewsAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	@Override
	public String execute() throws Exception {
		request.setCharacterEncoding("UTF-8");
		String type=new String(request.getParameter("type").getBytes("UTF-8"), "UTF-8");
		int status = Integer.parseInt(request.getParameter("status"));
		List<News> newsList=NewsDao.quryNewsByType(type, status);
		request.setAttribute("newsList", newsList);
		request.setAttribute("type", type);
		return SUCCESS;
	}
	
}
