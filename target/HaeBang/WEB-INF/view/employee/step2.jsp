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
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/css/fancybox/jquery.fancybox.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/jcarousel.css"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/css/flexslider.css"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Theme skin -->
<link href="<%=request.getContextPath()%>/resources/skins/default.css"
	rel="stylesheet" />

<!-- =======================================================
    Theme Name: Moderna
    Theme URL: https://bootstrapmade.com/free-bootstrap-template-corporate-moderna/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
	======================================================= -->


<script src="https://www.gstatic.com/firebasejs/4.6.2/firebase.js"></script>

<script src="https://www.gstatic.com/firebasejs/4.2.0/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/4.2.0/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/4.2.0/firebase-database.js"></script>
<script src="https://www.gstatic.com/firebasejs/4.2.0/firebase-messaging.js"></script>

<script>
  // Initialize Firebase
  
  window.recaptchaVerifier = new firebase.auth.RecaptchaVerifier('recaptcha-container');

  var firebase = require("firebase/app");
				require("firebase/auth");
				require("firebase/messaging");
  
  var config = {
    apiKey: "AIzaSyD2yYWBnrFFgNo3boGudxusBspSqtNadh4",
    authDomain: "haebang-3a26c.firebaseapp.com",
    projectId: "haebang-3a26c",
    messagingSenderId: "987506698782"
  };
  firebase.initializeApp(config);
</script>

