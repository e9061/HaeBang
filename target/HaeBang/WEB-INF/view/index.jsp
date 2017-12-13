<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.11.1.min.js">
	
</script>
</head>
<style>
#hi {
	background-color: skyblue;
	family-font: bold;
	width: 500px;
	height: 50px;


.container {
	display: inline-block;
}

#hoho {
	display: inline-block;
}
</style>

<body>
	<div id="wrapper" align="center">
		<!-- start header -->
		<header>
			<jsp:include page="member_include/topmenu.jsp" />
		</header>

		<!-- end header -->
		<section id="featured">
			<!-- start slider -->
			<div class="container">
			<!-- 	<div class="row" style="float: left; width: 100%;"> -->
					<div class="col-lg-12">
						<!-- Slider -->
						<div id="main-slider" class="flexslider"
							style="width: 80%; float: left;">
							<ul class="slides">
								<!-- 1st 슬라이더 -->
								<li><img
									src="${ pageContext.request.contextPath }/resources/img/slides/1.jpg"
									alt="" />
									<div class="flex-caption">
										<!-- 슬라이더위에 메모창 -->
										<h3>Modern Design</h3>
										<p>Duis fermentum auctor ligula ac malesuada. Mauris et
											metus odio, in pulvinar urna</p>
										<a href="#" class="btn btn-theme">Learn More</a>
										<!-- ------------ -->
									</div></li>
								<!-- 2nd 슬라이더 -->
								<li><img
									src="${ pageContext.request.contextPath }/resources/img/slides/2.jpg"
									alt="" />
									<div class="flex-caption">
										<!-- 슬라이더위에 메모창 -->
										<h3>Fully Responsive</h3>
										<p>Sodales neque vitae justo sollicitudin aliquet sit amet
											diam curabitur sed fermentum.</p>
										<a href="#" class="btn btn-theme">Learn More</a>
										<!-- ------------ -->
									</div></li>
								<!-- 3nd 슬라이더 -->
								<li><img
									src="${ pageContext.request.contextPath }/resources/img/slides/3.jpg"
									alt="" />
									<div class="flex-caption">
										<!-- 슬라이더위에 메모창 -->
										<h3>Clean & Fast</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit
											donec mer lacinia.</p>
										<a href="#" class="btn btn-theme">Learn More</a>
										<!-- ------------ -->
									</div></li>
							</ul>
						</div>
						<!-- end slider -->

	<Br/>
	<Br/>
	<Br/>
					<div id=renewLogin
						style="width: 15%; height: auto; float: left; border: 1px-solid-skyblue; margin-left:50px;">
						<c:choose>
							<c:when test="${ empty userVO }">
								<h4>Login</h4>
								<form
									action="${ pageContext.request.contextPath }/member/mainLogin"
									name="form1" method="post" role="form" onsubmit="return prev()">
									<div class="form-group">

										<input type="text" name="m_id" class="form-control" id="m_id"
											placeholder="ID" style="width: 100%;" />

										<div class="validation"></div>
									</div>
									<div class="form-group">
										<input type="password" class="form-control" name="m_password"
											id="m_password" placeholder="PASSWORD" style="width: 100%;" />
										<div class="validation"></div>
									</div>
									<div id="hoho" style="float:left">
									<input type="submit" value="로그인" class="btn btn-theme" style="float:left" />
									<a href="${ pageContext.request.contextPath }/member/bloginForm" class="btn btn-theme" style="float:left" >비회원 로그인</a>
									 </div>
									<br/>
									<span
										style="color: red;">${ ErrorMessage }</span>
								</form>
							</c:when>
							<c:otherwise>

								<li><Strong>${ userVO.m_name }님 방문을 환영합니다!</Strong></li>
								<li><a
									href="${ pageContext.request.contextPath }/member/service">서비스현황</a></li>

							</c:otherwise>
						</c:choose>
					</div>
