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
<style>

	#content {
	text-align: center;
}

table {
	text-align: center;
}

tr {
	text-align: center;
}

td {
	text-align: center;
}

div {
	text-align: center;
	align: center;
}
</style>
<script>
/* $(document).on("click", "#fileUpload", function(){   

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
     }  */
 

</script>
</head>

<body>
	<div id="wrapper">
		<header> <jsp:include page="../member_include/topmenu.jsp" />
		</header>
		
		<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<article> 
					<div>
						<h2 align="center">
							<span>QnA 수정</span>
						</h2>
						<form:form commandName="QnAVO" method="PUT" >
							<table border="1" width="80%">
								<tr>
									<th width="25%">제목</th>
									<td><form:input path="q_title" class="form-control" default="${ QnAList.q_title }" /></td>
								</tr>
								<tr>
									<th width="25%">글쓴이</th>
									<td><form:input id="q_writer" class="form-control" placeholder="${ userVO.m_name }" name ="q_writer" value="${ userVO.m_name }" path="q_writer" readonly="true" /></td>
								</tr>
								<tr>
									<th width="25%">내용</th>
									<td><form:textarea rows="7" cols="10" class="form-control" path="q_content" default="${ QnAList.q_title }"/></td>
								<!-- </tr>
									<td bgcolor="orange" width="70">첨부파일</td><td align="left">
									<input type="file" name="q_oriName"/></td>
								</tr> -->
							</table>
							<div class="form-group">
							<!-- 아이디 t_employee 테이블 e_id -->
							
							<!-- onclick="javascript:chkeck_id($(this).prev().val())" -->
						<!-- <input id= "fileUpload1" type="file" style="width:50%;" name="fileQnA"/>
							<label for="fileUpload1" class="pop_label_03">첨부 파일</label>
							<img id="blah1" src="#" alt="" style="height: 10%; width: 10%" />

							<div id="holder1"></div>
						</div>	 -->
							<input type="submit" value="등록" />
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
