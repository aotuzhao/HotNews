package com.hotnews.entity;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class News {
	private int n_id;
	private String n_title;
	private String n_type;
	private String n_source;
	private String n_author;
	private Date n_date;
	private String n_img;
	private String n_keywords;
	private String n_content;
	private String n_introduce;
	private int n_status;//0-审核未通过，1-审核通过
	private Set<User> users=new HashSet<User>(0);
	public int getN_id() {
		return n_id;
	}
	public void setN_id(int n_id) {
		this.n_id = n_id;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_type() {
		return n_type;
	}
	public void setN_type(String n_type) {
		this.n_type = n_type;
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
	
	
	public String getN_introduce() {
		return n_introduce;
	}
	public void setN_introduce(String n_introduce) {
		this.n_introduce = n_introduce;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public int getN_status() {
		return n_status;
	}
	public void setN_status(int n_status) {
		this.n_status = n_status;
	}
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	
	public News(){
		super();
	}
	
	//创建
	public News(String n_title,String n_type,String n_source,String n_author,Date n_date,String n_keywords,String n_introduce,String n_content,int n_status,String n_img){
		super();
		this.n_title=n_title;
		this.n_type=n_type;
		this.n_author=n_author;
		this.n_source=n_source;
		this.n_content=n_content;
		this.n_introduce=n_introduce;
		this.n_keywords=n_keywords;
		this.n_status=n_status;
		this.n_img=n_img;
		this.n_date=n_date;
	}
}
