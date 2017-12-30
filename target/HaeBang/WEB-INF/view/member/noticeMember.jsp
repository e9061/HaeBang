<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>해방</title>
</head>
<body>
	<header>
		<jsp:include page="../member_include/topmenu.jsp"/>
	</header>

	<section>
		<div class="container">
			<jsp:include page="../common_include/notice.jsp">
				<jsp:param value="/member/memberNotice" name="path"/>
			</jsp:include>
		</div>
		<br/>
		<br/>
		<br/>
	</section>

	<footer>
		<jsp:include page="../member_include/bottom.jsp"/>
	</footer>

</body>
</html>