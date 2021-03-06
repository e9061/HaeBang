<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="reply.jsp"%>

<!DOCTYPE html>
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


<style type="text/css">
form {
	display: inlien;
}

.form-control {
	display: inline;
	width: 20%;
}
</style>

<script>
	function modify() {

		location.href = "${ pageContext.request.contextPath }/qna/${ QnAList.q_no }";

	}

	function GotoList() {

		location.href = "${ pageContext.request.contextPath }/qna/list";
	}
</script>
</head>

<body>
	<div id="wrapper">
		<!-- start header -->
		<header>
			<jsp:include page="/WEB-INF/view/admin_include/topmenu.jsp" />
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
				<div class="row">
					<div class="box-body">
						<%-- <h3>${ QnAVO.q_no }번 게시물</h3>
						<hr/>
						<h4>${ QnAVO.q_title }</h4>
						<hr/>
						<h4>${ QnAVO.q_writer }</h4>
						<hr/>
						<h4>${ QnAVO.q_content }</h4>
						<hr/>
						<h4>${ QnAVO.q_viewCnt }</h4>
						<hr/>
						<h4>${ QnAVO.q_regDate }</h4>
						<hr/> --%>
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

					<div class="container">
						<label for="content">comment</label>
						<form name="commentInsertForm">
							<div class="input-group">
								<input type="hidden" name="q_no" value="${ QnA.q_no }" /> <input
									type="text" class="form-control" id="r_writer" name="r_writer"
									placeholder="관리자" value="관리자" readonly="readonly" /> <input
									type="text" class="form-control" id="r_content"
									name="r_content" placeholder="내용을 입력하세요." />
								<button type="button" name="commentInsertBtn"
									class="btn btn-default">등록</button>
							</div>
						</form>
					</div>
					<div class="container">
						<div class="commentList"></div>
					</div>
				</div>
			</div>
			<div style="align: center">
				<a href="${ pageContext.request.contextPath }/qna/${ QnA.q_no }"
					class="btn btn-theme" style="align: center">수정</a>
				<%-- <c:if test=${ QnA.q_writer } eq ${ userVO.m_name }>
					</c:if> --%>
				<input type="button" value="목록" onclick="GotoList()"
					class="btn btn-theme" style="align: center" />
			</div>
		</section>
		<footer>
			<jsp:include page="/WEB-INF/view/admin_include/bottom.jsp" />
		</footer>
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

