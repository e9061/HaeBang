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

<script>
	
	function modify(){
		
		location.href = "${ pageContext.request.contextPath }/admin/${ QnAList.q_no }";
		
	}
	
	function GotoList(){
		
		location.href = "${ pageContext.request.contextPath }/admin/FE";
	}
	
</script>
</head>

<body>
	<div id="wrapper">
		<!-- start header -->
		<header> <jsp:include page="../admin_include/topmenu.jsp" />
		</header>
		<!-- end header -->
		<section id="inner-headline">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="#"><i class="fa fa-home"></i></a><i
							class="icon-angle-right"></i></li>
						<li><a href="#">상세 게시판</a><i class="icon-angle-right"></i></li>
						<li class="active">Typography</li>
					</ul>
				</div>
			</div>
		</div>
		</section>
		<section id="content">
		<div class="container">
			<div class="row" align="center" style="text-align: left;">
				<div class="box-body">
					<table class="table table-striped table-bordered table-hover" style="width: 1120px;">       
         <tr>
            <th style="width:10%; height:10%; text-align:center;">제목</th>
            <td><c:out value="${ QnA.q_title }"/></td>
         </tr>
         <tr>
            <th style="width:10%; height:10%; text-align:center;">작성자</th>
            <td><c:out value="${ QnA.q_writer }"/></td>
         </tr>
         
         <tr>
            <th style="text-align:center;">내용</th>
            <td style="width: 95%; height: 300px; font-size:16px;">
            <c:out value="${ QnA.q_content }"/></td>
         </tr>  
         <tr>
            <th style="width:10%; height:10%; text-align:center;">첨부파일</th>
            <td>
           <c:if test="${QnA.q_saveName ne null }">
						<label>파일</label> <img src="data:image/jpeg;base64,${image}"
							style="width: auto; height: auto;" />
					</c:if>         
            </td>
         </tr>
         <tr>
            <th style="width:10%; height:10%; text-align:center;">등록일</th>
            <td>${ QnA.q_regDate }</td>
         </tr>
         </table>
			</div>
		</div>
		<div align="center">
			<a href="${ pageContext.request.contextPath }/admin/E/${ QnA.q_no }"
				class="btn btn-theme">수정</a> <input type="button" value="목록"
				onclick="GotoList()" class="btn btn-theme" />
		</div>
		</section>
		<footer> <jsp:include
			page="/WEB-INF/view/admin_include/bottom.jsp" /> </footer>
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

