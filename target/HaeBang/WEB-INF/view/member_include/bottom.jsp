<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
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

</head>
<style>
	#hi {
	
		background-color : skyblue;
		family-font : bold;
		width : 500px;
		height : 50px;
	
	}
</style>
<script src="https://code.jquery.com/jquery-1.11.1.min.js">
		
	</script>
	<!-- Bootstrap JavaScript -->
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

	<!-- Custom JavaScript -->
	<script src="${ pageContext.request.contextPath }/resources/js/custom.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/checkForm.js"></script>
	
	<div class="container">
				<div class="row">
					<div class="col-lg-3">
						<div class="widget">
							<h5 class="widgetheading">Get in touch with us</h5>
							<address>
					<strong>HaeBang company Inc</strong><br>
					 서울특별시 서초구 서초대로74길33 <br>
					 비트빌 4층 </address>
							<p>
								<i class="icon-phone"></i>  02-3486-3456 - 02-3486-7890 <br>
								<i class="icon-envelope-alt"></i> juhojuho@haebang.com
							</p>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="widget">
							<h5 class="widgetheading">Pages</h5>
							<ul class="link-list">
								<li><a href="#">Press release</a></li>
								<li><a href="#">Terms and conditions</a></li>
								<li><a href="#">Privacy policy</a></li>
								<li><a href="${ pageContext.request.contextPath }/admin/main">임시관리자페이지</a></li>
								<li><a href="${ pageContext.request.contextPath }/ceo">사장님 사이트</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="widget">
							<h5 class="widgetheading">FAQ</h5>
							<ul class="link-list">
								<li><a href="#">바퀴가 너무 많이 보여요...도와주세요</a></li>
								<li><a href="#">서비스 최소범위가 어떻게되는지요?</a></li>
								<li><a href="#">우리집엔 개미가 산다!</a></li>
								<li><a href="#">더 보기</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="widget">
							<h5 class="widgetheading">Flickr photostream</h5>
							<div class="flickr_badge">
								<script type="text/javascript" src="https://www.flickr.com/badge_code_v2.gne?count=8&amp;display=random&amp;size=s&amp;layout=x&amp;source=user&amp;user=34178660@N03"></script>
							</div>
							<div class="clear">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="sub-footer">
				<div class="container">
					<div class="row">
						<div class="col-lg-6">
							<div class="copyright">
								<p>&copy; Moderna Theme. All right reserved.</p>
								<div class="credits">
									<!--
                    All the links in the footer should remain intact.
                    You can delete the links only if you purchased the pro version.
                    Licensing information: https://bootstrapmade.com/license/
                    Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Moderna
                  -->
									<a href="https://bootstrapmade.com/">Free Bootstrap Themes</a> by <a href="https://bootstrapmade.com/">BootstrapMade</a>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<ul class="social-network">
								<li><a href="#" data-placement="top" title="Facebook"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#" data-placement="top" title="Twitter"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#" data-placement="top" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="#" data-placement="top" title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
								<li><a href="#" data-placement="top" title="Google plus"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
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