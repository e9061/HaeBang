<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>

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
						console.log(result.coordinateInfo.coordinate[0].newLon+"new");
						console.log(result.coordinateInfo.coordinate[0].lon+"old");
						if (result.coordinateInfo.coordinate.length == '1') {
							document.getElementById('lon').value = result.coordinateInfo.coordinate[0].newLon;
							document.getElementById('lat').value = result.coordinateInfo.coordinate[0].newLat;
						} else {
							document.getElementById('lon').value = result.coordinateInfo.coordinate[0].lon;
							document.getElementById('lat').value = result.coordinateInfo.coordinate[0].lat;
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
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}

#bootstrap-override .jumbotron {
	padding: 30px 30px;
    margin: 30px 10px;
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
				<div class="col-lg-8" style="float:left;">
					<!-- start Customer-control form -->
					<div id="question">

						<span id="q1"><h5>${q1.title}</h5></span>
						<p class="q" style="line-height: 19.5px; font-size: 14px;font-weight: 100;">
							<c:forEach var="option" items="${q1.options}">
								<input type="radio" name="response[1]" value="${option}" id="${option}">
								<label for="${option}">${option}</label><br/>
							</c:forEach>
						</p>

					</div>
						<button type="button" class="qSubmit btn" value="Next">Next</button>

					<div id="myModal" class="modal fade" role="dialog" tabindex="-1" aria-labelly="myModalLabel" aria-hidden="true" >
						<div class="modal-dialog">

							<!-- Modal content -->
							<div class="modal-content">
								<div class="modal-header">
									<div id="myProgress" >
										 <div id="myBar"></div>
									</div>
								</div>
								<div class="modal-body">
									<div class="row hide" data-step="1"
										data-title="맞춤서비스 해방">
										<div class="jumbotron">
											<h3>
											 맞춤 서비스를 위한 질문에 답해주세요!
											</h3>
										</div>
									</div>
									<div class="row hide" data-step="2"
										data-title="This is the second step!">
										<div class="jumbotron">
											<div>
												<h3>해방 서비스 종류를 선택해주세요.</h3>
												<ul class="request-formset">
													<li class="checkset"><input type="radio"
														name="radio-1" id="radio-1" value="s"> <span
														class="radio-body"><label for="radio-1">소독</label></span>
													<li class="checkset"><input type="radio"
														name="radio-1" id="radio-2" value="h"> <span
														class="radio-body"><label for="radio-2">해충</label></span>
												</ul>
											</div>
										</div>
									</div>
									<div class="row hide" data-step="3" data-title="This is the third step!">
										<div class="jumbotron">
											<div>
												<h3>골치아픈 해충은 무엇인가요?</h3>
												<ul class="request-formset">
													<li class="item-list"><input type="checkbox"
														name="check-1" id="checkbox-1" value="ground"> <span
														class="checkbox-body"><label for="checkbox-1">보행해충</label></span></li>
													<li class="item-list"><input type="checkbox"
														name="check-1" id="checkbox-2" value="air"> <span
														class="checkbox-body"><label for="checkbox-2">비행해충</label></span></li>
													<li class="item-list"><input type="checkbox"
														name="check-1" id="checkbox-3" value="mouse"> <span
														class="checkbox-body"><label for="checkbox-3">쥐</label></span></li>
													<li class="item-list"><input type="checkbox"
														name="check-1" id="checkbox-4" value="etc"> <span
														class="checkbox-body"><label for="checkbox-4">기타</label></span></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="row hide" data-step="4"
										data-title="This is the fourth step!">
										<div class="jumbotron">
											<div>
												<h3>서비스를 받으실 곳을 선택해주세요.</h3>
												<ul class="request-formset">
													<li class="item-list"><input type="radio"
														name="radio-2" id="radio-3" value="k"> <span
														class="radio-body"><label for="radio-3">가정</label></span></li>
													<li class="item-list"><input type="radio"
														name="radio-2" id="radio-4" value="y"> <span
														class="radio-body"><label for="radio-4">영업장</label></span></li>
												</ul>
											</div>
										</div>
									</div>
									
									<div class="row hide" data-step="5"
										data-title="This is the sixth step!">
										<div class="jumbotron">
											<div>
												<h3>방역장소의 평수는 어떻게 되시나요?</h3>
												<ul class="request-formset">
													<li class="item-list"><input type="radio"
														name="radio-4" id="radio-7" value="1"> <span
														class="radio-body"><label for="radio-7">10평
																이하</label></span></li>
													<li class="item-list"><input type="radio"
														name="radio-4" id="radio-8" value="11"> <span
														class="radio-body"><label for="radio-8">11평~20평</label></span></li>
													<li class="item-list"><input type="radio"
														name="radio-4" id="radio-9" value="21"> <span
														class="radio-body"><label for="radio-9">21평~30평</label></span></li>
													<li class="item-list"><input type="radio"
														name="radio-4" id="radio-10" value="31"> <span
														class="radio-body"><label for="radio-10">31평~40평</label></span></li>
													<li class="item-list"><input type="radio"
														name="radio-4" id="radio-11" value="41"> <span
														class="radio-body"><label for="radio-11">41평~50평</label></span></li>
													<li class="item-list"><input type="radio"
														name="radio-4" id="radio-12" value="51"> <span
														class="radio-body"><label for="radio-12">기타</label></span>
														<div>
															<input placeholder="직접입력" type="text"
																class="form-control" id="manual">
														</div></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="row hide" data-step="6" data-title="Sign in..">
										<div id="modal-login">
											<div id="cd-login">
												<!-- log in form -->
												<form class="cd-form" id="cd-form">
													<p class="fieldset">
														<label class="image-replace cd-email" for="signin-email">E-mail</label>
														<input class="full-width has-padding has-border"
															id="signin-email" type="email" placeholder="E-mail">
														<span class="cd-error-message">Error message here!</span>
													</p>

													<p class="fieldset">
														<label class="image-replace cd-password"
															for="signin-password">Password</label> <input
															class="full-width has-padding has-border"
															id="signin-password" type="password"
															placeholder="Password"> <a href="#0"
															class="hide-password">Hide</a> <span
															class="cd-error-message">Error message here!</span>
													</p>

													<p class="fieldset">
														<input type="checkbox" id="remember-me" checked> <label
															for="remember-me">Remember me</label>
													</p>

													<p class="fieldset">
														<input class="full-width" type="submit" value="Login"><input
															class="full-width" id="bLogin" type="button" value="bLogin">
													</p>
												</form>

												<p class="cd-form-bottom-message">
													<a href="#0">Forgot your password?</a>
												</p>
												<!-- <a href="#0" class="cd-close-form">Close</a> -->
											</div>
											<!-- cd-login -->
										</div>
									</div>
									<form id="insertMOrder" name="sform" class="form-horizontal">
									
									<div class="row hide" data-step="7" data-title="고객님 정보를 입력해주세요">
										<div id="modal-logout">
													<!-- *********************************************************************************************** -->
													<h1>고객정보등록</h1>
													<!-- left column -->
													<div class="col-sm-12">

														<p class="lead">고객 정보 등록</p>
														<div class="form-group">
															<label for="new_name"
																class="col-sm-2 control-label bg-danger">이름</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="name"
																	name="name" placeholder="고객 이름" />
															</div>
														</div>
														<div class="form-group">
															<label for="new_subname"
																class="col-sm-2 control-label bg-danger">주소</label>
															<div class="col-sm-10">
																<input type="text" name="postcode" id="postcode"
																	class="form-control" style="width: 20%; float: left"
																	onkeyup="checkpostcode()" /> &nbsp;&nbsp; <input
																	type="button" class="btn btn-info1"
																	onclick="c_execDaumPostcode()" value="우편번호 찾기">
															</div>
															<label for="new_addresssub"
																class="col-sm-2 control-label" style="color: white;"></label>
															<div class="col-sm-10">
																<input type="text" onblur="inputAddress($(this).val())"
																	id="address" name="address" class="form-control"
																	onkeyup="checkpostcode()" />
															</div>
															<label for="new_addresssub"
																class="col-sm-2 control-label" style="color: white;"></label>
															<div class="col-sm-10">
																<input type="text" placeholder="상세주소입력"
																	id="detailAddress" name="detailAddress"
																	class="form-control" />
															</div>
															<input type="hidden" id="lon" name="lon" /> <input
																type="hidden" id="lat" name="lat" />
														</div>


														<div class="form-group">
															<label for="new_name"
																class="col-sm-2 control-label bg-danger">연락처</label>
															<div class="col-sm-10">
																<select id="phone1" class="form-control" name="phone1"
																	style="width: 25%; float: left">
																	<option value="">선택</option>
																	<option value="${first}" selected="selected">${first}</option>
																	<option value="010" >010</option>
																	<option value="011">011</option>																	
																	<option value="016">016</option>
																	<option value="017">017</option>
																	<option value="018">018</option>
																	<option value="019">019</option>
																
																</select><span style="float: left;">&nbsp;&nbsp;-&nbsp;&nbsp;${second}</span>
																<input type="text" class="form-control" id="phone2"
																	name="phone2" MaxLength="4"
																	style="width: 25%; float: left"  /><span
																	style="float: left;">&nbsp;&nbsp;-&nbsp;&nbsp;</span> <input
																	type="text" class="form-control" id="phone3"
																	name="phone3" MaxLength="4"
																	style="width: 25%; float: left"  />
															</div>
															${third}
														</div>

													</div>

													<!-- *********************************************************************************************** -->
												</div>
									</div>
									<div class="row hide" data-step="8" data-title="추천 서비스 중에서 원하시는 서비스, 날짜, 시간을 선택해주세요">
												<div class="form-group form-group-sm">
													<div class="col-sm-12" style="padding-left: 50px; ">

														<!-- right column -->
													

														<div class="form-group">
															<label for="new_company_identity"
																class="col-sm-2 control-label bg-danger">종류</label>
															<div class="col-sm-10" style="left: 0.6%;">
																<input type="radio" id="onetime" name="period-type"
																	checked="checked" value="onetime" /><span class="radio-body"><label
																				for="onetime">보장 서비스</label></span>
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																<input type="radio" id="regular" name="period-type"
																	value="regular" /><span class="radio-body"><label
																				for="regular">정기 서비스</label></span>
															</div>
														</div>

														<!-- 1회성 -->
														<div id="type1">


															<div class="form-group">

																<div class="col-sm-10" style="left:13%">
																	<ul class="request-formset">
																	</ul>
																</div>
															</div>

															<div class="form-group">
																<label for="new_company_identity"
																	class="col-sm-2 control-label bg-danger">날짜</label>
																<div class="col-sm-9">

																	<div class="input-group date" id="datepicker1">
																		<input class="form-control" id="date1" name="date1"
																			placeholder="MM-DD-YYYY" type="text" /> <span
																			class="input-group-addon"><i
																			class="glyphicon glyphicon-calendar"></i></span>
																	</div>

																</div>
															</div>



															<div class="form-group">
																<label for="new_bol_require"
																	class="col-sm-2 control-label bg-danger">시작</label>
																<div class="col-sm-10">
																	<select id="startTimeHour1" class="form-control1"
																		name="startTimeHour1" style="width: 30%; float: left">
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


																	<select id="startTimeMinute1" class="form-control1"
																		name="startTimeMinute1"
																		style="width: 30%; float: left">
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



															<div class="form-group">
																<label for="new_pod_require"
																	class="col-sm-2 control-label bg-danger">종료</label>
																<div class="col-sm-10">
																	<select id="endTimeHour1" class="form-control1"
																		name="endTimeHour1" style="width: 30%; float: left">
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
																		<option value="21">21</option>
																	
																	</select> <span style="float: left;">&nbsp;&nbsp;:&nbsp;&nbsp;</span>

																	<select id="endTimeMinute1" class="form-control1"
																		name="endTimeMinute1" style="width: 30%; float: left">
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

														</div>
														<!-- type1 end  -->

														<!-- type2 -->
														<div id="type2">

															<div class="form-group">

																<div class="col-sm-10" style="left:13%">
																	<ul class="request-formset">
																		
																	</ul>

																</div>
															</div>

															<div class="form-group">
																<label for="new_bol_require"
																	class="col-sm-2 control-label bg-danger">단위</label>
																<div class="col-sm-4">
																	<select class="form-control1" id="unit" name="unit" >
																		<option value="">선택</option>
																		<option value="week">주단위 반복</option>
																		<option value="month">월단위 반복</option>
																	</select>
																</div>

																<label for="new_pod_require"
																	class="col-sm-2 control-label bg-danger">반복</label>
																<div class="col-sm-4">
																	<select class="form-control1" id="cycle" name="cycle" style= "width: 72%;">
																	</select>
																</div>
															</div>



															<div class="form-group">
																<label for="new_company_identity"
																	class="col-sm-2 control-label bg-danger">총 횟수</label>
																<div class="col-sm-10">
																	<select id="totalCnt" class="form-control1"
																		name="totalCnt">
																		<option value="">선택</option>
																		<option value="1">1회</option>
																		<option value="2">2회</option>
																		<option value="3">3회</option>
																		<option value="4">4회</option>
																		<option value="5">5회</option>
																		<option value="6">6회</option>
																		<option value="7">7회</option>
																		<option value="8">8회</option>
																		<option value="9">9회</option>
																		<option value="10">10회</option>
																		<option value="11">11회</option>
																		<option value="12">12회</option>
																	</select>
																</div>
															</div>


															<div class="form-group">
																<label for="new_company_identity"
																	class="col-sm-2 control-label bg-danger">시작날</label>
																<div class="col-sm-9">

																	<div class="input-group date" id="datepicker2">
																		<input class="form-control" id="date2" name="date2"
																			placeholder="MM-DD-YYYY" type="text" /> <span
																			class="input-group-addon"><i
																			class="glyphicon glyphicon-calendar"></i></span>
																	</div>

																</div>
															</div>



															<div class="form-group">
																<label for="new_bol_require"
																	class="col-sm-2 control-label bg-danger">시작</label>
																<div class="col-sm-10">
																	<select id="startTimeHour2" class="form-control1"
																		name="startTimeHour2" style="width: 30%; float: left">
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

																	<select id="startTimeMinute2" class="form-control1"
																		name="startTimeMinute2"
																		style="width: 30%; float: left">
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



															<div class="form-group">
																<label for="new_pod_require"
																	class="col-sm-2 control-label bg-danger">종료</label>
																<div class="col-sm-10">
																	<select id="endTimeHour2" class="form-control1"
																		name="endTimeHour2" style="width: 30%; float: left">
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
																		<option value="21">21</option>
																		
																	</select> <span style="float: left;">&nbsp;&nbsp;:&nbsp;&nbsp;</span>

																	<select id="endTimeMinute2" class="form-control1"
																		name="endTimeMinute2" style="width: 30%; float: left">
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

														</div>
													</div>
												</div>
												<!-- type2 end -->
												<!-- End main input boxes, starting a new "row" -->

												<div class="col-sm-12" style="left: 20px;">
													<div class="form-group">
														<label for="new_comments" class="col-sm-1 control-label">비고</label>
														<div class="col-sm-11">
															<textarea style ="height: 80px;" class="form-control1" id="comments"
																name="comments" rows="3" placeholder="비고사항 입력"></textarea>

														</div>
													</div>
												</div>
												
												<div class="col-sm-12" style="left: 35%;">
												<div class="form-group">
												<div class="col-sm-11" style="align-content: center;">
												<button type="button" class="btn btn-warning js-btn-step" data-orientation="previous" data-step="6">Previous</button>
												<button type="submit" class="btn btn-success"  style="width: 85px;">렛츠고</button>
												</div>
												</div>
												</div>
												
										</div>
									<div class="row hide" data-step="9" data-title="t_m_order테이블에  추가완료">
									
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
						style="width: 15%; height: auto; float: left; border: 1px-solid-skyblue; margin-left: 50px; position: relative;
    left: 141.6px;">
						<c:choose>
							<c:when test="${ empty userVO }">
								<h4 style="width:180px">Login</h4>
								<form style="width:180px"
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

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#date1" ).datepicker();
    $( "#date1" ).datepicker( "option", "dateFormat", "yy-mm-dd" );

    $( "#date2" ).datepicker();
    $( "#date2" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
    
  });
  </script>



