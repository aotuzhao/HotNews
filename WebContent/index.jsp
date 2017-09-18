<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@page import="com.hotnews.entity.User"%>
<%@page import="com.hotnews.entity.News"%>
<%
	User user = new User();
	user = (User) session.getAttribute("userSession");
	List<News> listNews=new ArrayList<News>();
	listNews = (List<News>) request.getAttribute("indexNews");
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>热点网--热点新闻 一网打尽--Home</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />


<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<script src="js/jquery.min.js"></script>

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
	<div class="content">
		<div class="services">
			<div class="container">
				<h2>热点速览</h2>
				<div class="service-top">
					<div class="col-md-3 top-service">
						<i> </i> <a href="showTypeNewsAction.action?status=1&type=汽车" style='text-decoration: none;'><h5>汽车热点</h5></a>
						<p>拥有博爱和向往自由的人，他们叫----骑士！</p>
					</div>
					<div class="col-md-3 top-service">
						<i class="ic"> </i> <a href="showTypeNewsAction.action?status=1&type=国际"
							style='text-decoration: none;'><h5>国际热点</h5></a>
						<p>海阔凭鱼跃，天高任鸟飞。</p>
					</div>
					<div class="col-md-3 top-service">
						<i class="ic1"> </i> <a href="showTypeNewsAction.action?status=1&type=体育"
							style='text-decoration: none;'><h5>体育热点</h5></a>
						<p>生命在于运动! </p>
					</div>
					<div class="col-md-3 top-service">
						<i class="ic2"> </i> <a href="showTypeNewsAction.action?status=1&type=娱乐"
							style='text-decoration: none;'><h5>娱乐热点</h5></a>
						<p>娱乐使生活更多彩!</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="service-top">
					<div class="col-md-3 top-service">
						<i class="ic3"> </i> <a href="showTypeNewsAction.action?status=1&type=国内"
							style='text-decoration: none;'><h5>国内热点</h5></a>
						<p>国家大事，事事关心！</p>
					</div>
					<div class="col-md-3 top-service">
						<i class="ic4"> </i> <a href="showTypeNewsAction.action?status=1&type=生活"
							style='text-decoration: none;'><h5>生活热点</h5></a>
						<p>人生难得的是活的舒适、惬意。</p>
					</div>
					<div class="col-md-3 top-service">
						<i class="ic5"> </i> <a href="showTypeNewsAction.action?status=1&type=旅行"
							style='text-decoration: none;'><h5>旅行热点</h5></a>
						<p>爆带动你的灵魂，去寻找生命的春光。</p>
					</div>
					<div class="col-md-3 top-service">
						<i class="ic6"> </i> <a href="showTypeNewsAction.action?status=1&type=财经"
							style='text-decoration: none;'><h5>财经热点</h5></a>
						<p>当大浪退去时，我们才知道谁在裸泳。</p>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>

		<!--news-->
		<div class="container">
			<div class=" grid-middle">
				<h3>Latest-News</h3>
				
				
					<% int i=1; for(News mNews:listNews) {
							
							if(i>=5){
								break;
							}
							
						%>
						<%
						if(i%2==1){
						
							%>
						<div class="news-top">
						
						<%} 
						
						
						if(i%2==1){ %>
						<div class=" col-md-6 latest-grid">
						<div class="col-md-9 news-in">
							<h5><a href="showNewsAction?n_id=<%=mNews.getN_id()%>"><%=mNews.getN_title()%></a></h5>
							<p><%=mNews.getN_introduce()%></p>
						</div>
						<div class="col-md-3 news">
							<h4>
								<%=i %><span>Top</span>
							</h4>
						</div>
						<div class="clearfix"></div>
					</div>	
						<%}else{ %>
							<div class=" col-md-6 latest-grid">
							<div class="col-md-3 news">
							<h4>
								<%=i %><span>Top</span>
							</h4>
						</div>
						<div class="col-md-9 news-in">
							<h5><a href="showNewsAction?n_id=<%=mNews.getN_id()%>"><%=mNews.getN_title()%></a></h5>
							<p><%=mNews.getN_introduce()%></p>
						</div>
						
						<div class="clearfix"></div>
					</div>	
						<%} %>
						<%
						if(i%2==0&&i>=2){
						
							%>
							<div class="clearfix"></div>
							</div>
						<%}
						i++;
					} %>
					
				

			</div>

			<!--content-top-->
			<div class="content-top">
				<div class="col-md-4 top-content">
					<a href="showTypeNewsAction.action?status=1&type=旅行"><img class="img-responsive"
						src="images/pic.jpg" alt=""></a>
					<h4>
						<a href="showTypeNewsAction.action?status=1&type=旅行">旅行</a>
					</h4>
					<p>带动你的灵魂，去寻找生命的春光。</p>
				</div>
				<div class="col-md-4 top-content">
					<a href="showTypeNewsAction.action?status=1&type=娱乐"><img class="img-responsive"
						src="images/pic1.jpg" alt=""></a>
					<h4>
						<a href="showTypeNewsAction.action?status=1&type=娱乐">娱乐</a>
					</h4>
					<p>懂得放松的人走的更远。</p>
				</div>
				<div class="col-md-4 top-content">
					<a href="showTypeNewsAction.action?status=1&type=生活"><img class="img-responsive"
						src="images/pic2.jpg" alt=""></a>
					<h4>
						<a href="showTypeNewsAction.action?status=1&type=生活">生活</a>
					</h4>
					<p>人生难得的是活的舒适、惬意。</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!--//content-top-->
		<div class="contact-me">
			<div class="container">
				<h3>About Us</h3>
				<div class="contact-top">
					<div class="col-md-3 contact-fax">
						<i class="glyphicon glyphicon-map-marker"></i>
						<p>ZZU</p>
					</div>
					<div class="col-md-3 contact-fax">
						<i class="glyphicon glyphicon-phone"></i>
						<p>188****5470</p>
					</div>
					<div class="col-md-3 contact-fax">
						<a href="#"><i class="glyphicon glyphicon-envelope"></i></a>
						<p>
							<a href="mailto:aotu1996@qq.com">aotu1996@qq.com</a>
						</p>
					</div>
					<div class="col-md-3 contact-fax">
						<i class="glyphicon glyphicon-print"></i>
						<p>Contrary to popular</p>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
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
