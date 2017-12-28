<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<style type="text/css">
.container1 {
	padding: 0 30px 0 50px;
	position: relative;
}

table.type09 {
	border-collapse: collapse;
	line-height: 1.5;
	margin: 5px;
	margin-bottom: 20px;
}

table.type09 thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
	text-align: center;
}

table.type09 tbody th {
	width: 250px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}

table.type09 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

.center {
	text-align: center !important;
	font-weight: bold;
}

*, *::before, *::after {
	box-sizing: border-box;
}

html, body {
	min-height: 100%;
	font-family: 'Open sans', sans-serif;
}

/*--------------------
Form
--------------------*/
.form fieldset {
	border: none;
	padding: 0;
	padding: 10px 0;
	position: relative;
	clear: both;
}

.form fieldset.fieldset-expiration {
	float: left;
	width: 60%;
}

.form fieldset.fieldset-expiration .select {
	width: 84px;
	margin-right: 12px;
	float: left;
}

.form fieldset.fieldset-ccv {
	clear: none;
	float: right;
	width: 86px;
}

.form fieldset label {
	display: block;
	text-transform: uppercase;
	font-size: 11px;
	color: rgba(0, 0, 0, 0.6);
	margin-bottom: 5px;
	font-weight: bold;
	font-family: Inconsolata;
}

.form fieldset input, .form fieldset .select {
	width: 100%;
	height: 38px;
	color: #333333;
	padding: 10px;
	border-radius: 5px;
	font-size: 15px;
	outline: none !important;
	border: 1px solid rgba(0, 0, 0, 0.3);
	box-shadow: inset 0 1px 4px rgba(0, 0, 0, 0.2);
}

.form fieldset input.input-cart-number, .form fieldset .select.input-cart-number
	{
	width: 82px;
	display: inline-block;
	margin-right: 8px;
}

