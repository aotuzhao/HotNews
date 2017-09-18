package com.hotnews.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.hotnews.entity.User;
import com.hotnews.service.UserDao;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	private String u_email; 
	private String u_password;	
	private String error = null;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();

	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_password() {
		return u_password;
	}
	public void setU_password(String u_password) {
		this.u_password = u_password;
	}

	@Override
	public String execute() throws Exception {
		//定义返回值变量
		String strReturn =INPUT;
		//业务逻辑判断
		User user = new User();
		user.setU_email(u_email);
		user.setU_password(u_password);
		User user2 = UserDao.querUserByUser(user);
		if (user2!=null) {
			int n = user2.getU_status();
			if (n==0) {
				strReturn = "success1";
				session.setAttribute("userSession", user2);
			}else if (n==1) {
				strReturn = "success2";
				session.setAttribute("userSession", user2);
			}else if (n==2) {
				strReturn = "success3";
				error = "此账户已被冻结，请与管理员联系！";
				request.setAttribute("error", error);
			}
		}else {
			error = "密码输入错误，请重新输入！";
			request.setAttribute("error", error);
		}
		return strReturn;

	}
	
}

