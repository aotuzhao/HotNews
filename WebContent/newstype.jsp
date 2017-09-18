<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@page import="com.hotnews.entity.User"%>
<%@page import="com.hotnews.entity.News"%>
<%
	User user = user = new User();
	user = (User) session.getAttribute("userSession");
	request.setCharacterEncoding("UTF-8");
	String type = (String) request.getAttribute("type");
	List<News> listNews = new ArrayList<News>();
	listNews = (List<News>) request.getAttribute("newsList");
%>
<!DOCTYPE html>
<html>
<head>
<title>Blog</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Whizz Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!--flexslider-->
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" />
<!--//flexslider-->
</head>
<body>
	<!--header-->
	<div class="header">
		<div class="container">
			<div class="header-top">
				<div class="top-nav">
					<span class="menu"><img src="images/menu.png" alt="">
					</span>
					<ul>
						<li><a href="index.action" class="color"><i
								class="glyphicon glyphicon-home"></i> </a></li>
						<li><a href="showTypeNewsAction.action?status=1&type=国际" class="hvr-bounce-to-top">国际
						</a></li>
						<li><a href="showTypeNewsAction.action?status=1&type=国内" class="hvr-bounce-to-top">国内
						</a></li>
						<li><a href="showTypeNewsAction.action?status=1&type=娱乐" class="hvr-bounce-to-top">娱乐
						</a></li>
						<li><a href="showTypeNewsAction.action?status=1&type=财经" class="hvr-bounce-to-top">财经
						</a></li>
						<li><a href="showTypeNewsAction.action?status=1&type=汽车" class="hvr-bounce-to-top">汽车
						</a></li>
						<%
						if (user == null) {
					%>
					<li><a href="login.jsp" class="hvr-bounce-to-top">登陆</a></li>
					<%
						} else {
					%>
					<li>
					<a href="userinfo.jsp" class="hvr-bounce-to-top"><%=user.getU_name()%></a>
					</li>
					<%
						}
					%>
					</ul>
					<!--script-->
					<script>
						$("span.menu").click(function() {
							$(".top-nav ul").slideToggle(500, function() {
							});
						});
					</script>
				</div>
				<div class="search-in">
					<div class="search">
						<form action="searchAction?status=1" method="post">
							<input type="text" name="keywords" class="text"> <input type="submit"
								value="SEARCH">
						</form>
						<div class="close-in">
							<img src="images/close.png" alt="" />
						</div>
					</div>
					<div class="right">
						<button></button>
					</div>
				</div>
				<script type="text/javascript">
					$('.search').hide();
					$('button').click(function() {
						$('.search').show();
						$('.text').focus();
					});
					$('.close-in').click(function() {
						$('.search').hide();
					});
				</script>
				<div class="clearfix"></div>
			</div>
			<div class="logo">
				<a href="index.action"><img src="images/log.png" alt=""> </a>
			</div>
		</div>
	</div>
	<!--//header-->

	<!--content-->
	<div class="blog">
		<div class="container">
			<h1><%=type%></h1>
			<%
				if (listNews.size() == 0) {
			%>
			<h1>没有最新新闻！</h1>
			<%
				} else {
					if (listNews.size() <= 3) {
			%>
			<div class="blog-head">
				<%
					for (News news : listNews) {
				%>
				<div class="col-md-4 blog-top">
					<div class="blog-in">
						<a href="showNewsAction?n_id=<%=news.getN_id()%>"><img class="img-responsive"
							src="${pageContext.request.contextPath}/<%=news.getN_img() %>"
							alt="新闻图片"></a>
						<div class="blog-grid">
							<h3>
								<a href="showNewsAction?n_id=<%=news.getN_id()%>" style='text-decoration:none;'><%=news.getN_title()%></a>
							</h3>
							<p><%=news.getN_introduce()%></p>

							<div class="date">
								<span class="date-in"><i
									class="glyphicon glyphicon-calendar"> </i><%=news.getN_date()%></span>
									<a href="showNewsAction?n_id=<%=news.getN_id()%>" class="comments"><i class="glyphicon glyphicon-comment"></i>
										<%=news.getN_author()%></a>
									<div class="clearfix"> </div>
							</div>
							<a href="showNewsAction.action?n_id=<%=news.getN_id()%>" class="hvr-overline-from-center more">READ
								MORE</a>
						</div>
					</div>
				</div>
				<%
					}
				%>
				<div class="clearfix"></div>
			</div>
			<%
				} else {
						int i=0;
						for (News news : listNews) {
							
		
			%>
				<div class="col-md-4 blog-top">
					<div class="blog-in">
						<a href="showNewsAction?n_id=<%=news.getN_id()%>"><img class="img-responsive"
							src="${pageContext.request.contextPath}/<%=news.getN_img() %>"
							alt=" "></a>
						<div class="blog-grid">
							<h3>
								<a href="showNewsAction?n_id=<%=news.getN_id()%>" style='text-decoration:none;'><%=news.getN_title()%></a>
							</h3>
							<p><%=news.getN_introduce()%></p>

							<div class="date">
								<span class="date-in"><i
									class="glyphicon glyphicon-calendar"> </i><%=news.getN_date()%></span>
									<a href="showNewsAction?n_id=<%=news.getN_id()%>" class="comments"><i class="glyphicon glyphicon-comment"></i>
										<%=news.getN_author()%></a>
									<div class="clearfix"> </div>
							</div>
							<a href="showNewsAction.action?n_id=<%=news.getN_id()%>" class="hvr-overline-from-center more">READ
								MORE</a>
						</div>
					</div>
				</div>
				
				<% i++;
				if(i%3==0&&i>=3){%>
				<div class="clearfix"></div>
				<%} %>
			<%
			}
			%>

			<%
				}
				}
			%>

		</div>
	</div>
	<!--//content-->
	<div class="footer">
		<div class="container">
			<div class="footer-class">
				<div class="col-md-10 class-footer">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li><a href="showTypeNewsAction.action?status=1&type=国际">国际</a></li>
						<li><a href="showTypeNewsAction.action?status=1&type=国内">国内 </a></li>
						<li><a href="showTypeNewsAction.action?status=1&type=娱乐">娱乐 </a></li>
						<li><a href="showTypeNewsAction.action?status=1&type=财经">财经 </a></li>
						<li><a href="showTypeNewsAction.action?status=1&type=汽车">汽车 </a></li>
						<li><a href="showTypeNewsAction.action?status=1&type=体育">体育 </a></li>
					</ul>
					<p class="footer-grid">Copyright &copy; 2017.Company name All
						rights reserved.</p>
				</div>
				<div class="col-md-2">
					<ul class="social">
						<li><a href="#"><i> </i></a></li>
						<li><a href="#"><i class="facebook"> </i></a></li>
						<li><a href="#"><i class="google"> </i></a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>

	</div>
</body>
</html>