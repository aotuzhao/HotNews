package com.hotnews.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

import com.hotnews.entity.User;
import com.hotnews.service.UserDao;

public class Test {

	@org.junit.Test
	public void testCreateDB(){
		Configuration cfg = new Configuration().configure();
		SchemaExport se = new SchemaExport(cfg);
		se.create(true, true);
	}
	
	@org.junit.Test
	public void one() {
		User u=new User("admin@qq.com",0,"admin", "admin","");
		UserDao.saveUser(u);

	}
}
