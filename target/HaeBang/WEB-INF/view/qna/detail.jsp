<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="replyQnA.jsp"%>
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
		
		location.href = "${ pageContext.request.contextPath }/qna/${ QnAList.q_no }";
		
	}
	
	function GotoList(){
		
		location.href = "${ pageContext.request.contextPath }/qna/list";
	}
	
</script>
</head>

<body>
	<div id="wrapper">
		<!-- start header -->
		<header> <jsp:include
			page="/WEB-INF/view/member_include/topmenu.jsp" /> </header>
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
			<div class="row">
				<div class="box-body">
					
					<div class="form-group" style="width: 50%;">
						<label>번호</label> <input type="text" style="width: 50%;"
							name="q_no" class="form-control" value="${ QnA.q_no }"
							readonly="readonly">
					</div>
					<div class="form-group" style="width: 50%;">
						<label>제목</label> <input type="text" style="width: 50%;"
							name="q_title" class="form-control" value="${ QnA.q_title }"
							readonly="readonly">
					</div>
					<div class="form-group" style="width: 50%;">
						<label>작성자</label> <input type="text" style="width: 50%;"
							name="q_writer" class="form-control" value="${ QnA.q_writer }"
							readonly="readonly">
					</div>
					<div class="form-group" style="width: 50%;">
						<label>내용</label>
						<textarea style="width: 800px; height: 500px;" name="q_content"
							class="form-control" readonly="readonly">${ QnA.q_content }</textarea>
					</div>
					<c:if test="${QnA.q_saveName ne null }">
					<div class="form-group" style="width: 50%;">
						<label>파일</label> <img src="data:image/jpeg;base64,${image}"
							style="width: 100px; height: auto;" />
					</div>
					</c:if>
					
					
				</div>

				<div class="container"
					style="border-top: 1px solid lightgray; border-bottom: 1px solid lightgray; background-color: #F6F6F6; border-left: 1px solid lightgray; border-right: 1px solid lightgray; border-inner: 1px solid lightgray;">
					<div class="commentList"></div>
				</div>



			</div>
		</div>
		<a href="${ pageContext.request.contextPath }/qna/${ QnA.q_no }"
			class="btn btn-theme">수정</a> <%-- <c:if test=${ QnA.q_writer } eq ${ userVO.m_name }>
					</c:if> --%> <input type="button" value="목록" onclick="GotoList()"
			class="btn btn-theme" align="middle" /> </section>
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
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>

</body>

</html>

