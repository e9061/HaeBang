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
	<link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet" />
	<link href="<%=request.getContextPath() %>/resources/css/fancybox/jquery.fancybox.css" rel="stylesheet">
	<link href="<%=request.getContextPath() %>/resources/css/jcarousel.css" rel="stylesheet" />
	<link href="<%=request.getContextPath() %>/resources/css/flexslider.css" rel="stylesheet" />
	<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet" />


	<!-- Theme skin -->
	<link href="<%=request.getContextPath() %>/resources/skins/default.css" rel="stylesheet" />

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
         <jsp:include page="../employee_include/topmenu.jsp" />
      </header>
      <!-- end header -->
		<section id="inner-headline">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<ul class="breadcrumb">
							<li><a href="#"><i class="fa fa-home"></i></a><i class="icon-angle-right"></i></li>
							<li class="active">띠로리</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		
		
		
		
		<section id="content">


		<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4><strong>환영합니다!</strong></h4>

						<div id="sendmessage">Your message has been sent. Thank you!</div>
						<div id="errormessage"></div>
							반가워요 ^^						
							<div class="form-group">
					<p><strong>${joinEmployeeVo.e_id}님</strong> &nbsp;회원가입을 완료했습니다.</p>
					<div class="text-center">
							<a href="<%=request.getContextPath()%>/ceo"><input type="button" value="메인" class="btn btn-theme"></a>
							</div>


							

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
<script src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/jquery.easing.1.3.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/jquery.fancybox.pack.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/jquery.fancybox-media.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/google-code-prettify/prettify.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/portfolio/jquery.quicksand.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/portfolio/setting.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/jquery.flexslider.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/animate.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/custom.js"></script>
	<script>
	</script>
	<script src="<%=request.getContextPath() %>/resources/contactform/contactform.js"></script>

</body>

</html>

