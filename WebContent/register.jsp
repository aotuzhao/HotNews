<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String s = (String)request.getAttribute("error");
	if(s==null) s="";

%>

<!DOCTYPE html>
<html>
	<head>
		<title>Single</title>
		<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
			<script src="js/jquery.min.js"></script>
			<link href="css/login.css" rel="stylesheet" type="text/css" />
			<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	

		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="Whizz Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
			martphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
			
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--flexslider-->
		<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
<!--//flexslider-->
	</head>
<body>
<!--header-->

<div class="header">
	<div class="container">
		<div class="header-top">
		<div class="top-nav">
			<span class="menu"><img src="images/menu.png" alt=""> </span>
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
						<li><a href="showTypeNewsAction.action?status=1&type=体育" class="hvr-bounce-to-top">体育
						</a></li>
						<li><a href="showTypeNewsAction.action?status=1&type=体育" class="hvr-bounce-to-top">生活</a></li>
						<div class="clearfix"></div>
					</ul>
					<!--script-->
				<script>
					$("span.menu").click(function(){
						$(".top-nav ul").slideToggle(500, function(){
						});
					});
			</script>	
		</div>
		 <div class="search-in" >
			<div class="search" >
				<form action="searchAction?status=1" method="post">
							<input type="text" name="keywords" class="text"> <input type="submit"
								value="SEARCH">
						</form>
				<div class="close-in"><img src="images/close.png" alt="" /></div>
			</div>
			<div class="right"><button> </button></div>
		</div>
			<script type="text/javascript">
				$('.search').hide();
				$('button').click(function (){
				$('.search').show();
				$('.text').focus();
				}
				);
				$('.close-in').click(function(){
				$('.search').hide();
				});
			</script>
			<div class="clearfix"> </div>
		</div>
		<div class="logo">
			<a href="index.action"><img src="images/log.png" alt="">	</a>	
		</div>
	</div>
</div>
<!--//header-->
<!--content-->
<div class="content">
		<div class="style">
	<form action="registerAction" enctype="multipart/form-data" method="post" name="formLogin" class="basic-grey">
    	<div class="styleFont">邮箱注册：</div>
        <div class="styleForm"><input type="email" name="u_email" placeholder="xxxx@qq.com" /></div>
        <div class="styleFont">用户昵称：</div>
        <div class="styleForm"><input type="text" name="u_name" placeholder="阿萨德" /></div>
        <div class="styleFont">用户头像：</div>
        <div class="styleForm"><input type="file"  name="u_image" size="30" /></div> 
    	<div class="styleFont">输入密码：</div>
        <div class="styleForm"><input type="password" name="u_password" placeholder="请使用数字和字母组合更安全！" /></div>     	
        <div class="styleerror"><label><input type="checkbox" id="mobile_check" class="checkbox" checked="1">我已阅读并同意用户使用协议</label></div> 
	     <div class="bu"><input type="submit" class="button" value="注册" /></div>
	     <div class="error"><%=s %></div>
     </form>
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
					 <p class="footer-grid">Copyright &copy; 2017.Company name All rights reserved.</p>

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

