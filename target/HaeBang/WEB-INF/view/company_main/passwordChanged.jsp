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


</script>
</head>

<body>
	<header>
		<jsp:include page="../employee_include/topmenu.jsp" />
	</header>
	
	
	<div class="container">
		<h1>새로운 비밀번호 설정</h1>
		<hr>
		비밀번호가 정상적으로 변경되었습니다.
		<hr>		
		<br/>
		<a href="${ pageContext.request.contextPath }/ceo"><input class="btn btn-theme" type="button" value="메인으로 돌아가기" /></a>
		<br/>		
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
<script>

function isNull(obj, msg) {
	if (obj.value == "") {
		alert(msg);
		obj.focus();
		return true;
	}
	return false;
}


function checkForm(){
	    		
	var f = document.lform;
	
	if(isNull(f.e_password, '새로운 비밀번호를 입력해 주세요')){
		return false;
	}
	
	if(isNull(f.confirmpassword, '비밀번호를 한번 더 입력해 주세요')){
		return false;
	}
	

}
</script>
</html>