<script>
	$(document).ready(function(){
		
						 
						
						$("select[name=startTimeHour1], select[name=startTimeHour2]").change(
								function() {
									var n = Number($(this).val());
									var AA = "";				
									if((n+1)<10)
									{
									AA = "0"+(n+1);
									}
									else if(10<=(n+1) && (n+1) <=19){
									AA = "1"+((n+1)-10);
									}
									
									else if((n+1)==20 || (n+1)==21){
									AA = "2"+((n+1)-20);
									}
									
									console.log(AA);
								$(this).parents().next().children().first().next().children().first().val(AA);
								
								
								});
						$("select[name=startTimeMinute1], select[name=startTimeMinute2]").change(
								function() {
									var n = $(this).val();
									console.log(n);
									$(this).parents().next().children().first().next().children().first().next().next().val(n);
								
								
								});


						$("select[name=unit]").change(
								function() {

									var selected = $("#unit option:selected")
											.val();

									if (selected == "week")
										var opts = [ {
											name : "선택",
											val : ""
										}, {
											name : "1주마다",
											val : "1"
										}, {
											name : "2주마다",
											val : "2"
										}, {
											name : "3주마다",
											val : "3"
										} ];

									else if (selected == "month")
										var opts = [ {
											name : "선택",
											val : ""
										}, {
											name : "1개월마다",
											val : "1"
										}, {
											name : "2개월마다",
											val : "2"
										}, {
											name : "3개월마다",
											val : "3"
										}, {
											name : "4개월마다",
											val : "4"
										}, {
											name : "5개월마다",
											val : "5"
										}, {
											name : "6개월마다",
											val : "6"
										} ];

									else if (selected == "")
										var opts = [ {
											name : "단위를 선택해주세요",
											val : ""
										} ];

									$("#cycle").empty();
									$.each(opts,
											function(k, v) {

												$("#cycle").append(
														"<option value='"+v.val+"'>"
																+ v.name
																+ "</option>");

											});
								});
					});
	/* 	var date_input1 = $('input[name="date1"]');
		var container = $('.bootstrap-iso form').length > 0 ? $(
				'.bootstrap-iso form').parent()
				: "body";
		date_input1.datepicker({
			format : 'yyyy-mm-dd',
			container : container,
			todayHighlight : true,
			autoclose : true
		});

		var date_input2 = $('input[name="date2"]');
		var container = $('.bootstrap-iso form').length > 0 ? $(
				'.bootstrap-iso form').parent()
				: "body";
		date_input2.datepicker({
			format : 'yyyy-mm-dd',
			container : container,
			todayHighlight : true,
			autoclose : true
		});
	 */


	 
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

</script>


</html>