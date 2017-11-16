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
	<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
	<link href="resources/css/fancybox/jquery.fancybox.css" rel="stylesheet">
	<link href="resources/css/jcarousel.css" rel="stylesheet" />
	<link href="resources/css/flexslider.css" rel="stylesheet" />
	<link href="resources/css/style.css" rel="stylesheet" />



	<!-- Theme skin -->
	<link href="resources/skins/default.css" rel="stylesheet" />

</head>
<script src="https://code.jquery.com/jquery-1.11.1.min.js">
		
	</script>
	<!-- Bootstrap JavaScript -->
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

	<!-- Custom JavaScript -->
	<script src="resources/js/custom.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/checkForm.js"></script>
		
<body>
	<div id="wrapper">
		<!-- start header -->
		<header>
			<div class="navbar navbar-default navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
						<a class="navbar-brand" href="/HaeBang"><span>H</span>aeBang</a>
					</div>
					<div class="navbar-collapse collapse ">
						<ul class="nav navbar-nav">
							<li class="active"><a href="/HaeBang">Home</a></li>
							<li><a href="${ pageContext.request.contextPath }/qna/list">신청</a></li>
							<li><a href="${ pageContext.request.contextPath }/member/myPage">서비스목록</a></li>

						<c:choose> 
							<c:when test="${ empty userVO }">
								<li><a href="${ pageContext.request.contextPath }/member/join">회원가입</a></li> 
	        					<li><a href="${ pageContext.request.contextPath }/member/loginForm">로그인</a></li>
      						   </c:when>
							<c:otherwise>
								<li><a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">${ userVO.m_id }<b class=" icon-angle-down"></b></a></li>
									<li><a href="${ pageContext.request.contextPath }/member/myPage">내 정보 확인</a></li>
          						<li><a href="${ pageContext.request.contextPath }/member/logout">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</header>
		
		<!-- end header -->
		<section id="featured">
			<!-- start slider -->
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<!-- Slider -->
						<div id="main-slider" class="flexslider">
							<ul class="slides">
								<!-- 1st 슬라이더 -->
								<li>
									<img src="resources/img/slides/1.jpg" alt="" />
									<div class="flex-caption">
										<!-- 슬라이더위에 메모창 -->
										<h3>Modern Design</h3>
										<p>Duis fermentum auctor ligula ac malesuada. Mauris et metus odio, in pulvinar urna</p>
										<a href="#" class="btn btn-theme">Learn More</a>
										<!-- ------------ -->
									</div>
								</li>
								<!-- 2nd 슬라이더 -->
								<li>
									<img src="resources/img/slides/2.jpg" alt="" />
									<div class="flex-caption">
										<!-- 슬라이더위에 메모창 -->
										<h3>Fully Responsive</h3>
										<p>Sodales neque vitae justo sollicitudin aliquet sit amet diam curabitur sed fermentum.</p>
										<a href="#" class="btn btn-theme">Learn More</a>
										<!-- ------------ -->
									</div>
								</li>
								<!-- 3nd 슬라이더 -->
								<li>
									<img src="resources/img/slides/3.jpg" alt="" />
									<div class="flex-caption">
										<!-- 슬라이더위에 메모창 -->
										<h3>Clean & Fast</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit donec mer lacinia.</p>
										<a href="#" class="btn btn-theme">Learn More</a>
										<!-- ------------ -->
									</div>
								</li>
							</ul>
						</div>
						<!-- end slider -->
					</div>
				</div>
			</div>


		</section>
		<section class="callaction">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="big-cta">
							<div class="cta-text">
								<h2><span>HaeBang</span> 해충과 피해</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section id="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<h4>바퀴벌레</h4>
										<div class="icon">
											<i class="fa fa-bug fa-3x"></i>
										</div>
										<p>
											한 마리가 3개월에 800마리 번식<br/><br/>
											▶ 식중독 유발, 콜레라, 세균성 이질, 장티푸스 등 100여종의 병원균을 보유<br/>
											▶ 아토피, 알레르기성 천식, 비염 유발
										</p>

									</div>
									<div class="box-bottom">
										<a href="#">더 궁금하면 클릭 !</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<h4>개미</h4>
										<div class="icon">
											<i class="fa fa-bug fa-3x"></i>
										</div>
										<p>
											한 군집 당 4,000마리 번식<br/><br/>
											▶ 식중독, 알레르기성 천식, 비염 유발<br/><br/><br/><br/>
										</p>

									</div>
									<div class="box-bottom">
										<a href="#">더 궁금하면 클릭 !</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<h4>쥐</h4>
										<div class="icon">
											<i class="fa fa-bug fa-3x"></i>
										</div>
										<p>
											두 마리가 1년동안 1,256마리 번식<br/><br/>
											▶ 전선을 갉는 습성으로 화재 유발<br/>
											▶ 식중독, 유행성 출혈열, 랩토스피아, 서교열 등의 질병 유발<br/><br/><br/>
										</p>

									</div>
									<div class="box-bottom">
										<a href="#">더 궁금하면 클릭 !</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<h4>집먼지 진드기</h4>
										<div class="icon">
											<i class="fa fa-bug fa-3x"></i>
										</div>
										<p>
											매일 1~3개 알 산란, 1mg에 2만마리 서식<br/><br/>
											▶ 미세하면서 군체량이 많아 발생 시 상당한 스트레스 유발<br/>
											▶ 천식, 기관지염 등의 호흡계 질환 유발
										</p>

									</div>
									<div class="box-bottom">
										<a href="#">더 궁금하면 클릭 !</a>
									</div>
								</div>
							</div>
						</div>
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
				<!-- Portfolio Projects -->
				<div class="row">
					<div class="col-lg-12">
						<h4 class="heading">HaeBang Solution</h4>
						<div class="row">
							<section id="projects">
								<ul id="thumbs" class="portfolio">
									<!-- Item Project and Filter Name -->
									<li class="col-lg-3 design" data-id="id-0" data-type="web">
									<div class="navbar-collapse collapse ">
						<ul class="nav navbar-nav">
							<li class="active" style="float:center"> <strong><h4>1단계 : 사전조사, 진단</h4></strong> </li>
							</ul>
							</div>
										<div class="item-thumbs">
											<!-- Fancybox - Gallery Enabled - Title - Full Image -->
											<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="1단계 : 사전조사 및 진단" href="resources/img/works/1.jpg">
						<span class="overlay-img">1단계 : 사전조사, 진단</span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
											<!-- Thumb Image and Description -->
											<img src="resources/img/works/1.jpg" alt="사전 조사를 통해, 대략적인 범위를 조사하여 진단하는 단계입니다.">
										</div>
									</li>
									<!-- End Item Project -->
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 design" data-id="id-1" data-type="icon">
									<div class="navbar-collapse collapse ">
						<ul class="nav navbar-nav">
							<li class="active" style="float:center"> <strong><h4>2단계 : 서비스 처방</h4></strong> </li>
							</ul>
							</div>
										<!-- Fancybox - Gallery Enabled - Title - Full Image -->
										<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="2단계 : 해방서비스 결정 및 처방" href="resources/img/works/2.jpg">
						<span class="overlay-img">2단계 : 서비스 처방</span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
										<!-- Thumb Image and Description -->
										<img src="resources/img/works/2.jpg" alt="사전에 진단된 판단을 토대로, 어떤 방식을 취할건지 결정하는 단계입니다.">
									</li>
									<!-- End Item Project -->
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
									<div class="navbar-collapse collapse ">
						<ul class="nav navbar-nav">
							<li class="active" style="float:center"> <strong><h4>3단계 : 해방 서비스</h4></strong> </li>
							</ul>
							</div>
										<!-- Fancybox - Gallery Enabled - Title - Full Image -->
										<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="3단계 : 해방 서비스 시행" href="resources/img/works/3.jpg">
						<span class="overlay-img">3단계 : 해방 서비스 시행</span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
										<!-- Thumb Image and Description -->
										<img src="resources/img/works/3.jpg" alt="2단계에서 결정한 방식으로 '해방'서비스를 시행하는 단계입니다.">
									</li>
									<!-- End Item Project -->
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
									<div class="navbar-collapse collapse ">
						<ul class="nav navbar-nav">
							<li class="active" style="float:center"> <strong><h4>4단계 : 지속적 모니터링</h4></strong> </li>
							</ul>
							</div>
										<!-- Fancybox - Gallery Enabled - Title - Full Image -->
										<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="4단계 : 서비스 기간동안 확실한 모니터링" href="resources/img/works/4.jpg">
						<span class="overlay-img">4단계 : 서비스 기간동안 확실한 모니터링</span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
										<!-- Thumb Image and Description -->
										<img src="resources/img/works/4.jpg" alt="서비스 기간동안, 해충이 사라지고 있는지 모니터링을 통해 관리합니다.">
									</li>
									<!-- End Item Project -->
								</ul>
							</section>
						</div>
					</div>
				</div>

			</div>
		</section>
		<footer>
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