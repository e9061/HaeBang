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
<style>
.form-control {
	clear: both;
	width: 200px;
}
</style>
<script type="text/javascript">
	function checkForm() {
		var f = document.lform;
		if (isNull(f.id, '아이디를 입력해주세요')) {
			f.id.focus();
			return false;
		}
		if (isNull(f.password, '비밀번호를 입력해주세요')) {
			f.password.focus();
			return false;
		}
		return true;
	}
	
	function doSignUp() {
		var pass = document.check.signpassword;
		var passCheck = document.check.signpasscheck;
		var form = document.check;
		if(form.signid.value == ""){
			alert('아이디를 입력하세요');
			form.id.focus();
			return false;
		}
		if(pass.value == ""){
			alert('비밀번호를 입력하세요');
			pass.focus();
			return false;
		}
		if(form.name.value == ""){
			alert('이름을 입력하세요');
			form.name.focus();
			return false;
		}
		
		if (pass.value == passCheck.value){
			location.href = "Login.jsp";
			return true;
		}else{
			alert('패스워드가 다릅니다 다시 입력하세요');
			return false;
		}
	}
	function selectEvent(selectObj) {
		document.getElementById('email_domain').value = selectObj.value;
		
	}
	jQuery().ready(function() {
		$('#back').click(function(){
			location.href = "/Hwiview-Web/";
		});
		$('#idcheck').click(function(){
			$.ajax({
				url : "sign/confirm.jsp",
				type : "post",
				data : "id=" + $('#signid').val(),
				success : function(data){
					if($.trim(data) == "NO"){
						alert("이미 사용중인 아이디입니다!");
					}else if($('#signid').val() == ""){
						alert("아이디를 입력해주세요");
					}else{
						alert("사용 가능한 아이디입니다!");
					}
				}
			});
		}); 
	});
</script>
</head>

<body>
	<div id="wrapper">
		<!-- start header -->
		<header> <jsp:include
			page="/WEB-INF/view/member_include/topmenu.jsp" /> </header>
		<!-- end header -->
		<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4>해방에 가입하시는데는, 개인정보가 필요하지 않습니다</strong></h4>

						<div id="sendmessage">해방에 가입해주셔서 너무나도 감사합니다!</div>
						<div id="errormessage"></div>
						<form action="" method="post" role="form" class="contactForm">
							<div class="form-group">
								<input type="text" name="m_name" class="form-control" id="m_name" placeholder="Write Your Name" data-msg="Please enter at least 4 chars" />
								<div class="validation"></div>
							</div>
							<div class="form-group">
								<input type="text" name="m_id" class="form-control" id="m_id" placeholder="Write Your Id" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
								<div class="validation"></div>
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="m_password" id="m_password" placeholder="Write Your Password" data-rule="email" data-msg="Please enter a valid email" />
								<div class="validation"></div>
							</div>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="Password Confirm" data-rule="email" data-msg="Please enter a valid email" />
								<div class="validation"></div>
							</div>
							<div class="form-group">
								<input type="phone" class="form-control" name="m_phone" id="m_phone" placeholder="Write Your Phone" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
								<div class="validation"></div>
							</div>

							<div class="text-center"><button type="submit" class="btn btn-theme">가입 완료</button></div>
						</form>
					</div>
				</div>
			</div>
			</form>
		</div>
		<footer> <jsp:include
			page="/WEB-INF/view/member_include/bottom.jsp" /> </footer>
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD8HeI8o-c1NppZA-92oYlXakhDPYR7XMY"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<script>
		jQuery(document).ready(
				function($) {
					//Google Map
					var get_latitude = $('#google-map').data('latitude');
					var get_longitude = $('#google-map').data('longitude');

					function initialize_google_map() {
						var myLatlng = new google.maps.LatLng(get_latitude,
								get_longitude);
						var mapOptions = {
							zoom : 14,
							scrollwheel : false,
							center : myLatlng
						};
						var map = new google.maps.Map(document
								.getElementById('google-map'), mapOptions);
						var marker = new google.maps.Marker({
							position : myLatlng,
							map : map
						});
					}
					google.maps.event.addDomListener(window, 'load',
							initialize_google_map);
				});
	</script>
	<script src="resources/contactform/contactform.js"></script>

</body>

</html>
