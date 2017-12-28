<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>해방</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<!-- css -->
<link href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="${ pageContext.request.contextPath }/resources/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/resources/css/jcarousel.css" rel="stylesheet" />
<link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet" />
<link href="${ pageContext.request.contextPath }/resources/css/login-modal.css" rel="stylesheet" />

</head>

<body>
	<div id="wrapper">
		

		<div class="container">
			<div class="col-lg-12">
				<div class="row ">
				<div style="padding: 100px 0 0 0;">
				<h2 style="text-align: center;">관리자 전용 페이지
				</h2>
				</div>
				</div>
			</div>
		</div>



		<div class="container" style="width: 40%">
			<div class="col-lg-12">
				<div class="row ">
					<div id="modal-login">
						<div id="cd-login">
							<!-- log in form -->
							<form action="/admin/login" method="POST" class="cd-form" id="cd-form">
								<p class="fieldset">
									<label class="image-replace cd-email" for="signin-email">E-mail</label>
									<input class="full-width has-padding has-border"
										id="signin-email" name="m_id" type="email" placeholder="E-mail"> <span
										class="cd-error-message"></span>
								</p>

								<p class="fieldset">
									<label class="image-replace cd-password" for="signin-password">Password</label>
									<input class="full-width has-padding has-border"
										id="signin-password" type="password" name="m_password" placeholder="Password">
									<a href="#0" class="hide-password">Hide</a> 
									<span class="cd-error-message"></span>
								</p>

								<p class="fieldset">
									<input type="checkbox" id="remember-me" checked> <label
										for="remember-me">Remember me</label>
								</p>
								<span  style="color:red;">${ ErrorMessage }</span>
								<p class="fieldset">
									<input class="full-width" type="submit" value="Login">
								</p>
							</form>
						</div>
						<!-- cd-login -->
					</div>
				</div>


			</div>
		</div>

	</div>

</body>
   <script src="${ pageContext.request.contextPath }/resources/js/jquery.js"></script>
   <script src="${ pageContext.request.contextPath }/resources/js/jquery.easing.1.3.js"></script>
   <script src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
   <script src="${ pageContext.request.contextPath }/resources/js/jquery.fancybox.pack.js"></script>
   <script src="${ pageContext.request.contextPath }/resources/js/jquery.fancybox-media.js"></script>
   <script src="${ pageContext.request.contextPath }/resources/js/google-code-prettify/prettify.js"></script>
   <script src="${ pageContext.request.contextPath }/resources/js/portfolio/jquery.quicksand.js"></script>
   <script src="${ pageContext.request.contextPath }/resources/js/portfolio/setting.js"></script>
</html>