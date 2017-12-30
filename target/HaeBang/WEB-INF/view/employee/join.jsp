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
	<link href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet" />
	<link href="${ pageContext.request.contextPath }/resources/css/fancybox/jquery.fancybox.css" rel="stylesheet">
	<link href="${ pageContext.request.contextPath }/resources/css/jcarousel.css" rel="stylesheet" />
	<link href="${ pageContext.request.contextPath }/resources/css/flexslider.css" rel="stylesheet" />
	<link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet" />


	<!-- Theme skin -->
	<link href="${ pageContext.request.contextPath }/resources/skins/default.css" rel="stylesheet" />

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
		
		<header> <jsp:include page="../employee_include/topmenu.jsp" />
		</header>
		<!-- end header -->
		<section id="inner-headline">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<ul class="breadcrumb">
							<li><a href="#"><i class="fa fa-home"></i></a><i class="icon-angle-right"></i></li>
							<li><a href="#">Features</a><i class="icon-angle-right"></i></li>
							<li class="active">Typography</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<section id="content">
			<div class="container">
				<div class="top_spot bg_acc">
				<p>WELCOME TO 마케팅 센터 회원가입</p>
				<strong>사장님 지금 바로 <span>해방</span>과 함께하세요!</strong>
				<b>간편한 회원가입으로 내 업체는 오늘부터 손쉽게 관리 OK</b>
				여기어때 마케팅 센터 회원이 되시면 손쉬운 업체관리부터<br/>
				리얼리뷰, 서비스 통계, 다양한 혜택들을 살펴보세요.
			</div><br/>
				<!-- divider -->
				<div class="row">
					<div class="col-lg-12">
						<div class="solidline">
						</div>
					</div>
				</div>
				<!-- end divider -->
				<!-- Descriptions -->
				<div class="row" >
					<div class="col-lg-1 " >
						<!-- Description -->
					</div>
					
					<div class="col-lg-4 alert alert-success">
						<!-- Description -->
						<dl>
							<dt><h4>신규 업체 등록</h4></dt>
							<dd>해방은 처음이신가요?</dd>
							<dd>신규업체 등록 원하시는 사장님</dd>
						</dl><br/>
						<a href="step1?type=O" class="btn btn-info btn-rounded">가 입 하 기</a>
					</div>
						<div class="col-lg-1 " >
						<!-- Description -->
					</div>
					<!-- Horizontal Description -->
			<div class="col-lg-4 alert alert-success">
						<!-- Description -->
						<dl>
							<dt><h4>직원 회원 가입</h4></dt>
							<dd>해방맨이 되어주세요!</dd>
							<dd>신규 직원 등록 원하시는 직원님</dd>
						</dl><br/>
						<a href="step1?type=M" class="btn btn-info btn-rounded">가 입 하 기</a>
					</div>
					<div class="col-lg-3 " >
						<!-- Description -->
						
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
				
			</div>
		</section>
			<footer> <jsp:include page="../employee_include/bottom.jsp" />
		</footer>
	</div>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="${ pageContext.request.contextPath }/resources/js/jquery.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/jquery.easing.1.3.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/jquery.fancybox.pack.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/jquery.fancybox-media.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/google-code-prettify/prettify.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/portfolio/jquery.quicksand.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/portfolio/setting.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/jquery.flexslider.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/animate.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/custom.js"></script>

</body>

</html>