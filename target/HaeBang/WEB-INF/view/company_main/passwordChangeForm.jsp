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


function checkPasswordPattern(str) {

	var pattern1 = /[0-9]/; // 숫자 
	var pattern2 = /[a-zA-Z]/; // 문자 
	var pattern3 = /[~!@\#$%<>^&*\()\-=+_\’]/; // 특수문자
	var pattern4 = /[\s]/;
	if (!pattern1.test(str) || !pattern2.test(str)
			|| !pattern3.test(str) || str.length < 8) {
		if (!pattern1.test(str) && !pattern2.test(str)) {
		 document.getElementById('checkPasswordPattern').style.color = 'red';
			document.getElementById('checkPasswordPattern').innerText = '영문자, 숫자를 입력하세요.';
		} else if (!pattern1.test(str) && !pattern3.test(str)) {
		 document.getElementById('checkPasswordPattern').style.color = 'red';
			document.getElementById('checkPasswordPattern').innerText = '특수문자, 숫자를 입력하세요.';
		} else if (!pattern2.test(str) && !pattern3.test(str)) {
		 document.getElementById('checkPasswordPattern').style.color = 'red';
			document.getElementById('checkPasswordPattern').innerText = '영문자, 특수문자를 입력하세요.';
		} else if (!pattern1.test(str)) {
		 document.getElementById('checkPasswordPattern').style.color = 'red';
			document.getElementById('checkPasswordPattern').innerText = '숫자를 입력하세요.';
		} else if (!pattern2.test(str)) {
		 document.getElementById('checkPasswordPattern').style.color = 'red';
			document.getElementById('checkPasswordPattern').innerText = '영문자를 입력하세요.';
		} else if (!pattern3.test(str)) {
		 document.getElementById('checkPasswordPattern').style.color = 'red';
			document.getElementById('checkPasswordPattern').innerText = '특수문자를 입력하세요.';
		} else if (str.length < 8) {
		 document.getElementById('checkPasswordPattern').style.color = 'red';
			document.getElementById('checkPasswordPattern').innerText = '8자리 이상 입력하세요.';
		}

	} else {
		 document.getElementById('checkPasswordPattern').style.color = 'green';
		document.getElementById('checkPasswordPattern').innerText = '사용가능';
	}

	if (pattern4.test(str)) {
		 document.getElementById('checkPasswordPattern').style.color = 'red';
		document.getElementById('checkPasswordPattern').innerText = '공백은 입력할 수 없습니다';
	}
	if (str == "") {
		document.getElementById('checkPasswordPattern').innerText = str;
	}

}

var check1 = function() {
	
	  document.getElementById('message').innerHTML = '';
		  
}


var check2 = function() {
	
	  if (document.getElementById('e_password').value ==
	    document.getElementById('confirmpassword').value) {
	    document.getElementById('message').style.color = 'green';
	    document.getElementById('message').innerHTML = '일치';
	  } else {
	    document.getElementById('message').style.color = 'red';
	    document.getElementById('message').innerHTML = '불일치';
	  }
	  
	  
}
	
	
	
	
	
	
var passwordConfirm = function() {
	
	if (document.getElementById('e_password').value ==
	    document.getElementById('confirmpassword').value) {
	     
		return true;
		
	}else{
		
		alert("입력하신 두 비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
		return false;
		
		
	}
	
	
}

</script>
</head>

<body>
	<header>
		<jsp:include page="../employee_include/topmenu.jsp" />
	</header>
	
	
	<div class="container">
		<h1>새로운 비밀번호 설정</h1>
		<hr>
		<h4>변경하실 새 비밀번호를 입력해주세요</h4>
		<hr>		
		<form:form name="lform" commandName="employeeVo" action="${ pageContext.request.contextPath }/ceo/passwordChangeForm" method="post" onsubmit="return checkForm()" >
		<form:input type="hidden" id="e_id" value="${ userID }" path="e_id"/>
		<label>새로운 비밀번호&nbsp;&nbsp;<form:input class="form-control" type="password" id="e_password" size="20" name="e_password" path="e_password" onkeyup='checkPasswordPattern($(this).val());check1();'/><span id="checkPasswordPattern"></span></label><br/><br/>
		<label>새로운 비밀번호 확인&nbsp;&nbsp;<input class="form-control" type="password" id="confirmpassword" size="20" name="confirmpassword" onkeyup='check2();'/>
		<span id="message"></span></label><br/><br/>
		<input class="btn btn-theme" type="submit" onclick="return passwordConfirm()" value="변경완료" />
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

</html>