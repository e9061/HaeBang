<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
ul{
   list-style:none;
   }
   
textarea {
	 border:none;
	 border-right:0px; 
	 border-top:0px; 
	 boder-left:0px; 
	 boder-bottom:0px;
}
</style>

<script>
	function confirmChangeTime() {							// 후에 포스트 방식으로 변경
		if(confirm("담당 해방맨이 변경 될 수 있습니다. 예약 시간을 변경하시겠습니까?")){
			
			if($('#det_s_style').val()=="정기형"){
				if(confirm("추후 일정의 시간도 동일하게 변경하시겠습니까?")){
					location.href="${pageContext.request.contextPath}/member/changeDate?mo_orderNo="+$('#det_mo_orderNo').val()+"&mo_startTime="+$('#det_mo_startTime').val()+"&mo_cnt="+$('#det_mo_cnt').val()+"&mo_total="+$('#det_mo_total').val() +"&mo_freqType="+$('#det_mo_freqType').val() +"&mo_freqCycle="+$('#det_mo_freqCycle').val() +"&s_duration="+$('#det_s_duration').val();
				}else if(confirm("해당 일정의 시간만 변경 하시겠습니까?")){
					location.href="${pageContext.request.contextPath}/member/changeDate?mo_orderNo="+$('#det_mo_orderNo').val()+"&mo_startTime="+$('#det_mo_startTime').val()+"&mo_cnt="+$('#det_mo_cnt').val()+"&mo_freqType="+$('#det_mo_freqType').val() +"&s_duration="+$('#det_s_duration').val();
				}
				
			}else{				// 보장형 
				
				location.href="${pageContext.request.contextPath}/member/changeDate?mo_orderNo="+$('#det_mo_orderNo').val()+"&mo_startTime="+$('#det_mo_startTime').val()+"&mo_freqType="+$('#det_mo_freqType').val() +"&s_duration="+$('#det_s_duration').val();
			}
		}
	};
	
	
</script>

<div class="modal fade" id="myReservDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-80p">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h2 class="modal-title" id="myModalLabel" style="text-align: center">
                    	예약 상세 내역
                </h2>
			</div>
			<!-- End Modal Header -->
			
			
			<!-- Modal body -->
			<div class="modal-body">
				<div class="form-group form-group-sm">
					<div class="col-sm-6">
						<div class=" bottom-article">
							<ul class="meta-post">
								<li style="width:40%"> &nbsp;&nbsp;예약 번호 </li>
								<li style="width:50%"><input type="text" id="det_mo_orderNo" name="mo_orderNo">
									<input type="hidden" id="det_mo_no" name="mo_no">
								</li>					
							</ul>
						</div>
						<div class=" bottom-article">
							<ul class="meta-post">
								<li style="width:40%"> &nbsp;&nbsp;신청 날짜 </li>
								<li style="width:50%"><input type="text" id="det_mo_regDate" name="mo_regDate"></li>					
							</ul>
						</div>
						<div class=" bottom-article">
							<ul class="meta-post" style="width:97%">
								<li style="width:28%"> &nbsp;&nbsp;예약 시간 </li>
								<li style="width:65%">
									<input type="text" id="det_mo_startTime" name="mo_startTime">
									<button type="button" class="btn btn-theme" id="changeDate"> 시간 변경 </button>	
								</li>					
							</ul>
						</div>
						<div class=" bottom-article">
							<ul class="meta-post" id="endTime">
								<li style="width:40%"> &nbsp;&nbsp; 종료 시간 </li>
								<li style="width:50%">
									<input type="text" id="det_mo_endTime" name="mo_endTime">
									<input type="hidden" id="det_s_duration" name="s_duration">
								</li>					
							</ul>
						</div>
						<div class=" bottom-article" id="memo">
							<ul class="meta-post">
								<li style="width:30%"> &nbsp;&nbsp; 고객 메모 </li>
								<li style="width:50%">
									<textarea rows="2" cols="35" id="det_mo_memo" name="mo_memo"></textarea>
								</li>					
							</ul>
						</div>
						<br/>
						<div class=" bottom-article">
							<ul class="meta-post">
								<li style="width:40%" id="haebangMan"> &nbsp;&nbsp; 담당 해방맨 
														
								</li>
								<li style="width:50%"><input type="text" id="det_e_name" name="e_name"></li>					
							</ul>
						</div>
						<div class=" bottom-article" id="phone">
							<ul class="meta-post">
								<li style="width:40%"> &nbsp;&nbsp; 해방맨 휴대전화 </li>
								<li style="width:50%"><input type="text" id="det_e_phone" name="e_phone"></li>					
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="bottom-article">
			               	<ul class="meta-post">
								<li style="width:50%"> &nbsp;&nbsp;서비스명 </li>
								<li style="width:30%"><input type="text" id="det_s_name" name="s_name"></li>					
							</ul>
						</div>
						<div class="bottom-article">
			               	<ul class="meta-post">
								<li style="width:50%"> &nbsp;&nbsp;서비스타입(해충/소독) </li>
								<li style="width:40%"><input type="text" id="det_s_type" name="s_type"></li>					
							</ul>
						</div>
						<div class="bottom-article">
			               	<ul class="meta-post">
								<li style="width:52%"> &nbsp;&nbsp;서비스형(정기/보장) </li>
								<li style="width:40%"><input type="text" id="det_s_style" name="s_style"></li>					
							</ul>
						</div>
						<div class="bottom-article" id="freq">
			               	<ul class="meta-post">
								<li style="width:37%"> &nbsp;&nbsp; 주기(정기형) </li>
								<li style="width:50%">
									<input type="text" id="det_mo_freqCycle" name="mo_freqCycle" style="width:15%; text-align:right">					
									<input type="text" id="det_mo_freqTitle" name="mo_freqTitle" style="width:40%">
									<input type="hidden" id="det_mo_freqType" name="mo_freqType">
								</li>					
							</ul>
						</div>
						<div class="bottom-article" id="cntNow">
			               	<ul class="meta-post">
								<li style="width:52%"> &nbsp;&nbsp; 횟수(정기형) </li>
								<li style="width:40%"><input type="text" id="det_mo_cnt" name="mo_cnt"></li>					
							</ul>
						</div>
						<div class="bottom-article" id="totalCnt">
			               	<ul class="meta-post">
								<li style="width:50%"> &nbsp;&nbsp;총 횟수(정기형) </li>
								<li style="width:40%"><input type="text" id="det_mo_total" name="mo_total"></li>					
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- End Modal body -->
			<br/>
			<br/>
			
			<!-- Modal Footer -->
			<div class="modal-footer" style="border-top:none">    
				 <div class="col-sm-12" style="border:0px; margin-top: 5%" id="btns">
					<button type="button" class="btn btn-modify" id="cancleService">서비스 취소</button>
				 	<button type="button" class="btn btn-modify" data-dismiss="modal">닫기</button>               
				 </div>     
            </div>
            <!-- End Modal Footer -->
			
		</div>	
	</div>	
</div>	