<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<script src ="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>해방</title>
<style type="text/css">
.container1 {
	padding:0 30px 0 50px;
	position:relative;
}

table.type09 {
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;

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

input {
	 border:none;
	 border-right:0px; 
	 border-top:0px; 
	 boder-left:0px; 
	 boder-bottom:0px;
}
input th{
	background-color: #f3f6f7;
	 margin: auto;
}




</style>
<script>

	
$(document).ready(function(){
	
	$.ajax({
		type : "POST",
		url : "${ pageContext.request.contextPath }/member/myReservation",
		dataType : "json",
		error : function(request, status, error){
			alert("code :" + request.status + "\r\nmessage : " + request.responseText);
		},
		success :  function(data){
			console.log(data);
			var output = "";
			
			for(var i=0; i < data.length; i++){
				output +=   "	<tr>					"
				output +=	"		 <th><input type='text' name='mo_orederNo' value='" + data[i].mo_orderNo + "' style='background-color: #f3f6f7; text-align : center' readonly='readonly'></th>  ";
				output +=	"		 <td><input type='text' id='s_name' name='s_name' value='" + data[i].s_name  + "' style='text-align : center' readonly='readonly'></td>														";
				output +=	"		 <td><input type='text' id='mo_startTime' name='mo_startTime' value='" + data[i].mo_startTime  + "' style='text-align : center'readonly='readonly'></td>									";
				output +=	"		 <td><input type='text' id='mo_endTime' name='mo_endTime' value='" + data[i].mo_endTime  + "' style='text-align : center'readonly='readonly'></td>											";
				if(data[i].mo_callFlag == "ing") {
					output +=	"		 <td><input type='hidden' id='mo_callFlag' name='mo_callFlag' value='" + data[i].mo_callFlag + "' style='text-align : center'><input type='text' value='해방맨 매칭 중입니다!'></td>											";
				}else if(data[i].mo_callFlag == "ed"){
					output +=	"		 <td><input type='hidden' id='mo_callFlag' name='mo_callFlag' value='" + data[i].mo_callFlag + "' style='text-align : center'><input type='text' value='해방맨 매칭 완료!'></td>											";
				}else{
					output +=	"		 <td><input type='hidden' id='mo_callFlag' name='mo_callFlag' value='" + data[i].mo_callFlag + "' style='text-align : center'><input type='text' value='서비스 취소 상태!'></td>											";
				}
				output +=	 "	<td><input type='image' src='${pageContext.request.contextPath }/resources/img/noun_1060075_cc.png' style='width: 25px; height: 25px;' onclick='detail_btn(" + data[i].mo_no + ");'></td>	";		
				output +=   "	</tr>					"
			}	
				$('#reservList').html(output);
				
		}
		
	});
		
});


	function detail_btn(mo_no){
		console.log(mo_no);
		$.ajax({
			type : "POST",
			data : {
				mo_no : mo_no
			},
			url : "${ pageContext.request.contextPath }/member/myReservDetail",
			dataType : "json",
			error : function(request, status, error){
				alert("code :" + request.status + "\r\nmessage : " + request.responseText);
			},
			success :  function(data){
				console.log(data);
				$('#det_mo_no').val(data.mo_no);
				$('#det_mo_orderNo').val(data.mo_orderNo);
				$('#det_mo_regDate').val(data.mo_regDate);
				$('#det_mo_startTime').val(data.mo_startTime);
				$('#det_mo_endTime').val(data.mo_endTime);
				$('#det_s_name').val(data.s_name);
				$('#det_s_duration').val(data.s_duration);
				
				if(data.s_type == 'h' || data.s_type == 'H'){
					$('#det_s_type').val("해충 방역");
				}else{
					$('#det_s_type').val("소독");
				}
				console.log("정기/보장 : " + data.s_style);
				
				if(data.s_style == 'J' || data.s_style == 'j'){				// 정기형
					$('#det_s_style').val("정기형");
					$('#det_mo_total').val(data.mo_total);
					$('#det_mo_cnt').val(data.mo_cnt);
					$('#det_mo_freqCycle').val(data.mo_freqCycle);
					if(data.mo_freqType == 'M' || data.mo_freqType == 'm'){
						$('#det_mo_freqTitle').val("개월 마다");
						$('#det_mo_freqType').val(data.mo_freqType);
					}else{
						$('#det_mo_freqTitle').val("주 마다");
						$('#det_mo_freqType').val(data.mo_freqType);
					}
					$('#freq').show();
					$('#cntNow').show();
					$('#totalCnt').show();
				}else{								// 보장형
					$('#det_mo_freqType').val(data.mo_freqType);
					$('#det_s_style').val("보장형");
					$('#freq').hide();
					$('#cntNow').hide();
					$('#totalCnt').hide();
				}

				if(data.mo_memo != null){
					$('#det_mo_memo').val(data.mo_memo);
					$('#memo').show();
				}else{
					$('#memo').hide();
				}
					
				console.log("해방맨 매칭 전 " + data.e_name)
				if(data.e_name != null){
					$('#det_e_name').val(data.e_name);
				//	$('#haebangMan').html("<img src='data:image/jpeg;base64," + ${empPicture} + " style='width: 40px; height: auto;' />");
					$('#det_e_phone').val(data.e_phone);
					$('#phone').show();
				}else{
					$('#det_e_name').val("해방맨 매칭 중입니다.");
					$('#phone').hide();
				}
				
				$('#myReservDetailModal').modal('show');
				
				
				
				$('#cancleService').click(function(){			// 해당 관련 서비스 모두 취소 
					if(confirm("서비스번호 : " + data.mo_orderNo  + " 관련 예약을 모두 취소 하시겠습니까?")){
						location.href="${pageContext.request.contextPath}/member/cancleService?mo_orderNo="+data.mo_orderNo;
						alert("서비스가 취소 되었습니다.");						
					}
				});
				
				
				$('#changeDate').click(function(){
					if(confirm("예약 날짜를 변경 하시겠습니까?")){
						var popUrl = "${pageContext.request.contextPath}/member/reserv/PopUpChangeDate";
						var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
						window.open(popUrl,"addrPopUp",popOption);

					}else{
						alert("변경이 취소 되었습니다.");
					}
					
				});
				
				
				
			}
		});
	};
	

</script>
</head>
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
	 									<li><i class="icon-angle-right"></i><a href="${ pageContext.request.contextPath }/member/myPage">My Info</a></li>
										<li><i class="icon-angle-right"></i><a href="${ pageContext.request.contextPath }/member/myReservation"><strong>My Reservation</strong></a></li> 
									</ul>
								</div>
							</aside>
						</div>
						<div class="col-lg-6">
							<article>
								<div class="post-heading">
									<h3><a href="#"> ${ memberVO.m_name } 회원 님의 예약 정보</a></h3>
								</div>
								<table class="type09">
								    <thead>
								    <tr>
								        <th>예약 번호</th>
								        <th>서비스 명</th>
								        <th>예약 날짜 및 시간</th>
								        <th>예상 종료 시간</th>
								        <th>매칭 상태</th>
								        <th>detail</th>
								    </tr>
								    </thead>
								    <tbody id="reservList">
								    </tbody>
								</table>
							</article>
							
						</div>
					</div>
				</div>
				
				<jsp:include page="../member/myReservDetail.jsp"></jsp:include>
			</section>
			
	<footer>
		<jsp:include page="../member_include/bottom.jsp"></jsp:include>
	</footer>

</body>
</html>