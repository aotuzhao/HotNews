package com.hotnews.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;

import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hotnews.entity.News;
import com.hotnews.entity.User;
import com.hotnews.service.NewsDao;
import com.opensymphony.xwork2.ActionSupport;

public class PublishNewsAction extends ActionSupport{
	private String n_title;
	private String n_source;
	private String n_author;
	private String n_type;
	private Date n_date;
	private String n_img;
	private String n_keywords;
	private String n_content;
	private String n_introduce;
	
	private File n_image;
	private String n_imageFileName;
	private String n_imageContentType;
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	@Override
	public String execute() throws Exception {
		String strRult = INPUT;
		// 测试用户，从session中获取
		User user = (User) session.getAttribute("userSession");
		saveImage();
		int status = Integer.parseInt(request.getParameter("status"));
		News news=new News(n_title, n_type, n_source, n_author, n_date, n_keywords,n_introduce, n_content, status, n_img);
		Boolean res=NewsDao.insertNews(news, user);
		if (res) {
			return SUCCESS;
		} else {
			return strRult;
		}

	}
	
	
	public void saveImage() throws Exception {
		String path = ServletActionContext.getServletContext().getRealPath("/newsimage");
		
		InputStream is = new FileInputStream(this.n_image);
		OutputStream os = new FileOutputStream(new File(path, this.n_imageFileName));
		this.n_img = "newsimage/" + this.n_imageFileName;
		byte[] buffer = new byte[1024];
		int n = 0;
		while ((n = is.read(buffer)) != -1) {
			os.write(buffer, 0, n);
		}
		is.close();
		os.close();
	}


	public String getN_title() {
		return n_title;
	}


	public void setN_title(String n_title) {
		this.n_title = n_title;
	}


	public String getN_source() {
		return n_source;
	}


	public void setN_source(String n_source) {
		this.n_source = n_source;
	}


	public String getN_author() {
		return n_author;
	}


	public void setN_author(String n_author) {
		this.n_author = n_author;
	}


	public String getN_type() {
		return n_type;
	}


	public void setN_type(String n_type) {
		this.n_type = n_type;
	}


	public Date getN_date() {
		return n_date;
	}


	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}


	public String getN_img() {
		return n_img;
	}


	public void setN_img(String n_img) {
		this.n_img = n_img;
	}


	public String getN_keywords() {
		return n_keywords;
	}


	public void setN_keywords(String n_keywords) {
		this.n_keywords = n_keywords;
	}


	public String getN_content() {
		return n_content;
	}


	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	
	

	public String getN_introduce() {
		return n_introduce;
	}


	public void setN_introduce(String n_introduce) {
		this.n_introduce = n_introduce;
	}


	public File getN_image() {
		return n_image;
	}


	public void setN_image(File n_image) {
		this.n_image = n_image;
	}


	public String getN_imageFileName() {
		return n_imageFileName;
	}


	public void setN_imageFileName(String n_imageFileName) {
		this.n_imageFileName = n_imageFileName;
	}


	public String getN_imageContentType() {
		return n_imageContentType;
	}


	public void setN_imageContentType(String n_imageContentType) {
		this.n_imageContentType = n_imageContentType;
	}
	
}
