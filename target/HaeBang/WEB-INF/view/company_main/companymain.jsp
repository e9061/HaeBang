<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<title>해방 사장님 사이트</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<!-- css -->
<link
	href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="${ pageContext.request.contextPath }/resources/css/fancybox/jquery.fancybox.css"
	rel="stylesheet">
<link
	href="${ pageContext.request.contextPath }/resources/css/jcarousel.css"
	rel="stylesheet" />
<link
	href="${ pageContext.request.contextPath }/resources/css/flexslider.css"
	rel="stylesheet" />
<link
	href="${ pageContext.request.contextPath }/resources/css/style.css"
	rel="stylesheet" />

<!-- Theme skin -->
<link
	href="${ pageContext.request.contextPath }/resources/skins/default.css"
	rel="stylesheet" />
	

<!-- =======================================================
    Theme Name: Moderna
    Theme URL: https://bootstrapmade.com/free-bootstrap-template-corporate-moderna/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
	======================================================= -->



<style>

#map {
	height:500px;
	width:700px;
}

</style>

<script>

/* $(document).ready(function(){
    $("#login_btn").click(function(){
       alert("떠라 쫌");
       
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
          
    }); */

    var map;
    
    function initMap() {
      map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 37.548460113062, lng: 126.98654938037113},
        zoom: 11
      });
    }
  </script>
    
    <!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5a0aa9aa198bd56b8c03afe2/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
    

  
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA55tXe_wDtqEVlLtwacYJsOXG2zBQC7lk&callback=initMap"
    async defer></script>




</head>

