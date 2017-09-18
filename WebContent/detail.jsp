<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@page import="com.hotnews.entity.User"%>
<%@page import="com.hotnews.entity.News"%>
<%
	User user = new User();
	user = (User) session.getAttribute("userSession");
	News news=(News)request.getAttribute("news");
	List<News> listNews=new ArrayList<News>();
	listNews = (List<News>) request.getAttribute("typeNews");
	if(news==null){
		news=new News();
	}
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title><%=news.getN_title()%>--热点网 全网热点 一网打尽</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<meta name="description" content="<%=news.getN_content()%>" />
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
						<li><a href="showTypeNewsAction.action?status=1&type=国际"
							class="hvr-bounce-to-top">国际 </a></li>
						<li><a href="showTypeNewsAction.action?status=1&type=国内"
							class="hvr-bounce-to-top">国内 </a></li>
						<li><a href="showTypeNewsAction.action?status=1&type=娱乐"
							class="hvr-bounce-to-top">娱乐 </a></li>
						<li><a href="showTypeNewsAction.action?status=1&type=财经"
							class="hvr-bounce-to-top">财经 </a></li>
						<li><a href="showTypeNewsAction.action?status=1&type=汽车"
							class="hvr-bounce-to-top">汽车 </a></li>
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
							<input type="text" name="keywords" class="text"> <input
								type="submit" value="SEARCH">
						</form>
						<div class="close-in">
							<img src="images/close.png" alt="关闭" />
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
	<div class="single">
		<div class="container">

			<div class="col-md-8 ">
				<div class=" single-grid">
					<a href="showNewsAction?n_id=<%=news.getN_id()%>"><img class="img-responsive"
						src="${pageContext.request.contextPath}/<%=news.getN_img() %>" alt="新闻图片" /></a>
					<div class="lone-line">
						<h4><%=news.getN_title()%></h4>
						<div class="cal">
						
							<ul>
								<li><span><i class="glyphicon glyphicon-calendar">
									</i><%=news.getN_date()%></span></li>
								<li><span><i class="glyphicon glyphicon-comment">
									</i><%=news.getN_author()%></span></li>
								
							</ul>
						</div>
						<p><%=news.getN_introduce()%></p>
						<p><%=news.getN_content()%></p>
						<!--MOB SHARE BEGIN-->
					<div class="-mob-share-ui-button -mob-share-open">分享</div>
					<div class="-mob-share-ui" style="display: none">
						<ul class="-mob-share-list">
							<li class="-mob-share-weibo"><p>新浪微博</p></li>
							<li class="-mob-share-qzone"><p>QQ空间</p></li>
							<li class="-mob-share-qq"><p>QQ好友</p></li>
							<li class="-mob-share-douban"><p>豆瓣</p></li>
							<li class="-mob-share-facebook"><p>Facebook</p></li>
							<li class="-mob-share-twitter"><p>Twitter</p></li>
						</ul>
						<div class="-mob-share-close">取消</div>
					</div>
					<div class="-mob-share-ui-bg"></div>
					<script id="-mob-share"
						src="http://f1.webshare.mob.com/code/mob-share.js?appkey=75a628ef641f73732366abd968a975c5"></script>
					<!--MOB SHARE END-->
					</div>
				</div>
				<div class=" single-profile">
					<h4>热门分类</h4>
					<div class="single-left ">
						<div class="col-md-3 post-top">
							<img class="img-responsive " src="images/si4.jpg" alt="">
							<h6><a href="showTypeNewsAction.action?status=1&type=生活">生活</a></h6>
							<p>人生难得的是活的舒适、惬意。</p>
						</div>
						<div class="col-md-3 post-top">
							<img class="img-responsive " src="images/si1.jpg" alt="">
							<h6><a href="showTypeNewsAction.action?status=1&type=财经">财经</a></h6>
							<p>当大浪退去时，我们才知道谁在裸泳。</p>
						</div>
						<div class="col-md-3 post-top">
							<img class="img-responsive " src="images/si2.jpg" alt="">
							<h6><a href="showTypeNewsAction.action?status=1&type=国际">国际</a></h6>
							<p>海阔凭鱼跃，天高任鸟飞。</p>
						</div>
						<div class="col-md-3 post-top">
							<img class="img-responsive " src="images/si3.jpg" alt="">
							<h6><a href="showTypeNewsAction.action?status=1&type=旅行">旅行</a></h6>
							<p>带动你的灵魂，去寻找生命的春光。</p>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="single-bottom"></div>
			</div>
			<div class="col-md-3 categories-grid">
				<div class="grid-categories">
					<h4>热点推荐</h4>
					<ul class="popular ">
						<% int i=0; for(News mNews:listNews) {
							
							if(i>=5){
								break;
							}
							i++;
						%>
							
						<li><a href="showNewsAction?n_id=<%=mNews.getN_id()%>"><i class="glyphicon glyphicon-ok"> </i>
								<%=mNews.getN_title()%></a></li>
						
						<%} %>
						
					</ul>
				</div>
			</div>
			<div class="clearfix"></div>

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
						<li><a href="showTypeNewsAction.action?status=1&type=国内">国内
						</a></li>
						<li><a href="showTypeNewsAction.action?status=1&type=娱乐">娱乐
						</a></li>
						<li><a href="showTypeNewsAction.action?status=1&type=财经">财经
						</a></li>
						<li><a href="showTypeNewsAction.action?status=1&type=汽车">汽车
						</a></li>
						<li><a href="showTypeNewsAction.action?status=1&type=体育">体育
						</a></li>
					</ul>
					<p class="footer-grid">Copyright &copy; 2017.Company name All
						rights reserved.</p>

				</div>
				<div class="col-md-2">


					<!--MOB SHARE BEGIN-->
					<div class="-mob-share-ui-button -mob-share-open">分享</div>
					<div class="-mob-share-ui" style="display: none">
						<ul class="-mob-share-list">
							<li class="-mob-share-weibo"><p>新浪微博</p></li>
							<li class="-mob-share-qzone"><p>QQ空间</p></li>
							<li class="-mob-share-qq"><p>QQ好友</p></li>
							<li class="-mob-share-douban"><p>豆瓣</p></li>
							<li class="-mob-share-facebook"><p>Facebook</p></li>
							<li class="-mob-share-twitter"><p>Twitter</p></li>
						</ul>
						<div class="-mob-share-close">取消</div>
					</div>
					<div class="-mob-share-ui-bg"></div>
					<script id="-mob-share"
						src="http://f1.webshare.mob.com/code/mob-share.js?appkey=75a628ef641f73732366abd968a975c5"></script>
					<!--MOB SHARE END-->
				</div>
				<div class="clearfix"></div>
			</div>
		</div>

	</div>
</body>
</html>