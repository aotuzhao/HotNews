package com.hotnews.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.hotnews.entity.News;
import com.hotnews.entity.User;
import com.opensymphony.xwork2.ActionSupport;

public class MyNewsAction extends ActionSupport {
	
	
	private static final long serialVersionUID = 1L;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	@Override
	public String execute() throws Exception {
		request.setCharacterEncoding("UTF-8");
		User user = (User)session.getAttribute("userSession");
		List<News> ListNews=new ArrayList<News>();
		for (Iterator<News> iterator2 = user.getNews().iterator(); iterator2.hasNext();) {
			News n = iterator2.next();
			ListNews.add(n);
		}
		int i = Integer.parseInt(request.getParameter("type"));
		List<News> postNews=new ArrayList<News>();
		List<News> fileNews=new ArrayList<News>();
		for (News news : ListNews) {
			if(news.getN_status()==0) {
				fileNews.add(news);
			}else {
				postNews.add(news);
			}
		}
		if(i==0) {
			request.setAttribute("myNews", fileNews);
			
		}else{
			request.setAttribute("myNews", postNews);
		}
		
		return SUCCESS;
	}
}
