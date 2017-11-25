<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<title>해방 사장님 사이트</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />

</head>

<body>
	<header>
		<jsp:include page="../employee_include/topmenu.jsp" />
	</header>


	<div class="container">
		<h1>아이디 찾기</h1>
		<hr>
		<h4>입력하신 정보와 일치하는 아이디 정보입니다.</h4>
		<hr>
		<br />

		<table>
		
		<tr>
			<td width="200px">회원가입일</td>
			<td width="300px">해방 ID</td>
		</tr>
		<tr>
			<td>${ joinDate }</td>
			<td>${ modifiedEmail }</td>
		</tr>		
		
		</table>
		<br/>
		-해방 ID는 Email형태입니다. <br/>
		-개인정보보호를 위해 아이디는 중간중간 ***로 표시됩니다.<br/>
		-아이디 전체 정보는 본인인증 후 확인 가능합니다.<br/>
		
		<br/>
		아이디 전체 확인<br/>
		<a href="#">휴대폰 인증</a> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<a href="#">아이핀 인증</a><br/>
		-법인 명의 휴대폰 사용자는 통신사 지점 또는 대리점에 방문하여 법인명의 실사용자 등록 후 휴대폰 인증이 가능합니다.
		<br/><br/>
		
		
		

		</div>
		<br/><br/><br/>


<div align="center">
				<a href="${ pageContext.request.contextPath }/ceo"><button type="button" class="btn btn-theme">메인으로 돌아가기</button></a>
						<br/><br/><br/>
			</div>

	
	<br/><br/><br/>
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