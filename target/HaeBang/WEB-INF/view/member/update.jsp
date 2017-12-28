<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	function checkPasswordPattern(str) {

		var pattern1 = /[0-9]/; // 숫자 
		var pattern2 = /[a-zA-Z]/; // 문자 
		var pattern3 = /[~!@\#$%<>^&*\()\-=+_\’]/; // 특수문자
		var pattern4 = /[\s]/;
		if (!pattern1.test(str) || !pattern2.test(str) || !pattern3.test(str)
				|| str.length < 8) {
			if (!pattern1.test(str) && !pattern2.test(str)) {
				document.getElementById('checkPasswordPattern').style.color = 'red';
				document.getElementById('checkPasswordPattern').innerText = '영문자, 숫자를 입력하세요.';
			} else if (!pattern1.test(str) && !pattern3.test(str)) {
				document.getElementById('checkPasswordPattern').style.color = 'red';
				document.getElementById('checkPasswordPattern').innerText = '특수문자, 숫자를 입력하세요.';
			} else if (!pattern2.test(str) && !pattern3.test(str)) {
				document.getElementById('checkPasswordPattern').style.color = 'red';
				document.getElementById('checkPasswordPattern').innerText = '영문자, 특수문자를 입력하세요.';
			} else if (!pattern1.test(str)) {
				document.getElementById('checkPasswordPattern').style.color = 'red';
				document.getElementById('checkPasswordPattern').innerText = '숫자를 입력하세요.';
			} else if (!pattern2.test(str)) {
				document.getElementById('checkPasswordPattern').style.color = 'red';
				document.getElementById('checkPasswordPattern').innerText = '영문자를 입력하세요.';
			} else if (!pattern3.test(str)) {
				document.getElementById('checkPasswordPattern').style.color = 'red';
				document.getElementById('checkPasswordPattern').innerText = '특수문자를 입력하세요.';
			} else if (str.length < 8) {
				document.getElementById('checkPasswordPattern').style.color = 'red';
				document.getElementById('checkPasswordPattern').innerText = '8자리 이상 입력하세요.';
			}

			/* document.getElementById('checkPasswordPattern').innerText = '사용불가능'; */
			/* document.getElementById('checkPasswordPattern').innerText =str; */
			//alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.");
		} else {
			document.getElementById('checkPasswordPattern').style.color = 'green';
			document.getElementById('checkPasswordPattern').innerText = '사용가능';
		}

		if (pattern4.test(str)) {
			document.getElementById('checkPasswordPattern').style.color = 'red';
			document.getElementById('checkPasswordPattern').innerText = '공백은 입력할 수 없습니다';
		}
		if (str == "") {
			document.getElementById('checkPasswordPattern').style.color = 'red';
			document.getElementById('checkPasswordPattern').innerText = str;
		}

	}

	function firmFi() {
		document.getElementById("firmFirm").innerText = "";
	}

	function firmFirm() {

		var m_password = document.jForm.m_password.value;
		var m_confirm = document.jForm.m_confirm.value;

		if (m_password != m_confirm) {
			document.getElementById('firmFirm').style.color = 'red';
			document.getElementById('firmFirm').innerText = "패스워드 불일치";
		} else {
			document.getElementById('firmFirm').style.color = 'green';
			document.getElementById('firmFirm').innerText = "일치"
		}

	}

	function checkcheck1() {

		var m_password = document.jForm.m_password.value;
		var m_confirm = document.jForm.m_confirm.value;
		var phone1 = document.jForm.phone1.value;
		var phone2 = document.jForm.phone2.value;
		var phone3 = document.jForm.phone3.value;
		var m_address = document.jForm.m_address.value;
		var m_owner = document.jForm.m_owner.value;
		var m_cardNo = document.jForm.m_cardNo.value;
		var m_cardCVC = document.jForm.m_cardCVC.value;

		if (m_password == "") {
			alert("비밀번호를 작성해주세요.");
			document.jForm.m_password.focus();
			return false;
		}

		if (m_confirm == "") {
			alert("비밀번호확인을 입력해주세요.");
			document.jForm.m_confirm.focus();
			return false;
		}
		if (m_password != m_confirm) {
			alert(" 비밀번호가 비밀번호확인과 일치하지 않습니다. ");
			document.ajFormll.m_password.focus();
			return false;
		}
		if (phone1 == "") {
			alert(" 전화번호 앞자리를 입력해주세요. ");
			document.jForm.phone2.focus();
			return false;
		}
		if (phone2 == "") {
			alert(" 전화번호 가운데 자리를 입력해주세요. ");
			document.jForm.phone2.focus();
			return false;
		}

		if (phone2.length < 3) {
			alert("전화번호는 최소 3자리이상, 4자리 이하로 입력하셔야 합니다.");
			document.jForm.phone2.focus();
			return false;
		}

		if (phone3 == "") {
			alert(" 전화번호 뒷자리를 입력해 주세요. ");
			document.jForm.phone3.focus();
			return false;
		}

		if (phone3.length != 4) {
			alert("전화번호는 4자리로 입력하셔야 합니다.");
			document.jForm.phone3.focus();
			return false;
		}

		if (phone2.length < 3) {
			alert("전화번호는 최소 3자리이상, 4자리 이하로 입력하셔야 합니다.");
			document.jForm.phone3.focus();
			return false;
		}
		
		if (m_address == "") {
			alert(" 주소를 입력해 주세요. ");
			document.jForm.m_address.focus();
			return false;
		}
		if (m_owner == "") {
			alert(" 카드명의자를 입력해 주세요. ");
			document.jForm.m_address.focus();
			return false;
		}
		if (m_cardNo == "") {
			alert(" 카드번호를 입력해 주세요. ");
			document.jForm.m_address.focus();
			return false;
		}
		if (m_cardCVC == "") {
			alert(" 카드CVC 뒤 3자리를 입력해 주세요. ");
			document.jForm.m_address.focus();
			return false;
		}
		
		
		alert("정보 수정이 완료되었습니다.");
		return true;
	}

	function chkpwd() {

		var m_password = document.jForm.m_password.value;
		var m_confirm = document.jForm.m_confirm.value;

		if (m_password != m_confirm) {

			alert(" 비밀번호가 비밀번호확인과 일치하지 않습니다. ");

			document.jForm.m_password.focus();

		}

	}
</script>

</head>
<body>
	<header> <jsp:include
		page="/WEB-INF/view/member_include/topmenu.jsp" /> </header>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<form:form action="" method="PUT" role="form" name="jForm"
					commandName="member" onsubmit="return checkcheck1()">
					<div id="sendmessage">해방에 가입해주셔서 너무나도 감사합니다!</div>
					<div>이름:</div>
					<form:input style="width:50%;" path="m_name" class="form-control"
						placeholeder="${ memberVO.m_name }" value="${ memberVO.m_name }"
						readonly="true" />
					<br />
					<div>아이디:</div>
					<form:input style="width:50%;" path="m_id" class="form-control"
						placeholder="${ memberVO.m_id }" value="${ memberVO.m_id }" readonly="true" />
					<div style="float: left;" class="form-group" id="checkId">
						<span class="txt_right" style="text-align: right;"></span>
					</div>
					<!-- <a class="btn btn-theme" id="duplicate1" style="width: 100px">중복
						확인</a> -->
					<br />
					<br />
					<div>비밀번호:</div>
					<form:input type="password" style="width:50%;" path="m_password"
						class="form-control" placeholder="${ memberVO.m_password }"
						onkeyup="checkPasswordPattern($(this).val());firmFi()" />
					<div class="validation"></div>
					<div style="float: left;" class="form-group"
						id="checkPasswordPattern">
						<span class="txt_right" style="text-align: right; color: red;"></span>
					</div>
					<br />
					<br />
					<div>비밀번호 확인:</div>
					<input type="password" style="width: 50%;" id="m_confirm"
						name="m_confirm" class="form-control"
						placeholder="${ memberVO.m_password }"
						onkeyup="firmFirm($(this).val())" onfocusout="chkpwd()">
					<div class="form-group" id="firmFirm">
						<span class="txt_right" style="text-align: right; color: red;"></span>
					</div>
					<br />
					<br />
					<div style="align: inline;">
					<div>연락처:</div>
					<div style="align: inline;">
						<select style="width: 15%; float: left;" class="form-control"
							id="phone1" name="phone1">
							<option value="">선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="0130">0130</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
							<option value="0502">0502</option>
							<option value="0505">0505</option>
							<option value="0506">0506</option>
						</select> <input style="width: 15%; float: center; display: inline;"
							path="phone2" id="phone2" name="phone2" class="form-control"
							placeholder="전화번호를 입력해 주세요." /> <input
							style="width: 15%; float: left; display: inline;" path="phone3"
							id="phone3" name="phone3" class="form-control"
							placeholder="전화번호를 입력해 주세요." />
					</div>
					</div>
					<br />
					<div>주소:</div>
					<form:input style="width:50%;" path="m_address" class="form-control"
						placeholeder="${ memberVO.m_address }" value="${ memberVO.m_address }" />
					<br/>
					<br/>
					<div>카드 명의:</div>
					<form:input style="width:50%;" path="m_owner" class="form-control"
						placeholeder="${ memberVO.m_owner }" value="${ memberVO.m_owner }" />
					<br/>
					<br/>
					<div>카드 번호:</div>
					<form:input style="width:50%;" path="m_cardNo" class="form-control"
						placeholeder="${ memberVO.m_cardNo }" value="${ memberVO.m_cardNo }" />
					<br/>
					<br/>
					<div>카드 CVC:</div>
					<form:input style="width:50%;" path="m_cardCVC" class="form-control"
						placeholeder="${ memberVO.m_cardCVC }" value="${ memberVO.m_cardCVC }" />

					<!-- <input type="submit" class="btn btn-theme" value="가입 완료"> -->
					<input type="submit" value="수정 완료" class="btn btn-theme" />

					<!-- <a class="btn btn-theme" type="submit" style="width: 100px">가입 완료</a> -->
					<!-- <input type="submit" class="btn btn-theme" value="가입 완료" /> -->
				</form:form>
			</div>
		</div>

		<div>
			<footer> <jsp:include
				page="/WEB-INF/view/member_include/bottom.jsp" /> </footer>
		</div>
	</div>
</body>
</html>