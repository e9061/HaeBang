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
<link href="${ pageContext.request.contextPath }/resources/css/jcarousel.css"
	rel="stylesheet" />
<link href="${ pageContext.request.contextPath }/resources/css/flexslider.css"
	rel="stylesheet" />
<link href="${ pageContext.request.contextPath }/resources/css/style.css"
	rel="stylesheet" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Theme skin -->
<link href="${ pageContext.request.contextPath }/resources/skins/default.css"
	rel="stylesheet" />

<!-- =======================================================
    Theme Name: Moderna
    Theme URL: https://bootstrapmade.com/free-bootstrap-template-corporate-moderna/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
	======================================================= -->

<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none; position:fixed; overflow:hidden; z-index:1; -webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>



<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function c_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
            	// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('c_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('c_address').value = fullAddr;
                  document.getElementById('c_address').focus();

	             
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
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
		
		
		var check = function() {
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
		

		function nextStep() {
			var form = document.form;
			var i;
			for (i = 0; i < form.length - 1; i++) {
				if (form[i].value == "" || form[i].value == null) {
					
					if(form[i].name=='e_id' ){
						alert("아이디를 입력해주세요.");
						form[i].focus();
						return false;
					}
					if(form[i].name=='fileEmployee'){
						alert("사진을 첨부해주세요.");
						form[i].focus();
						return false;
					}
					if(form[i].name=='e_password' ){
						alert("비밀번호를 입력해주세요.");
						form[i].focus();
						return false;
					}
					if(form[i].name=='confirmPassword' ){
						alert("비밀번호 확인을 입력해주세요.");
						form[i].focus();
						return false;
					}
					if(form[i].name=='e_name' ){
						alert("이름을 입력해주세요.");
						form[i].focus();
						return false;
					}
					if(form[i].name=='c_name' ){
						alert("회사명을 입력해주세요.");
						form[i].focus();
						return false;
					}
					if(form[i].name=='e_phone1' || form[i].name=='e_phone2' || form[i].name=='e_phone3'){
						alert("휴대전화 번호를 입력해주세요.");
						form[i].focus();
						return false;
					}
					if(form[i].name=='c_phone' ){
						alert("업체 대표번호를 입력해주세요.");
						form[i].focus();
						return false;
					}
					if(form[i].name=='c_bizNo' ){
						alert("사업자 등록번호를 입력해주세요.");
						form[i].focus();
						return false;
					}
					if(form[i].name=='fileCompany'){
						alert("사업자 등록증을 첨부해주세요.");
						form[i].focus();
						return false;
					}
					if(form[i].name=='c_postcode' ){
						alert("주소를 검색해주세요.");
						form[i].focus();
						return false;
					}
					if(form[i].name =='c_address' ){
						alert("주소를 검색해주세요.");
						form[i].focus();
						return false;
					}
					if(form[i].name == 'c_detailAddress'){
						alert("상세 주소를 입력해주세요.");
						form[i].focus();
						return false;
					}
					if(form[i].name == 'c_code'){
						alert("회사 코드를 입력해주세요.");
						form[i].focus();
						return false;
					}
					
				}
				
				
				else if($(document.form[0]).next().next().html() !='사용가능한 아이디입니다.'){
								alert("아이디 중복확인을 해주세요.");
								document.form[0].focus();
								return false;
						}
				else if(i==2){
					if(document.getElementById('checkPasswordPattern').innerText != "사용가능")	
					{
								alert("비밀번호를 올바르게 입력해주세요.");
								document.form[i].focus();
								return false;
						}
					}
					else if(i ==3){
						if(form[2].value != form[3].value)
							{
							alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.')
							document.form[i].focus();
							return false;
							}
					
					}else if($(document.form[i]).parents().prev().html()=="휴대전화 번호" || $(document.form[i]).prev().html()=="업체 대표 번호")
					{
						var pattern1 = /^[0-9]+$/g; // 숫자
						
						if(!pattern1.test(form[i].value)){
							alert('숫자만 입력해주세요.')
							document.form[i].focus();
							return false;
							
				
						}

					}else if($(document.form[i]).parents().prev().html()=="사업자 등록번호")
					{	
						if($(document.form[i]).next().next().html() !='사용가능한 사업자 번호입니다.'){
					
						alert("사업자 번호 중복확인을 해주세요.");
						document.form[i].focus();
						return false;
					
						}
					}
				
				
					
				
			
			}
			if(document.form.c_bizNo == null){
				
				alert("회사 코드를 입력해주세요.")
				return false;
			}
			return true;
		}
				
		$(document).on("click", "#duplicate1", function(){
			
				$.ajax({		
					url: "${pageContext.request.contextPath}/ceo/register/duplicate1",
					type: "POST",
					data: {	
						e_id : $(this).prev().val(),
					},
					success: function(result){
						$("#duplicate1").next().text(result);
					}
				}); 
			});
				
	
		$(document).on("click", "#duplicate2", function(){
			
				$.ajax({		
					url: "${pageContext.request.contextPath}/ceo/register/duplicate2",
					type: "POST",
					data: {	
						c_bizNo : $(this).prev().val(),
					},
					success: function(data){
						$("#duplicate2").next().text(data);
					}
				}); 
			});
				
		
		
	
	$(document).on("click", "#confirmCode", function(){
		
		$.ajax({		
			url: "${pageContext.request.contextPath}/ceo/register/ccode",
			type: "GET",
			/* dataType: 'json' */
			data: {	
				c_code : $(this).prev().val(),
			},
			success: function(result){ 
				var msg ="";
				var msg1 ="";
				var msg2 ="";
				if(result ==null || result == ""){
					$("#ajax").next().html("");
					$("#ajax").next().next().html("");
					$("#ajax").next().next().next().html("");
					$("#confirmCode").next().text("일치하는 회사가 없습니다.");
				}
				else{
					
					$("#confirmCode").next().text("");
					msg += " <label for='c_name' class='pop_label_03'>회사명</label> ";
					msg += "<input type='text' style='width:50%;' name='c_name' class='form-control' readonly='readonly' value='"+result.c_name+"' />";
					msg1 += " <label for='c_address' class='pop_label_03'>회사 주소</label> ";
					msg1 += "<input type='text' style='width:50%;' name='c_address' class='form-control' readonly='readonly' value='"+result.c_address+"' />";
					msg2 += " <label for='c_bizNo' class='pop_label_03'>사업자 등록 번호</label> ";
					msg2 += "<input type='text' style='width:50%;' name='c_bizNo' class='form-control' readonly='readonly' value='"+result.c_bizNo+"' />";
					msg2 += "<input type='hidden' style='width:50%;' name='c_phone'  value='"+result.c_phone+"' />";
					
				}
				$("#ajax").next().html(msg);
				$("#ajax").next().next().html(msg1);
				$("#ajax").next().next().next().html(msg2);
		} 
	});
	});
	
	
	

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
     

		  function inputAddress(address){
			  
			  $.ajax({		
					url: "http://apis.skplanetx.com/tmap/geo/fullAddrGeo",
					type: "GET",
					data: {	
						version : 1,
						fullAddr : address,
						addressFlag : "F00",
						format : "json",
						appKey : "1d03f3c5-e620-375a-94d6-e359b011ec64"
					},
					success : function(result)
					{
						
						document.getElementById('c_lon').value = result.coordinateInfo.coordinate[0].newLon;
						document.getElementById('c_lat').value = result.coordinateInfo.coordinate[0].newLat;
						
					},
					error: function(data){
						var str = JSON.stringify(data.responseText);
						var str1 = str.substring(str.lastIndexOf(",")+1);
						var str2 = str.substring(0,str.lastIndexOf(","));
						str1 = str1.substring(0, str1.length-1);
						str2 = str2.substring(1, str2.length);
						var str3 = str2.replace(/\\/gi,"")+str1.replace(/\\/gi,"");
						var result = JSON.parse(str3);
						
						
						document.getElementById('c_lon').value = result.coordinateInfo.coordinate[0].lon;
						document.getElementById('c_lat').value = result.coordinateInfo.coordinate[0].lat;

						
					}
			  });
		  }
							  
		  
		  
	
	
	
	
	
	
	</script>

<style type="text/css">


.btn-info1:hover {
  color : #000000;
  border: 1px solid #000000;
}
.btn-info1 {
  color : #000000;
  border: 0.5px thin #000000;
}



</style>


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



		
		<section id="content"> 
		
		<form:form action="step3" name="form" commandName="joinEmployeeVo" method="post" 
		onsubmit="return nextStep()" enctype="multipart/form-data"> 
			<div class="container">
			
				<div class="row">
				
					<div class="col-md-8 col-md-offset-2">
						<h4>
							<strong>계정 정보</strong>
						</h4>

							

							<label for="e_id" class="pop_label_03">아이디(이메일)</label>
						<div class="form-group">
							<form:input style="width:50%; float:left;" path="e_id" class="form-control"
								placeholder="아이디를 입력해주세요." /> 
							&nbsp;&nbsp;<a class="btn btn-info1" id="duplicate1" style="width: 100px ">중복 확인</a>
							&nbsp;&nbsp;
							<form:errors path="e_id" />
							<span></span>
						</div>
						<div class="form-group">
							<!-- 아이디 t_employee 테이블 e_id -->
							
							<!-- onclick="javascript:chkeck_id($(this).prev().val())" -->
						<input id= "fileUpload1" type="file" style="width:50%;" name="fileEmployee"/>
							<label for="fileUpload1" class="pop_label_03">회원사진 첨부</label>
							<img id="blah1" src="#" alt="" style="height: 10%; width: 10%" />

							<div id="holder1"></div>
						</div>	
						

						<div class="form-group"></div>

						<div class="form-group">
							<label for="e_password" class="pop_label_03">비밀번호</label>
							<form:password onkeyup="checkPasswordPattern($(this).val())"
								style="width:50%;" path="e_password" class="form-control"
								placeholder="비밀번호를 입력해주세요."  />
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
								onkeyup='check();' />
							<form:errors path="confirmPassword" />

							<div class="validation"></div>
						</div>
<div class="form-group" id="message">
							<span class="txt_right" style="text-align: right;"></span>
						</div>

					</div>
				</div>
			</div>


			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<c:choose>
						<c:when test="${ownerOrMember ne 'M' }">
						
						
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
						
							<label for="e_phone1" class="pop_label_03">휴대전화 번호</label>
						<div class="form-group">
							<form:input style="width:16%; float:left;" path="e_phone1"
								class="form-control" />
							<form:input style="width:17%; float:left;" path="e_phone2"
								class="form-control" />
							<form:input style="width:17%; float:left;" path="e_phone3"
								class="form-control" />
							&nbsp;&nbsp;<a href="#"	class="btn btn-info1" style="width: 100px">번호 인증</a>
							<!-- 휴대전화 번호 t_employee 테이블 변수 e_phone -->
						</div>
							<label for="c_phone" class="pop_label_03">업체 대표 번호</label>
						<div class="form-group">
							<form:input style="width:50%;" path="c_phone"
								class="form-control"  />
							<form:errors path="c_phone" />
							<!-- 업체 대표 번호 t_company 테이블 변수 c_phone -->


							<div class="validation"></div>
						</div>
							<label for="c_bizNo" class="pop_label_03">사업자 등록번호</label>
						<div class="form-group">
							<form:input style="width:50%; float:left;" path="c_bizNo" class="form-control" placeholder="사업자 등록증상 등록번호"/>
							&nbsp;&nbsp;<a class="btn btn-info1" id="duplicate2" style="width: 100px;">중복 확인</a>
							<span></span>
							<form:errors path="c_bizNo" />
						
						</div>
						<div class="form-group">
							<!-- 사업자 등록번호 t_company 테이블 변수 c_bizNo -->
							<input id= "fileUpload" type="file" style="width:50%;" name="fileCompany"/>
							<label for="fileUpload" class="pop_label_03">사업자 등록증 첨부</label>
							<img id="blah" src="#" alt="" style="height: 10%; width: 10%" />

							<div id="holder"></div>
								
							<div class="validation"></div>
						</div>
					<!-- 	<div class="form-group">
							<span class="txt_right" style="text-align: right;">*'-' 제외
								입력</span>
						</div> -->
							<label for="c_address" class="pop_label_03">업체 주소</label>
						<div class="form-group">
						
						<input type="text" name ="c_postcode" id="c_postcode" class="form-control" style="width:20%; float:left"/>
						&nbsp;&nbsp; <input type="button" class="btn btn-info1" onclick="c_execDaumPostcode()" value="우편번호 찾기"><br>
						</div>
						<div class="form-group">
							<form:input style="width:50%;" onblur="inputAddress($(this).val())" path="c_address"
								class="form-control" placeholder="사업자 등록증상 업체 주소를 입력해 주세요." />
							<form:errors path="c_address" />
							<!-- 업체주소 t_company 테이블 변수 c_address -->
						<input type="text" name="c_detailAddress" placeholder="상세입력" class="form-control" style="width:50%;"/>
						<form:hidden path="c_lon"/>
						<form:hidden path="c_lat"/>
						</div>
						
						<div class="text-center" id="plz"></div>
												<div class="text-center">
							<a href="<%=request.getContextPath()%>/ceo"><input
								type="button" value="취소" class="btn btn-theme"></a> <input
								type="submit" value="다음" class="btn btn-theme">
						</div>
						
						</c:when>
						<c:otherwise>
						
						<h4>
							<strong>직원님 정보</strong>
						</h4>
						<div class="form-group">
							<label for="e_name" class="pop_label_03">직원님 성함</label>
							<form:input path="e_name" class="form-control"
								 style="width:50%;" placeholder="실명을 입력해주세요" />
							<form:errors path="e_name" />
							<!-- 사장님 성함 t_employee 테이블 변수 e_name -->


							<div class="validation"></div>
						</div>


						<label for="e_phone1" class="pop_label_03">휴대전화 번호</label>
						<div class="form-group">
							<form:input style="width:16%; float:left;" path="e_phone1"
								class="form-control" />
							<form:input style="width:17%; float:left;" path="e_phone2"
								class="form-control" />
							<form:input style="width:17%; float:left;" path="e_phone3"
								class="form-control" />
							&nbsp;&nbsp;<a href="#"	class="btn btn-info1" style="width: 100px">번호 인증</a>
							<!-- 휴대전화 번호 t_employee 테이블 변수 e_phone -->
						</div>
						
						
							<label for="c_code" class="pop_label_03">회사 코드</label>
				<div class="form-group" id="ajax">
							<form:input style="width:50%; float:left" path="c_code" class="form-control"
								placeholder="회사 코드 번호 입력" />
							&nbsp;&nbsp;<a class="btn btn-info1" id="confirmCode" style="width: 100px">코드 확인</a>
							&nbsp;&nbsp;<span></span>
						</div>
						
						
						<div class="form-group">
							
						</div>

						<div class="form-group">
						</div>
						
						<div class="form-group">
						</div>
						
						<div class="text-center">
							<a href="<%=request.getContextPath()%>/ceo"><input
								type="button" value="취소" class="btn btn-theme"></a> <input
								type="submit" value="다음" class="btn btn-theme">
						</div>
						</c:otherwise>
						
						
						</c:choose>
						
					<input name = "ownerOrMember" type="hidden" value='<c:out value="${ownerOrMember }"></c:out>' />
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
	<script src="${ pageContext.request.contextPath }/resources/js/jquery.js"></script>
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
	<script src="${ pageContext.request.contextPath }/resources/js/animate.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/custom.js"></script>
	
	<script
		src="${ pageContext.request.contextPath }/resources/contactform/contactform.js"></script>

</body>

</html>


