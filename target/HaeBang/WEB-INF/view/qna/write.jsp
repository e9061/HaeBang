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
<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="resources/css/jcarousel.css" rel="stylesheet" />
<link href="resources/css/flexslider.css" rel="stylesheet" />
<link href="resources/css/style.css" rel="stylesheet" />


<!-- Theme skin -->
<link href="resources/skins/default.css" rel="stylesheet" />

<!-- =======================================================
    Theme Name: Moderna
    Theme URL: https://bootstrapmade.com/free-bootstrap-template-corporate-moderna/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
	======================================================= -->
<!-- <script type="text/javascript">
	function doAction() {
		location.href = "${ pageContext.request.contextPath }/qna/write"

	}
</script> -->
<script>
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



 
 	$(function(){
		$("#fileUpload1").on("change", function(){
			readURL1(this);	
		});	
	});
	
	 function readURL1(fileUpload) {
         if (fileUpload.files && fileUpload.files[0]) {
         var reader = new FileReader();

         reader.onload = function (e) {
                 $('#blah1').attr('src', e.target.result);
                 
             }

           reader.readAsDataURL(fileUpload.files[0]);
         }
     } 
 

</script>
</head>

<body>
	<div id="wrapper">
		<header> <jsp:include page="../member_include/topmenu.jsp" />
		</header>
		
		<section id="content">
		<div class="container" align="center">
			<div class="row" align="center">
				<div class="col-lg-8" align="center">
					<article> 
					<div>
						<h2>
							<span>QnA 작성</span>
						</h2>
						<form:form commandName="QnAVO" method="post" enctype="multipart/form-data">
							<table border="1" class="table table-striped table-bordered table-hover" style="width: 1120px;" >
								<tr>
									<th width="25%">제목</th>
									<td><form:input path="q_title" class="form-control"/></td>
								</tr>
								<tr>
									<th width="25%">글쓴이</th>
									<td><form:input id="q_writer" class="form-control" placeholder="${ userVO.m_name }" name ="q_writer" value="${ userVO.m_name }" path="q_writer" readonly="true" /></td>
								</tr>
								<tr>
									<th width="25%">내용</th>
									<td><form:textarea rows="7" cols="10" class="form-control" path="q_content" /></td>
								</tr>
							</table>
							
							<div class="form-group">
								 <input type="file" name="qnaFile">
							</div>
						<div align="center">
							<input type="submit" value="등록" class="btn btn-theme"s/>
						</div>
						</form:form>
					</div>
				
					
				</div>
				
			</div>
		</div>
		</section>
		<footer> <jsp:include page="/WEB-INF/view/member_include/bottom.jsp" />
		</footer>
	</div>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="resources/js/jquery.js"></script>
	<script src="resources/js/jquery.easing.1.3.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.fancybox.pack.js"></script>
	<script src="resources/js/jquery.fancybox-media.js"></script>
	<script src="resources/js/google-code-prettify/prettify.js"></script>
	<script src="resources/js/portfolio/jquery.quicksand.js"></script>
	<script src="resources/js/portfolio/setting.js"></script>
	<script src="resources/js/jquery.flexslider.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>

</body>

</html>