.cardinput {
	display: inline-block;
	width: 100%;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.428571429;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

.cardinput:last-child, .form fieldset input.input-cart-number:last-child,
	.form fieldset .select.input-cart-number:last-child {
	margin-right: 0;
}

.form fieldset .select {
	position: relative;
}

.form fieldset .select::after {
	content: '';
	border-top: 8px solid #222;
	border-left: 4px solid transparent;
	border-right: 4px solid transparent;
	position: absolute;
	z-index: 2;
	top: 14px;
	right: 10px;
	pointer-events: none;
}

.form fieldset .select select {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	position: absolute;
	padding: 0;
	border: none;
	width: 100%;
	outline: none !important;
	top: 6px;
	left: 6px;
	background: none;
}

.form fieldset .select select :-moz-focusring {
	color: transparent;
	text-shadow: 0 0 0 #000;
}

.form button {
	width: 100%;
	outline: none !important;
	background: -webkit-linear-gradient(top, #49a09b, #3d8291);
	background: linear-gradient(180deg, #49a09b, #3d8291);
	text-transform: uppercase;
	font-weight: bold;
	border: none;
	box-shadow: none;
	text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
	margin-top: 90px;
}

.form button .fa {
	margin-right: 6px;
}

/*--------------------
Checkout
--------------------*/
.checkout {
	margin: 150px auto 30px;
	position: relative;
	width: 460px;
	background: white;
	border-radius: 15px;
	padding: 160px 45px 30px;
	box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
}

/*--------------------
Credit Card
--------------------*/
.credit-card-box {
	-webkit-perspective: 1000;
	perspective: 1000;
	width: 400px;
	height: 280px;
	position: absolute;
	top: -112px;
	left: 50%;
	-webkit-transform: translateX(-50%);
	transform: translateX(-50%);
}

.credit-card-box:hover .flip, .credit-card-box.hover .flip {
	-webkit-transform: rotateY(180deg);
	transform: rotateY(180deg);
}

.credit-card-box .front, .credit-card-box .back {
	width: 400px;
	height: 250px;
	border-radius: 15px;
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
	background: -webkit-linear-gradient(315deg, #bd6772, #53223f);
	background: linear-gradient(135deg, #bd6772, #53223f);
	position: absolute;
	color: #fff;
	font-family: Inconsolata;
	top: 0;
	left: 0;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.3);
	box-shadow: 0 1px 6px rgba(0, 0, 0, 0.3);
}

.credit-card-box .front::before, .credit-card-box .back::before {
	content: '';
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: url("http://cdn.flaticon.com/svg/44/44386.svg") no-repeat
		center;
	background-size: cover;
	opacity: .05;
}

.credit-card-box .flip {
	-webkit-transition: 0.6s;
	transition: 0.6s;
	-webkit-transform-style: preserve-3d;
	transform-style: preserve-3d;
	position: relative;
}

.credit-card-box .logo {
	position: absolute;
	top: 9px;
	right: 20px;
	width: 60px;
}

.credit-card-box .logo svg {
	width: 100%;
	height: auto;
	fill: #fff;
}

.credit-card-box .front {
	z-index: 2;
	-webkit-transform: rotateY(0deg);
	transform: rotateY(0deg);
}

.credit-card-box .back {
	-webkit-transform: rotateY(180deg);
	transform: rotateY(180deg);
}

.credit-card-box .back .logo {
	top: 185px;
}

.credit-card-box .chip {
	position: absolute;
	width: 60px;
	height: 45px;
	top: 20px;
	left: 20px;
	background: -webkit-linear-gradient(315deg, #ddccf0 0%, #d1e9f5 44%, #f8ece7 100%);
	background: linear-gradient(135deg, #ddccf0 0%, #d1e9f5 44%, #f8ece7 100%);
	border-radius: 8px;
}

.credit-card-box .chip::before {
	content: '';
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
	border: 4px solid rgba(128, 128, 128, 0.1);
	width: 80%;
	height: 70%;
	border-radius: 5px;
}

.credit-card-box .strip {
	background: -webkit-linear-gradient(315deg, #404040, #1a1a1a);
	background: linear-gradient(135deg, #404040, #1a1a1a);
	position: absolute;
	width: 100%;
	height: 50px;
	top: 30px;
	left: 0;
}

.credit-card-box .number {
	position: absolute;
	margin: 0 auto;
	top: 103px;
	left: 19px;
	font-size: 38px;
}

.credit-card-box label {
	font-size: 10px;
	letter-spacing: 1px;
	text-shadow: none;
	text-transform: uppercase;
	font-weight: normal;
	opacity: 0.5;
	display: block;
	margin-bottom: 3px;
}

.credit-card-box .card-holder, .credit-card-box .card-expiration-date {
	position: absolute;
	margin: 0 auto;
	top: 180px;
	left: 19px;
	font-size: 22px;
	text-transform: capitalize;
}

.credit-card-box .card-expiration-date {
	text-align: right;
	left: auto;
	right: 20px;
}

.credit-card-box .ccv {
	height: 36px;
	background: #fff;
	width: 91%;
	border-radius: 5px;
	top: 110px;
	left: 0;
	right: 0;
	position: absolute;
	margin: 0 auto;
	color: #000;
	text-align: right;
	padding: 10px;
}

.credit-card-box .ccv label {
	margin: -25px 0 14px;
	color: #fff;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet prefetch'
	href='https://fonts.googleapis.com/css?family=Inconsolata'>
<link rel='stylesheet prefetch'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>

<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	function c_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = data.address; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 기본 주소가 도로명 타입일때 조합한다.
						if (data.addressType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('address').value = fullAddr;
						document.getElementById('address').focus();

					}
				}).open();

	}

	function inputAddress(address) {
		$
				.ajax({
					url : "https://api2.sktelecom.com/tmap/geo/fullAddrGeo",
					type : "GET",
					data : {
						version : 1,
						fullAddr : address,
						addressFlag : "F00",
						format : "json",
						appKey : "3a8e2503-7364-4259-9624-81dfdd0cb5ff"
					},
					success : function(result) {
						console.log(result);
						console.log(result.coordinateInfo.coordinate[0].newLon
								+ "new");
						console.log(result.coordinateInfo.coordinate[0].lon
								+ "old");
						if (result.coordinateInfo.coordinate.length == '1') {
							document.getElementById('lon').value = result.coordinateInfo.coordinate[0].newLon;
							document.getElementById('lat').value = result.coordinateInfo.coordinate[0].newLat;
							document.getElementById('m_gu').value = result.coordinateInfo.coordinate[0].gu_gun;
						} else {
							document.getElementById('lon').value = result.coordinateInfo.coordinate[0].lon;
							document.getElementById('lat').value = result.coordinateInfo.coordinate[0].lat;
							document.getElementById('m_gu').value = result.coordinateInfo.coordinate[0].gu_gun;
						}
					},

				});
	}
</script>


</head>
<style>
#hi {
	background-color: skyblue;
	family-font: bold;
	width: 500px;
	height: 50px;
}

.container {
	display: inline-block;
}

.hide {
	visibility: hidden;
}

ul, ol {
	padding: 0;
	margin: 0 0 0 0;
	list-style-type: none;
}

.modal-80p {
	width: 80%;
}

.ad {
	position: absolute;
	bottom: 70px;
	right: 48px;
	z-index: 992;
	background-color: #f3f3f3;
	position: fixed;
	width: 155px;
	padding: 1px;
}

.ad-btn-hide {
	position: absolute;
	top: -10px;
	left: -12px;
	background: #fefefe;
	background: rgba(240, 240, 240, 0.9);
	border: 0;
	border-radius: 26px;
	cursor: pointer;
	padding: 2px;
	height: 25px;
	width: 25px;
	font-size: 14px;
	vertical-align: top;
	outline: 0;
}

.carbon-img {
	float: left;
	padding: 10px;
}

.carbon-text {
	color: #888;
	display: inline-block;
	font-family: Verdana;
	font-size: 11px;
	font-weight: 400;
	height: 60px;
	margin-left: 9px;
	width: 142px;
	padding-top: 10px;
}

.carbon-text:hover {
	color: #666;
}

.carbon-poweredby {
	color: #6A6A6A;
	float: left;
	font-family: Verdana;
	font-size: 11px;
	font-weight: 400;
	margin-left: 10px;
	margin-top: 13px;
	text-align: center;
}

#type2 {
	display: none;
}

.form-control1 {
	display: block;
	width: 90%;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.428571429;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, box-shadow
		ease-in-out .15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

#bootstrap-override .jumbotron {
	background-color: transparent !important;
	padding: 40px 40px;
	margin: 30px 10px;
}

.centerContent {
	display: table;
	margin-left: auto;
	margin-right: auto;
}

label {
	font-size: 16px !important;
	margin-bottom: 15px !important;
}

#myProgress {
	width: 100%;
	background-color: #ddd;
}

#myBar {
	width: 1%;
	height: 30px;
	background-color: #4CAF50;
}

#bootstrap-override .modal-dialog {
	width: 50%;
}

/* 내정보등록 */
.header {
	background: #3f9cb5;
	padding: 30px 25px;
	font-size: 30px;
	color: #fff;
	text-align: center;
	text-transform: uppercase;
	border-radius: 3px 3px 0 0;
}

.heading {
	font-size: 16px;
	color: #3f9cb5;
	margin: 10px 0 20px 0;
	text-transform: capitalize;
}

.form-content {
	padding: 25px;
	background: #fff;
}

.myinfo-form-control {
	padding: 12px 16px 12px 39px;
	height: 50px;
	font-size: 14px;
	color: #2b2a2a;
	border: none;
	border-bottom: 2px solid #ccc;
	border-radius: 0;
	box-shadow: none;
	margin-bottom: 15px;
}

.myinfo-form-control:focus {
	border-color: #3f9cb5;
	box-shadow: none;
}

.control-label {
	font-size: 17px;
	color: #ccc;
	position: absolute;
	top: 5px;
	left: 27px;
	text-align: center;
}

textarea.myinfo-form-control {
	resize: vertical;
	height: 130px;
}
</style>

<body id="bootstrap-override">
	<div id="wrapper">
		<!-- start header -->
		<header>
			<jsp:include page="member_include/topmenu.jsp" />
		</header>

		<!-- end header -->
		<section id="featured">
			<!-- start slider -->
			<div class="container">
				<!--    <div class="row" style="float: left; width: 100%;"> -->
				<div class="col-lg-8" style="float: left;">
					<!-- start Customer-control form -->
					<div id="question">

						<span id="q1"><h5>${q1.title}</h5></span>
						<p class="q"
							style="line-height: 19.5px; font-size: 14px; font-weight: 100;">
							<c:forEach var="option" items="${q1.options}">
								<input type="radio" name="response[1]" value="${option}"
									id="${option}">
								<label for="${option}">${option}</label>
								<br />
							</c:forEach>
						</p>

					</div>
					<button type="button" class="qSubmit btn" value="Next">Next</button>

					<div id="myModal" class="modal fade" role="dialog" tabindex="-1"
						aria-labelly="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">

							<!-- Modal content -->
							<div class="modal-content">
								<div class="modal-header">
									<div id="myProgress">
										<div id="myBar"></div>
									</div>
								</div>
								<div class="modal-body">
									<div class="row hide" data-step="1" data-title="맞춤서비스 해방">
										<div class="jumbotron">
											<div class="centerContent" style="margin-bottom: 20px;">

												<h3>맞춤 서비스를 위한 해방 진단을 시작합니다.</h3>

											</div>


											<div
												style="display: table; margin-left: auto; margin-right: auto;">
												<img
													src="${ pageContext.request.contextPath }/resources/img/magnifyingGlass.png" />
											</div>
										</div>
										<!-- <div style="align:right;">
											<button type="button" class="btn btn-warning js-btn-step" data-orientation="previous">이전</button>
											<button type="button" class="btn btn-success" id="step2" >다음</button>
											</div> -->
									</div>

									<div class="row hide" data-step="2"
										data-title="This is the second step!">
										<div class="jumbotron">
											<div>


												<div class="centerContent">

													<div style="margin-bottom: 40px;">
														<h2>해방 서비스를 선택해주세요.</h2>
													</div>

													<ul class="request-formset">

														<li class="checkset"><input type="radio"
															name="selecttype" id="choice1" value="H"> <span class="radio-body"><label
																for="choice1">해충방역</label></span>
														<li class="checkset">
															<div
																style="width: 100px; border: 1px soild black; height: 50px; float: left;">
																<input type="radio" name="selecttype" id="choice2"
																	value="S"> <span class="radio-body"><label
																	for="choice2">소독</label></span>

															</div>
													</ul>
												</div>
											</div>



										</div>
									</div>
									<div class="row hide" data-step="3"
										data-title="This is the third step!">
										<div class="jumbotron">
											<div>
												<div class="centerContent">
													<div style="margin-bottom: 40px;">
														<h2>어떤 해충에서 해방되고 싶으십니까?</h2>
													</div>
													<ul class="request-formset">
														<li class="item-list"><input type="checkbox"
															name="selectinsect" id="checkbox-1" value="roach"> <span class="checkbox-body"><label
																for="checkbox-1">바퀴벌레</label></span></li>
														<li class="item-list"><input type="checkbox"
															name="selectinsect" id="checkbox-2" value="ant">
															<span class="checkbox-body"><label
																for="checkbox-2">개미</label></span></li>
														<li class="item-list"><input type="checkbox"
															name="selectinsect" id="checkbox-3" value="mouse">
															<span class="checkbox-body"><label
																for="checkbox-3">쥐</label></span></li>
														<li class="item-list"><input type="checkbox"
															name="selectinsect" id="checkbox-4" value="fly">
															<span class="checkbox-body"><label
																for="checkbox-4">비래해충(파리, 나방, 모기 등)</label></span></li>
														<li class="item-list"><input type="checkbox"
															name="selectinsect" id="checkbox-5" value="micro">
															<span class="checkbox-body"><label
																for="checkbox-5">미세해충(좀벌레, 빈대, 옴 등)</label></span></li>
														<li class="item-list"><input type="checkbox"
															name="selectinsect" id="checkbox-6" value="rice">
															<span class="checkbox-body"><label
																for="checkbox-6">저곡해충(쌀바구미 등)</label></span></li>
														<li class="item-list"><input type="checkbox"
															name="selectinsect" id="checkbox-7" value="walk">
															<span class="checkbox-body"><label
																for="checkbox-7">기타 보행해충(지네, 그리마, 곱등이 등)</label></span></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<div class="row hide" data-step="4"
										data-title="This is the fourth step!">
										<div class="jumbotron">
											<div>

												<div class="centerContent">
													<div style="margin-bottom: 40px;">
														<h2>해방되고 싶은 장소는 어디인가요?</h2>
													</div>
													<ul class="request-formset">
														<li class="item-list"><input type="radio"
															name="selectplace" id="radio-3" value="K"> <span class="radio-body"><label
																for="radio-3">가정</label></span></li>
														<li class="item-list"><input type="radio"
															name="selectplace" id="radio-4" value="Y"> <span
															class="radio-body"><label for="radio-4">영업장</label></span></li>
													</ul>
												</div>
											</div>
										</div>
									</div>

									<div class="row hide" data-step="5"
										data-title="This is the sixth step!">
										<div class="jumbotron">
											<div>
												<div class="centerContent">
													<div style="margin-bottom: 40px;">
														<h2>장소의 크기를 선택해주세요.</h2>
													</div>
													<ul class="request-formset">
														<li class="item-list"><input type="radio"
															name="selectsize" id="radio-7" value="1"> <span class="radio-body"><label
																for="radio-7">10평이하</label></span></li>
														<li class="item-list"><input type="radio"
															name="selectsize" id="radio-8" value="11"> <span
															class="radio-body"><label for="radio-8">11평~20평</label></span></li>
														<li class="item-list"><input type="radio"
															name="selectsize" id="radio-9" value="21"> <span
															class="radio-body"><label for="radio-9">21평~30평</label></span></li>
														<li class="item-list"><input type="radio"
															name="selectsize" id="radio-10" value="31"> <span
															class="radio-body"><label for="radio-10">31평~40평</label></span></li>
														<li class="item-list"><input type="radio"
															name="selectsize" id="radio-11" value="41"> <span
															class="radio-body"><label for="radio-11">41평~50평</label></span></li>
														<li class="item-list"><input type="radio"
															name="selectsize" id="radio-12" value="51"> <span
															class="radio-body"><label for="radio-12">기타</label></span>
															&nbsp;&nbsp;&nbsp;&nbsp;<input
															placeholder="직접입력(숫자만 입력해주세요)"
															style="display: inline-block; height: 34px; padding: 6px 12px; font-size: 14px; line-height: 1.428571429; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px; box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075); transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;"
															size="25" type="text" id="manual">평</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<div class="row hide" data-step="6" data-title="Sign in..">
										<div id="modal-login">
											<div id="cd-login">
												<div class="centerContent">
													<div style="padding: 40px;">
														<h2>로그인을 하시면 해방 서비스를 더욱 편하게 이용하실 수 있습니다.</h2>
													</div>

													<!-- log in form -->
													<div
														style="display: table; margin-left: auto; margin-right: auto;">
														<form class="cd-form" id="cd-form">

															<span class="fieldset" style="align: center;"> <label
																class="image-replace cd-email" for="signin-email">E-mail</label>
																<input class="full-width has-padding has-border"
																id="signin-email" type="email" placeholder="E-mail"
																style="margin-bottom: 10px;">
															</span> <span class="fieldset" style="align: center;"> <label
																class="image-replace cd-password" for="signin-password">Password</label>
																<input class="full-width has-padding has-border"
																id="signin-password" type="password"
																placeholder="Password" style="margin-bottom: 20px;">
															</span>



															<p class="fieldset">
																<input class="full-width"
																	style="width: 500px; margin-top: 20px; margin-bottom: 10px;"
																	type="submit" value="로그인"><br />
																<input class="full-width"
																	style="width: 500px; background-color: gray;"
																	id="bLogin" type="button" value="비회원으로 진행할래요">
															</p>
														</form>

														<p class="cd-form-bottom-message">
															<span style="font-size: small;"><a
																href="${ pageContext.request.contextPath }/ceo/forgotmyid">아이디</a>
																/ <a
																href="${ pageContext.request.contextPath }/ceo/forgotmypassword">비밀번호</a>가
																기억나지 않아요!</span><br />

														</p>
														<!-- <a href="#0" class="cd-close-form">Close</a> -->
													</div>
												</div>
											</div>
											<!-- cd-login -->
										</div>
									</div>


									<form id="insertMOrder" name="sform" class="form-horizontal">


										<div class="row hide" data-step="7"
											data-title="고객님 정보를 입력해주세요">
											<div class="jumbotron">
												<div id="modal-logout">

													<!-- *********************************************************************************************** -->

													<!-- left column -->
													<div class="centerContent">
														<div class="col-md-offset-3 col-md-6"
															style="width: 500px; margin: 0px; border: 2px solid lightgrey;">

															<div class="header">내 정보 등록</div>
															<div class="form-content">
																<h4 class="heading">이름</h4>
																<div class="form-group">
																	<div class="col-sm-10">
																		<label class="control-label" for="exampleInputName2"><i
																			class="fa fa-user"></i></label> <input style="width: 350px;"
																			class="myinfo-form-control" name="name" id="name"
																			type="text">
																	</div>
																</div>
																<h4 class="heading">주소</h4>
																<div class="form-group">
																	<div class="col-sm-10">
																		<label class="control-label" for="exampleInputName2"><i
																			class="fa fa-envelope-o"></i></label> <input
																			class="myinfo-form-control" style="width: 100px;"
																			onkeyup="checkpostcode()" name="postcode"
																			id="postcode" type="text"> &nbsp;&nbsp; <input
																			type="button" class="btn btn-info1"
																			onclick="c_execDaumPostcode()" value="우편번호 찾기">

																	</div>

																	<div class="col-sm-10">
																		<label class="control-label" for="exampleInputName2"></label>
																		<input class="myinfo-form-control"
																			onkeyup="checkpostcode()"
																			onblur="inputAddress($(this).val())"
																			style="width: 350px; padding-left: 16px;"
																			id="address" name="address"
																			placeholder="우편번호찾기버튼을 이용해주세요" type="text">
																	</div>

																	<div class="col-sm-10">
																		<label class="control-label" for="exampleInputName2"></label>
																		<input class="myinfo-form-control" id="detailAddress"
																			name="detailAddress"
																			style="width: 350px; padding-left: 16px;"
																			placeholder="상세주소입력" type="text">
																	</div>

																	<input type="hidden" id="lon" name="lon" /> <input
																		type="hidden" id="lat" name="lat" /> <input
																		type="hidden" id="m_gu" name="m_gu" />

																</div>
																<h4 class="heading">연락처</h4>
																<div class="form-group">
																	<div class="col-sm-3" style="float: left;">
																		<label class="control-label" for="exampleInputName2"><i
																			class="fa fa-lock"></i></label>
																		<!-- <input class="myinfo-form-control" style="width:100px;" id="exampleInputName2" placeholder="연락처를 적어주세요" > -->
																		<select id="phone1" class="myinfo-form-control"
																			name="phone1" style="width: 100px;">
																			<option value="">선택</option>
																			<option value="010">010</option>
																			<option value="011">011</option>
																			<option value="016">016</option>
																			<option value="017">017</option>
																			<option value="018">018</option>
																			<option value="019">019</option>
																		</select>

																	</div>
																	<span style="float: left; padding: 12px 0px;">&nbsp;&nbsp;-&nbsp;&nbsp;</span>
																	<div class="col-sm-3" style="float: left;">
																		<label class="control-label" for="exampleInputName2"></label>
																		<input class="myinfo-form-control"
																			style="width: 100px; padding-left: 16px;"
																			name="phone2" MaxLength="4" id="phone2" type="text" />
																	</div>
																	<span style="float: left; padding: 12px 0px;">&nbsp;&nbsp;-&nbsp;&nbsp;</span>
																	<div class="col-sm-3" style="float: left;">
																		<label class="control-label" for="exampleInputName2"></label>
																		<input class="myinfo-form-control"
																			style="width: 100px; padding-left: 16px;"
																			name="phone3" MaxLength="4" id="phone3" type="text" />
																	</div>
																</div>

															</div>
														</div>
													</div>




												</div>
											</div>
										</div>



										<div class="row hide" data-step="8"
											data-title="select a service">
											<div class="jumbotron">

												<div style="margin-bottom: 40px;">
													<h2>선택해주신 정보를 바탕으로 해방에서 추천드리는 서비스입니다.</h2>
												</div>
												<div class="centerContent">
													<div id="recomendedService"></div>
												</div>

											</div>
										</div>




										<div class="row hide" data-step="9"
											data-title="추천 서비스 중에서 원하시는 날짜, 시간을 선택해주세요">

											<div class="jumbotron">
												<div id="modal-logout">
													<div class="centerContent">
														<div class="col-md-offset-3 col-md-6"
															style="width: 500px; margin: 0px; border: 2px solid lightgrey;">

															<div class="header">날짜 및 시간 등록</div>
															<div class="form-content">
																<h4 class="heading">서비스를 받을 날짜를 선택해주세요.</h4>
																<div class="form-group">
																	<div class="col-sm-10">
																		<div class="input-group date" id="datepicker1">
																			<label class="control-label" for="exampleInputName2"></label>
																			<input type="text"
																				style="width: 400px; padding-left: 15px;"
																				class="myinfo-form-control" id="date1" name="date1"
																				placeholder="YYYY-MM-DD" />
																		</div>
																	</div>
																</div>
																<h4 class="heading">서비스 시작시간을 선택해주세요.</h4>
																<div class="form-group">
																	<div class="col-sm-10">
																		<select id="startTimeHour1"
																			class="myinfo-form-control" name="startTimeHour1"
																			style="width: 130px; float: left; margin-bottom: 30px;">
																			<option value="">선택</option>
																			<option value="00">00</option>
																			<option value="01">01</option>
																			<option value="02">02</option>
																			<option value="03">03</option>
																			<option value="04">04</option>
																			<option value="05">05</option>
																			<option value="06">06</option>
																			<option value="07">07</option>
																			<option value="08">08</option>
																			<option value="09">09</option>
																			<option value="10">10</option>
																			<option value="11">11</option>
																			<option value="12">12</option>
																			<option value="13">13</option>
																			<option value="14">14</option>
																			<option value="15">15</option>
																			<option value="16">16</option>
																			<option value="17">17</option>
																			<option value="18">18</option>
																			<option value="19">19</option>
																			<option value="20">20</option>

																		</select> <span style="float: left;">&nbsp;&nbsp;:&nbsp;&nbsp;</span>


																		<select id="startTimeMinute1"
																			class="myinfo-form-control" name="startTimeMinute1"
																			style="width: 130px; float: left; margin-bottom: 30px;">
																			<option value="">선택</option>
																			<option value="00">00</option>
																			<option value="05">05</option>
																			<option value="10">10</option>
																			<option value="15">15</option>
																			<option value="20">20</option>
																			<option value="25">25</option>
																			<option value="30">30</option>
																			<option value="35">35</option>
																			<option value="40">40</option>
																			<option value="45">45</option>
																			<option value="50">50</option>
																			<option value="55">55</option>
																		</select>


																	</div>
																</div>
																<h4 class="heading">해방맨에게 남기는 메모</h4>
																<div class="form-group">
																	<textarea
																		style="width: 400px; height: 80px; border: 2px solid #ccc; margin-left: 10px; padding-left: 15px;"
																		class="myinfo-form-control" id="comments"
																		name="comments" rows="5"
																		placeholder="(ex.바퀴벌레 발생 빈도, 장소 등)"></textarea>


																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row hide" data-step="10" data-title="카드정보등록">
											<div class="centerContent" style="margin-bottom: 40px;">

												<h2>신용카드 정보를 등록합니다.</h2>

											</div>

											<div class="checkout">
												<div class="credit-card-box">
													<div class="flip">
														<div class="front">
															<div class="chip"></div>
															<div class="logo"></div>
															<div class="number"></div>
															<div class="card-holder">

																<label>Card holder</label>
																<div></div>
															</div>
															<div class="card-expiration-date">
																<label>Expires</label>
																<div></div>
															</div>
														</div>
														<div class="back">
															<div class="strip"></div>

															<div class="ccv">
																<label>CVC</label>
																<div></div>
															</div>
														</div>
													</div>
												</div>
												<fieldset>
													<div>
														<label for="card-company">카드사 선택</label>
													</div>
													<div class="select">
														<select class="form-control1" name="card-company-list"
															id="card-company-list" style="margin-bottom: 20px;">
															<option value="">선택</option>
															<option value="shinhan">신한카드</option>
															<option value="samsung">삼성카드</option>
															<option value="kukmin">국민카드</option>
															<option value="woori">우리카드</option>
															<option value="hana">하나카드</option>
														</select>
													</div>
												</fieldset>

												<fieldset>
													<div>
														<label for="card-number">카드번호</label>
													</div>
													<input type="num" name="cardNo1" id="cardNo1"
														style="margin-right: 5px; margin-bottom: 20px; width: 80px; float: left;"
														class="cardinput" maxlength="4" /> <input type="num"
														name="cardNo2" id="cardNo2"
														style="margin-right: 5px; margin-bottom: 20px; width: 80px; float: left;"
														class="cardinput" maxlength="4" /> <input type="num"
														name="cardNo3" id="cardNo3"
														style="margin-right: 5px; margin-bottom: 20px; width: 80px; float: left;"
														class="cardinput" maxlength="4" /> <input type="num"
														name="cardNo4" id="cardNo4"
														style="width: 80px; margin-bottom: 20px; float: left;"
														class="cardinput" maxlength="4" />
												</fieldset>
												<fieldset>
													<div>
														<label for="card-holder">카드 소지자 영문성함</label>
													</div>
													<input type="text" name="card-holder" id="card-holder"
														style="width: 150px; margin-bottom: 20px; display: inline-block; height: 34px; padding: 6px 12px; font-size: 14px; line-height: 1.428571429; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px; box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075); transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;" />
												</fieldset>
												<fieldset class="fieldset-expiration">
													<div>
														<label for="card-expiration-month">유효기간</label>
													</div>
													<div class="select">
														<select class="form-control1" name="card-expiration-month"
															id="card-expiration-month"
															style="width: 50px; float: left; margin-bottom: 20px;">
															<option></option>
															<option>01</option>
															<option>02</option>
															<option>03</option>
															<option>04</option>
															<option>05</option>
															<option>06</option>
															<option>07</option>
															<option>08</option>
															<option>09</option>
															<option>10</option>
															<option>11</option>
															<option>12</option>
														</select>
													</div>
													<span style="padding: 5px; float: left;">/</span>
													<div class="select">
														<select class="form-control1" name="card-expiration-year"
															id="card-expiration-year"
															style="width: 100px; float: left; margin-bottom: 20px;">
															<option></option>
															<option>2018</option>
															<option>2019</option>
															<option>2020</option>
															<option>2021</option>
															<option>2022</option>
															<option>2023</option>
															<option>2024</option>
															<option>2025</option>
														</select>
													</div>
												</fieldset>
												<fieldset class="fieldset-ccv">
													<div>
														<label for="card-ccv">CVC</label>
													</div>
													<input type="text" id="card-ccv" name="cardCVC"
														style="width: 80px; margin-bottom: 20px; display: inline-block; height: 34px; padding: 6px 12px; font-size: 14px; line-height: 1.428571429; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px; box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075); transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;"
														maxlength="3" />
												</fieldset>

											</div>
										</div>

										<div class="row hide" data-step="11" data-title="미리보기">
											<div class="jumbotron">
												<div style="margin-bottom: 80px; align: center;">
													<h2>해방맨이 곧 달려갑니다. 마지막으로 확인해주세요!</h2>
												</div>


												<div align='center'>
													<h4>[서비스진단 정보]</h4>
												</div>

												<table class='type09'>
													<thead>
														<tr>
															<th style='width: 30%;'>구분</th>
															<th>내용</th>
														</tr>
													</thead>


													<tbody>
														<tr>
															<td class="center">서비스 구분</td>
															<td><span id="final_type"></span></td>
														</tr>
														<tr>
															<td class="center">해충 구분</td>
															<td><span id="final_insect"></span></td>
														</tr>
														<tr>
															<td class="center">장소 구분</td>
															<td><span id="final_place" /></span></td>
														</tr>
														<tr>
															<td class="center">장소의 크기</td>
															<td><span id="final_size" /></span></td>
														</tr>
													</tbody>

												</table>
												<br />
												<br />


												<div align='center'>
													<h4>[나의 정보]</h4>
												</div>

												<table class='type09'>
													<thead>
														<tr>
															<th style='width: 30%;'>구분</th>
															<th>내용</th>
														</tr>
													</thead>



													<tbody>
														<tr>
															<td class="center">이름</td>
															<td><span id="final_name"></span></td>
														</tr>
														<tr>
															<td class="center">주소</td>
															<td><span id="final_postcode"></span>&nbsp;<span
																id="final_address"></span>&nbsp;<span
																id="final_detailAddress"></span></td>
														</tr>
														<tr>
															<td class="center">연락처</td>
															<td><span id="final_phone1" /></span>-<span type="text"
																id="final_phone2"></span>-<span id="final_phone3"></span></td>
														</tr>
													</tbody>

												</table>
												<br />
												<br />




												<div align='center'>
													<h4>[선택 서비스 정보]</h4>
												</div>

												<table class='type09'>
													<thead>
														<tr>
															<th style='width: 30%;'>구분</th>
															<th>내용</th>
														</tr>
													</thead>



													<tbody>
														<tr>
															<td class="center">서비스</td>
															<td><span id="final_service"></span></td>
														</tr>
														<tr>
														<tr>
															<td class="center">서비스 설명</td>
															<td><span id="final_explanation"></span></td>
														</tr>
														<tr>
														<tr>
															<td class="center">가격</td>
															<td><span id="final_price"></span></td>
														</tr>
														<tr>
															<td class="center">서비스 받을 날짜</td>
															<td><span id="final_date"></span></td>
														</tr>
														<tr>
															<td class="center">서비스 받을 시간</td>
															<td><span id="final_timeHour" /></span>:<span
																id="final_timeMinute" /></span></td>
														</tr>
														<tr>
															<td class="center">메모</td>
															<td><span id="final_memo" /></span></td>
														</tr>
													</tbody>

												</table>
												<br />
												<br />



												<div align='center'>
													<h4>[신용카드 정보]</h4>
												</div>

												<table class='type09'>
													<thead>
														<tr>
															<th style='width: 30%;'>구분</th>
															<th>내용</th>
														</tr>
													</thead>

													<tbody>
														<tr>
															<td class="center">카드사</td>
															<td><span id="final_cardCo"></span></td>
														</tr>
														<tr>
															<td class="center">카드번호</td>
															<td><span id="final_cardNo1" /></span>-<span type="text"
																id="final_cardNo2"></span>-<span id="final_cardNo3"></span>-<span
																id="final_cardNo4"></span></td>
														</tr>
														<tr>
															<td class="center">카드 소지자 영문명</td>
															<td><span id="final_cardName" /></span></td>
														</tr>
														<tr>
															<td class="center">유효기간</td>
															<td><span id="final_expMonth"></span>/<span
																id="final_expYear"></span></td>
														</tr>
														<tr>
															<td class="center">CVC</td>
															<td><span id="final_cvc" /></span></td>
														</tr>
													</tbody>

												</table>
												<br />
												<br />
											<div align="center">
												<button type="button" class="btn btn-warning js-btn-step"
													data-orientation="previous">Previous</button>
												<button style="align: center;" type="submit"
													class="btn btn-success" id="final_btn">해방합니다</button>
											</div>

											</div>
										</div>




									</form>

								</div>

								<div class="modal-footer">
									<button type="button"
										class="btn btn-default js-btn-step pull-left"
										data-orientation="cancel" data-dismiss="modal"></button>
									<button type="button" class="btn btn-warning js-btn-step"
										data-orientation="previous"></button>
									<button type="button" class="btn btn-success js-btn-step"
										data-orientation="next"></button>
								</div>
							</div>
						</div>
					</div>
					<!-- end Customer-control form -->

					<Br /> <Br /> <Br />
					<!-- </div> -->
				</div>
				<div id=renewLogin
					style="width: 15%; height: auto; float: left; border: 1px-solid-skyblue; margin-left: 50px; position: relative; left: 141.6px;">
					<c:choose>
						<c:when test="${ empty userVO }">
							<h4 style="width: 180px">Login</h4>
							<form style="width: 180px"
								action="${ pageContext.request.contextPath }/member/mainLogin"
								name="form1" method="post" role="form" onsubmit="return prev()">
								<div class="form-group">

									<input type="text" name="m_id" class="form-control" id="m_id"
										placeholder="ID" style="width: 100%;" />

									<div class="validation"></div>
								</div>
								<div class="form-group">
									<input type="password" class="form-control" name="m_password"
										id="m_password" placeholder="PASSWORD" style="width: 100%;" />
									<div class="validation"></div>
								</div>
								<input type="submit" value="로그인" class="btn btn-theme" /> <br />
								<span style="color: red;">${ ErrorMessage }</span>
							</form>
						</c:when>
						<c:otherwise>

							<li><Strong>${ userVO.m_name }님 방문을 환영합니다!</Strong></li>
							<li><a
								href="${ pageContext.request.contextPath }/member/service">서비스현황</a></li>

						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</section>
		<section class="callaction">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="big-cta">
							<div class="cta-text">
								<h2>
									<span>HaeBang</span> 해충과 피해
								</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section id="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<h4>바퀴벌레</h4>
										<div class="icon">
											<i class="fa fa-bug fa-3x"></i>
										</div>
										<p>
											한 마리가 3개월에 800마리 번식<br /> <br /> ▶ 식중독 유발, 콜레라, 세균성 이질,
											장티푸스 등 100여종의 병원균을 보유<br /> ▶ 아토피, 알레르기성 천식, 비염 유발
										</p>

									</div>
									<div class="box-bottom">
										<a href="#">더 궁금하면 클릭 !</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<h4>개미</h4>
										<div class="icon">
											<i class="fa fa-bug fa-3x"></i>
										</div>
										<p>
											한 군집 당 4,000마리 번식<br /> <br /> ▶ 식중독, 알레르기성 천식, 비염 유발<br />
											<br /> <br /> <br />
										</p>

									</div>
									<div class="box-bottom">
										<a href="#">더 궁금하면 클릭 !</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<h4>쥐</h4>
										<div class="icon">
											<i class="fa fa-bug fa-3x"></i>
										</div>
										<p>
											두 마리가 1년동안 1,256마리 번식<br /> <br /> ▶ 전선을 갉는 습성으로 화재 유발<br />
											▶ 식중독, 유행성 출혈열, 랩토스피아, 서교열 등의 질병 유발<br /> <br /> <br />
										</p>

									</div>
									<div class="box-bottom">
										<a href="#">더 궁금하면 클릭 !</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<h4>집먼지 진드기</h4>
										<div class="icon">
											<i class="fa fa-bug fa-3x"></i>
										</div>
										<p>
											매일 1~3개 알 산란, 1mg에 2만마리 서식<br /> <br /> ▶ 미세하면서 군체량이 많아 발생
											시 상당한 스트레스 유발<br /> ▶ 천식, 기관지염 등의 호흡계 질환 유발
										</p>

									</div>
									<div class="box-bottom">
										<a href="#">더 궁금하면 클릭 !</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- divider -->
				<div class="row">
					<div class="col-lg-12">
						<div class="solidline"></div>
					</div>
				</div>
				<!-- end divider -->
				<!-- Portfolio Projects -->
				<div class="row">
					<div class="col-lg-12">
						<h4 class="heading">HaeBang Solution</h4>
						<div class="row">
							<section id="projects">
								<ul id="thumbs" class="portfolio">
									<!-- Item Project and Filter Name -->
									<li class="col-lg-3 design" data-id="id-0" data-type="web">
										<div class="navbar-collapse collapse ">
											<ul class="nav navbar-nav">
												<li class="active" style="float: center"><strong><h4>1단계
															: 사전조사, 진단</h4></strong></li>
											</ul>
										</div>
										<div class="item-thumbs">
											<!-- Fancybox - Gallery Enabled - Title - Full Image -->
											<a class="hover-wrap fancybox" data-fancybox-group="gallery"
												title="1단계 : 사전조사 및 진단" href="resources/img/works/1.jpg">
												<span class="overlay-img">1단계 : 사전조사, 진단</span> <span
												class="overlay-img-thumb font-icon-plus"></span>
											</a>
											<!-- Thumb Image and Description -->
											<img
												src="${ pageContext.request.contextPath }/resources/img/works/1.jpg"
												alt="사전 조사를 통해, 대략적인 범위를 조사하여 진단하는 단계입니다.">
										</div>
									</li>
									<!-- End Item Project -->
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 design" data-id="id-1"
										data-type="icon">
										<div class="navbar-collapse collapse ">
											<ul class="nav navbar-nav">
												<li class="active" style="float: center"><strong><h4>2단계
															: 서비스 처방</h4></strong></li>
											</ul>
										</div> <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
										class="hover-wrap fancybox" data-fancybox-group="gallery"
										title="2단계 : 해방서비스 결정 및 처방" href="resources/image/ready.png">
											<span class="overlay-img">2단계 : 서비스 처방</span> <span
											class="overlay-img-thumb font-icon-plus"></span>
									</a> <!-- Thumb Image and Description --> <img
										src="${ pageContext.request.contextPath }/resources/image/ready.png"
										alt="사전에 진단된 판단을 토대로, 어떤 방식을 취할건지 결정하는 단계입니다.">
									</li>
									<!-- End Item Project -->
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 photography" data-id="id-2"
										data-type="illustrator">
										<div class="navbar-collapse collapse ">
											<ul class="nav navbar-nav">
												<li class="active" style="float: center"><strong><h4>3단계
															: 해방 서비스</h4></strong></li>
											</ul>
										</div> <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
										class="hover-wrap fancybox" data-fancybox-group="gallery"
										title="3단계 : 해방 서비스 시행" href="resources/image/go.png"> <span
											class="overlay-img">3단계 : 해방 서비스 시행</span> <span
											class="overlay-img-thumb font-icon-plus"></span>
									</a> <!-- Thumb Image and Description --> <img
										src="${ pageContext.request.contextPath }/resources/image/go.png"
										alt="2단계에서 결정한 방식으로 '해방'서비스를 시행하는 단계입니다.">
									</li>
									<!-- End Item Project -->
									<!-- Item Project and Filter Name -->
									<li class="item-thumbs col-lg-3 photography" data-id="id-2"
										data-type="illustrator">
										<div class="navbar-collapse collapse ">
											<ul class="nav navbar-nav">
												<li class="active" style="float: center"><strong><h4>4단계
															: 지속적 모니터링</h4></strong></li>
											</ul>
										</div> <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
										class="hover-wrap fancybox" data-fancybox-group="gallery"
										title="4단계 : 서비스 기간동안 확실한 모니터링"
										href="resources/img/works/4.jpg"> <span
											class="overlay-img">4단계 : 서비스 기간동안 확실한 모니터링</span> <span
											class="overlay-img-thumb font-icon-plus"></span>
									</a> <!-- Thumb Image and Description --> <img
										src="${ pageContext.request.contextPath }/resources/img/works/4.jpg"
										alt="서비스 기간동안, 해충이 사라지고 있는지 모니터링을 통해 관리합니다.">
									</li>
									<!-- End Item Project -->
								</ul>
							</section>
						</div>
					</div>
				</div>
			</div>
	</div>
	</section>
	<footer>
		<jsp:include page="member_include/bottom.jsp" />
	</footer>
	</div>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

</body>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#date1").datepicker({
			minDate : 0
		});
		$("#date1").datepicker("option", "dateFormat", "yy-mm-dd");

	});