<body>




	<div id="wrapper">
		<!-- start header -->
		<header> <jsp:include page="../employee_include/topmenu.jsp" />
		</header>
		<!-- end header -->
		<jsp:include page="../employee_include/loginModal.jsp" />
		
		<section id="inner-headline">
			<div class="container">
				<!-- <div class="row" > -->
				<div width="100%" height="300px">
					<div class="col-lg-12">
						<br/>
						<br/>
						<br/>
					</div>
				</div>
			</div>
		</section>
		<section id="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-8"> 
					
					<article>
						<c:if test="${ not empty userVo }">
						<h4>Today's Schedule</h4>
						<div id="map"></div>	
						</c:if>
					</article>							
						
						
						<article>
						<h4>Quick Menu</h4>
							<table border="1" bordercolor="lightgray" style="width: 700px; height: 150px;">
						<tr>							
							<td style="background-color:SteelBlue; color:white; text-align:center;">
							<c:if test="${ empty userVo }">
							<a href="#myModal" class="trigger-btn" data-toggle="modal">					
							정산관리
							</a>
							</c:if>
							<c:if test="${ not empty userVo }">
							<a href="#">
							정산관리
							</a>
							</c:if>
					
							</td>							
							<td style="background-color:white; text-align:center;">
							<c:if test="${ empty userVo }">
							<a href="#myModal" class="trigger-btn" data-toggle="modal">					
							스케쥴관리
							</a>
							</c:if>
							<c:if test="${ not empty userVo }">
							<a href="#">
							스케쥴관리
							</a>
							</c:if>
							</td>
						</tr>
						<tr style="width:350px;">
							<td style="background-color:white; text-align:center;">
							<c:if test="${ empty userVo }">
							<a href="#myModal" class="trigger-btn" data-toggle="modal">					
							종합통계
							</a>
							</c:if>
							<c:if test="${ not empty userVo }">
							<a href="#">
							종합통계
							</a>
							</c:if>
							</td>
							<td style="background-color:SteelBlue; color:white; text-align:center;">
							<c:if test="${ empty userVo }">
							<a href="#myModal" class="trigger-btn" data-toggle="modal">					
							예약내역
							</a>
							</c:if>
							<c:if test="${ not empty userVo }">
							<a href="#">
							예약내역
							</a>
							</c:if>
							</td>
						</tr>
					</table>
						</article>
						
						
						
						<article>
							<div class="post-slider">
								<div class="post-heading">
									<h4>Tips</h4>		
									<h3><a href="#">우리 업체 필증 발급, 정확하게 하고있나요?</a></h3>
								</div>
								<!-- start flexslider -->
								<img src="${ pageContext.request.contextPath }/resources/img/pestcontrol.jpg" alt="" width="700px" height="300px" />
									<%-- <ul class="slides">
										<li>
											<img src="${ pageContext.request.contextPath }/resources/img/pestcontrol.jpg" alt="" width="700px" height="300px" />
										</li>
										<li>
											<img src="${ pageContext.request.contextPath }/resources/img/dummies/blog/img2.jpg" alt="" />
										</li>
										<li>
											<img src="${ pageContext.request.contextPath }/resources/img/dummies/blog/img3.jpg" alt="" />
										</li>
									</ul>
								</div> --%>
								<!-- end flexslider -->
							</div>
							<p>
								소독필증은 대상시설물 교부용1부,보건소신고용1부,회사보관용1부 총3부를 작성하여 소독실시후 소독회사는 반드시 소독실시 대상시설물에 1부를 교부하고, 시설물 소재지 관할 보건소에 소독신고서와 같이 1부를 제출하고 나머지 1부는 소독회사에서 보관합니다.
							</p>
							<div class="bottom-article">
								<ul class="meta-post">
									<li><i class="icon-calendar"></i><a href="#"> Mar 23, 2013</a></li>
									<li><i class="icon-user"></i><a href="#"> Admin</a></li>
									<li><i class="icon-folder-open"></i><a href="#"> Blog</a></li>
									<li><i class="icon-comments"></i><a href="#">4 Comments</a></li>
								</ul>
								<a href="#" class="pull-right">Continue reading <i class="icon-angle-right"></i></a>
							</div>
						</article>
						
						
						<article>

				


					</article>
						
						
						
						
						<article>
							<div class="post-quote">
								<div class="post-heading">
									<h3><a href="#">Nice example of quote post format below</a></h3>
								</div>
								<blockquote>
									<i class="icon-quote-left"></i> Lorem ipsum dolor sit amet, ei quod constituto qui. Summo labores expetendis ad quo, lorem luptatum et vis. No qui vidisse signiferumque...
								</blockquote>
							</div>
							<div class="bottom-article">
								<ul class="meta-post">
									<li><i class="icon-calendar"></i><a href="#"> Mar 23, 2013</a></li>
									<li><i class="icon-user"></i><a href="#"> Admin</a></li>
									<li><i class="icon-folder-open"></i><a href="#"> Blog</a></li>
									<li><i class="icon-comments"></i><a href="#">4 Comments</a></li>
								</ul>
								<a href="#" class="pull-right">Continue reading <i class="icon-angle-right"></i></a>
							</div>
						</article>
						<article>
							<div class="post-video">
								<div class="post-heading">
									<h3><a href="#">Amazing video post format here</a></h3>
								</div>
								<div class="video-container">
									<iframe src="http://player.vimeo.com/video/30585464?title=0&amp;byline=0">
								</iframe>
								</div>
							</div>
							<p>
								Qui ut ceteros comprehensam. Cu eos sale sanctus eligendi, id ius elitr saperet, ocurreret pertinacia pri an. No mei nibh consectetuer, semper laoreet perfecto ad qui, est rebum nulla argumentum ei. Fierent adipisci iracundia est ei, usu timeam persius
								ea. Usu ea justo malis, pri quando everti electram ei.
							</p>
							<div class="bottom-article">
								<ul class="meta-post">
									<li><i class="icon-calendar"></i><a href="#"> Mar 23, 2013</a></li>
									<li><i class="icon-user"></i><a href="#"> Admin</a></li>
									<li><i class="icon-folder-open"></i><a href="#"> Blog</a></li>
									<li><i class="icon-comments"></i><a href="#">4 Comments</a></li>
								</ul>
								<a href="#" class="pull-right">Continue reading <i class="icon-angle-right"></i></a>
							</div>
						</article>
						<div id="pagination">
							<span class="all">Page 1 of 3</span>
							<span class="current">1</span>
							<a href="#" class="inactive">2</a>
							<a href="#" class="inactive">3</a>
						</div>
					</div>
					<div class="col-lg-4">
						<aside class="right-sidebar">
							<div class="widget">			
				<h4>Login</h4>		
		<c:if test="${ empty userVo }">
			<form:form action="${ pageContext.request.contextPath }/ceo" commandName="employeeVo" method="post"> 
				Username&nbsp;<input class="form-control" placeholder="아이디" type="text" size="20" name="e_id" id="e_id" path="e_id" />
				<br />
				Password&nbsp;<input class="form-control" placeholder="비밀번호" type="password" size="20" name="e_password" id="e_password" path="e_password" />
				<br />
				<input class="btn btn-theme" type="submit" id="login_btn" value="로그인">&nbsp;	
				<a href="<c:url value="ceo/register/join"/>"><input class="btn btn-theme" type="button" id="register_btn" value="회원가입"></a>
			</form:form>		
		</c:if>
			<c:if test="${ not empty userVo }">
		${ userVo.e_name }&nbsp; ${ userVo.e_type }님 환영합니다. <br />
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="${ pageContext.request.contextPath }/logout">로그아웃</a>
		
		</c:if>
							</div>							
							<div class="widget">
								<h5 class="widgetheading">Latest notices</h5>
								<ul class="recent">
									<li>										
										<h6><a href="#">Lorem ipsum dolor sit</a></h6>
										<p>
											Mazim alienum appellantur eu cu ullum officiis pro pri
										</p>
									</li>
									<li>										
										<h6><a href="#">Maiorum ponderum eum</a></h6>
										<p>
											Mazim alienum appellantur eu cu ullum officiis pro pri
										</p>
									</li>
									<li>										
										<h6><a href="#">Et mei iusto dolorum</a></h6>
										<p>
											Mazim alienum appellantur eu cu ullum officiis pro pri
										</p>
									</li>
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
		<footer> <jsp:include page="../employee_include/bottom.jsp" />
		</footer>
	</div>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.easing.1.3.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.fancybox.pack.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.fancybox-media.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/google-code-prettify/prettify.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/portfolio/jquery.quicksand.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/portfolio/setting.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.flexslider.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/animate.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/custom.js"></script>
		


</body>

</html>
