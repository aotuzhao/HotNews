package com.hotnews.entity;

import java.util.HashSet;
import java.util.Set;

public class User {
	private int u_id;
	private String u_name;
	private String u_email;
	private String u_password;
	private int u_status;
	private String u_icon;
	private Set<News> news = new HashSet<News>(0);

	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
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

	public int getU_status() {
		return u_status;
	}

	public void setU_status(int u_status) {
		this.u_status = u_status;
	}

	public String getU_icon() {
		return u_icon;
	}

	public void setU_icon(String u_icon) {
		this.u_icon = u_icon;
	}

	public Set<News> getNews() {
		return news;
	}

	public void setNews(Set<News> news) {
		this.news = news;
	}

	public User() {
		super();
	}

	// 注册
	public User(int u_status,String u_email,String u_name, String u_password, String u_icon) {
		super();
		this.u_status=u_status;
		this.u_email=u_email;
		this.u_name = u_name;
		this.u_password = u_password;
		this.u_icon = u_icon;

	}

	//测试
	public User(String u_email,int u_status, String u_name, String u_password, String u_icon) {
		super();
		this.u_email=u_email;
		this.u_status = u_status;
		this.u_name = u_name;
		this.u_password = u_password;
		this.u_icon = u_icon;

	}
}
