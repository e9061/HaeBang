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


<!-- Theme skin -->
<link href="${ pageContext.request.contextPath }/resources/skins/default.css"
	rel="stylesheet" />

<!-- =======================================================
    Theme Name: Moderna
    Theme URL: https://bootstrapmade.com/free-bootstrap-template-corporate-moderna/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
	======================================================= -->

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
						<li class="active">${type}</li>
					</ul>
				</div>
			</div>
		</div>
		</section>




		<section id="content">
		<form onsubmit="return nextStep() " name="first"
			action="<%=request.getContextPath()%>/ceo/register/step2"
			method="post" class="contractForm">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<input type="checkbox" name="second" id="all_agree"
							class="pop_chk_03" onclick="allChk()" /> <label
							for="all_agree" class="pop_label_03" style="font-size: 15px">해방
							사장님 사이트 이용 약관, 개인정보 수집 등 아래의 사항 <b>전체 동의</b> 합니다.
						</label>


						<div id="sendmessage">Your message has been sent. Thank you!</div>
						<div id="errormessage"></div>
						<div class="form-group"></div>
						<div class="form-group" id="owner">
							<h5>해방 사장님 사이트 이용 약관</h5>

						</div>

						<div class="form-group"></div>
						<div class="form-group"></div>
						<div class="form-group">
							<textarea readonly="readonly" class="form-control" name="message"
								rows="5" data-rule="required"
								data-msg="Please write something for us" placeholder="Message">
제 1장 총칙
제 1조 [목적]
이 약관은 해방이노베이션(이하 "회사"라 합니다)과 이용 고객(이하 "회원"이라고 함)간에 "회사"가 제공하는 위치 기반 광고 플랫폼 서비스인 여기어때(이하 "서비스"라 합니다) 및 제반 서비스를 유선 또는 무선 인터넷 등의 수단으로 이용함에 있어 "회사"와 "회원" 간의 권리, 이용에 관한 제반 사항과 기타 필요한 사항을 규정하는 것을 목적으로 합니다.
제2조 [용어의 정의]
이 약관에서 사용하는 용어의 정의는 다음 각호와 같습니다.
①	"회원"이라 함은 "회사"가 제공하는 서비스에 유선 또는 무선 인터넷 등의 수단으로 접속하여 약관에 따라 "회사"가 제공하는 "콘텐츠" 및 제반 서비스를 이용하고 "회사"와 이용계약을 체결하고 마케팅 센터 "회원"아이디(ID)를 부여 받은 "회원"으로서 "회사"의 정보를 지속적으로 제공받으며 이용할 수 있는 자를 말합니다.
②	"고객"이라 함은 여기어때 웹, 모바일웹, 앱을 사용하는 사용자로서 "회사"가 제공하는 서비스를 지속적으로 이용할 수 있는 자를 말합니다.
③	"아이디(ID)"라 함은 "회원" 식별과 "회원"의 서비스 이용을 위하여 "회원"이 선정하고 "회사"가 승인하는 문자와 숫자의 조합한 식별 정보를 의미합니다.
④	"비밀번호(Password)"라 함은 "회원"이 부여 받은 "아이디(ID)"와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원"자신이 정한 문자 또는 숫자의 조합을 말합니다.
⑤	"콘텐츠"라 함은 정보통신망이용촉진 및 정보보호 등에 관한 법률 제2조 제1항 제1호의 규정에 의한 정보통신망에서 사용되는 부호, 문자, 음성, 음향, 이미지 또는 영상 등으로 표현된 자료 또는 정보로서, 그 보존 및 이용에 있어서 효용을 높일 수 있도록 전자적 형태로 제작 또는 처리된 것을 말합니다.
⑥	"마일리지"라 함은 "회사"가 제공하는 다양한 서비스를 이용하고 얻는 마일리지로서 현금처럼 지불이 가능한 사이버 머니를 말하며 현금 1원당 포인트 1점의 비율로 적립 및 사용이 가능합니다. (단, 서비스에 따라 최소 사용단위가 요구 되며, 일정 기간 후 소멸되는 시점은 “회사”가 임의로 변경할 수 있습니다.)
⑦	"게시물"이라 함은 "서비스"에 "회원", “고객”이 올린 글, 그림, 사진, 각종 댓글 등 정보의 총칭을 말합니다.
⑧	"쿠폰"이라 함은 "서비스" 내에서 사용 가능한 온-오프라인 형태의 쿠폰을 의미하여, 쿠폰 사용 및 발급 등은 각 쿠폰의 명시된 기준을 따릅니다.
⑨	본 조에서 정의된 용어 이외의 용어에 대해서는 관계 법령 및 서비스 별 이용기준에서 정의하는 바에 따릅니다.

								</textarea>
							<div class="form-group">
								<input type="checkbox" name="third" id="joinAgr"
									class="pop_chk_03" /> <label for="joinAgr"
									class="pop_label_03">이용 약관 동의</label>
							</div>


							<div class="validation"></div>
						</div>

					</div>
				</div>
			</div>


			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">

						<div id="sendmessage">Your message has been sent. Thank you!</div>
						<div id="errormessage"></div>
						<div class="form-group"></div>
						<div class="form-group" id="information" onclick="what()">
							<h5>개인정보 수집, 이용 동의</h5>

						</div>

						<div class="form-group"></div>
						<div class="form-group"></div>
						<div class="form-group">
							<textarea readonly="readonly" class="form-control" name="message"
								rows="5" data-rule="required"
								data-msg="Please write something for us" placeholder="Message">
