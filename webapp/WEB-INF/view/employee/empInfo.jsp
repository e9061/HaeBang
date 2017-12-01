<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	border-right:1px dotted #e9e9e9;
	padding-right:90px;
	padding-top: 10px;
	
}
</style>

<script type="text/javascript">
	function click_update(data){
		
		var msg = "<input class='form-control' type='text' placeholder='"+$(document.getElementsByClassName(data)).next().html()+"'/>"
		var msg1 = "<a class='btn btn-info' id='"+data+"' style='width: 70px; color:white';>수정</a>"
		$(document.getElementsByClassName(data)).next().html(msg);
		$(document.getElementsByClassName(data)).next().next().html(msg1);
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
									<li><i class="icon-angle-right"></i><a href="info">개인 정보</a></li>
									<c:if test="${employeeVo.e_type =='사장' }">
									<li><i class="icon-angle-right"></i><a href="empInfo">직원 정보</a></li>
									</c:if>
								</ul>
							</div>
							
						</aside>
					</div>
					<div class="col-lg-9">
						<article>
								<div class="post-heading">
									<h3><a href="#">직원 정보</a></h3>
								</div>
						
							<div class="bottom-article">
								<ul class="meta-post">
									<li style="width:140px;">직 함</li>
									<li style="width:150px;">이 름</li>
									<li style="width:180px;">전화번호</li>
									<li style="width:180px;">가입일</li>
									<li style="width:150px;">사진정보</li>
									<li style="width:150px;">삭제</li>
								</ul>
							</div>
							
							<div class= "deleteAfter">
						<c:forEach var ="emp" items="${employeeVoList }">
							<div class="bottom-article">
								
								<ul class="meta-post">
									<li style="width:140px;">
									
									<c:if test="${emp.e_type eq 'O' }">
									사 장
									</c:if>
									<c:if test="${emp.e_type eq 'E' }">
									직 원
									</c:if>
									
									
									</li>
									<li style="width:150px;">${emp.e_name }</li>
									<li style="width:180px;">${emp.e_phone }</li>
									<li style="width:180px;">${emp.e_joinDate }</li>
									<li style="width:150px;"><img src="data:image/jpeg;base64,${emp.encodedString}" style="width: 40px; height: auto;" /></li>
									<li style="width:150px;"><c:if test="${emp.e_type ne 'O' }"><a class="delete" href="#" ><img src="${pageContext.request.contextPath }/resources/img/noun_945742_cc.png" style="width: 40px; height: auto;" /></a></c:if></li>
									<li ><input type="hidden" value="${emp.e_no }"/></li>
								</ul>
								
							</div>
						</c:forEach>
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
<script>
$(document).on("click",".delete", function(){
	
	if(confirm($(this).parents().parents().children().first().next().html() +" 직원을 삭제하시겠습니까?")== false)
	{
		
		return false;	
	}
	$.ajax({
		url: "${pageContext.request.contextPath}/ceo/empInfo/delete",
		type: "POST",
		data: {
			e_no : $(this).parent().next().children().val()
		},
		success: function(result){
			
				var msg ="";
				var list = JSON.parse(result);
			for(i =0; i<list.length; i++ )
				{
				
					msg += "<div class='bottom-article'>";
					msg += "<ul class='meta-post'>";
					msg +="<li style='width:140px;'>";	
					if(list[i].e_type =='O')
					{	msg+="사 장";		}
					else
					{	msg+="직 원";		}
					msg +="</li>";
					msg +="<li style='width:150px;'>";
					msg += list[i].e_name;
					msg +="</li>";
					msg +="<li style='width:180px;'>";
					msg += list[i].e_phone;
					msg +="</li>";
					msg +="<li style='width:180px;'>";
					msg += list[i].e_joinDate;
					msg +="</li>";
					msg +="<li style='width:150px;'>";
					msg +="<img src='data:image/jpeg;base64,";
					msg += list[i].encodedString;
					msg += "' style='width: 40px; height: auto;' /></li>";
					msg += "<li style='width:150px;'>";
					if(list[i].e_type !='O')
						{
							msg +="<a class='delete' href='#' ><img src='${pageContext.request.contextPath }/resources/img/noun_945742_cc.png' style='width: 40px; height: auto;' /></a>";
						}
					msg += "</li>";					
					msg += "<li>";
					msg += "<input type='hidden' value='";
					msg += list[i].e_no;
					msg += "'/></li>";
					
					msg += "</ul>";
					msg += "</div>";
					
					
				}
				
				$(".deleteAfter").html(msg);
				
			
		}
	});
});
</script>


</html>