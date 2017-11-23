<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<script>

	function doAction(boardNo) {
		location.href = "${ pageContext.request.contextPath }/ceo/noticeDetail?no=" + boardNo;

	}
</script>
<meta charset="utf-8">
<title>해방 사장님 사이트</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<!-- css -->
<link
	href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="${ pageContext.request.contextPath }/resources/css/fancybox/jquery.fancybox.css"
	rel="stylesheet">
<link
	href="${ pageContext.request.contextPath }/resources/css/jcarousel.css"
	rel="stylesheet" />
<link
	href="${ pageContext.request.contextPath }/resources/css/flexslider.css"
	rel="stylesheet" />
<link
	href="${ pageContext.request.contextPath }/resources/css/style.css"
	rel="stylesheet" />

<!-- Theme skin -->
<link
	href="${ pageContext.request.contextPath }/resources/skins/default.css"
	rel="stylesheet" />


</head>

<body>
	<header>
		<jsp:include page="../employee_include/topmenu.jsp" />
	</header>
	
	
	<div class="container">
	
			<div align="right">
			<form action="${ pageContext.request.contextPath }/ceo/notice" method="get">
				<select name="searchCondition" id="searchCondition">
					<!-- <option value="writer">작성자</option> -->
					<option value="titlecontent">제목+내용</option>
				</select> <input type="text" name="word" id="word"> 
				<input class="btn btn-theme" type="submit" value="검색">
			</form>
		</div>
		
		
		<div align="center">
			<hr>
			<h2>
				<strong>공지사항</strong>
			</h2>
			<hr>
		</div>



		<table style="width: 900px;">
			<thead>
				<tr>
					<th width="7%">번호</th>
					<th>제목</th>
					<th width="20%">등록일</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${ noticelist }" var="board" varStatus="loop">
					<tr>
						<td>${ board.n_no }</td>
						<td><a href="javascript:doAction('${board.n_no }')"> <c:out
									value="${ board.n_title }" />
						</a></td>
						<td>${ board.n_regDate }</td>
					</tr>
				</c:forEach>

				<c:if test="${ count eq 0 }">
					<tr>
						<td colspan="6" align="center">게시글이 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>

		
		<div align="center">
		<ul class="pagination">
			<li><a
				href="${ pageContext.request.contextPath }/ceo/notice?nowpage=0">처음</a></li>

			<!--현재 페이지가 0보다 작아질 경우 이전 버튼을 disabled하는 조건문 -->
			<c:choose>
				<c:when test="${nowpage <= 0}">
					<li class="disabled"><a href="#">이전</a></li>
				</c:when>

				<c:otherwise>
					<li><a
						href="${ pageContext.request.contextPath }/ceo/notice?nowpage=${nowpage-1}">이전</a></li>
				</c:otherwise>
			</c:choose>

			<!--해당하는 페이지로 갈 수 있는 버튼 -->
			<c:forEach var="i" begin="0" end="${totalpage}">
				<li><a
					href="${ pageContext.request.contextPath }/ceo/notice?nowpage=${i}">${i+1}</a></li>
			</c:forEach>

			<!--현재 페이지가 totalpage보다 커질 경우 다음 버튼을 disabled하는 조건문 -->
			<c:choose>
				<c:when test="${nowpage >= totalpage}">
					<li class="disabled"><a href="#">다음</a></li>
				</c:when>

				<c:otherwise>
					<li><a
						href="${ pageContext.request.contextPath }/ceo/notice?nowpage=${nowpage+1}">다음</a></li>
				</c:otherwise>
			</c:choose>

			<li><a
				href="${ pageContext.request.contextPath }/ceo/notice?nowpage=${totalpage}">마지막</a></li>
		</ul>
	</div>


		<br/>
		<br/>
	</div>

</div>

	<!-- /.container -->

	<footer>
		<jsp:include page="../employee_include/bottom.jsp" />
	</footer>

	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.easing.1.3.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.fancybox.pack.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.fancybox-media.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/google-code-prettify/prettify.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/portfolio/jquery.quicksand.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/portfolio/setting.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.flexslider.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/animate.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/custom.js"></script>

</body>

</html>