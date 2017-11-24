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

</head>
<style>
	#hi {
	
		background-color : skyblue;
		family-font : bold;
		width : 500px;
		height : 50px;
	
	}
</style>
<script src="https://code.jquery.com/jquery-1.11.1.min.js">
		
	</script>
	<!-- Bootstrap JavaScript -->
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

	<!-- Custom JavaScript -->
	<script src="${ pageContext.request.contextPath }/resources/js/custom.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/checkForm.js"></script>
		
<body>
	<div id="wrapper">
		<!-- start header -->
	
		<div class="navbar navbar-default navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
						<a class="navbar-brand" href="${ pageContext.request.contextPath }/"><span>H</span>aeBang</a>
					</div>
					<div class="navbar-collapse collapse ">
						<ul class="nav navbar-nav">
							<li class="active"><a href="${ pageContext.request.contextPath }/">Home</a></li>
							<li><a href="#">신청</a></li>
							<li><a href="${ pageContext.request.contextPath }/member/service">서비스목록</a></li>

						<c:choose> 
							<c:when test="${ empty userVO }">
								<li><a href="${ pageContext.request.contextPath }/member/join">회원가입</a></li> 
	        					<li><a href="${ pageContext.request.contextPath }/member/loginForm">로그인</a></li>
	        					<li><a href="${ pageContext.request.contextPath }/member/memberNotice?n_type=m">공지사항</a></li>
      						   </c:when>	
							<c:otherwise>
								<li><a href="${ pageContext.request.contextPath }/member/myPage">${ userVO.m_id }<b class=" icon-angle-down"></b></a></li>
									<li><a href="${ pageContext.request.contextPath }/qna/list">QnA</a></li>
          						<li><a href="${ pageContext.request.contextPath }/member/logout">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
						<!-- dropdown 지운링크 -->
						<!--  class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false" -->
						</ul>
					</div>
				</div>
			</div>