<!-- </div> -->
				</div>
			</div>
		</section>
		<section class="callaction">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="big-cta">
							<div class="cta-text">
								<h2>
									<span>HaeBang</span> 해충과 피해
								</h2>
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
											한 마리가 3개월에 800마리 번식<br /> <br /> ▶ 식중독 유발, 콜레라, 세균성 이질,
											장티푸스 등 100여종의 병원균을 보유<br /> ▶ 아토피, 알레르기성 천식, 비염 유발
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
											한 군집 당 4,000마리 번식<br /> <br /> ▶ 식중독, 알레르기성 천식, 비염 유발<br />
											<br /> <br /> <br />
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
											두 마리가 1년동안 1,256마리 번식<br /> <br /> ▶ 전선을 갉는 습성으로 화재 유발<br />
											▶ 식중독, 유행성 출혈열, 랩토스피아, 서교열 등의 질병 유발<br /> <br /> <br />
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
											매일 1~3개 알 산란, 1mg에 2만마리 서식<br /> <br /> ▶ 미세하면서 군체량이 많아 발생
											시 상당한 스트레스 유발<br /> ▶ 천식, 기관지염 등의 호흡계 질환 유발
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
						<div class="solidline"></div>
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
												<li class="active" style="float: center"><strong><h4>1단계
															: 사전조사, 진단</h4></strong></li>
											</ul>
										</div>
										<div class="item-thumbs">
											<!-- Fancybox - Gallery Enabled - Title - Full Image -->
											<a class="hover-wrap fancybox" data-fancybox-group="gallery"
												title="1단계 : 사전조사 및 진단" href="resources/img/works/1.jpg">
												<span class="overlay-img">1단계 : 사전조사, 진단</span> <span
												class="overlay-img-thumb font-icon-plus"></span>
											</a>
											<!-- Thumb Image and Description -->
											<img
												src="${ pageContext.request.contextPath }/resources/img/works/1.jpg"
												alt="사전 조사를 통해, 대략적인 범위를 조사하여 진단하는 단계입니다.">
										</div>
									</li>
									<!-- End Item Project -->
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 design" data-id="id-1"
										data-type="icon">
										<div class="navbar-collapse collapse ">
											<ul class="nav navbar-nav">
												<li class="active" style="float: center"><strong><h4>2단계
															: 서비스 처방</h4></strong></li>
											</ul>
										</div> <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
										class="hover-wrap fancybox" data-fancybox-group="gallery"
										title="2단계 : 해방서비스 결정 및 처방" href="resources/image/ready.png">
											<span class="overlay-img">2단계 : 서비스 처방</span> <span
											class="overlay-img-thumb font-icon-plus"></span>
									</a> <!-- Thumb Image and Description --> <img
										src="${ pageContext.request.contextPath }/resources/image/ready.png"
										alt="사전에 진단된 판단을 토대로, 어떤 방식을 취할건지 결정하는 단계입니다.">
									</li>
									<!-- End Item Project -->
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 photography" data-id="id-2"
										data-type="illustrator">
										<div class="navbar-collapse collapse ">
											<ul class="nav navbar-nav">
												<li class="active" style="float: center"><strong><h4>3단계
															: 해방 서비스</h4></strong></li>
											</ul>
										</div> <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
										class="hover-wrap fancybox" data-fancybox-group="gallery"
										title="3단계 : 해방 서비스 시행" href="resources/image/go.png"> <span
											class="overlay-img">3단계 : 해방 서비스 시행</span> <span
											class="overlay-img-thumb font-icon-plus"></span>
									</a> <!-- Thumb Image and Description --> <img
										src="${ pageContext.request.contextPath }/resources/image/go.png"
										alt="2단계에서 결정한 방식으로 '해방'서비스를 시행하는 단계입니다.">
									</li>
									<!-- End Item Project -->
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 photography" data-id="id-2"
										data-type="illustrator">
										<div class="navbar-collapse collapse ">
											<ul class="nav navbar-nav">
												<li class="active" style="float: center"><strong><h4>4단계
															: 지속적 모니터링</h4></strong></li>
											</ul>
										</div> <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
										class="hover-wrap fancybox" data-fancybox-group="gallery"
										title="4단계 : 서비스 기간동안 확실한 모니터링"
										href="resources/img/works/4.jpg"> <span
											class="overlay-img">4단계 : 서비스 기간동안 확실한 모니터링</span> <span
											class="overlay-img-thumb font-icon-plus"></span>
									</a> <!-- Thumb Image and Description --> <img
										src="${ pageContext.request.contextPath }/resources/img/works/4.jpg"
										alt="서비스 기간동안, 해충이 사라지고 있는지 모니터링을 통해 관리합니다.">
									</li>
									<!-- End Item Project -->
								</ul>
							</section>
						</div>
					</div>
				</div>
			</div>
	</section>
	</div>
	<div style="">
	<footer>
		<jsp:include page="member_include/bottom.jsp" />
	</footer>

	</div>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

</body>

</html>