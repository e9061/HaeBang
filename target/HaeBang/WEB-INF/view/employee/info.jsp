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
	border-right:0px dotted #e9e9e9;
	padding-right:50px;
}


</style>

<script type="text/javascript">


	function click_update(data){
		if(data == "e_password"){
			
			var msg = "<input class='form-control' name='password' type='password' placeholder='기존 비밀번호를 입력해주세요.'/>"
		}else{
			var msg = "<input class='form-control' type='text' placeholder='"+$(document.getElementsByClassName(data)).next().html()+"'/>"
		}
		var msg1 = "<a class='btn btn-info' id='"+data+"' style='width: 70px; color:white';>수정</a>"
		$(document.getElementsByClassName(data)).next().html(msg);
		$(document.getElementsByClassName(data)).next().next().html(msg1);
		$(document.getElementsByClassName(data)).parent().next().html("");

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
					<div class="col-lg-6">
						<article>
								<div class="post-heading">
									<h3><a href="#">개인 정보</a></h3>
								</div>
						
							<div class="bottom-article">
								<ul class="meta-post" >
									<li style="width:150px; ">아이디</li>
									<li style="width:400px; " >${employeeVo.e_id }</li>
								</ul>
								<a href="${pageContext.request.contextPath }/ceo/info/updateEmpPicture" class="pull-right abc"><img src="data:image/jpeg;base64,${image}"  style="width: 100px; height: auto;" /></a>
							</div>
							<div class="bottom-article">
								<ul class="meta-post">
									<li style="width:150px">이 름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
									<li style="width:400px" >${employeeVo.e_name }</li>
								</ul>
							</div>
							<div class="bottom-article">
								<ul class="meta-post">
									<li style="width:150px" class="e_phone" >휴대전화</li>
									<li style="width:400px" >${employeeVo.e_phone }</li>
									<li></li>
								</ul>
								<a href="javascript:click_update('e_phone');" class="pull-right abc"><img src="${pageContext.request.contextPath }/resources/img/noun_1060075_cc.png" style="width: 25px; height: auto;" /></a>
							</div>
							<div class="bottom-article">
								<ul class="meta-post">
									<li style="width:150px" class="e_password">비밀번호</li>
									<li style="width:400px" >************</li>
									<li></li>
								</ul>
								<a href="javascript:click_update('e_password');" class="pull-right"><img src="${pageContext.request.contextPath }/resources/img/noun_1060075_cc.png" style="width: 25px; height: auto;" /></a>
									<input id="hidden" type="hidden" value="${employeeVo.e_password }"/>
							</div>
							
								<div class="bottom-article">
								<ul class="meta-post">
									<li style="width:150px">직 책&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
									<li style="width:400px" >${employeeVo.e_type }</li>
									<li></li>
								</ul>
							</div>
							
						</article>
						
						<article>
							<div class="post-image">
								<div class="post-heading">
									<h3><a href="#">회사 정보</a></h3>
								</div>
							</div>
							<div class="bottom-article">
								<ul class="meta-post">
									<li style="width:150px" class="c_name">회사명</li>
									<li style="width:400px" >${companyVo.c_name }</li>
									<li></li>
								</ul>
								<c:if test="${employeeVo.e_type =='사장' }" ><a href="javascript:click_update('c_name');" class="pull-right"><img src="${pageContext.request.contextPath }/resources/img/noun_1060075_cc.png" style="width: 25px; height: auto;" /></a></c:if>
							</div>
							<div class="bottom-article">
								<ul class="meta-post">
									<li style="width:150px">회사 주소</li>
									<li style="width:400px" id= "${companyVo.c_address }"> ${companyVo.c_address }</li>
									<li></li>
								</ul>
								<c:if test="${employeeVo.e_type =='사장' }"><a href="${pageContext.request.contextPath }/ceo/info/updateAddress" class="pull-right"><img src="${pageContext.request.contextPath }/resources/img/noun_1060075_cc.png" style="width: 25px; height: auto;" /></a></c:if>
							</div>
							<div class="bottom-article">
								<ul class="meta-post">
									<li style="width:150px" class="c_phone">대표전화번호</li>
									<li  style="width:400px" > ${companyVo.c_phone }</li>
									<li></li>
								</ul>
								<c:if test="${employeeVo.e_type =='사장' }"><a href="javascript:click_update('c_phone');" class="pull-right"><img src="${pageContext.request.contextPath }/resources/img/noun_1060075_cc.png" style="width: 25px; height: auto;" /></a></c:if>
							</div>
							
							
							<c:if test="${employeeVo.e_type =='사장' }">
							
							
							<div class="bottom-article">
								<ul class="meta-post">
									<li style="width:150px">사업자등록번호</li>
									<li style="width:400px" >${companyVo.c_bizNo }</li>
									<li></li>
								</ul>
								<a href="${pageContext.request.contextPath }/ceo/info/updateBizNo" class="pull-right"><img src="${pageContext.request.contextPath }/resources/img/noun_1060075_cc.png" style="width: 25px; height: auto;" /></a>
							</div>
								<div class="bottom-article">
								<ul class="meta-post">
									<li style="width:150px">은행계좌 및 계좌번호</li>
									<li style="width:200px" >${companyVo.c_bank }</li>
									<li style="width:200px" >${companyVo.c_accNo }</li>
									<li></li>
								</ul>
								<a href="#" class="pull-right"><img src="${pageContext.request.contextPath }/resources/img/noun_1060075_cc.png" style="width: 25px; height: auto;" /></a>
							</div>
								<div class="bottom-article">
								<ul class="meta-post">
									<li style="width:150px">직원수</li>
									<li style="width:400px" >${companyVo.c_empCnt }</li>
									<li></li>
								</ul>
							</div>
								<div class="bottom-article">
								<ul class="meta-post">
									<li style="width:150px">회사코드</li>
									<li style="width:400px" >${companyVo.c_code }</li>
								</ul>
							</div>
						</c:if>
								<div class="bottom-article">
								<ul class="meta-post">
									<li style="width:150px">해방가입일</li>
									<li style="width:400px" >${companyVo.c_signDate }</li>
								</ul>
							</div>
								<div class="bottom-article">
								<ul class="meta-post">
									<li style="width:150px">해방등록일</li>
									<li style="width:400px" >${companyVo.c_regDate }</li>
								</ul>
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

$(document).on("click", "#e_phone, #c_name, #c_phone", function(){
	
	if($(this).parents('li').prev().children().val() =="")
	{
			alert($(this).parents('li').prev().prev().html()+"를 입력해주세요.")
			return false; 
	}
	if($(this).parents('li').prev().prev().html()=="휴대전화" || $(this).parents('li').prev().prev().html()=="대표전화번호"){
			var pattern1 = /^[0-9]+$/g; // 숫자
			if(!pattern1.test($(this).parents('li').prev().children().val())){
				alert('숫자만 입력해주세요.')
				return false;
			}
		}
	if(confirm("수정 하시겠습니까?")==false)
		{
		return false;
		}
	$.ajax({		
		url: "${pageContext.request.contextPath}/ceo/info/update",
		type: "POST",
		data: {	
			key : $(this).parents('li').prev().prev().attr('class'),
			value : $(this).parents('li').prev().children().val()
			
		},
		success: function(result){

				var msg = "<img src='${pageContext.request.contextPath }/resources/img/noun_1060075_cc.png' style='width: 25px; height: auto;' />"; 
				$("#e_phone").parents('li').prev().html(result.employeeVo.e_phone);
				$("#e_phone").parent().parent().next().html(msg);
				$("#e_phone").parents('li').html("");

				$("#c_name").parents('li').prev().html(result.companyVo.c_name);
				$("#c_name").parent().parent().next().html(msg);
				$("#c_name").parents('li').html("");
				
				$("#c_phone").parents('li').prev().html(result.companyVo.c_phone);
				$("#c_phone").parent().parent().next().html(msg);
				$("#c_phone").parents('li').html("");
			
			
			/* else if($(this).parents('li').prev().prev().attr('class')=='c_phone' )
			{
				$(this).parents('li').prev().attr('id', "${companyVo.c_phone }"); 
				$(this).parents('li').prev().html("${companyVo.c_phone }");
				
				$(this).parents('li').html("");
			}else{
				$(this).parents('li').prev().attr('id', "${companyVo.c_name }"); 
				$(this).parents('li').prev().html("${companyVo.c_name }");
				
				$(this).parents('li').html("");
				
			} */
			
		}
	}); 
});


$(document).on("click", "#e_password",function(){
	
	if( $("#hidden").val() == $(this).parents().prev().children().val()){
		
		    var form = document.createElement("form");
		    form.setAttribute("method", "POST");
		    form.setAttribute("action", "${pageContext.request.contextPath}/ceo/info/changePassword");
		        var hiddenField = document.createElement("input");
		        hiddenField.setAttribute("type", "hidden");
		        hiddenField.setAttribute("name", "next");
		        hiddenField.setAttribute("value", "step");
		        form.appendChild(hiddenField);
		        document.body.appendChild(form);

		        form.submit();
		}
	else{
		alert("비밀번호가 일치하지 않아요. 다시 입력해주세요.");
		return false;
	}
});


</script>


</html>
