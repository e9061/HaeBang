<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Moderna - Bootstrap 3 flat corporate template</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />

<!-- Theme skin -->
<link
	href="${ pageContext.request.contextPath }/resources/skins/default.css"
	rel="stylesheet" />
<style>
.form-control {
	clear: both;
	width: 200px;
}
</style>
<script type="text/javascript">
	
function checkPasswordPattern(str) {

	var pattern1 = /[0-9]/; // 숫자 
	var pattern2 = /[a-zA-Z]/; // 문자 
	var pattern3 = /[~!@\#$%<>^&*\()\-=+_\’]/; // 특수문자
	var pattern4 = /[\s]/;
	if (!pattern1.test(str) || !pattern2.test(str)
			|| !pattern3.test(str) || str.length < 8) {
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
	
	function firmFi(){
		document.getElementById("firmFirm").innerText = "";
	}
	
	function firmFirm(){
		
		var m_password = document.jForm.m_password.value;
		var m_confirm = document.jForm.m_confirm.value;
		
		if (m_password != m_confirm){
			document.getElementById('firmFirm').style.color = 'red';
			document.getElementById('firmFirm').innerText = "패스워드 불일치";
		} else {
			document.getElementById('firmFirm').style.color = 'green';
			document.getElementById('firmFirm').innerText = "일치"
		}
		
	}


	function checkcheck(){
		
		var m_name = document.jForm.m_name.value;
		var m_id = document.jForm.m_id.value;
		var m_password = document.jForm.m_password.value;
		var m_confirm = document.jForm.m_confirm.value;
		var phone1 = document.jForm.phone1.value;
		var phone2 = document.jForm.phone2.value;
		var phone3 = document.jForm.phone3.value;
		
		if(m_name == ""){
			alert("이름을 작성해주세요.");
			document.jForm.m_name.focus();
			return false;
		}
		if(m_id == ""){
			alert("아이디를 작성해주세요.");
			document.jForm.m_id.focus();
			return false;
		}
		
		
		
		if(m_password == ""){
			alert("비밀번호를 작성해주세요.");
			document.jForm.m_password.focus();
			return false;
		}
		
		if(m_confirm == ""){
			alert("비밀번호확인을 입력해주세요.");
			document.jForm.m_confirm.focus();
			return false;
		}
		if (m_password != m_confirm) {
			alert(" 비밀번호가 비밀번호확인과 일치하지 않습니다. ");
			document.ajFormll.m_password.focus();
			return false;
		}
		if (phone1 == ""){
			alert(" 전화번호 앞자리를 입력해주세요. ");
			document.jForm.phone2.focus();
			return false;
		}
		if (phone2 == ""){
			alert(" 전화번호 가운데 자리를 입력해주세요. ");
			document.jForm.phone2.focus();
			return false;
		}
		
		if (phone2.length < 3){
			alert("전화번호는 최소 3자리이상, 4자리 이하로 입력하셔야 합니다.");
			document.jForm.phone2.focus();
			return false;
		}
		
		if (phone3 == ""){
			alert(" 전화번호 뒷자리를 입력해 주세요. ");
			document.jForm.phone3.focus();
			return false;
		}
		
		if (phone3.length != 4){
			alert("전화번호는 4자리로 입력하셔야 합니다.");
			document.jForm.phone3.focus();
			return false;
		}
		
		alert("회원가입이 완료되었습니다. 메인화면으로 이동합니다.");
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
	<!-- start header -->
	<header> <jsp:include
		page="/WEB-INF/view/member_include/topmenu.jsp" /> </header>
	<!-- end header -->

	<div class="container">

		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<h4>
					해방에 가입하시는데는, 개인정보가 필요하지 않습니다</strong>
				</h4>
				<form:form action="join" method="post" role="form" name="jForm"
					commandName="member" onsubmit="return checkcheck()" >
					<div id="sendmessage">해방에 가입해주셔서 너무나도 감사합니다!</div>

					<form:input style="width:50%;" path="m_name" class="form-control"
						placeholder="이름을 입력해 주세요." />
					<br />
					<form:input style="width:50%;" path="m_id" class="form-control"
						placeholder="아이디를 입력해주세요." onkeyup="duplicate1($(this).val());" />
						<div style="float:left;" class="form-group" id="checkId">
						<span class="txt_right" style="text-align:right;"></span>
					</div>
					<!-- <a class="btn btn-theme" id="duplicate1" style="width: 100px">중복
						확인</a> -->
					<br />
					<br />
					
					<form:input type="password" style="width:50%;" path="m_password"
						class="form-control" placeholder="비밀번호를 입력해 주세요." onkeyup="checkPasswordPattern($(this).val());firmFi()" />
						<div class="validation"></div>
					<div style="float:left;" class="form-group" id="checkPasswordPattern">
						<span class="txt_right" style="text-align:right; color:red;"></span>
					</div>
					
					<input type="password" style="width:50%;" id="m_confirm" name="m_confirm" 
						class="form-control" placeholder="위와 같은 비밀번호를 입력해 주세요." onkeyup="firmFirm($(this).val())"
						onfocusout="chkpwd()" >
						<div class="form-group" id="firmFirm">
						<span class="txt_right" style="text-align:right; color:red;"></span>
					</div>
					<br />
					<div style="align:inline;">
					<select style="width:15%; float:left;" class="form-control" id="phone1" name="phone1">
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
					</select>
					<input style="width:15%; float:center; display: inline;" path="phone2" id="phone2" name="phone2" class="form-control"
						placeholder="전화번호를 입력해 주세요." />
					<input style="width:15%; float:left; display: inline;" path="phone3" id="phone3" name="phone3" class="form-control"
						placeholder="전화번호를 입력해 주세요." />
					</div>
					<br />
					
					<!-- <input type="submit" class="btn btn-theme" value="가입 완료"> -->
					<input type="submit" value="가입 완료" class="btn btn-theme" />

					<!-- <a class="btn btn-theme" type="submit" style="width: 100px">가입 완료</a> -->
					<!-- <input type="submit" class="btn btn-theme" value="가입 완료" /> -->
				</form:form>
			</div>
		</div>
	</div>
	</div>
	</div>
	<footer> <jsp:include page="/WEB-INF/view/member_include/bottom.jsp" /> </footer>

	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
</body>


<script>

  
$(document).on("keyup", "#m_id", function(){
	
	$.ajax({		
		url: "${ pageContext.request.contextPath }/member/duplicate1",
		type: "POST",
		data: {	
			m_id : $(this).val(),
		},
		success: function(data){
			var a = "";
			if(data === ("이메일 형식을 지켜주세요.")){
				a += "<div style = 'color : red;'>"+ data + "</div>";
				$("#checkId").html(a);
				
			}else if(data === ("사용가능한 아이디입니다.")){
				a += "<div style = 'color : green;'>"+ data + "</div>";
				$("#checkId").html(a);
				
			}else{
				a += "<div style = 'color : red;'>"+ data + "</div>";
				$("#checkId").html(a);
				
				
			}
		}
	}); 
});

</script>

</html>
					 