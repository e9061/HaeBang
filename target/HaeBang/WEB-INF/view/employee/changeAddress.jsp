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

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
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



.btn-info1:hover {
  color : #000000;
  border: 1px solid #000000;
}
.btn-info1 {
  color : #000000;
  border: 0.5px thin #000000;
}


</style>

<script>

function nextStep() {
	var form = document.form;
	var i;

		if (form[0].value == "" || form[0].value == null) {
			alert('우편번호를 검색해주세요.');
			form[0].focus();
			return false;
		}
		
		if (form[2].value == "" || form[2].value == null) {
		
			alert('주소를 입력해주세요.');
			form[2].focus();
			return false;
		}
		if (form[3].value == "" || form[3].value == null) {
		
			alert('상세주소를 입력해주세요.');
			form[3].focus();
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
      <h3>업체 주소 변경</h3>
      <hr>
					<form:form action="${pageContext.request.contextPath}/ceo/info/updateAddress" name="form" commandName="companyVo" method="post" onsubmit="return nextStep()" enctype="multipart/form-data">
						
						<label for="c_address" class="pop_label_03">업체 주소</label>
						<div class="form-group">
						
						<input type="text" id="c_postcode" class="form-control" style="width:10%; float:left"/>
						&nbsp;&nbsp; <input type="button" class="btn btn-info1" onclick="c_execDaumPostcode()" value="우편번호 찾기"><br>
						</div>
						<div class="form-group">
							<form:input style="width:30%;" path="c_address"
								class="form-control" placeholder="사업자 등록증상 업체 주소를 입력해 주세요." />
							<!-- 업체주소 t_company 테이블 변수 c_address -->
						<input type="text" name="c_detailAddress" placeholder="상세입력" class="form-control" style="width:30%;"/>

							<div class="validation"></div>
						</div>
						
						<br/>
						<div class="form-group">
						 <input class="btn btn-info1" type="submit" value="변경완료" />
						
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
