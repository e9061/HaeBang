<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<script src ="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ceo`s HaeBang - Notice </title>
</head>
<body>
	
	<header>
		<jsp:include page="../employee_include/topmenu.jsp"/>
	</header>
	
	<section>
	<div class="container">
		<jsp:include page="../common_include/notice.jsp">
			<jsp:param value="/ceo/ceoNotice" name="path"/>
		</jsp:include>
	</div>
		<br/>
		<br/>
		<br/>
	</section>
	
	<footer>
		<jsp:include page="../employee_include/bottom.jsp"/>
	</footer>
</body>
</html>