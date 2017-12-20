<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src ="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
.container1 {
	padding:0 30px 0 50px;
	position:relative;
}
</style>
 
<script type="text/javascript">

	function click_update(data){				// 패스워드 해야함
		console.log(data);
		if(data == "m_password"){
			
			var msg = "<input class='form-control' name='password' type='password' placeholder='기존 비밀번호를 입력해주세요.'/>"
		}else if(daya == "m_phone"){
			var msg = "<input class='form-control' type='text' id='newM_phone' placeholder='"+$('#m_phone').val()+"'/>"
		}else{
			var msg = "<input class='form-control' type='text' id='newM_address' placeholder='"+$('#m_phone').val()+"'/>"
		}
		var msg1 = "<a class='btn btn-info' id='"+data+"_btn' style='width: 70px; color:white'>수정 완료</a>"
		$(document.getElementsByClassName(data)).next().html(msg);
		$(document.getElementsByClassName(data)).next().next().html(msg1);
		$(document.getElementsByClassName(data)).parent().next().html("");
	};


	function popupAddr(){
		var popUrl = "${pageContext.request.contextPath}/member/myPage/popupAddr";
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
		
	};
	
	$(document).on("click", "#m_phone_btn", function(){
		alert("버튼 눌림");
		console.log($('#newM_phone').val());
		location.href="${pageContext.request.contextPath}/member/changeMyInfo?m_phone="+$('#newM_phone').val();
		
	});
	$(document).on("click", "#newAddress_btn", function(){		// 나중에 폼으로 만들어서 넘겨볼 것
		alert("버튼 눌림");
		console.log($('#m_address').val());
		location.href="${pageContext.request.contextPath}/member/changeMyInfo?m_address="+$('#m_address').val() +" "+ $('#m_detail').val() + "&m_gu="+ $('#m_gu').val() + "&m_lon="+ $('#m_lon').val() + "&m_lat="+ $('#m_lat').val(); 
	});
	
	/*
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
	 */
	
	
	
</script>

<style>

div.bottom-article {
		border-bottom: 1px solid #ccc;
		border-top: 1px solid #ccc;
}
 
input {
	 border:none;
	 border-right:0px; 
	 border-top:0px; 
	 boder-left:0px; 
	 boder-bottom:0px;
}

</style>

<body>
	<header>
		<jsp:include page="../member_include/topmenu.jsp"></jsp:include>
	</header>
			<section id="content">
				<div class="container1">
					<div class="row">
						<div class="col-lg-2">
							<aside class="left-sidebar">
								<div class="widget">
									<h5 class="widgetheading">Information</h5>
									<ul class="cat">
	 									<li><i class="icon-angle-right"></i><a href="${ pageContext.request.contextPath }/member/myPage"><strong>My Info</strong></a></li>
										<li><i class="icon-angle-right"></i><a href="${ pageContext.request.contextPath }/member/myReservation">My Reservation</a></li> 
									</ul>
								</div>
							</aside>
						</div>
						<div class="col-lg-6">
							<article>
								<div class="post-heading">
									<h3><a href="#"> ${ memberVO.m_name } 회원 님의 개인 정보</a></h3>
								</div>
								<div class="bottom-article"  style="margin-top: 5%">
									<ul class="meta-post" >
										<li style="width:40%"> &nbsp;&nbsp;아이디 </li>
										<li style="width:50%"><input type="text" id="m_id" name="m_id" value="${getMyPage.m_id}" readonly="readonly"></li>					
									</ul>
								</div>
								<div class="bottom-article">
									<ul class="meta-post">
										<li style="width:40%"> &nbsp;&nbsp;비밀번호 </li>
										<li style="width:50%"><input type="password" id="m_password" name="m_password" value="${getMyPage.m_password}" readonly="readonly"></li>
									</ul>
									<a href="javascript:click_update('m_password');" class="pull-right"><img src="${pageContext.request.contextPath }/resources/img/noun_1060075_cc.png" style="width: 25px; height: auto;" /></a>
										<input type="hidden" value="${memberVO.m_password }"/>
								</div>
								<div class="bottom-article">
									<ul class="meta-post">
										<li style="width:40%"> &nbsp;&nbsp;이름 </li>
										<li style="width:50%"><input type="text" id="m_name" name="m_name" value="${getMyPage.m_name}" readonly="readonly" ></li>
									</ul>
								</div>
								<div class="bottom-article">
									<ul class="meta-post" style="width:60%">
										<li style="width:15%" class="m_phone"> &nbsp;&nbsp;휴대전화 </li>
										<li style="width:40%"><input type="text" id="m_phone" name="m_phone" value="${getMyPage.m_phone}" readonly="readonly"></li>
										<li></li>
									</ul>
									<a href="javascript:click_update('m_phone');" class="pull-right abc">
										<input type='image' src='${pageContext.request.contextPath }/resources/img/noun_1060075_cc.png' style="width: 25px; height: 25px;"> 
									</a>
								</div>
							</article>
							
							<article>
								<div class="post-heading">
									<h4><a href="#"> 추가 기제 사항 </a></h4>
								</div>
								<div class="bottom-article">
									<ul class="meta-post" style="width:95%">
										<li style="width:15%"> &nbsp;&nbsp; 주 소</li>
										<li style="width:65%" id="newAddr">
											<input style="width:70%" type="text" id="m_address" value="${getMyPage.m_address}" readonly="readonly"/>
											<input style="width:20%" type="text" id="m_detail"/>
											<input type="hidden" id="m_lon"/>
											<input type="hidden" id="m_lat"/>
											<input type="hidden" id="m_gu"/>
										</li>
										<li></li>
									</ul>
									<a href="javascript:popupAddr();" class="pull-right abc">
										<input type='image' src='${pageContext.request.contextPath }/resources/img/noun_1060075_cc.png' style="width: 25px; height: 25px;"> 
									</a>
								</div>
								<div class="bottom-article">
									<ul class="meta-post">
										<li style="width:150px"> 카드 정보 </li>
										<li style="width:200px" >${memberVO.m_cardNo }</li>
										<li style="width:70px" >${memberVO.m_cardExp }</li>
										<li style="width:50px" >${memberVO.m_cardCVC }</li>
									</ul>
									<a href="#" class="pull-right"><img src="${pageContext.request.contextPath }/resources/img/noun_1060075_cc.png" style="width: 25px; height: auto;" /></a>
								</div>
								<div class="bottom-article">
									<ul class="meta-post">
										<li style="width:40%"> &nbsp;&nbsp;해방가입일</li>
										<li style="width:50%"><input type="text" id="m_joinDate" name="m_joinDate" value="${getMyPage.m_joinDate}" readonly="readonly"></li>
									</ul>
								</div>
							</article>
							
						</div>
					</div>
				</div>
				
			</section>
	<footer>
		<jsp:include page="../member_include/bottom.jsp"></jsp:include>
	</footer>

</body>
</html>