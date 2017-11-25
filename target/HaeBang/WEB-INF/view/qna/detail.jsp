<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

</head>

<body>
	<div id="wrapper">
		<!-- start header -->
		<header>
	<jsp:include page="/WEB-INF/view/member_include/topmenu.jsp" />
	</header>
		<!-- end header -->
		<section id="inner-headline">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<ul class="breadcrumb">
							<li><a href="#"><i class="fa fa-home"></i></a><i class="icon-angle-right"></i></li>
							<li><a href="#">상세 게시판</a><i class="icon-angle-right"></i></li>
							<li class="active">Typography</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<section id="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-4">
						<h3>${ QnAVO.q_no }번 게시물</h3>
						<hr/>
						<h4>${ QnAVO.q_title }</h4>
						<hr/>
						<h4>${ QnAVO.q_writer }</h4>
						<hr/>
						<h4>${ QnAVO.q_content }</h4>
						<hr/>
						<h4>${ QnAVO.q_viewCnt }</h4>
						<hr/>
						<h4>${ QnAVO.q_regDate }</h4>
						<hr/>
					</div>
					<div class="col-lg-4">
						<h4>Example of paragraph</h4>
						<p>
							<strong>Lorem ipsum dolor sit amet</strong>, consetetur sadipscing elitr, sed diam non mod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
						</p>
						<p class="lead">
							At vero eos et accusam et justo duo dolores et eabum.
						</p>
						<p>
							<em>
					Consetetur sadipscing elitr, sed diam non mod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </em>
						</p>
						<p>
							<small>
					Consetetur sadipscing elitr, sed diam non mod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </small>
						</p>
					</div>
					<div class="col-lg-4">
						<h4>Float image in paragraph</h4>
						<img src="resources/img/dummies/dummy-1.jpg" alt="" class="align-left" />
						<p>
							Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam non mod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et eabum. Stet clita kasd gubergren, no sea takimata sanctus
							est Lorem ipsum dolor sit amet
						</p>
					</div>
				</div>
				<!-- divider -->
				<div class="row">
					<div class="col-lg-12">
						<div class="solidline">
						</div>
					</div>
				</div>
				<!-- end divider -->
				<!-- Descriptions -->
				<div class="row">
					<div class="col-lg-6">
						<!-- Description -->
						<h4>Description</h4>
						<dl>
							<dt>Description lists</dt>
							<dd>A description list is perfect for defining terms.</dd>
							<dt>Euismod</dt>
							<dd>Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</dd>
							<dd>Donec id elit non mi porta gravida at eget metus.</dd>
							<dt>Malesuada porta</dt>
							<dd>Etiam porta sem malesuada magna mollis euismod.</dd>
						</dl>
					</div>
					<!-- Horizontal Description -->
					<div class="col-lg-6">
						<h4>Horizontal Description</h4>
						<dl class="dl-horizontal">
							<dt>Description lists</dt>
							<dd>A description list is perfect for defining terms.</dd>
							<dt>Euismod</dt>
							<dd>Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</dd>
							<dd>Donec id elit non mi porta gravida at eget metus.</dd>
							<dt>Malesuada porta</dt>
							<dd>Etiam porta sem malesuada magna mollis euismod.</dd>
							<dt>Felis euismod semper eget lacinia</dt>
							<dd>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</dd>
						</dl>
					</div>
				</div>
				<!-- divider -->
				<div class="row">
					<div class="col-lg-12">
						<div class="solidline">
						</div>
					</div>
				</div>
				<!-- end divider -->
				<!-- Lists -->
				<div class="row">
					<!-- Unordered Lists -->
					<div class="col-lg-3">
						<h4>Unordered Lists</h4>
						<ul>
							<li>Lorem ipsum dolor sit amet</li>
							<li>Consectetur adipiscing elit</li>
							<li>Integer molestie lorem at massa</li>
							<li>Facilisis in pretium nisl aliquet</li>
							<li>Nulla volutpat aliquam velit
								<ul>
									<li>Phasellus iaculis neque</li>
									<li>Purus sodales ultricies</li>
									<li>Vestibulum laoreet porttitor sem</li>
									<li>Ac tristique libero volutpat at</li>
								</ul>
							</li>
							<li>Faucibus porta lacus fringilla vel</li>
							<li>Aenean sit amet erat nunc</li>
							<li>Eget porttitor lorem</li>
						</ul>
					</div>
					<!-- Unstyled Lists -->
					<div class="col-lg-3">
						<h4>Unstyled Lists</h4>
						<ul class="unstyled">
							<li>Lorem ipsum dolor sit amet</li>
							<li>Consectetur adipiscing elit</li>
							<li>Integer molestie lorem at massa</li>
							<li>Facilisis in pretium nisl aliquet</li>
							<li>Nulla volutpat aliquam velit
								<ul>
									<li>Phasellus iaculis neque</li>
									<li>Purus sodales ultricies</li>
									<li>Vestibulum laoreet porttitor sem</li>
									<li>Ac tristique libero volutpat at</li>
								</ul>
							</li>
							<li>Faucibus porta lacus fringilla vel</li>
							<li>Aenean sit amet erat nunc</li>
							<li>Eget porttitor lorem</li>
						</ul>
					</div>
					<!-- Ordered Lists -->
					<div class="col-lg-3">
						<h4>Ordered Lists</h4>
						<ol>
							<li>Lorem ipsum dolor sit amet</li>
							<li>Consectetur adipiscing elit</li>
							<li>Integer molestie lorem at massa</li>
							<li>Facilisis in pretium nisl aliquet</li>
							<li>Nulla volutpat aliquam velit
								<ol>
									<li>Phasellus iaculis neque</li>
									<li>Purus sodales ultricies</li>
									<li>Vestibulum laoreet porttitor sem</li>
									<li>Ac tristique libero volutpat at</li>
								</ol>
							</li>
							<li>Faucibus porta lacus fringilla vel</li>
							<li>Aenean sit amet erat nunc</li>
							<li>Eget porttitor lorem</li>
						</ol>
					</div>
					<!-- Unstyled Lists -->
					<div class="col-lg-3">
						<h4>Unstyled Lists</h4>
						<ol class="unstyled">
							<li>Lorem ipsum dolor sit amet</li>
							<li>Consectetur adipiscing elit</li>
							<li>Integer molestie lorem at massa</li>
							<li>Facilisis in pretium nisl aliquet</li>
							<li>Nulla volutpat aliquam velit
								<ol>
									<li>Phasellus iaculis neque</li>
									<li>Purus sodales ultricies</li>
									<li>Vestibulum laoreet porttitor sem</li>
									<li>Ac tristique libero volutpat at</li>
								</ol>
							</li>
							<li>Faucibus porta lacus fringilla vel</li>
							<li>Aenean sit amet erat nunc</li>
							<li>Eget porttitor lorem</li>
						</ol>
					</div>
				</div>
				<!-- divider -->
				<div class="row">
					<div class="col-lg-12">
						<div class="solidline">
						</div>
					</div>
				</div>
				<!-- end divider -->
				<div class="row">
					<div class="col-lg-4">
						<h4>Blockquote</h4>
						<blockquote>
							<i class="icon-quote-left icon-2x"></i> Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam non mod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
						</blockquote>
					</div>
					<div class="col-lg-4">
						<h4>Blockquote and cite</h4>
						<blockquote>
							<i class="icon-quote-left icon-2x"></i> Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam non mod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. <cite>John doe, Awesome Inc.</cite>
						</blockquote>
					</div>
					<div class="col-lg-4">
						<h4>Pullquote left and right</h4>
						<span class="pullquote-left">
				Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam non mod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </span>
						<span class="pullquote-right margintop10">
				Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam non mod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </span>
					</div>
				</div>
				<!-- divider -->
				<div class="row">
					<div class="col-lg-12">
						<div class="solidline">
						</div>
					</div>
				</div>
				<!-- end divider -->
				<div class="row">
					<div class="col-lg-12">
						<h4>Preformatted text</h4>
						<pre class="prettyprint linenums">
					 &lt;div class="col-lg-12"&gt;<br />
					 &nbsp;&nbsp;&lt;p&gt;Lorem ipsum dolor sit amet, consetetur sadipscing elitr..&lt;/p&gt;<br />
					 &nbsp;&nbsp;&lt;p&gt;Lorem ipsum dolor sit amet, consetetur sadipscing elitr..&lt;/p&gt;<br />
					 &nbsp;&nbsp;&lt;p&gt;Lorem ipsum dolor sit amet, consetetur sadipscing elitr..&lt;/p&gt;<br />
					 &lt;/div&gt;
				</pre>
					</div>
				</div>
			</div>
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/member_include/bottom.jsp" />
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

