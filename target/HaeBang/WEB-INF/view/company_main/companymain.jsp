<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta charset="utf-8">
	<title>해방 사업자 사이트</title>
	



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

<style>

.login {

border-style: solid;
border-color: skyblue;
border-width:1px;
width: 100px;
height: 50px;

}


</style>

<script>

$(document).ready(function(){
    $("#login_btn").click(function(){
       
       
       if($("#username").val().trim()==""){
          alert("아이디를 입력하세요.");
          $("#username").val("").focus();
       }
       
       if($("#password").val().trim()==""){
           alert("비밀번호를 입력하세요.");
           $("#password").val("").focus();
           
        }else{
          $.ajax({         
             url: "/ceo/login",
             type: "POST",
             data: {
                username: $("#username").val(),
                password: $("#password").val()
                               
             },
             success: function() {
                alert("로그인 되었습니다");
                $("#username").val("");
                $("#password").val("");
                 
                
             },         
          })
       }
          
    });



</script>



</head>

<body>
	



	<div id="wrapper">
		<!-- start header -->
		<header>
	<jsp:include page="../employee_include/topmenu.jsp" />	
	</header>
		<!-- end header -->
		<section id="featured">
			<!-- start slider -->
			<div class="container">
			
			<div id="map_div" ></div>
			
				<div class="row">
					<div class="col-lg-12">
						<!-- Slider -->
						
						<div class="login">
						
						<c:if test="${ authInfo.username == null }">
							Username&nbsp;<input type="text" size="20" name="username" id="username"/><br/>
							Password&nbsp;<input type="text" size="20" name="password" id="password"/><br/>			
						<input type="button" id="login_btn" value="로그인">&nbsp;
						<input type="button" id="register_btn" value="회원가입">
						</c:if>
						
						<c:if test="${ authInfo.username != null }">
							${ authInfo.username }&nbsp; ${ authInfo.type }님 환영합니다. <br/>
							
							
						
						</c:if>
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
								<h2><span>Moderna</span> HTML Business Template</h2>
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
										<br/>								
										<div class="icon">
											<i class="fa fa-desktop fa-3x"></i>
										</div>		
									</div>
									<div class="box-bottom">
										<a href="#">정산관리</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<br/>
										<div class="icon">
											<i class="fa fa-pagelines fa-3x"></i>
										</div>
									</div>
									<div class="box-bottom">
										<a href="#">스케쥴관리</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<br/>
										<div class="icon">
											<i class="fa fa-edit fa-3x"></i>
										</div>
									</div>
									<div class="box-bottom">
										<a href="#">종합통계</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<br/>
										<div class="icon">
											<i class="fa fa-code fa-3x"></i>
										</div>
									</div>
									<div class="box-bottom">
										<a href="#">예약상세내역</a>
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
						<h4 class="heading">Recent Works</h4>
						<div class="row">
							<section id="projects">
								<ul id="thumbs" class="portfolio">
									<!-- Item Project and Filter Name -->
									<li class="col-lg-3 design" data-id="id-0" data-type="web">
										<div class="item-thumbs">
											<!-- Fancybox - Gallery Enabled - Title - Full Image -->
											<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Work 1" href="resources/img/works/1.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
											<!-- Thumb Image and Description -->
											<img src="resources/img/works/1.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
										</div>
									</li>
									<!-- End Item Project -->
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 design" data-id="id-1" data-type="icon">
										<!-- Fancybox - Gallery Enabled - Title - Full Image -->
										<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Work 2" href="resources/img/works/2.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
										<!-- Thumb Image and Description -->
										<img src="resources/img/works/2.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
									</li>
									<!-- End Item Project -->
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
										<!-- Fancybox - Gallery Enabled - Title - Full Image -->
										<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Work 3" href="resources/img/works/3.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
										<!-- Thumb Image and Description -->
										<img src="resources/img/works/3.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
									</li>
									<!-- End Item Project -->
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
										<!-- Fancybox - Gallery Enabled - Title - Full Image -->
										<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Work 4" href="resources/img/works/4.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
										<!-- Thumb Image and Description -->
										<img src="resources/img/works/4.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
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
<jsp:include page="../employee_include/bottom.jsp" />		
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
