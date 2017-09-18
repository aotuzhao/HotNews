package com.hotnews.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.hotnews.entity.User;
import com.hotnews.service.UserDao;
import com.opensymphony.xwork2.ActionSupport;

public class AlterUserAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String u_email; 
	private String u_password;
	private String u_name;
	private String u_icon;
	
	private File u_image;
	private String u_imageFileName;
	private String u_imageContentType;
	
	private String error = null;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		User user = (User)session.getAttribute("userSession");
		if(u_image==null) {
		}else {
			saveImage();
			user.setU_icon(u_icon);
		}
		
		user.setU_name(u_name);
		user.setU_password(u_password);
		
		String strReturn =INPUT;
		if (UserDao.update(user)) {
			session.setAttribute("userSession", user);
			return SUCCESS;
		} 
		request.setAttribute("error", "提交失败，请重新提交！");
		return INPUT;
	}
	
	
	public void saveImage() throws Exception {
		String path = 
				ServletActionContext.getServletContext().getRealPath("/userimage");
		System.out.println(path);
		
		InputStream is = new FileInputStream(this.u_image);
		OutputStream os = new FileOutputStream(new File(path, this.u_imageFileName));
		this.u_icon = "userimage/" + this.u_imageFileName;
		byte[] buffer = new byte[1024];
		int n = 0;
		while ((n = is.read(buffer)) != -1) {
			os.write(buffer, 0, n);
		}
		is.close();
		os.close();
	}


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


	public String getU_name() {
		return u_name;
	}


	public void setU_name(String u_name) {
		this.u_name = u_name;
	}


	public String getU_icon() {
		return u_icon;
	}


	public void setU_icon(String u_icon) {
		this.u_icon = u_icon;
	}


	public File getU_image() {
		return u_image;
	}


	public void setU_image(File u_image) {
		this.u_image = u_image;
	}


	public String getU_imageFileName() {
		return u_imageFileName;
	}


	public void setU_imageFileName(String u_imageFileName) {
		this.u_imageFileName = u_imageFileName;
	}


	public String getU_imageContentType() {
		return u_imageContentType;
	}


	public void setU_imageContentType(String u_imageContentType) {
		this.u_imageContentType = u_imageContentType;
	}
	
}
