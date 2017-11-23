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

</head>

<body>
	<header>
		<jsp:include page="../employee_include/topmenu.jsp" />
	</header>
	
	
	<div class="container">
		<h1>비밀번호 찾기</h1>
		<hr>
		<h4>아이디 확인 후 비밀번호를 다시 설정하실 수 있습니다.</h4>
		<hr>		
		<form:form name="lform" commandName="employeeVo" action="${ pageContext.request.contextPath }/ceo/forgotmypassword" method="post" onsubmit="return checkForm()" >
		<label>아이디</label>&nbsp;&nbsp;<form:input class="form-control" type="text" id="e_id" size="10" name="e_id" path="e_id" style="width:300px;margin:0px;" /><input class="btn btn-theme" type="submit" value="확인" /> <span style="color: red;">${ errorMessage }</span>
		</form:form>
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
	
	if(isNull(f.e_id, '아이디를 입력해 주세요')){
		return false;
	}
	

}
</script>
</html>