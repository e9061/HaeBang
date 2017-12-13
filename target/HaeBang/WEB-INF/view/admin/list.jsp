<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style>
#content {
	text-align: center;
}

table {
	text-align: center;
}

tr {
	text-align: center;
}

td {
	text-align: center;
}
</style>
<script type="text/javascript">
	function doAction() {
		location.href = "${ pageContext.request.contextPath }/qna/write";

	}

	function preBlock(bowBlock, pageNo) {
		document.total.nowBlock.value = nowBlock;
		document.total.pageNo.value = pageNo;
		total.submit();
	}

	function prePage(nowBlock, pageNo) {
		document.total.nowBlock.value = nowBlock;
		document.total.pageNo.value = pageNo;
		total.submit();
	}

	function afterBlock(nowBlock, pageNo) {
		document.total.nowBlock.value = nowBlock();
		document.total.pageNo.value = pageNo();
		total.submit();
	}
</script>
</head>

<body>
	<div id="wrapper">
		<header> <jsp:include
			page="/WEB-INF/view/admin_include/topmenu.jsp" /> </header>
		<section>
		<div class="container">
			<hr width="100%" />
			<h2 align="center">게시물 목록</h2>
			<hr width="100%" />
			<br>
			<table border="1" width="100%">
				<tr>
					<th width="7%">번호</th>
					<th>제목</th>
					<th width="16%">글쓴이</th>
					<th width="7%">조회수</th>
					<th width="20%">등록일</th>
				</tr>
				<c:forEach items="${ list }" var="list" varStatus="loop">
					<tr <c:if test="${ loop.count mod 2 eq 0 }"  >class="even"</c:if>>
						<td>${ list.q_no }</td>
						<td>
							<%-- <a onclick="doAction('${ board.no }')"> --%> <a
							href="${ pageContext.request.contextPath }/admin/detail/${ list.q_no }">
								<c:out value="${ list.q_title }" />
						</a>
						</td>
						<td>${ list.q_writer }</td>
						<td>${ list.q_viewCnt }</td>
						<td>${ list.q_regDate }</td>
					</tr>
				</c:forEach>


			</table>
			<br />
			<div align="center">
				<ul class="pagination">
					<li><a
						href="${ pageContext.request.contextPath }/admin/list?pageNo=0">처음</a></li>
					<%-- 				<li><a href="${ pageContext.request.contextPath }/list/&pageNo=0&searchCondition=${ titlecontent }&word=${ word }">처음</a></li>
 --%>
					<!--현재 페이지가 0보다 작아질 경우 이전 버튼을 disabled하는 조건문 -->
					<c:choose>
						<c:when test="${pageNo <= 0}">
							<li class="disabled"><a href="#">이전</a></li>
						</c:when>

						<c:otherwise>
							<li><a
								href="${ pageContext.request.contextPath }/admin/list?pageNo=${pageNo -1}">이전</a></li>
							<%-- 							href="${ pageContext.request.contextPath }/list/&pageNo=${pageNo -1}&searchCondition=${ titlecontent }&word=${ word }">이전</a></li> --%>
						</c:otherwise>
					</c:choose>

					<!--해당하는 페이지로 갈 수 있는 버튼 -->
					<c:forEach var="i" begin="0" end="${lastPage-1}">
						<li><a
							href="${ pageContext.request.contextPath }/admin/list?pageNo=${i}">${i+1}</a></li>
						<%-- 					<li><a href="${ pageContext.request.contextPath }/list/&pageNo=${i}&searchCondition=${ titlecontent }&word=${ word }">${i+1}</a></li> --%>
					</c:forEach>

					<!--현재 페이지가 totalpage보다 커질 경우 다음 버튼을 disabled하는 조건문 -->
					<c:choose>
						<c:when test="${pageNo >= endPage-1}">
							<li class="disabled"><a href="#">다음</a></li>
						</c:when>

						<c:otherwise>
							<li><a
								href="${ pageContext.request.contextPath }/admin/list?pageNo=${pageNo+1}">다음</a></li>
							<%-- 							href="${ pageContext.request.contextPath }/list/&pageNo=${pageNo+1}&searchCondition=${ titlecontent }&word=${ word }">다음</a></li> --%>
						</c:otherwise>
					</c:choose>

					<li><a
						href="${ pageContext.request.contextPath }/admin/list?pageNo=${lastPage-1}">마지막</a></li>
					<%-- 				<li><a href="${ pageContext.request.contextPath }/list/&pageNo=${totalpage}&searchCondition=${ titlecontent }&word=${ word }">마지막</a></li> --%>
				</ul>
			</div>
			<br /> <br />
			<c:if test="${ not empty userVO }">
			<div align="center">
				<input type="button" value="새글등록" onclick="doAction()"
					class="btn btn-theme"  />
					</div>
			</c:if>
		</div>
		</section>
		<br /> <br /> <br />
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
