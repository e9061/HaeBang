<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<script>

$(document).ready(function(){
	
//	$('input').attr("readonly",true);		// 인풋 태그 수정 불가
//	$('input').attr("readonly",false);		
	
	$('#btn-modify-detail').click(function(){
		if(confirm("수정 하시겠습니까?")){		// 처음 수정 버튼 클릭
			if($('#btn-modify-detail').text() == "수정"){
					$('#btn-modify-detail').text("수정 완료");
					$('#btn-close-detail').text("수정 취소");
//					$('input').attr("readonly", false);
					
			} else {	// 수정 완료 ( 수정버튼 두번째 ) 눌렀을 경우
//				$('input').attr("readonly",true);
				$('#btn-modify-detail').text("수정");
				$('#btn-close-detail').text("닫기");
			}
		}else{
//			$('input').attr("readonly",true);
		}
	});
	
	$('#btn-delete-detail').click(function(){
	//	alert($("#mo_cnt").val());
		if(confirm("해당 스케쥴을 삭제 하시겠습니까?")){
			if($('#m_type')=='n'){
				alert("해당 스케쥴이 삭제 되었습니다.");
				location.href="/ceo/scheduleDelete?mo_orderNo="+$("#mo_orderNo").val();
				$('#btn-close-detail').click();
			}else{
				alert("해방을 통한 스케쥴은 수정만 가능합니다.");
			}
		}
			
	});
	
	/* 
	$("input[type='radio'][name='period-type']").change(function(){
	   
	    var selected = $("s_style").val();

	    if(selected == "b") {
	       $('#type1').show();
	       $('#type2').hide();
	       
	    }else if(selected=="j"){       
	       $('#type2').show();
	       $('#type1').hide();
	    }
	    
	});
	 */
	
})
</script>



<div id="scheduleDetail">
	<div class="modal-header">
	 <!-- Modal Header -->
		<h2 class="modal-title">
		                Schedule Detail
		</h2>
	</div>
	
	<!-- Modal Body -->
	<div class="modal-body">
	
		<!-- left column -->
        <div class="col-sm-6">
			
			<p class="lead">고객 정보 </p>
			
			<div>
				<label for="new_name">이름</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" id="m_name" style="width:60%" />
			</div>
			<br/>
			<div>
				<label for="new_subname">주소</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" id="m_address" style="width:60%"/>               
			</div>
			<br/>
			<div>
				<label for="new_name">전화번호</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" id="m_phone"  style="width:60%"/>
			</div>
			<br/>
			<br/>
		
			<!-- employee  -->
			<div class="form-group">
			
				<p class="lead">담당 직원 정보 </p>
				
				<div>
					<label for="new_name">이름</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" id="e_name"  style="width:60%"/>
				</div>
				<br/>
				<div>
					<label for="new_name">전화번호</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				    <input type="text" id="e_phone"  style="width:60%"/>
				</div>
			</div>
				
				
		</div>
		
		
		
				
		
		
		<!-- right column -->
		<div class="col-sm-6 service">
			
			<p class="lead">서비스 정보 </p>
			
			<div>
				<label for="new_company_identity">서비스명</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" style="width:70%" id="s_name"/>                        
			</div>
			<br/>
			
			<div>
				<label for="new_company_identity">서비스번호</label>&nbsp;&nbsp;&nbsp;
				<input type="text" style="width:67%" id="mo_orderNo"/>                        
			</div>
			<br/>
			
			<div>
				<label for="new_company_identity">종류</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" id="b"  />보장형 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" id="j" />정기형               
			</div>
			<br/>
			<div>
					<label for="new_company_identity">단위</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select id="mo_freqType" style="width:25%">
							<option value="w">주단위 반복</option>
							<option value="m">월단위 반복</option>                          
							<option value="null">    -   </option>                          
						</select>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
					<label for="new_pod_require" style="width:10%">반복</label>&nbsp;&nbsp;
						<input type="text" id="mo_freqCycle" style="width:30%"/>
			</div>
			<br/>
			<div>
				<label for="new_pod_require">횟수</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" id="mo_cnt" style="width:20%"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label for="new_company_identity">총 신청 횟수</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" id="mo_total" style="width:20%"/>
			</div>
			<br/>
			<div>
				<div>
					<label for="new_pod_require">서비스 시간</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" id="mo_startTime"  style="width:60%"/>
				</div>
				<br/>
				<div>
					<label for="new_pod_require">종료 시간</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" id="mo_endTime"style="width:60%"/>
				</div>
			</div>
		</div>
		
		
    <div class="col-sm-12">
        	<label for="new_comments">비고</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            	<div>
					<textarea id="comments" rows="3" placeholder="비고사항" style="width:80%; margin-left: 7%"></textarea>
            	</div>
            </div>
    </div>
		
		
	
    				<button id="btn-modify-detail">수정</button>
    				<button id="btn-delete-detail">삭제</button>
    				<button id="btn-close-detail">닫기</button>
</div>

	