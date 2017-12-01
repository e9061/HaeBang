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

#blogin {
	width: 150px;
	height: 100px;
}

#prevLogin {
	width: 150px;
	height: 100px;
}
</style>
<script>

	function blogin() {

		location.href = "${ pageContext.request.contextPath }/member/bloginForm";

	}

	function prevLogin() {
		location.href = "${ pageContext.request.contextPath }/member/prevLoginForm";
	}

	var menuClick = function(url) {

		if (url == '/') {

			location.reload(true);

			return;

		}

		$.ajax({

			type : 'POST',

			url : url,

			async : false,

			data : "",

			contentType : "application/x-www-form-urlencoded; charset=UTF-8",

			success : function(data) {

				$('#Container').html(data);

				/* if (isMenuHide)
					menuOff();
				 */
			},

			error : function(request, status, error) {

				alert(error);

			}

		});

	};

	$(document)
			.ready(
					function() {

						$("#btnLogin")
								.click(
										function() {
											alert("!");
											var m_id = $("#m_id").val();
											var m_password = $("#m_password")
													.val();
											if (m_id == "") {
												alert("아이디를 입력해주세요.");
												$("#m_id").focus();
												return;
											}
											if (m_password == "") {
												alert("비밀번호를 입력하세요");
												$("#m_password").focus();
												return;
											}

											document.form1.action = "${ pageContext.request.contextPath }/member/loginCheck"
											document.form1.submit();

										});

						function btnLogin() {
							alert("!");
							var m_id = $("#m_id").val();
							var m_password = $("#m_password").val();
							if (m_id == "") {
								alert("아이디를 입력해주세요.");
								$("#m_id").focus();
								return false;
							}
							if (m_password == "") {
								alert("비밀번호를 입력하세요");
								$("#m_password").focus();
								return false;
							}

							return true;
						}
						;
					});
</script>
</head>

<body>

	
	
	<header>
		<jsp:include page="/WEB-INF/view/member_include/topmenu.jsp" />
	</header>
 <br/>
 	<br/>
 	<br/>
	<table align="center">
		<tr>
			<td><input type="button" class="btn btn-theme" id="blogin"
				value="비회원 로그인" onclick="blogin()"></td>
			<td>&nbsp; &nbsp;</td>
			<td><input type="button" class="btn btn-theme" id="prevLogin"
				value="회원 로그인" onclick="prevLogin()"></td>
		<tr>
	</table>

 	<br/>
 	<br/>
 	<br/>
	<%-- <div>
		<div>
			<input type="button" class="btn btn-theme" id="blogin"
				value="비회원 로그인" onclick="blogin()">
			<a href="${ pageContext.request.contextPath }/member/bloginForm" >비회원로그인</a>
		</div>
		<div>
			<input type="button" class="btn btn-theme" id="prevLogin"
				value="회원 로그인" onclick="prevLogin()">
			<a href="${ pageContext.request.contextPath }/member/prevLoginForm" >회원로그인</a>
		</div>
	</div> --%> 
	<%-- <div id="left">

			<a href="javascript:menuClick('${ pageContext.request.contextPath }/member/bloginForm');">blogin</a><br /> <a
				href="javascript:menuClick('${ pageContext.request.contextPath }/member/prevLoginForm');">prevLogin</a>

		</div>

		<div id="Content">/* 화면전환 부분 "/</div> --%>
	<!--  id="prevLogin" class="btn btn-theme" -->

	<footer>
		<jsp:include page="/WEB-INF/view/member_include/bottom.jsp" />
	</footer>

</body>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active" ></i></a>
<script>
	
</script>
</html>

