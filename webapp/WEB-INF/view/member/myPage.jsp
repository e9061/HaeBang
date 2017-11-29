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
	
</script>
</head>

<body>
	<div id="wrapper">
		<!-- start header -->
		<header>
			<jsp:include page="/WEB-INF/view/member_include/topmenu.jsp" />
		</header>
		<!-- end header -->
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>
						"<strong>${ userVO.m_name }</strong>"님의 회원정보
					</h4>
					<section>
						<div class="box box-info">

							
							<div class="box-body">
								<div class="table-responsive">

									<table id="member_table" class="table no-margin">
										<tr>
											<th>이름</th>
											<td>${ memberVO.m_name }</td>
										</tr>
										<tr>
											<th>아이디</th>
											<td>${ memberVO.m_id }</td>
										</tr>
										<tr>
											<th>비밀번호</th>
											<td><input type="password" id="${ memberVO.m_password }" value ="${ memberVO.m_password }" readonly /></td>
										</tr>
										<tr>
											<th>연락처</th>
											<td>${ memberVO.m_phone }</td>
										</tr>
										<tr>
											<th>주소</th>
											<td>${ memberVO.m_address }</td>
										</tr>
										<tr>
											<th>카드 명의자</th>
											<td>${ memberVO.m_owner }</td>
										</tr>
										<tr>
											<th>카드 번호</th>
											<td>${ memberVO.m_cardNo }</td>
										</tr>
										<tr>
											<th>카드 CVC</th>
											<td>${ memberVO.m_cardCVC }</td>
										</tr>
									</table>
									<div style="display:inline-block; align:center;" >
									<form
										action="${ pageContext.request.contextPath }/member/${ memberVO.m_id }"
										method="get" style="float:left;">
										<input type="submit" class="btn btn-theme" value="수정" />
									</form>
									
									<form
										action="${ pageContext.request.contextPath }/member/delete/${ memberVO.m_id }"
										method="post" style="float:left; margin-left:10px;">
										<input type="hidden" name="_method" value="delete"> <input
											type="submit" value="회원탈퇴" class="btn btn-theme" />
									</form>
									</div>
									<%-- <input type="button" class="btn btn-theme"
										onclick="location.href='${ pageContext.request.contextPath }/board/list'"
										value="목록" /> --%>

									<!-- 댓글 -->

									<%-- <div class="container">
										<label for="content">comment</label>
										<form name="commentInsertForm">
											<div class="input-group">
												<input type="hidden" name="rno" value="${ boardVO.no }" />
												<input type="text" class="form-control" id="writer"
													name="writer" placeholder="작성자를 입력하세요." /> <input
													type="text" class="form-control" id="content"
													name="content" placeholder="내용을 입력하세요." />
												<button type="button" name="commentInsertBtn"
													class="btn btn-default">등록</button>
											</div>
										</form>
									</div> --%>
									<div class="container">
										<div class="commentList"></div>
									</div>
									<!-- /.table-responsive -->

								</div>
							</div>
						</div>

					</section>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<jsp:include page="/WEB-INF/view/member_include/bottom.jsp" />
	</footer>

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

	<script src="resources/contactform/contactform.js"></script>

</body>

</html>
