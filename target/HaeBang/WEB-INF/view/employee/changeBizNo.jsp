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
<link
	href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="${ pageContext.request.contextPath }/resources/css/fancybox/jquery.fancybox.css"
	rel="stylesheet">
<link
	href="${ pageContext.request.contextPath }/resources/css/jcarousel.css"
	rel="stylesheet" />
<link
	href="${ pageContext.request.contextPath }/resources/css/flexslider.css"
	rel="stylesheet" />
<link
	href="${ pageContext.request.contextPath }/resources/css/style.css"
	rel="stylesheet" />


<!-- Theme skin -->
<link
	href="${ pageContext.request.contextPath }/resources/skins/default.css"
	rel="stylesheet" />

<!-- =======================================================
    Theme Name: Moderna
    Theme URL: https://bootstrapmade.com/free-bootstrap-template-corporate-moderna/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
	======================================================= -->

<style type="text/css">
.container1 {
	padding: 0 30px 0 50px;
	position: relative;
}

ul.meta-post li {
	float: left;
	margin: 0 10px 0 0;
	padding: 0;
	list-style: none;
	border-right: 0px dotted #e9e9e9;
	padding-right: 50px;
}
</style>

<script>

function nextStep() {
	var form = document.form;
	var i;

		if (form[0].value == "" || form[0].value == null) {
			alert($(document.form[0]).parents().prev().children().html() + '를 입력해주세요.');
			form[0].focus();
			return false;
		}
		if($(document.form[0]).parents().prev().children().html()=="사업자 등록번호")
		{	
			if($(document.form[0]).next().next().html() !='사용가능한 사업자 번호입니다.'){
		
			alert("사업자 번호 중복확인을 해주세요.");
			document.form[0].focus();
			return false;
		
			}
		}
		if (form[1].value == "" || form[1].value == null) {
		
			alert('사업자 등록증을 첨부해주세요.');
			form[1].focus();
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
						<li><a href="#"><i class="fa fa-home"></i></a><i
							class="icon-angle-right"></i></li>
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
							<li><i class="icon-angle-right"></i><a
								href="${ pageContext.request.contextPath }/ceo/info">개인 정보</a></li>
							<c:if test="${employeeVo.e_type =='사장' }">
								<li><i class="icon-angle-right"></i><a
									href="${ pageContext.request.contextPath }/ceo/empInfo">직원
										정보</a></li>
							</c:if>
						</ul>
					</div>

					</aside>
				</div>
				<div class="col-lg-6">
					<article> 
					
					<div class="container">
      <h2>새 사업자번호 및 등록증 설정</h2>
      <hr>
					<form:form action="${pageContext.request.contextPath}/ceo/info/changeBizNo" name="form" commandName="companyVo" method="post" onsubmit="return nextStep()" enctype="multipart/form-data">
						
						<div class="form-group">
						
							<label for="c_bizNo" class="pop_label_03">사업자 등록번호</label>
						</div>
						<div class="form-group">
							<form:input style="width:30%; float:left;" path="c_bizNo"
								class="form-control" placeholder="사업자 등록증상 등록번호"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="btn btn-info" id="duplicate3" style="width: 100px;">중복
								확인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span></span> 
								<form:errors path="c_bizNo"/>
								
						</div>
						<br/>
						
						<div class="form-group">
						<label
								for="fileUpload" class="pop_label_03">사업자 등록증 첨부</label>
						</div>
						<div class="form-group">
						<input id="fileUpload" type="file"
								style="width: 50%;" name="fileCompany" />  <img
								id="blah" src="#" alt="" style="height: 10%; width: 10%" />

						
						
						</div>
						<br/>
						<div class="form-group">
						 <input class="btn btn-theme" type="submit" value="변경완료" />
						
						</div>
						
					</form:form> 
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


<script >



$(document).on("click", "#fileUpload", function(){   

	$("#fileUpload").on("change", function(){
		readURL(this);	
	});	

});


 function readURL(fileUpload) {
     if (fileUpload.files && fileUpload.files[0]) {
     var reader = new FileReader();

     reader.onload = function (e) {
             $('#blah').attr('src', e.target.result);
             
         }

       reader.readAsDataURL(fileUpload.files[0]);
     }
 } 
 
 
 
 
 $(document).on("click", "#duplicate3", function(){
		
		$.ajax({		
			url: "${pageContext.request.contextPath}/ceo/register/duplicate3",
			type: "POST",
			data: {	
				c_bizNo : $(this).prev().val(),
			},
			success: function(data){
				$(document.form[0]).next().next().text(data);
				$(document.form[0]).next().next().next().html("");
			}
		}); 
	});
 
 

</script>


</html>
