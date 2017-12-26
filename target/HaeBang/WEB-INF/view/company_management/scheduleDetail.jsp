<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<div class="modal fade" id="scheduleDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-80p">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                       <span aria-hidden="true">×</span>
                       <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    	상세 일정 보기 
                </h4>
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">

       		 <div class="form-group form-group-sm">
        
            <!-- left column -->
            <div class="col-sm-6">
            
            <p class="lead">고객 정보</p>
            	<div id="sentence" name="sentence" class="form-group" align="right"></div>            	
                <div class="form-group" style="padding-bottom:20px;">
                    <label for="new_name" class="col-sm-2 control-label bg-danger">이름</label>
                    <div class="col-sm-10">
                        <span class="form-control" id="m_name" name="m_name" ></span>

                        <input type="hidden" id="m_type" name="m_type">					<!-- detail 컨트롤러 넘기기 위해 넣음  by 주호-->
                        <input type="hidden" id="mo_no" name="mo_no">					<!-- detail 컨트롤러 넘기기 위해 넣음  by 주호-->


                    </div>
                </div>
      
                <div class="form-group" style="padding-bottom:40px;">
                    <label for="new_name" class="col-sm-2 control-label bg-danger">주소</label>
                    <div class="col-sm-10">
                        <span class="form-control" id="m_address" name="m_address" style="display: block; height:50px;"></span>
                    </div>
                </div>
             
                
                 <div class="form-group" style="padding-bottom:20px;">
                    <label for="new_name" class="col-sm-2 control-label bg-danger">전화</label>
                    <div class="col-sm-10">
                        <span id="m_phone1"  class="form-control" name="m_phone1" style="width:25%; float:left"></span>
						<span style="float:left;">&nbsp;&nbsp;-&nbsp;&nbsp;</span> 
						<span  class="form-control" id="m_phone2" name="m_phone2" style="width:25%; float:left"></span>
						<span style="float:left;">&nbsp;&nbsp;-&nbsp;&nbsp;</span> 
						<span  class="form-control" id="m_phone3" name="m_phone3" style="width:25%; float:left"></span>
                    </div>
                </div>
           
          	<br/>
          	<br/>
			<br/>

           <p class="lead">담당 직원 정보</p>
           
       
                <div class="form-group" style="padding-bottom:20px;">
                    <label for="new_name" class="col-sm-2 control-label bg-danger">이름</label>
                    <div class="col-sm-10">
                        <span class="form-control" id="e_name" name="e_name" ></span>
                    </div>
                </div>
                

                <div class="form-group" style="padding-bottom:20px;">
                    <label for="new_name" class="col-sm-2 control-label bg-danger" >전화</label>
                     <div class="col-sm-10">
                        <span id="e_phone1"  class="form-control" name="e_phone1" style="width:25%; float:left"></span>
						<span style="float:left;">&nbsp;&nbsp;-&nbsp;&nbsp;</span> 
						<span  class="form-control" id="e_phone2" name="e_phone2" style="width:25%; float:left"></span>
						<span style="float:left;">&nbsp;&nbsp;-&nbsp;&nbsp;</span> 
						<span  class="form-control" id="e_phone3" name="e_phone3" style="width:25%; float:left"></span>
                    </div>
                </div>
					
			  
                </div>    
            
                
			 




            <!-- right column -->
             <p class="lead">서비스 정보</p>   
            <div class="col-sm-6">
            	<div class="form-group" style="padding-bottom:20px;">
                    <label for="new_company_identity" class="col-sm-2 control-label bg-danger">번호</label>
                    <div class="col-sm-10">
          	           <span class="form-control" id="mo_orderNo" name="mo_orderNo"></span>                        
                    </div>
                </div>
            
            
                <div class="form-group" style="padding-bottom:20px;">
                    <label for="new_company_identity" class="col-sm-2 control-label bg-danger">상품</label>
                    <div class="col-sm-10">
          	           <span class="form-control" id="mo_service" name="mo_service"></span>                        
                    </div>
                </div>
                
                        
                
                 <div class="form-group" style="padding-bottom:20px;">
                    <label for="new_company_identity" class="col-sm-2 control-label bg-danger">종류</label>
                    <div class="col-sm-10">
                        <span class="form-control" id="period-type" name="period-type"></span>         
                    </div>
                </div> 
                
                                     
                 
                
                <!-- 1회성 -->
                <div id="type3">
                
                    <div class="form-group" style="padding-bottom:20px;">
                    <label for="new_company_identity" class="col-sm-2 control-label bg-danger">날짜</label>
                    <div class="col-sm-10">
                        <span class="form-control" id="date3" name="date3" ></span>
                    </div>
                </div>     
                
               

  			 <div class="form-group" style="padding-bottom:20px;">
                    <label for="new_bol_require" class="col-sm-2 control-label bg-danger">시작</label>
                    <div class="col-sm-10">
                    	<span id="startTime3" class="form-control" name="startTime3" style="width:30%;"></span>
												                         
                    </div>
                   </div>
                   
                      
                   <div class="form-group" style="padding-bottom:20px;">
                    <label for="new_pod_require" class="col-sm-2 control-label bg-danger">종료</label>
                    <div class="col-sm-10">
                       <span id="endTime3" class="form-control" name="endTime3" style="width:30%;"></span>
							
                    </div>
                </div>
                
                    

			</div>
			
		
			
			<!-- 정기서비스 -->
			<div id="type4">			
                            
            
             <div class="form-group" style="padding-bottom:20px;">
                    <label for="new_bol_require" class="col-sm-2 control-label bg-danger">단위</label>
                    <div class="col-sm-4">
                    	<span class="form-control" id="unit" name="unit"></span>                      
                    </div>
                    
                    <label for="new_pod_require" class="col-sm-2 control-label bg-danger">반복</label>
                    <div class="col-sm-4">
                        <span class="form-control" id="mo_freqCycle" name="mo_freqCycle"></span>                        
                    </div>
                </div>
                
        
              
                
                  <div class="form-group" style="padding-bottom:20px;">
                    <label for="new_bol_require" class="col-sm-2 control-label bg-danger">번째</label>
                    <div class="col-sm-4">
                        <span class="form-control" id="mo_cnt" name="mo_cnt"></span>
                    </div>
                    
                    <label for="new_pod_require" class="col-sm-2 control-label bg-danger">총계</label>
                    <div class="col-sm-4">
                        <span class="form-control" id="mo_total" name="mo_total"></span>                        
                    </div>
                </div>
                
         
                
                
            <div class="form-group" style="padding-bottom:20px;">
                    <label for="new_company_identity" class="col-sm-2 control-label bg-danger">시작</label>
                    <div class="col-sm-10">
                        <span class="form-control" id="startDate4" name="date4" ></span>
                    </div>
                </div>    
                

                 <div class="form-group" >
                    <label for="new_bol_require" class="col-sm-2 control-label bg-danger">시간</label>
                    <div class="col-sm-10" style="padding-bottom:5px;">
                    	<span id="startTime4" class="form-control" name="startTime4" style="width:30%;"></span>
							                         
                    </div>
         
                   
                    <div class="form-group" >
                    <label for="new_company_identity" class="col-sm-2 control-label bg-danger">종료</label>
                    <div class="col-sm-10" style="padding-bottom:5px;">
                        <span class="form-control" id="endDate4" name="date4" ></span>
                    </div>
                </div>    
                   
           </div>
                   
                    <div class="form-group" style="padding-bottom:20px;">
                    <label for="new_bol_require" class="col-sm-2 control-label bg-danger">시간</label>
                    <div class="col-sm-10">
                    	<span id="endTime4" class="form-control" name="endTime4" style="width:30%;"></span>
							                         
                    </div>
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
                    	<span class="form-control" id="eo_memo" name="eo_memo" style="display: block; height:100px;"></span>
                    </div>
                    </div>
                   
                   <div align="right"> 
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>               

                <input type="button" class="btn btn-primary" id="modify_btn" value="수정하기"/>



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









