<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    


	<!-- css -->
	<link href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet" />
	<link href="${ pageContext.request.contextPath }/resources/css/fancybox/jquery.fancybox.css" rel="stylesheet">
	<link href="${ pageContext.request.contextPath }/resources/css/jcarousel.css" rel="stylesheet" />
	<link href="${ pageContext.request.contextPath }/resources/css/flexslider.css" rel="stylesheet" />
	<link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet" />

	<!-- Theme skin -->
	<link href="${ pageContext.request.contextPath }/resources/skins/default.css" rel="stylesheet" />
	
	
	
	<div class="navbar navbar-default navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
						<a class="navbar-brand" href="${ pageContext.request.contextPath }/index.jsp"><span>ㅎ</span>방 사업자 사이트</a>
					</div>
					<div class="navbar-collapse collapse ">
						<ul class="nav navbar-nav">
							<li class="active" data-close-others="false"><a href="${ pageContext.request.contextPath }/admin/main.do">진행현황</a></li>
							<li><a href="${ pageContext.request.contextPath }/admin/schedule">스케쥴관리</a></li>
							<li><a href="${ pageContext.request.contextPath }/admin/bal">정산관리</a></li>
							<li><a href="${ pageContext.request.contextPath }/admin/schedule">Q&A게시판</a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">통계<b class=" icon-angle-down"></b></a>
								<ul class="dropdown-menu">
									<li><a href="pricingbox.html">별점통계</a></li>
									<li><a href="components.html">리뷰통계</a></li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">업체관리<b class=" icon-angle-down"></b></a>
								<ul class="dropdown-menu">
									<li><a href="components.html">해방업체</a></li>
									<li><a href="typography.html">일반업체</a></li>
								</ul>
							</li>
							<li><a href="${ pageContext.request.contextPath }/admin/mbManage">회원관리</a></li>
						</ul>
					</div>
				</div>
			</div>
