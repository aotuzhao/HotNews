package com.hotnews.action;

import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.hotnews.entity.News;
import com.hotnews.page.Pager;
import com.hotnews.page.PagerHelper;
import com.hotnews.service.NewsDao;
public class AllNewsAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	@Override
	public String execute() throws Exception {
		int totalRows = 0;
		Pager pager = null; 
		int pageSize = 10;
		totalRows = NewsDao.getTotalRows();
		pager = PagerHelper.getPager(request, totalRows, pageSize); 
		pager.setLinkUrl("showAllNewsAction.action?"); 
		request.setAttribute("pb", pager); 
		List<News> news = NewsDao.quryAllNewsAdmin(pager);
		if (news!=null) {
			request.setAttribute("listNews", news);
		}
		
		return SUCCESS;
		
	}
}
