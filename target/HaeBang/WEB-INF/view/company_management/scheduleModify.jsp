<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script>

	function validate(){
		if($('#mod_m_name').val().trim()==""){
			alert("소비자 이름을 입력해 주세요.");
			$('#mod_m_name').val("").focus();
			return false;
		}else{
			if(confirm("스케쥴 수정을 완료 하시겠습니까?:")){
				return true;
			} else {
				return false;
			}
		}
	};

	
</script>


<form action="${ pageContext.request.contextPath }/ceo/sceduleModify" method="post" onsubmit="validate()">
<div class="modal fade" id="scheduleModifyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-80p">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                       <span aria-hidden="true">×</span>
                       <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    	일정 수정 
                </h4>
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">

       		 <div class="form-group form-group-sm">
        
            <!-- left column -->
            <div class="col-sm-6">
            
            <p class="lead">고객 정보</p>
            	<div id="sentence" class="form-group" align="right"></div>            	
                <div class="form-group" style="padding-bottom:20px;">
                    <label for="new_name" class="col-sm-2 control-label bg-danger">이름</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control each" id="mod_m_name" name="m_name"/>
                        <input type="hidden" class="form-control each" id="mod_m_no" name="m_no"/>
                        <input type="hidden" class="form-control each" id="mod_mo_no" name="mo_no"/>
                        <input type="hidden" class="form-control each" id="mod_m_type" name="m_type"/>
                    </div>
                </div>
      
                <div class="form-group" style="padding-bottom:20px;">
                    <label for="new_name" class="col-sm-2 control-label bg-danger">주소</label>
                  <!--       <input class="form-control each" id="mod_m_address" name="m_address"  style="height:50px;"></input> -->
                        
						<div class="col-sm-10" style="padding-bottom:2%;">
							<input type="text" id="mod_m_address" name="m_address" class="form-control each" />		
						</div>
						<div class="col-sm-12" style="padding-left:20%;">
							<input type="text" placeholder="상세주소입력" id="detailAddress" name="detailAddress"class="form-control each noHaebang"/>
	                    <div  style="padding-top :1%; padding-bottom: 2%">
	                        <button type="button" class="btn btn-theme noHaebang" id="searchAddress">주소지 변경</button>
	                    </div>    
						</div>
						
                        <input type="hidden" id="mod_m_lon" name="m_lon" />
                        <input type="hidden" id="mod_m_lat" name="m_lat" />
                        <input type="hidden" id="mod_m_gu" name="m_gu" />
                </div>
             
                
                 <div class="form-group" style="padding-bottom:20px;">
                    <label for="new_name" class="col-sm-2 control-label bg-danger">전화</label>
                    <div class="col-sm-10">
                        <input id="mod_m_phone"  class="form-control each" name="m_phone"  style="float:left"></input>
                    </div>
                </div>
           
          	<br/>
          	<br/>
			<br/>

           <p class="lead" style="padding-top :20%;">담당 직원 정보</p>
           
       
                <div class="form-group" style="padding-bottom:2px;">
                    <label for="new_name" class="col-sm-2 control-label bg-danger">이름</label>
                    <div class="col-sm-6">
                        <input class="form-control " id="mod_e_name" name="e_name" style="width:100%;">
                        <input type="hidden" id="mod_e_no" name="e_no"></input>
                    </div>
                    <div>
                        <button type="button" class="btn btn-theme" id="changeEmp">직원 변경</button>
                    </div>    
                      <!--   <button type="button" class="btn btn-modify" id="searchEmp">직원 리스트</button> -->
                </div>
                

                <div class="form-group" style="padding-bottom:20px;">
                    <label for="new_name" class="col-sm-2 control-label bg-danger" >전화</label>
                     <div class="col-sm-10">
                        <input  class="form-control " id="mod_e_phone" name="e_phone" style="width:90%;">
                      <!--   <input id="mod_e_phone"  class="form-control " name="e_phone" style="width:50%; float:left"></input> -->
                    </div>
                </div>
					
			  
          </div>    
            
                
			 




            <!-- right column -->
             <p class="lead">서비스 정보</p>   
            <div class="col-sm-6">
            	<div class="form-group" style="padding-bottom:20px;">
                    <label for="new_company_identity" class="col-sm-2 control-label bg-danger">번호</label>
                    <div class="col-sm-10">
          	           <input class="form-control" id="mod_mo_orderNo" name="mo_orderNo" readonly="readonly"></input>                        
                    </div>
                </div>
            
            
                <div class="form-group" style="padding-bottom:20px;">
                    <label for="new_company_identity" class="col-sm-2 control-label bg-danger">상품</label>
                    <div class="col-sm-10">
          	           <input class="form-control each haebang" id="mod_s_name" name="s_name"></input>                        
          	           <input type="hidden" id="mod_s_no" name="s_no"></input>                        
          	           <input type="hidden" id="mod_s_style" name="s_style"></input>                        
          	           <input class="form-control each noHaebang" id="mod_mo_svcName" name="mo_svcName"></input>                        
                    </div>
                </div>
                
                        
                
                 <div class="form-group" style="padding-bottom:20px;">
                    <label for="new_company_identity" class="col-sm-2 control-label bg-danger">종류</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="mod_periodType" name="periodType" readonly="readonly"></input>         
                    </div>
                </div> 
                
                                     
                 
				<!-- 정기서비스 해당 정보들 -->
            	 <div id="mod_type4">			
            		<div id="freq">
						<div class="form-group" style="padding-bottom:20px;">
						    <label for="new_bol_require" class="col-sm-2 control-label bg-danger">단위</label>
						    <div class="col-sm-4">
						    	<input class="form-control" id="mod_mo_freqType" name="mo_freqType" readonly="readonly"></input>                      
						    </div>
						    
						    <label for="new_pod_require" class="col-sm-2 control-label bg-danger">반복</label>
						    <div class="col-sm-4">
						        <input class="form-control" id="mod_mo_freqCycle" name="mo_freqCycle" readonly="readonly"></input>                        
						    </div>
						</div>
			                
						<div class="form-group" style="padding-bottom:20px;">
						    <label for="new_bol_require" class="col-sm-2 control-label bg-danger">번째</label>
						    <div class="col-sm-4">
						        <input class="form-control each" id="mod_mo_cnt" name="mo_cnt"></input>
						    </div>
						    
						    <label for="new_pod_require" class="col-sm-2 control-label bg-danger">총계</label>
						    <div class="col-sm-4">
						        <input class="form-control " id="mod_mo_total" name="mo_total" readonly="readonly"></input>                        
						    </div>
						</div>
            		</div>
            	</div>
                
                
					<div class="form-group">
					    <label for="new_company_identity" class="col-sm-2 control-label bg-danger">날짜</label>
					    <div class="col-sm-7">
					        <input class="form-control " id="mod_date" name="mod_date" ></input>
					    </div>
					        <button type="button" class="btn btn-theme" id="changeDate"> 날짜 변경 </button>
					</div>     

               

					<div class="form-group" style="padding-bottom:20px;">
						<label for="new_bol_require" class="col-sm-2 control-label bg-danger">시작</label>
						<div class="col-sm-10">
							<input id="mod_startTime" class="form-control " name="mod_startTime" style="width:30%;"></input>
						</div>
					</div>
                   
                      
					<div class="form-group" style="padding-bottom:20px;">
						<label for="new_pod_require" class="col-sm-2 control-label bg-danger">종료</label>
						<div class="col-sm-10">
						   <input id="mod_endTime" class="form-control " name="mod_endTime" style="width:30%;"></input>
						</div>
	                </div>
	                
			
		
			
            	
            	
            	
            </div>


<br/>

        <!-- End main input boxes, starting a new "row" -->

        <div class="form-group form-group-sm">
            <div class="col-sm-12">
                <div class="form-group" style="padding-bottom:100px;">
                    <label id="memo" for="new_comments" class="col-sm-1 control-label"></label>
                    <div class="col-sm-11">
                    	<input class="form-control noHaebang" id="mod_eo_memo" name="" style="display: block; height:100px;"></input>
                    	<input class="form-control haebang" id="mod_mo_memo" name="" style="display: block; height:100px;"></input>
                    </div>
                    </div>
                   
                   <div align="right"> 
                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>               
                <button type="submit" class="btn btn-modify" id="modifyList">수정 완료</button>
                    </div>
                </div>
                
                <div class="modal-footer" style="border:0px;">                
               
            </div><!-- End Modal Footer -->
                
                
                
            </div>
            
             <!-- Modal Footer -->
            
            
        </div>



     
            


</div> <!-- End modal body div -->
      </div> <!-- End modal content div -->
  </div> <!-- End modal dialog div -->
</div> <!-- End modal div -->
</form>