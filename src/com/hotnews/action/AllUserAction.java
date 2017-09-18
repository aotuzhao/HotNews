package com.hotnews.action;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.hotnews.entity.User;
import com.hotnews.service.UserDao;
import com.opensymphony.xwork2.ActionSupport;

public class AllUserAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	@Override
	public String execute() throws Exception {
		List<User> users = UserDao.queryAllUser();
		if (users!=null) {
			request.setAttribute("listUser", users);
		}
		return SUCCESS;
		
	}
}