제1장 총칙
주식회사 해방이노베이션(이하 "회사")은 제휴점주님의 개인정보를 소중하게 생각하며 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」과 「개인정보보호법」 등 관련 법령에 따라 개인정보를 효과적으로 관리하고 안전하게 보호하기 위하여 「개인정보처리방침」 제정하고 보호를 위한 노력을 다 하고 있습니다.
1. 개인정보란 생존하고 있는 개인에 관한 정보로서 성명, 이메일 등에 의하여 당해 개인을 알아볼 수 있는 부호, 문자, 음성, 음향, 영상 및 생체특성 등에 관한 정보(당해 정보만으로는 특정 개인을 알아볼 수 없는 경우에도 다른 정보와 용이하게 결합하여 알아볼 수 있는 것을 포함합니다)를 말합니다.
2. 회사는 개인정보처리방침을 통해 제휴점주가 회사에 제공하는 개인정보에 대한 수집•이용목적 및 개인정보 보호를 위해 회사에서 취하고 있는 조치 등을 알려드립니다.
3. 회사는 개인정보처리방침을 여기어때 마케팅센터 홈페이지(newad.goodchoice.kr)에 공개함으로써 제휴점주가 확인할 수 있도록 조치하고 있습니다.
4. 회사가 개인정보처리방침을 변경하는 경우 여기어때 마케팅센터 홈페이지의 공지사항을 통하여 공지합니다.
5. 회사가 영업의 전부 또는 일부를 양도하거나 합병 등으로 그 권리 의무를 이전하는 경우 서면·전자우편 등을 통하여 제휴점주께 개별적으로 통지하거나, 여기어때 마케팅센터 홈페이지 첫 화면에서 식별할 수 있도록 표기하여 30일 이상 그 사실을 공지합니다.
제2장 개인정보의 수집 및 이용목적
회사는 개인정보 수집 시 관련법령에 따라 개인정보처리방침에 그 수집범위 및 목적을 사전 고지합니다. 회사는 수집한 개인정보는 다음의 목적을 위해 이용합니다.
1. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
2. 서비스 가입/변경/해지 처리, 본인확인, 개인식별, 가입의사확인, 고지사항전달, 서비스제공관련 안내, 명의도용 방지를 위한 등록된 이동전화로 가입사실 통보, 이용요금 고지 결제 및 추심, 이용관련 문의 불만 처리
3. 예약 관리를 위한 서비스 이용에 따른 본인확인, 불만처리 등 민원처리, 고지사항 전달
4. 마케팅 및 광고에 활용 동의한 제휴점주에 한하여 광고, 이벤트, 기타 신규 서비스 개발 및 특화 내용 광고성 정보 전달 시 활용
5. 기타 개인정보처리방침에 고지된 수탁자에게 서비스제공 등 계약의 이행에 필요한 업무의 위탁
제3장 수집하는 개인정보의 항목 및 수집방법
회사는 회원가입, 상담, 서비스 제공을 위하여 아래와 같이 최소한의 개인정보만을 수집하며, 제휴점주의 인권을 현저하게 침해할 우려가 있는 개인정보를 수집하지 않습니다. 다만, 회원 가입 시 개인정보 제공에 동의하지 않을 경우 여기어때 마케팅센터의 일부 또는 전부의 서비스 제공을 받으실 수 없습니다.
								</textarea>
							<div class="form-group">
								<input type="checkbox" name="fourth" id="joinAgree_02"
									class="pop_chk_03" /> <label for="joinAgree_02"
									class="pop_label_03">이용 약관 동의</label>
							</div>

							
							<div class="validation"></div>
						</div>
						<input name = "ownerOrMember" type="hidden" value='<c:out value="${type }"></c:out>' />
						<div class="text-center">
							<a href="<%=request.getContextPath()%>/ceo"><input
								type="button" value="취소" class="btn btn-theme"></a> <input
								type="submit" value="다음" class="btn btn-theme">
						</div>
					</div>
				</div>
			</div>
		</form>





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
	<script>
		function allChk() {
			var click = document.first;
			if(click.second.checked==false)
				{
					click.fourth.checked=false;
					click.third.checked=false;
				}
			else{
				
					click.fourth.checked=true;
					click.third.checked=true;
			}
				
				
		}
		function isNull(obj, msg) {
			if (obj.checked == false) {
				alert(msg.trim()+'는 필수입니다.');
				obj.focus();
				return true;
			}
			return false;
		}
		function nextStep() {
			var click = document.first;
			if (isNull(click.third, document.getElementById('owner').innerText)) {
				return false;
			}
			if (isNull(click.fourth, document.getElementById('information').innerText)) {
				return false;
			} else
				return true;
		}
	</script>
	<script
		src="${ pageContext.request.contextPath }/resources/contactform/contactform.js"></script>

</body>

</html>