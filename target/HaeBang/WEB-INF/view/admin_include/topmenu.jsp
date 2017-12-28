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
						<a class="navbar-brand" href="${ pageContext.request.contextPath }/admin"><span>해</span>방 관리자 사이트</a>
					</div>
					<div class="navbar-collapse collapse ">
						<ul class="nav navbar-nav">
							<li class="active" data-close-others="false"><a href="${ pageContext.request.contextPath }/admin/main">진행현황</a></li>
							<li><a href="${ pageContext.request.contextPath }/admin/schedule">스케쥴관리</a></li>
							<li><a href="${ pageContext.request.contextPath }/admin/bal">정산관리</a></li>
							<li><a href="${ pageContext.request.contextPath }/admin/list">소비자 Q&A</a></li>
							<li><a href="${ pageContext.request.contextPath }/admin/FE">사업자 FAQ</a></li>
							<li><a href="${ pageContext.request.contextPath }/admin/FM">소비자 FAQ</a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">공지사항<b class=" icon-angle-down"></b></a>
								<ul class="dropdown-menu">
									<li><a href="${ pageContext.request.contextPath }/admin/adminNotice?n_type=m">소비자 공지사항</a></li>
									<li><a href="${ pageContext.request.contextPath }/admin/adminNotice?n_type=o">사업자 공지사항</a></li>
								</ul>
							</li>
								
							<li class="dropdown">
								<a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">통계<b class=" icon-angle-down"></b></a>
								<ul class="dropdown-menu">
									<li><a href="pricingbox.html">별점통계</a></li>
									<li><a href="components.html">리뷰통계</a></li>
								</ul>
							</li>
							<li><a href="${ pageContext.request.contextPath }/admin/companyManage">업체 관리</a></li>
							<li><a href="${ pageContext.request.contextPath }/admin/mbManage">회원 관리</a></li>
						</ul>
					</div>
				</div>
			</div>
