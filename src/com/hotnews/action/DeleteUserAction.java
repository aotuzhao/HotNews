package com.hotnews.action;

import com.hotnews.service.UserDao;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
public class DeleteUserAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	@Override
	public String execute() throws Exception {
		int i = Integer.parseInt(request.getParameter("u_id"));
		UserDao.deleteUser(i);
		return SUCCESS;
	}
}
