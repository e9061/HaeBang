<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>해방 사장님 사이트</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<script>

function doAction(userID) {   
    location.href = "${ pageContext.request.contextPath }/ceo/passwordChangeForm?id=" + userID;    
 }
 
</script>
</head>

<body>
	<header>
		<jsp:include page="../employee_include/topmenu.jsp" />
	</header>
	
	
	<div class="container">
		<h1>비밀번호 찾기</h1>
		<hr>
		<h4>본인확인 수단을 선택해주세요. </h4>
		<hr>	
		
		<table align="center" width="500px"> 
			<tr>
				<td style="text-align:center;width:250px; height:50px"><b>휴대폰 인증</b></td>
				<td style="text-align:center;width:250px;"><b>아이핀 인증</b></td>
			</tr>
			<tr>
				<td style="text-align:center; height:250px;"><a href="javascript:doAction('${ userID }')"><img src="${ pageContext.request.contextPath }/resources/img/phone.png" /></a></td>
				<td style="text-align:center; height:250px;"><a href="#"><img src="${ pageContext.request.contextPath }/resources/img/ipin.png" /></a></td>
			</tr>
		
		</table>	

		
		<br />
		<hr>
			
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