<script>
		// var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
		// 시작 /^과 끝 슬러시로 구분. 끝날때/g put, [a-z]  소문자, [a-zA-Z]소대문자, [a-z0-9]소문자숫자 $(달러표현이 마지막에 들어가면 마지막 문자에 대한 조건임)
		//{5,19} 5-19자리 가능!!

		/* 	var idReg = /[A-Za-z0-9]+[~!@\#$%<>^&*\()\-=+_\’]{6,20}/g
			if (!idReg.test($("input[name=uid]").val())) {
				alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
				return;
			} 
		
		
						var pattern1 = /[0-9]/;    숫자 포함여부
						var pattern2 = /[a-zA-Z]/;   영문자 포함여부
						var pattern3 = /[\s]/;      공백 포함 여부
						
						if(!pattern1.test(form[i].value) || !pattern2.test(form[i].value)|| form[i].value.length < 6 || form[i].value.length > 14 )
							{
								
								alert('영문, 숫자 포함 6~14자리로 입력해주세요.');
								document.form[i].focus();
								return false;
							}
						if (pattern3.test(form[i].value)) {
								alert('공백은 입력할 수 없습니다');
								document.form[i].focus();
								return false;
		
		
		
		*/

			function checkPasswordPattern(str) {

			var pattern1 = /[0-9]/; // 숫자 
			var pattern2 = /[a-zA-Z]/; // 문자 
			var pattern3 = /[~!@\#$%<>^&*\()\-=+_\’]/; // 특수문자
			var pattern4 = /[\s]/;
			if (!pattern1.test(str) || !pattern2.test(str)
					|| !pattern3.test(str) || str.length < 8) {
				if (!pattern1.test(str) && !pattern2.test(str)) {
					document.getElementById('checkPasswordPattern').innerText = '영문자, 숫자를 입력하세요.';
				} else if (!pattern1.test(str) && !pattern3.test(str)) {
					document.getElementById('checkPasswordPattern').innerText = '특수문자, 숫자를 입력하세요.';
				} else if (!pattern2.test(str) && !pattern3.test(str)) {
					document.getElementById('checkPasswordPattern').innerText = '영문자, 특수문자를 입력하세요.';
				} else if (!pattern1.test(str)) {
					document.getElementById('checkPasswordPattern').innerText = '숫자를 입력하세요.';
				} else if (!pattern2.test(str)) {
					document.getElementById('checkPasswordPattern').innerText = '영문자를 입력하세요.';
				} else if (!pattern3.test(str)) {
					document.getElementById('checkPasswordPattern').innerText = '특수문자를 입력하세요.';
				} else if (str.length < 8) {
					document.getElementById('checkPasswordPattern').innerText = '8자리 이상 입력하세요.';
				}

				/* document.getElementById('checkPasswordPattern').innerText = '사용불가능'; */
				/* document.getElementById('checkPasswordPattern').innerText =str; */
				//alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.");
			} else {
				document.getElementById('checkPasswordPattern').innerText = '사용가능';
			}

			if (pattern4.test(str)) {
				document.getElementById('checkPasswordPattern').innerText = '공백은 입력할 수 없습니다';
			}
			if (str == "") {
				document.getElementById('checkPasswordPattern').innerText = str;
			}

		}

		function nextStep() {
			var form = document.form;
			var i;
			for (i = 0; i < form.length - 1; i++) {
				if (form[i].value == "" || form[i].value == null) {
					alert($(document.form[i]).prev().html() + '를 입력해주세요.');
					form[i].focus();
					return false;
				}
				else if($(document.form[0]).next().next().html() !='사용가능한 아이디입니다.'){
								alert("아이디 중복확인을 해주세요.");
								document.form[0].focus();
								return false;
						}
				else if(document.getElementById('checkPasswordPattern').innerText != "사용가능")
						{
								alert("비밀번호를 올바르게 입력해주세요.");
								document.form[1].focus();
								return false;
						}
					else if(i ==2){
						if(form[1].value != form[2].value)
							{
							alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.')
							document.form[i].focus();
							return false;
							}
					
					}else if(i==5 || i==6 ){
						var pattern1 = /^[0-9]+$/g; // 숫자
						
						if(!pattern1.test(form[i].value)){
							alert('숫자만 입력해주세요.')
							document.form[i].focus();
							return false;
							
				
						}

					}
					else if($(document.form[7]).next().next().html() !='사용가능한 사업자 번호입니다.'){
						alert("사업자 번호 중복확인을 해주세요.");
						document.form[7].focus();
						return false;
			
					}
					
					
			
			}
			return true;
		}
				
		
		

		
/* 		$(document).ready(function(){
			$('#replybutton').click(function(){
				$.ajax({
					
					url : "/MiniProject2/likeReply.do",
					type : "GET",
					data : {
						id : $("#like_id").val(),
						like_no : $("#like_no").val(),
						content: $('#replyWord').val(), 
					},
					success : getIt,
					error : function(){
						alert('실패');
					}
				});
			});
			
		});
 */

		$(document).on("click", "#duplicate1", function(){
			
				$.ajax({		
					url: "/HaeBang1/ceo/register/duplicate1",
					type: "POST",
					data: {	
						e_id : $(this).prev().val(),
					},
					success: getIt1
				}); 
			});
				
		
	function getIt1(data){
				$('#duplicate1').next().text(data);
	}		
	
	
		$(document).on("click", "#duplicate2", function(){
			
				$.ajax({		
					url: "/HaeBang1/ceo/register/duplicate2",
					type: "POST",
					data: {	
						c_bizNo : $(this).prev().val(),
					},
					success: getIt2
				}); 
			});
				
		
	function getIt2(data){
				$('#duplicate2').next().text(data);
	}		
		
	
	
	
 	$(function(){
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
						<li class="active">Contact</li>
					</ul>
				</div>
			</div>
		</div>
		</section>




		<section id="content"> <form:form action="step3" name="form"
			commandName="joinEmployeeVo" method="post"
			onsubmit="return nextStep()" enctype="multipart/form-data"> 
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4>
							<strong>계정 정보</strong>
						</h4>

						<div id="sendmessage">Your message has been sent. Thank you!</div>
						<div id="errormessage"></div>

						<!-- $(document.first[0]).next().html() -->
						<div class="form-group">
							<label for="e_id" class="pop_label_03">아이디</label>
							<form:input style="width:50%;" path="e_id" class="form-control"
								placeholder="아이디를 입력해주세요." data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<%-- <form:errors path="e_id" /> --%>
							<!-- 아이디 t_employee 테이블 e_id -->
							
							<!-- onclick="javascript:chkeck_id($(this).prev().val())" -->
							<a class="btn_def_r" id="duplicate1" style="width: 100px">중복 확인</a>
							<span></span>
							<div class="validation"></div>
						</div>

						<div class="form-group">
							<span class="txt_right" style="text-align: right;">* 영문, 숫자 포함 6~14자리로 입력해주세요.</span>
						</div>

						<div class="form-group"></div>

						<div class="form-group">
							<label for="e_password" class="pop_label_03">비밀번호</label>
							<form:password onkeyup="checkPasswordPattern($(this).val())"
								style="width:50%;" path="e_password" class="form-control"
								placeholder="비밀번호를 입력해주세요." data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<form:errors path="e_password" />
							<!-- 비밀번호 t_employee 테이블 e_password -->


							<div class="validation"></div>
						</div>
						<div class="form-group" id="checkPasswordPattern">
							<span class="txt_right" style="text-align: right;"></span>
						</div>
						<div class="form-group">
							<span class="txt_right" style="text-align: right;">* 영문,
								숫자, 특수문자 포함 8자리 이상으로 입력해주세요.</span>
						</div>



						<div class="form-group">
							<label for="confirmPassword" class="pop_label_03">비밀번호 확인</label>
							<form:password style="width:50%;" path="confirmPassword"
								class="form-control" placeholder="비밀번호를 다시 입력해주세요."
								data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
							<form:errors path="confirmPassword" />

							<div class="validation"></div>
						</div>


					</div>
				</div>
			</div>


			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4>
							<strong>사장님 정보</strong>
						</h4>
						<div id="sendmessage">Your message has been sent. Thank you!</div>
						<div id="errormessage"></div>
						<div class="form-group">
							<label for="e_name" class="pop_label_03">사장님 성함</label>
							<form:input path="e_name" class="form-control"
								placeholder="사업자 등록증상 대표자명" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" style="width:50%;" />
							<form:errors path="e_name" />
							<!-- 사장님 성함 t_employee 테이블 변수 e_name -->


							<div class="validation"></div>
						</div>


						<div class="form-group">
							<label for="c_name" class="pop_label_03">업체명</label>
							<form:input style="width:50%;" path="c_name" class="form-control"
								placeholder="사업자 등록증상 업체명" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<form:errors path="c_name" />
							<!-- 업체명 t_company 테이블 변수 c_name -->


							<div class="validation"></div>
						</div>
						<div class="form-group">
							<span class="txt_right" style="text-align: right;">* 실명을
								입력해주세요.</span>
						</div>
						<div class="form-group">
							<label for="e_phone" class="pop_label_03">휴대전화 번호</label>
							<form:input style="width:50%;" path="e_phone"
								class="form-control" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<form:errors path="e_phone" />
							<!-- 휴대전화 번호 t_employee 테이블 변수 e_phone -->


							<a href="#" onclick="javascript:chkeck_id($(this).prev().val())"
								class="btn_def_r" style="width: 100px">번호 인증</a>
							<div class="validation"></div>
						</div>
						<div class="form-group">
							<label for="c_phone" class="pop_label_03">업체 대표 번호</label>
							<form:input style="width:50%;" path="c_phone"
								class="form-control" data-rule="minlen:4"
								data-msg="Please enter at least 4 chars" />
							<form:errors path="c_phone" />
							<!-- 업체 대표 번호 t_company 테이블 변수 c_phone -->


							<div class="validation"></div>
						</div>
						<div class="form-group">
							<label for="c_bizNo" class="pop_label_03">사업자 등록번호</label>
							<form:input style="width:50%;" path="c_bizNo"
								class="form-control" placeholder="사업자 등록증상 등록번호"
								data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
							<form:errors path="c_bizNo" />
							<!-- 사업자 등록번호 t_company 테이블 변수 c_bizNo -->
							<a class="btn_def_r" id="duplicate2" style="width: 100px">중복 확인</a>
							<span></span>
							<input id= "fileUpload" type="file" style="width:50%;" name="file"/>
							<label for="fileUpload" class="pop_label_03">사업자 등록증 첨부</label>
							<img id="blah" src="#" alt="" style="height: 10%; width: 10%" />

							<div id="holder"></div>
								
							<div class="validation"></div>
						</div>
					<!-- 	<div class="form-group">
							<span class="txt_right" style="text-align: right;">*'-' 제외
								입력</span>
						</div> -->
						<div class="form-group">
							<label for="c_address" class="pop_label_03">업체 주소</label>
							<form:input style="width:50%;" path="c_address"
								class="form-control" placeholder="사업자 등록증상 업체 주소를 입력해 주세요."
								data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
							<form:errors path="c_address" />
							<!-- 업체주소 t_company 테이블 변수 c_address -->

							<a href="#" onclick="javascript:chkeck_id($(this).prev().val())"
								class="btn_def_r" style="width: 100px">주소 확인</a>
							<div class="validation"></div>
						</div>


						<!-- <div class="form-group">
								이메일 주소 <input style="width:50%;" type="text" name="name" class="form-control" id="name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
							이메일 주소 t_company 테이블 변수 c_address
								<select title="직접 입력">
								<option value="뭥미"/>
								
								</select>								
								
								<div class="validation"></div>
							</div> -->

						<div class="text-center">
							<a href="<%=request.getContextPath()%>/ceo"><input
								type="button" value="취소" class="btn btn-theme"></a> <input
								type="submit" value="다음" class="btn btn-theme">
						</div>
					</div>
				</div>
			</div>
		</form:form> </section>
		<footer> <jsp:include page="../employee_include/bottom.jsp" />
		</footer>
	</div>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery.easing.1.3.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery.fancybox.pack.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery.fancybox-media.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/google-code-prettify/prettify.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/portfolio/jquery.quicksand.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/portfolio/setting.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery.flexslider.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/animate.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
	
	<script
		src="<%=request.getContextPath()%>/resources/contactform/contactform.js"></script>

</body>

</html>

