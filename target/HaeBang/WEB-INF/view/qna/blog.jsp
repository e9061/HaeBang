<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Moderna - Bootstrap 3 flat corporate template</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<!-- css -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="resources/css/jcarousel.css" rel="stylesheet" />
<link href="resources/css/flexslider.css" rel="stylesheet" />
<link href="resources/css/style.css" rel="stylesheet" />


<!-- Theme skin -->
<link href="resources/skins/default.css" rel="stylesheet" />

<!-- =======================================================
    Theme Name: Moderna
    Theme URL: https://bootstrapmade.com/free-bootstrap-template-corporate-moderna/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
	======================================================= -->
<!-- <script type="text/javascript">
	function doAction() {
		location.href = "${ pageContext.request.contextPath }/qna/write"

	}
</script> -->
</head>

<body>
	<div id="wrapper">
		<header> <jsp:include page="../member_include/topmenu.jsp" />
		</header>
		<section id="inner-headline">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="#"><i class="fa fa-home"></i></a><i
							class="icon-angle-right"></i></li>
						<li class="active">Blog</li>
					</ul>
				</div>
			</div>
		</div>
		</section>
		<section id="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<article> 
					<div>
						<h2>
							<span>QnA 작성</span>
						</h2>
						<form:form commandName="QnAVO" method="post">
							<table border="1" width="80%">
								<tr>
									<th width="25%">제목</th>
									<td><form:input path="q_title" class="form-control"/></td>
								</tr>
								<tr>
									<th width="25%">글쓴이</th>
									<td><form:input id="q_writer" class="form-control" placeholder="${ userVO.m_name }" name ="q_writer" value="${ userVO.m_name }" path="q_writer" readonly="true" /></td>
								</tr>
								<tr>
									<th width="25%">내용</th>
									<td><form:textarea rows="7" cols="10" class="form-control" path="q_content" /></td>
								</tr>
							</table>
							<input type="submit" value="등록" />
						</form:form>
					</div>
					<div class="post-slider">
						<div class="post-heading">
							<h3>
								<a href="#">This is an example of slider post format</a>
							</h3>
						</div>
						<!-- start flexslider -->
						<div id="post-slider" class="flexslider">
							<ul class="slides">
								<li><img src="resources/img/dummies/blog/img1.jpg" alt="" />
								</li>
								<li><img src="resources/img/dummies/blog/img2.jpg" alt="" />
								</li>
								<li><img src="resources/img/dummies/blog/img3.jpg" alt="" />
								</li>
							</ul>
						</div>
						<!-- end flexslider -->
					</div>
					<p>Qui ut ceteros comprehensam. Cu eos sale sanctus eligendi,
						id ius elitr saperet, ocurreret pertinacia pri an. No mei nibh
						consectetuer, semper laoreet perfecto ad qui, est rebum nulla
						argumentum ei. Fierent adipisci iracundia est ei, usu timeam
						persius ea. Usu ea justo malis, pri quando everti electram ei, ex
						homero omittam salutatus sed.</p>
					<div class="bottom-article">
						<ul class="meta-post">
							<li><i class="icon-calendar"></i><a href="#"> Mar 23,
									2013</a></li>
							<li><i class="icon-user"></i><a href="#"> Admin</a></li>
							<li><i class="icon-folder-open"></i><a href="#"> Blog</a></li>
							<li><i class="icon-comments"></i><a href="#">4 Comments</a></li>
						</ul>
						<a href="#" class="pull-right">Continue reading <i
							class="icon-angle-right"></i></a>
					</div>
					</article>
					<article>
					<div class="post-quote">
						<div class="post-heading">
							<h3>
								<a href="#">Nice example of quote post format below</a>
							</h3>
						</div>
						<blockquote>
							<i class="icon-quote-left"></i> Lorem ipsum dolor sit amet, ei
							quod constituto qui. Summo labores expetendis ad quo, lorem
							luptatum et vis. No qui vidisse signiferumque...
						</blockquote>
					</div>
					<div class="bottom-article">
						<ul class="meta-post">
							<li><i class="icon-calendar"></i><a href="#"> Mar 23,
									2013</a></li>
							<li><i class="icon-user"></i><a href="#"> Admin</a></li>
							<li><i class="icon-folder-open"></i><a href="#"> Blog</a></li>
							<li><i class="icon-comments"></i><a href="#">4 Comments</a></li>
						</ul>
						<a href="#" class="pull-right">Continue reading <i
							class="icon-angle-right"></i></a>
					</div>
					</article>
					<article>
					<div class="post-video">
						<div class="post-heading">
							<h3>
								<a href="#">Amazing video post format here</a>
							</h3>
						</div>
						<div class="video-container">
							<iframe
								src="http://player.vimeo.com/video/30585464?title=0&amp;byline=0">
							</iframe>
						</div>
					</div>
					<p>Qui ut ceteros comprehensam. Cu eos sale sanctus eligendi,
						id ius elitr saperet, ocurreret pertinacia pri an. No mei nibh
						consectetuer, semper laoreet perfecto ad qui, est rebum nulla
						argumentum ei. Fierent adipisci iracundia est ei, usu timeam
						persius ea. Usu ea justo malis, pri quando everti electram ei.</p>
					<div class="bottom-article">
						<ul class="meta-post">
							<li><i class="icon-calendar"></i><a href="#"> Mar 23,
									2013</a></li>
							<li><i class="icon-user"></i><a href="#"> Admin</a></li>
							<li><i class="icon-folder-open"></i><a href="#"> Blog</a></li>
							<li><i class="icon-comments"></i><a href="#">4 Comments</a></li>
						</ul>
						<a href="#" class="pull-right">Continue reading <i
							class="icon-angle-right"></i></a>
					</div>
					</article>
					<div id="pagination">
						<span class="all">Page 1 of 3</span> <span class="current">1</span>
						<a href="#" class="inactive">2</a> <a href="#" class="inactive">3</a>
					</div>
				</div>
				<div class="col-lg-4">
					<aside class="right-sidebar">
					<div class="widget">
						<form class="form-search">
							<input class="form-control" type="text" placeholder="Search..">
						</form>
					</div>
					<div class="widget">
						<h5 class="widgetheading">Categories</h5>
						<ul class="cat">
							<li><i class="icon-angle-right"></i><a href="#">Web
									design</a><span> (20)</span></li>
							<li><i class="icon-angle-right"></i><a href="#">Online
									business</a><span> (11)</span></li>
							<li><i class="icon-angle-right"></i><a href="#">Marketing
									strategy</a><span> (9)</span></li>
							<li><i class="icon-angle-right"></i><a href="#">Technology</a><span>
									(12)</span></li>
							<li><i class="icon-angle-right"></i><a href="#">About
									finance</a><span> (18)</span></li>
						</ul>
					</div>
					<div class="widget">
						<h5 class="widgetheading">Latest posts</h5>
						<ul class="recent">
							<li><img src="resources/img/dummies/blog/65x65/thumb1.jpg"
								class="pull-left" alt="" />
								<h6>
									<a href="#">Lorem ipsum dolor sit</a>
								</h6>
								<p>Mazim alienum appellantur eu cu ullum officiis pro pri</p></li>
							<li><a href="#"><img
									src="resources/img/dummies/blog/65x65/thumb2.jpg"
									class="pull-left" alt="" /></a>
								<h6>
									<a href="#">Maiorum ponderum eum</a>
								</h6>
								<p>Mazim alienum appellantur eu cu ullum officiis pro pri</p></li>
							<li><a href="#"><img
									src="resources/img/dummies/blog/65x65/thumb3.jpg"
									class="pull-left" alt="" /></a>
								<h6>
									<a href="#">Et mei iusto dolorum</a>
								</h6>
								<p>Mazim alienum appellantur eu cu ullum officiis pro pri</p></li>
						</ul>
					</div>
					<div class="widget">
						<h5 class="widgetheading">Popular tags</h5>
						<ul class="tags">
							<li><a href="#">Web design</a></li>
							<li><a href="#">Trends</a></li>
							<li><a href="#">Technology</a></li>
							<li><a href="#">Internet</a></li>
							<li><a href="#">Tutorial</a></li>
							<li><a href="#">Development</a></li>
						</ul>
					</div>
					</aside>
				</div>
			</div>
		</div>
		</section>
		<footer> <jsp:include page="/WEB-INF/view/member_include/bottom.jsp" />
		</footer>
	</div>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="resources/js/jquery.js"></script>
	<script src="resources/js/jquery.easing.1.3.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.fancybox.pack.js"></script>
	<script src="resources/js/jquery.fancybox-media.js"></script>
	<script src="resources/js/google-code-prettify/prettify.js"></script>
	<script src="resources/js/portfolio/jquery.quicksand.js"></script>
	<script src="resources/js/portfolio/setting.js"></script>
	<script src="resources/js/jquery.flexslider.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>

</body>

</html>
