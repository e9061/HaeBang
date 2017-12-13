<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>Moderna - Bootstrap 3 flat corporate template</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="" />
	<!-- css -->
	<link href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet" />
	<link href="${ pageContext.request.contextPath }/resources/css/fancybox/jquery.fancybox.css" rel="stylesheet">
	<link href="${ pageContext.request.contextPath }/resources/css/jcarousel.css" rel="stylesheet" />
	<link href="${ pageContext.request.contextPath }/resources/css/flexslider.css" rel="stylesheet" />
	<link href="${ pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet" />


	<!-- Theme skin -->
	<link href="${ pageContext.request.contextPath }/resources/skins/default.css" rel="stylesheet" />

	<!-- =======================================================
    Theme Name: Moderna
    Theme URL: https://bootstrapmade.com/free-bootstrap-template-corporate-moderna/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
	======================================================= -->

<style type="text/css">

.container1 {
	padding:0 30px 0 50px;
	position:relative;
}


ul.meta-post li{
	float:left;
	margin:0 10px 0 0;
	padding:0;
	list-style:none;
	border-right:0px dotted #e9e9e9;
	padding-right:50px;
}


</style>

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
       document.getElementById('e_password').style.borderColor='red'
         document.getElementById('checkPasswordPattern').innerText = '영문자, 숫자를 입력하세요.';
      } else if (!pattern1.test(str) && !pattern3.test(str)) {
       document.getElementById('checkPasswordPattern').style.color = 'red';
       document.getElementById('e_password').style.borderColor='red'
         document.getElementById('checkPasswordPattern').innerText = '특수문자, 숫자를 입력하세요.';
      } else if (!pattern2.test(str) && !pattern3.test(str)) {
       document.getElementById('checkPasswordPattern').style.color = 'red';
       document.getElementById('e_password').style.borderColor='red'
         document.getElementById('checkPasswordPattern').innerText = '영문자, 특수문자를 입력하세요.';
      } else if (!pattern1.test(str)) {
       document.getElementById('checkPasswordPattern').style.color = 'red';
       document.getElementById('e_password').style.borderColor='red'
         document.getElementById('checkPasswordPattern').innerText = '숫자를 입력하세요.';
      } else if (!pattern2.test(str)) {
       document.getElementById('checkPasswordPattern').style.color = 'red';
       document.getElementById('e_password').style.borderColor='red'
         document.getElementById('checkPasswordPattern').innerText = '영문자를 입력하세요.';
      } else if (!pattern3.test(str)) {
       document.getElementById('checkPasswordPattern').style.color = 'red';
       document.getElementById('e_password').style.borderColor='red'
         document.getElementById('checkPasswordPattern').innerText = '특수문자를 입력하세요.';
      } else if (str.length < 8) {
       document.getElementById('checkPasswordPattern').style.color = 'red';
       document.getElementById('e_password').style.borderColor='red'
         document.getElementById('checkPasswordPattern').innerText = '8자리 이상 입력하세요.';
      }

   } else {
       document.getElementById('checkPasswordPattern').style.color = 'green';
       document.getElementById('e_password').style.borderColor='green'
      document.getElementById('checkPasswordPattern').innerText = '사용가능';
   }

   if (pattern4.test(str)) {
       document.getElementById('checkPasswordPattern').style.color = 'red';
       document.getElementById('e_password').style.borderColor='red'
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
       document.getElementById('confirmPassword').value) {
    	   document.getElementById('confirmPassword').style.borderColor='green'
       document.getElementById('message').style.color = 'green';
       document.getElementById('message').innerHTML = '일치';
     } else {
    	   document.getElementById('confirmPassword').style.borderColor='red'
       document.getElementById('message').style.color = 'red';
       document.getElementById('message').innerHTML = '불일치';
     }
     
     
}
   
   
   
   
   
   
var passwordConfirm = function() {
   
   if (document.getElementById('e_password').value ==
       document.getElementById('confirmPassword').value) {
        
      return true;
      
   }else{
      
      alert("입력하신 두 비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
      return false;
      
      
   }
   
   
}

</script>


</head>

<body>
	<div id="wrapper">
		<!-- start header -->
		
		<header> <jsp:include page="../employee_include/topmenu.jsp" />
		</header>
		
		<!-- end header -->
		<section id="inner-headline">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<ul class="breadcrumb">
							<li><a href="#"><i class="fa fa-home"></i></a><i class="icon-angle-right"></i></li>
							<li class="active">Blog</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<section id="content">
			<div class="container1">
				<div class="row">
				<div class="col-lg-2">
						<aside class="left-sidebar">
							
							<div class="widget">
								<h5 class="widgetheading">Information</h5>
								<ul class="cat">
									<li><i class="icon-angle-right"></i><a href="${ pageContext.request.contextPath }/ceo/info">개인 정보</a></li>
									<c:if test="${employeeVo.e_type =='사장' }">
									<li><i class="icon-angle-right"></i><a href="${ pageContext.request.contextPath }/ceo/empInfo">직원 정보</a></li>
									</c:if>
								</ul>
							</div>
							
						</aside>
					</div>
					<div class="col-lg-6">
						<article>
								<div class="container">
      <h1>새로운 비밀번호 설정</h1>
      <hr>
      <h4>변경하실 새 비밀번호를 입력해주세요</h4>
      <hr>      
      <form:form name="lform" commandName="newEmployeeVo" action="${ pageContext.request.contextPath }/ceo/info/changingPassword" method="post" onsubmit="return checkForm()" >
      <form:input type="hidden" value="${ employeeVo.e_id }" path="e_id"/>
      <label>새로운 비밀번호&nbsp;&nbsp;<form:input class="form-control" type="password"  size="20" path="e_password" onkeyup='checkPasswordPattern($(this).val());check1();'/><span id="checkPasswordPattern"></span></label><br/><br/>
      <label>새로운 비밀번호 확인&nbsp;&nbsp;<input class="form-control" type="password" id="confirmPassword" size="20" name="confirmPassword" onkeyup='check2();'/>
      <span id="message"></span></label><br/><br/>
      <input class="btn btn-theme" type="submit" onclick="return passwordConfirm()" value="변경완료" />
      </form:form>
      <br />
      <hr>
         
   </div>
							
						</article>
						
					
						
					</div>
				</div>
			</div>
		</section>
		<footer> <jsp:include page="../employee_include/bottom.jsp" />
		</footer>
		
	</div>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
<script src="${ pageContext.request.contextPath }/resources/js/jquery.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/jquery.easing.1.3.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/jquery.fancybox.pack.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/jquery.fancybox-media.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/google-code-prettify/prettify.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/portfolio/jquery.quicksand.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/portfolio/setting.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/jquery.flexslider.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/animate.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/custom.js"></script>

</body>


</html>