</script>



<script>
	function isNull(obj, msg) {
		if (obj.value == "") {
			alert(msg);
			obj.focus();
			return true;
		}
		return false;
	}

	function checkpostcode() {
		alert("우편번호 찾기 버튼을 이용해주세요");
	}

	$('#card-company-list').on('keyup change', function() {
		var m = $("#card-company-list option:selected").text();
		$('.credit-card-box .logo').html(m);
	});

	$('.cardinput').on('keyup change', function() {
		$t = $(this);

		if ($t.val().length > 3) {
			$t.next().focus();
		}

		var card_number = '';
		$('.cardinput').each(function() {
			card_number += $(this).val() + ' ';
			if ($(this).val().length == 4) {
				$(this).next().focus();
			}
		})

		$('.credit-card-box .number').html(card_number);
	});

	$('#card-holder').on('keyup change', function() {
		$t = $(this);
		$('.credit-card-box .card-holder div').html($t.val());
	});

	$('#card-holder').on('keyup change', function() {
		$t = $(this);
		$('.credit-card-box .card-holder div').html($t.val());
	});

	$('#card-expiration-month, #card-expiration-year').change(
			function() {
				m = $('#card-expiration-month option').index(
						$('#card-expiration-month option:selected'));
				m = (m < 10) ? '0' + m : m;
				y = $('#card-expiration-year').val().substr(2, 2);
				$('.card-expiration-date div').html(m + '/' + y);
			})

	$('#card-ccv').on('focus', function() {
		$('.credit-card-box').addClass('hover');
	}).on('blur', function() {
		$('.credit-card-box').removeClass('hover');
	}).on('keyup change', function() {
		$('.ccv div').html($(this).val());
	});

	setTimeout(function() {
		$('#card-ccv').focus().delay(1000).queue(function() {
			$(this).blur().dequeue();
		});
	}, 500);
</script>


</html>