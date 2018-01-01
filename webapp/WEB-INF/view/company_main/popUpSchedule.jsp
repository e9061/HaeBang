<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src ="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css" type="text/css" rel="stylesheet" media="all">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	console.log($('#det_s_type').val());
	if($('#det_s_type').val() == 'N'||$('#det_s_type').val() == 'n'){
		$('#service').hide();
	}else{
		$('#service').show();
	}
});
	
</script>
<style>
ul{
   list-style:none;
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


</head>
<body>

        
        
            <div class="modal-header">
                <h2 class="modal-title" id="myModalLabel" style="text-align: center">
                    	예약 상세 내역
                </h2>
			</div>
			
					<div class="col-sm-6" style="margin-top: 5%">
						<div class=" bottom-article">
							<ul class="meta-post">
								<li style="width:40%"> &nbsp;&nbsp;고객 이름 </li>
								<li style="width:50%">
									<input type="text" id="det_mo_orderNo" name="mo_orderNo" value="${ mav.m_name }">
								</li>					
							</ul>
						</div>
						<div class=" bottom-article">
							<ul class="meta-post">
								<li style="width:40%"> &nbsp;&nbsp;예약 번호 </li>
								<li style="width:50%">
									<input type="text" id="det_mo_orderNo" name="mo_orderNo" value="${ mav.mo_orderNo }">
								</li>					
							</ul>
						</div>
						<div class=" bottom-article">
							<ul class="meta-post">
								<li style="width:40%"> &nbsp;&nbsp;신청 날짜 </li>
								<li style="width:50%"><input type="text" id="det_mo_regDate" name="mo_regDate" value="${ mav.mo_regDate }"></li>					
							</ul>
						</div>
						<div class=" bottom-article">
							<ul class="meta-post" style="width:97%">
								<li style="width:28%"> &nbsp;&nbsp;예약 시간 </li>
								<li style="width:65%">
									<input type="text" id="det_mo_startTime" name="mo_startTime" value="${ mav.mo_startTime }">
								</li>					
							</ul>
						</div>
						<div class=" bottom-article" id="memo">
							<ul class="meta-post">
								<li style="width:30%"> &nbsp;&nbsp; 고객 메모 </li>
								<li style="width:50%">
									<input type="text"  id="det_mo_memo" name="mo_memo" value="${ mav.m_memo }">
								</li>					
							</ul>
						</div>
						<br/>
						<div class=" bottom-article">
							<ul class="meta-post">
								<li style="width:40%" id="haebangMan"> &nbsp;&nbsp; 담당 해방맨 </li>
								<li style="width:50%"><input type="text" id="det_e_name" name="e_name" value="${ mav.e_name }"></li>					
							</ul>
						</div>
						<div class=" bottom-article" id="phone">
							<ul class="meta-post">
								<li style="width:40%"> &nbsp;&nbsp; 해방맨 휴대전화 </li>
								<li style="width:50%"><input type="text" id="det_e_phone" name="e_phone" value="${ mav.e_phone }"></li>					
							</ul>
						</div>
				</div>
				<div class="col-sm-6" id="service" style="margin-top: 5%">
						<div class="bottom-article">
			               	<ul class="meta-post">
								<li style="width:50%"> &nbsp;&nbsp;서비스명 </li>
								<li style="width:30%"><input type="text" id="det_s_name" name="s_name" value="${ mav.s_name }"></li>					
							</ul>
						</div>
						<div class="bottom-article">
			               	<ul class="meta-post">
								<li style="width:50%"> &nbsp;&nbsp;서비스타입(해충/소독) </li>
								<li style="width:40%"><input type="text" id="det_s_type" name="s_type" value="${ mav.s_type }"></li>					
							</ul>
						</div>
				</div>
				


					
</body>
</html>