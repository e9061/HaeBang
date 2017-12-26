<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<script src ="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin`s HaeBang - OwnerNotice </title>
</head>
<body>
	
	<header>
		<jsp:include page="../admin_include/topmenu.jsp"/>
	</header>
	
	<section>
	<div class="container">
		<jsp:include page="../common_include/notice.jsp">
			<jsp:param value="/admin/adminNotice" name="path"/>
		</jsp:include>
		<a href="${ pageContext.request.contextPath }/admin/noticeWrite?n_type=${n_type}">	
		<input class="btn btn-theme" type="button" id="write_btn" value="공지 글 등록" />
		</a>
	</div>
		<br/>
		<br/>
		<br/>
	</section>
	
	<footer>
		<jsp:include page="../admin_include/bottom.jsp"/>
	</footer>
</body>
</html>