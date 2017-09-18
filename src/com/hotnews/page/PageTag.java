package com.hotnews.page;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.struts2.ServletActionContext;

import com.hotnews.page.Pager;

public class PageTag extends TagSupport {
	 private static final long serialVersionUID = 1L;
	 private Pager pager;
	 public int doStartTag() {
	    try {
	     JspWriter out = pageContext.getOut();
	     out.print("第 " + pager.getCurrentPage() + " 页/共 " + (pager.getTotalPages()) + " 页");
	     if (pager.getCurrentPage() == 1) {
	      out.print("[最首页]");
	      out.print("[上一页]");
	     }
	     if (pager.getCurrentPage() != 1) {
	      out.print("[<a href='" + pager.getLinkUrl() + "cpage=1'>首页</a>]");
	      out.print("[<a href='" + pager.getLinkUrl() + "cpage=" + (pager.getCurrentPage() - 1) + "'>上一页</a>]");
	     }
	     for (int i = pager.getCurrentPage() - 3; i <= pager.getCurrentPage() + 3; i++) {
	      if (i <= 0 || i > pager.getTotalPages()) {
	       continue;
	      }
	      if (i == pager.getCurrentPage()) {
	       out.print("[<span style='color:#FF0000; border: 1px solid #cccccc; font-weight:bold; width:15px;text-align: center;'> " + i + " </span>]");
	      } else {
	       out.print("[<a href='" + pager.getLinkUrl() + "cpage=" + i + "'> " + i + " </a>]");
	      }
	     }
	     if (pager.getCurrentPage() == pager.getTotalPages() || pager.getTotalPages() == 0) {
		      out.print("[下一页]");
		      out.print("[最末页]");
		     }
	     if (pager.getCurrentPage() != pager.getTotalPages() && pager.getTotalPages() != 0) {
		      out.print("[<a href='" + pager.getLinkUrl() + "cpage=" + (pager.getCurrentPage() + 1) + "'>下一页</a>]");
		      out.print("[<a href='" + pager.getLinkUrl() + "cpage=" + (pager.getTotalPages()) + "'>最末页</a>]");
		     }
	     out.flush();
	    } catch (IOException e) {
	     e.printStackTrace();
	    }
	    return super.SKIP_BODY;
	 }
	 public int doEndTag() {
	  return super.EVAL_PAGE;
	 }
	 public void setPager(Pager pager) {
	  this.pager = pager;
	 }
	 public Pager getPager() {
	  return pager;
	 }
	}
