<%@page import="com.hotnews.entity.News"%>
<%@ taglib prefix="page" uri="/WEB-INF/mytld/pagetag.tld"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	List<News> listNews = (List<News>)request.getAttribute("listNews");
	if(listNews==null) listNews = new ArrayList<News>();
%>
<!DOCTYPE>
<html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理系统</title>
<link type="text/css" rel="stylesheet" href="css/style3.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
</head>

<body>
<div class="top"></div>
<div id="header">
	<div class="logo">热点网后台管理系统</div>
	<div class="navigation">
		<ul>
		 	<li>欢迎您！</li>
			<li>管理员</li>
			<li><a href="index.action">返回前台</a></li>
			<li><a href="createnews.jsp">添加新闻</a></li>
			<li><a href="loginOutAction.action">退出</a></li>
		</ul>
	</div>
</div>
<div id="content">
	<div class="left_menu">
				<ul id="nav_dot">
       <li>
          <h4 class="M1"><span></span> <a href="showAllUserAction.action">用户管理</a></h4>
         
        </li>
        <li>
          <h4 class="M2"><span></span> <a href="showAllNewsAction.action">新闻管理</a></h4>
         
        </li>
         
  </ul>
		</div>
		<div class="m-right">
			<div class="right-nav">
					<ul>
							<li><img src="images/home.png"></li>
								<li style="margin-left:25px;">您当前的位置：</li>
								<li><a href="#">新闻管理</a></li>
								<li>></li>
								<li><a href="#">最新信息</a></li>
						</ul>
			</div>
			<div class="main">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                	<td width="3%" height="22"  bgcolor="#FFFFFF"><div align="center"><span >序号</span></div></td>
	                <td width="3%" height="22"  bgcolor="#FFFFFF"><div align="center"><span >标题</span></div></td>
	                <td width="3%" height="22"  bgcolor="#FFFFFF"><div align="center"><span >类型</span></div></td>
	                <td width="3%" height="22"  bgcolor="#FFFFFF"><div align="center"><span >作者</span></div></td>
	                <td width="3%" height="22"  bgcolor="#FFFFFF"><div align="center"><span >关键字</span></div></td>
	                <td width="3%" height="22"  bgcolor="#FFFFFF"><div align="center"><span >日期</span></div></td>
	                <td width="3%" height="22"  bgcolor="#FFFFFF"><div align="center"><span >操作</span></div></td>
               </tr>
               
                <%
                	for (Iterator<News> iterator2 = listNews.iterator(); iterator2.hasNext();) {
						News news= iterator2.next();
				%>	
					<tr>
	               	<td width="3%" height="22"  bgcolor="#FFFFFF"><div align="center"><span ><%=news.getN_id() %></span></div></td>
	                <td width="3%" height="22"  bgcolor="#FFFFFF"><div align="center"><span ><a href="showNewsAction?n_id=<%=news.getN_id()%>"><%=news.getN_title() %></a></span></div></td>
	                <td width="3%" height="22"  bgcolor="#FFFFFF"><div align="center"><span ><%=news.getN_type() %></span></div></td>
	                <td width="3%" height="22"  bgcolor="#FFFFFF"><div align="center"><span ><%=news.getN_author() %></span></div></td>
	                <td width="3%" height="22"  bgcolor="#FFFFFF"><div align="center"><span ><%=news.getN_keywords() %></span></div></td>
	                <td width="3%" height="22"  bgcolor="#FFFFFF"><div align="center"><span ><%=news.getN_date() %></span></div></td>
	                <td width="3%" height="22"  bgcolor="#FFFFFF"><div align="center"><span >
	                <a href="deleteNewsAction.action?n_id=<%=news.getN_id() %>">删除</a> 
	                <%
	                	if(news.getN_status()==0){
	                 %>
	                <a href="checkNewsAction.action?n_id=<%=news.getN_id()%>">审核通过</a>
	                
	                <%
	               		}else if(news.getN_status()==1){
	               	%>
	               	<a href="checkNewsAction.action?n_id=<%=news.getN_id()%>">撤销通过</a>
	               	<%
	               		}
	                 %>
	                
	                
	                
	                </span></div></td>
                	</tr>	
				<%		
					}
                 %>
                 <tr >
                	<td algin="center" colspan="7">
                		<page:page pager="${pb}" />
                	</td>
                </tr>
                </table>
                </div>
                </div>
</div>
<div class="bottom"></div>
<div id="footer">	热点网版本1.0&copy</div>
</body>

</html>
