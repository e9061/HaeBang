<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>

<meta charset="utf-8">
<title>해방 사장님 사이트</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />

</head>

<body>
<header>
		<jsp:include page="../employee_include/topmenu.jsp" />
</header>


	<div class="container">
		<h1>아이디 찾기</h1>
		<hr>
		<h4>등록된 회원정보로 아이디를 찾으실 수 있습니다.</h4>
		<hr>
		<br />

									
		<form name="lform" action="${ pageContext.request.contextPath }/ceo/forgotmyid" method="post" onsubmit="return checkForm()">
			<input type="radio" id="cellphone" name="member-find-way" checked="checked" value="cellphone"/> 
			<label for="find-way-phone">휴대폰번호로 찾기</label><br/><br/><label for="user-name1">이름</label><input type="text" id="name1" name="name1"/> 
				<br /> <br /> 
				<div id="cellphoneForm">
				<label for="user-hp-1">휴대폰번호</label>&nbsp; 
				<select id="phone1" class="ui-select" name="phone1">
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
			</select>- 
			<input type="tel" size="10" id="phone2" name="phone2" MaxLength="4" />- 
			<input type="tel" size="10" id="phone3" name="phone3" MaxLength="4" /> 
			</div>
			<br /> <br /> <br />			
		
		
				
				<input type="radio" id="bizNo" name="member-find-way" value="bizNo"/> 
				<label for="find-way-corp">사업자등록번호로 찾기</label> 
				<br/> 
				<br/>
				<div id="bizForm">
				<label for="user-name2">이름</label> 
				<input type="text" id="name2" name="name2" maxlength="20" />
				<br/> 
				<br/>
				<label for="companyName">법인명</label> 
				<input type="text" id="companyName"	name="companyName" maxlength="20" /> 
				<br /> 
				<br/>
				<label for="corporate-license-0">사업자번호</label>&nbsp;
				<input type="tel" id="bizNo1" size="5" name="bizNo1" LengthType="byte"	MaxLength="3" InputType="number" />- 
				<input type="tel" id="bizNo2" size="3" name="bizNo2" LengthType="byte" MaxLength="2" InputType="number" />-
				<input type="tel" id="bizNo3" size="10" name="bizNo3" LengthType="byte" MaxLength="5" InputType="number" />
				</div>
				
				<br/><br/>
				<span style="color: red;">${ errorMessage }</span>
				<br /> <br /> <br />
				<input class="btn btn-theme" type="submit" value="아이디 찾기" />
		</form>

		
			

<div align="center">
				<a href="${ pageContext.request.contextPath }/ceo"><button type="button" class="btn btn-theme">메인으로 돌아가기</button></a>
						<br/><br/><br/>
			</div>

	</div>
	</div>

	<!-- /.container -->

	<footer>
		<jsp:include page="../employee_include/bottom.jsp" />
	</footer>

	<script
		src="/HaeBang/resources/js/jquery.js"></script>
	<script
		src="/HaeBang/resources/js/jquery.easing.1.3.js"></script>
	<script
		src="/HaeBang/resources/js/bootstrap.min.js"></script>
	<script
		src="/HaeBang/resources/js/jquery.fancybox.pack.js"></script>
	<script
		src="/HaeBang/resources/js/jquery.fancybox-media.js"></script>
	<script
		src="/HaeBang/resources/js/google-code-prettify/prettify.js"></script>
	<script
		src="/HaeBang/resources/js/portfolio/jquery.quicksand.js"></script>
	<script
		src="/HaeBang/resources/js/portfolio/setting.js"></script>
	<script
		src="/HaeBang/resources/js/jquery.flexslider.js"></script>
	<script
		src="/HaeBang/resources/js/animate.js"></script>
	<script
		src="/HaeBang/resources/js/custom.js"></script>

</body>
<script>

function isNull(obj, msg) {
	if (obj.value == "") {
		alert(msg);
		obj.focus();
		return true;
	}
	return false;
}


function checkForm(){
	    		
	var f = document.lform;	
	var chk_radio = document.getElementsByName('member-find-way');
	
	
	for(var i=0; i<chk_radio.length; i++){
		
		if(chk_radio[0].checked==true){
			
			
			if(isNull(f.name1, '이름을 입력해 주세요')){
				return false;
			}
			
			if(isNull(f.phone1, '전화번호 앞자리를 선택해 주세요.')){
				return false;
			}
			
			if(isNull(f.phone2, '전화번호 가운데 자리를 입력하세요.')){
				return false;
			}
			
			if(f.phone2.value.length < 3){
				alert('전화번호 가운데 자리는 최소 3자리 이상, 4자리 이하로 입력하셔야 합니다.');
				f.phone2.focus();
				return false;
			}
			
			if(isNull(f.phone3, '전화번호 뒷자리를 입력하세요.')){
				return false;
			}
			
			if(f.phone3.value.length  < 4){
				alert('전화번호 뒷자리는 4자리로 입력하셔야 합니다.');
				f.phone3.focus();
				return false;
			}	
			
			if(!isInteger(f.phone1.value)){
				alert("전화번호는 숫자 형식으로 입력하세요.");
				f.phone1.focus();
				return false;
			}
			
			if(!isInteger(f.phone2.value)){
				alert("전화번호는 숫자 형식으로 입력하세요.");
				f.phone2.focus();
				return false;
			}
					
			if(!isInteger(f.phone3.value)){
				alert("전화번호는 숫자 형식으로 입력하세요.");
				f.phone3.focus();
				return false;
			}	
			
			if(f.phone2.value == "0000" && f.phone3.value == "0000"){
				alert("휴대폰 정보가 올바르지 않습니다.");
				f.phone2.focus();
				return false;
			}
			
			return true;	 
			
			
			
		} else {
			
			if(isNull(f.name2, '이름을 입력해 주세요')){
				return false;
			}
			
			if(isNull(f.companyName, '법인명을 입력해 주세요')){
				return false;
			}
			
			if(isNull(f.bizNo1, '사업자번호를 입력해 주세요')){
				return false;
			}
			
			if(isNull(f.bizNo2, '사업자번호를 입력해 주세요')){
				return false;
			}
			
			if(isNull(f.bizNo3, '사업자번호를 입력해 주세요')){
				return false;
			}
			
			if( !isInteger( f.bizNo1.value ) || !isInteger( f.bizNo2.value ) || !isInteger( f.bizNo3.value ) ){
				alert( "사업자등록번호는 숫자만 입력해 주세요." );
				f.bizNo1.focus();
				return false;
			}
			
			var bizNo = f.bizNo1.value + f.bizNo2.value + f.bizNo3.value;
			
			if( bizNo.length != 10 ){
				alert( "사업자등록번호를 정확히 입력해 주세요." );
				f.bizNo1.focus();
				return false;
			}
			
			return true;	 
			
		}
			
	} 	
	
}


	

</script>

</html>