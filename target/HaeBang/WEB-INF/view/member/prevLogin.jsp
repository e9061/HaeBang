<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>

<head>
<meta charset="utf-8">
<title>해방</title>
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
</style>
<script type="text/javascript">
	/* $(document).ready(function() {
				
				
				$("#btnLogin").click(function() {
						alert("!");
						var m_id = $("#m_id").val();
						var m_password = $("#m_password").val();
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
			};	 
	}); */
	
	function prev() {
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
	};	 
	
	
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
					<h4>
						<strong>해방에 로그인 해주세요</strong>
					</h4>
					<div>
					<form action="${ pageContext.request.contextPath }/member/prevLogin" name="form1" method="post" role="form" onsubmit="return prev()">
						<div class="form-group">
							
								<input type="text" name="m_id" class="form-control" id="m_id"
									placeholder="ID" style="width:50%;" />
									
								<div class="validation"></div>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="m_password"
								id="m_password" placeholder="PASSWORD" style="width:50%;" />
							<div class="validation"></div>
						</div>
						<input type="submit" value="로그인" class="btn btn-theme"/>
						<span style="color:red;">${ ErrorMessage }</span>
						<%-- <div>
							<input type="submit" id="btnLogin" value="로그인"/>
							<c:if test="${ msg == 'failure' }">
								<div style="color: red">아이디 또는 비밀번호가 일치하지 않습니다.</div>
							</c:if>
							<c:if test="${ msg == 'logout' }">
								<div style="color: red"></div>
							</c:if>
						</div> --%>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer> <jsp:include
		page="/WEB-INF/view/member_include/bottom.jsp" /> </footer>
	
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	

</body>
<script>
	/* $(document).on("click", "blogin", function(){
		
		$.ajax({
			url: "${ pageContext.request.contextPath }/member/blogin",
			type: "GET",
			success: function(data):{
				
			}
			
			
			
			
		})
		
		
	}) */
</script>
</html>
						
