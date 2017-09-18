package com.hotnews.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class LoginOutAction extends ActionSupport {
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	@Override
	public String execute() throws Exception {
		session.removeAttribute("userSession");
		return SUCCESS;
	}
}
