<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
function pagination(nowpage, searchSchedule, word, startDate, endDate){
	var nowpage = nowpage;
	var searchSchedule = searchSchedule;
	var word = word;
	var startDate = startDate;
	var endDate = endDate;
	$.ajax({         
        url: "${ pageContext.request.contextPath}/admin/findSchedule?nowpage="+nowpage+"&searchSchedule="+searchSchedule+"&word="+word+"&startDate="+startDate+"&endDate="+endDate,
        type: "GET",
        success: function(data) {               
        	$('#content').html(data);
        	$('td').parent().css({'font-size':'13px'});
        	 $('th').css({'background-color':'#5D9CEC', 'color':'white'});  
           
        },         
     })
	
}

 $(document).ready(function(){
	 
	 $('#scheduleTable tr').click(function() {
		    var no = $(this).find("div.mo_no").text();		   
		    if(no) {		        
		         $.ajax({         
		            url: "${ pageContext.request.contextPath}/admin/findScheduleDetail",
		            type: "POST",
		            data : {
	    	    		mo_no : no
	    	    	},
	    	    	success : function(data){
	    	    		var data = JSON.parse(data);  
	    	    		
           	    		// detail 컨트롤러 넘기기 위해 넣음  by 주호
       	    			$('#m_type').val(data.m_type);		
       	    			$('#mo_no').val(data.mo_no);	
	    	    		
	    	    		
	    	    		if(data.m_type=="N"){ //해방통하지 않고 신청한 경우
	    	    			
	    	    			$('#m_name').text(data.m_name);
	    	    			$('#m_address').text(data.m_address);
	    	    			$('#m_phone1').text(data.m_phone1);
	    	    			$('#m_phone2').text(data.m_phone2);
	    	    			$('#m_phone3').text(data.m_phone3);
	    	    			$('#e_name').text(data.e_name);
	    	    			$('#e_phone1').text(data.e_phone1);
	    	    			$('#e_phone2').text(data.e_phone2);
	    	    			$('#e_phone3').text(data.e_phone3);
	    	    			$('#mo_service').text(data.mo_svcName);
	    	    			$('#eo_memo').text(data.eo_memo);
	    	    			$('#mo_orderNo').text(data.mo_orderNo);
	    	    			$('#sentence').html('<span style="color:blue;"><b>직접</b> 작성한 일정입니다.</span>');
	    	    			$('#memo').text('직원메모');
	    	    			
	    	    			if(data.mo_total==1){//1회성
	    	    				
	    	    				$('#type3').show();
	    	    		    	$('#type4').hide();

	    	    		    	$('#period-type').text(data.periodType);
	    	    		    	$('#unit').text("-");
	    	    		    	$('#mo_freqCycle').text("-");
	    	    		    	$('#mo_total').text("보장형");
	    	    		    	$('#mo_cnt').text("-");
	    	    		    	$('#date3').text(data.startDate);
	    	    		    	$('#startTime3').text(data.startTime);
	    	    		    	$('#endTime3').text(data.endTime);
	    	    				
	    	    				
	    	    			}else{//정기성
	    	    				
	    	    				$('#type4').show();
	    	    		    	$('#type3').hide();
	            	    		
	    	    		    	$('#period-type').text(data.periodType);
	    	    		    	$('#unit').text(data.mo_freqType);
	    	    		    	$('#mo_freqCycle').text(data.mo_freqCycle);
	    	    		    	$('#mo_total').text(data.mo_total);
	    	    		    	$('#mo_cnt').text(data.mo_cnt);
	    	    		    	$('#startDate4').text(data.startDate);
	    	    		    	$('#endDate4').text(data.endDate);
	    	    		    	$('#startTime4').text(data.startTime);
	    	    		    	$('#endTime4').text(data.endTime);
	 	 
	    	    				
	    	    			}
	    	    			
	    	    			
	    	    		}else { //해방 통해서 신청한 경우
	    	    			
	    	    			$('#m_name').text(data.m_name);
	    	    			$('#m_address').text(data.m_address);
	    	    			$('#m_phone1').text(data.m_phone1);
	    	    			$('#m_phone2').text(data.m_phone2);
	    	    			$('#m_phone3').text(data.m_phone3);
	    	    			$('#e_name').text(data.e_name);
	    	    			$('#e_phone1').text(data.e_phone1);
	    	    			$('#e_phone2').text(data.e_phone2);
	    	    			$('#e_phone3').text(data.e_phone3);
	    	    			$('#mo_service').text(data.s_name);
	    	    			$('#eo_memo').text(data.mo_memo);
	    	    			$('#mo_orderNo').text(data.mo_orderNo);
	    	    			$('#sentence').html('<span style="color:red;"><b>해방</b>을 통해서 신청한 고객입니다.</span>');
	    	    			$('#memo').text('고객메모');
	    	    		
	        	    		if(data.s_style=="j"){//정기형
	        	    			
	        	    			$('#type4').show();
	    	    		    	$('#type3').hide();
	        	    			
	    	    		    	$('#period-type').text(data.periodType);
	    	    		    	$('#unit').text(data.mo_freqType);
	    	    		    	$('#mo_freqCycle').text(data.mo_freqCycle);
	    	    		    	$('#mo_total').text(data.mo_total);
	    	    		    	$('#mo_cnt').text(data.mo_cnt);
	    	    		    	$('#startDate4').text(data.startDate);
	    	    		    	$('#endDate4').text(data.endDate);
	    	    		    	$('#startTime4').text(data.startTime);
	    	    		    	$('#endTime4').text(data.endTime);

	        	    			         		
	    	    			}else{//보장형
	    	    				
	    	    				$('#type3').show();
	    	    		    	$('#type4').hide();
	    	    				
	    	    		    	$('#period-type').text(data.periodType);
	    	    		    	$('#unit').text("-");
	    	    		    	$('#mo_freqCycle').text("-");
	    	    		    	$('#mo_total').text("보장형");
	    	    		    	$('#mo_cnt').text("-");
	    	    		    	$('#date3').text(data.startDate);
	    	    		    	$('#startTime3').text(data.startTime);
	    	    		    	$('#endTime3  ').text(data.endTime);
	    	    		    	
	    	    			}
	        	    		
	    	    		}
	    	    
	    	    		$("#scheduleDetailModal").modal('show');
	    	    		
	    	    	}         
		         });        
		    }
		});
	
	 
		$('#modify_btn').click(function(){
			var mo_no = $('#mo_no').val();
			var m_type = $('#m_type').val();
			
			$.ajax({    	
		    	
		    	type : "GET",
		    	url : "${ pageContext.request.contextPath }/ceo/sceduleModify",
		     	data : {
		     		mo_no : mo_no,
		     		m_type : m_type
		    	},
		    	dataType : "json",
		    	contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		    	error : function(request, status, error){
		    		alert("code : "+request.status + "\r\nmessage : " + request.reponseText);	    		
		    	},
		    	success : function(data){
					console.log(data);
					console.log(data.s_style);
					console.log(data.mo_freqCycle);
					console.log(data.mo_cnt);
					
					/*  해방, 비해방 공통사항들 	*/
					$('#mod_m_type').val(data.m_type);
					
					$('#mod_m_name').val(data.m_name);
					$('#mod_m_no').val(data.m_no);
					$('#mod_m_address').val(data.m_address);
					$('#mod_m_lon').val(data.m_lon);
					$('#mod_m_lat').val(data.m_lat);
					$('#mod_m_gu').val(data.m_gu);
					$('#mod_m_phone').val(data.m_phone);
					
					$('#mod_mo_no').val(data.mo_no);

					$('#mod_e_name').val(data.e_name);
					$('#mod_e_phone').val(data.e_phone);
					$('#mod_e_no').val(data.e_no);
					$('#mod_mo_orderNo').val(data.mo_orderNo);
					
					
					$('#mod_date').val(data.mod_date);
					$('#mod_startTime').val(data.mod_startTime);
					$('#mod_endTime').val(data.mod_endTime);
					
					
					
					/* 차이점들 */
                 if(data.m_type=="N"){ //해방통하지 않고 신청한 경우( 직접 등록한 경우 )
                      $('#mod_eo_memo').val(data.eo_memo);
                      $('#mod_mo_svcName').val(data.mo_svcName);

                      
                      
					$('#searchAddress').show();
		//			$('input[class*=each]').attr("readonly",false);	
					$('input[class*=noHaebang]').show();
                    $('input[class*=haebang]').hide();
						
                    
                    // 정기형   서비스
                    if(data.mo_freqType=="W" || data.mo_freqType=="w" || data.mo_freqType=="M" || data.mo_freqType=="m"){
                    
                    	 $('#mod_type4').show();
                    	 
                        $('#mod_periodType').val("정기형");
                        if(data.mo_freqType=="W" || data.mo_freqType=="w"){
	                        $('#mod_mo_freqType').val("주 단위");
	                        $('#mod_mo_freqCycle').val(data.mo_freqCycle+" 주 1 회 시행");
                        }else{
	                        $('#mod_mo_freqType').val("월 단위");
	                        $('#mod_mo_freqCycle').val(data.mo_freqCycle+" 개월 1회");
                        }
                        
                        $('#mod_mo_total').val(data.mo_total);
                        $('#mod_mo_cnt').val(data.mo_cnt);
     
                    // 1회용 서비스    
                    }else{
                       
                    	$('#mod_type4').hide();
                    	$('#mod_periodType').val("1회형");
                    }
                    
                    
                 }else { //해방 통해서 신청한 경우
                    
                	 $('#mod_mo_memo').val(data.mo_memo);
 					 $('#mod_s_name').val(data.s_name);
 					 $('#mod_s_no').val(data.s_no);
 					 $('#mod_s_style').val(data.s_style);
 					
 			//		$('input[class*=each]').attr("readonly",true);	// 수정 불가
					$('#searchAddress').hide();						// 주소지 검색 버튼 숨기기
					$('#detailAddress').hide();
					
                    $('#mod_mo_cnt').val(data.mo_cnt);
					
				   	$('input[class*=noHaebang]').hide();
                    $('input[class*=haebang]').show();
 					 
 					
                     if(data.s_style=="j"){//정기형
                        
                        
                    	
			//		    $('#mod_type4').hide();
					    $('#mod_type4').show();
             //           $('#freq').show();
                    	 
                        $('#mod_mo_total').val(data.mo_total);
                            
                        $('#mod_periodType').val("정기형");
                        if(data.mo_freqType=="W" || data.mo_freqType=="w"){
	                        $('#mod_mo_freqType').val("주 단위");
	                        $('#mod_mo_freqCycle').val(data.mo_freqCycle+" 주 1 회 시행");
                        }else{
	                        $('#mod_mo_freqType').val("월 단위");
	                        $('#mod_mo_freqCycle').val(data.mo_freqCycle+" 개월 1회");
                        } 
                        
          
                        
                    }else{//보장형
                    	
                    	
                        $('#mod_type4').hide();
                 //       $('#mod_type4').show();
                 //       $('#freq').hide();
                        
                        $('#mod_period-type').val("보장형");
                    }
                     
                 }
					
		    		$("#scheduleDetailModal").modal('hide');
		    		$("#scheduleModifyModal").modal('show');
		    		
		    		
					
		    	}
		    	
		    });
			
			
		});
	 
		

		// 담당 직원 변경
		$('#mod_e_name').change(function(){
			var index = $("#mod_e_name option").index($("#mod_e_name option:selected"));
			$(this).append("selected",true);
			$("#mod_e_phone option:eq("+index+")").attr("selected", "selected");
			$("#mod_e_phone").attr("disabled", "disabled");

		});
		
		// 주소지 변경 버튼
		$('#searchAddress').click(function(){
			
			var popUrl = "${pageContext.request.contextPath}/ceo/schedule/PopUpScheduleAddr";
			var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
			window.open(popUrl,"addrPopUp",popOption);

		});
		
		// 날짜 변경
		$('#changeDate').click(function(){
			
			var popUrl = "${pageContext.request.contextPath}/ceo/schedule/PopUpScheduleDate";
			var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
			window.open(popUrl,"addrPopUp",popOption);

		});
		// 직원 변경
		$('#changeEmp').click(function(){
			
			var popUrl = "${pageContext.request.contextPath}/ceo/schedule/PopUpScheduleEmp";
			var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
			window.open(popUrl,"empPopUp",popOption);

		});
		
		
	 
	 
	 
}); 


</script>
<style type="text/css">

 a:link { color: gray; text-decoration: none;}
 a:visited { color: gray; text-decoration: none;}
 a:hover { color: gray; text-decoration: none;}
</style>


</head>
<body>
<jsp:include page="./scheduleModify.jsp"></jsp:include>	
<jsp:include page="./scheduleDetail.jsp" />
 <table id="scheduleTable" class="table table-striped table-bordered table-hover" style="width: 1120px;">
      <tr>
         <th width='5%'>번호</th>
         <th width='10%'>주문번호</th>
         <th width='auto'>업체명 </th>
        <th width='15%'>시작시간</th>
         <th width='15%'>종료시간</th>
         <th width='7%'>고객명</th>
         <th width='10%'>고객연락처</th>
         <th width='7%'>순번</th>
         <th width='7%'>총 횟수</th>
         <th width='7%'>해방맨</th>

      </tr>


      <c:forEach items="${getScheduleList}" var="list" varStatus="status">
      <%-- 	<input type="hidden" name="mo_no" id="mo_no" value="${list.mo_no}" /> --%>
         <tr>
         	 <td width='auto'>
         	 	<c:if test="${ status.count eq 10 }">
	        	 	${ nowpage + 1 }${ status.count - 10 }
          	 	</c:if>
         	 	<c:if test="${ status.count ne 10 }">
        		 	${ nowpage }${ status.count }
          	 	</c:if>
        	 	
        	 	</td> 
        	 <td width='auto'>
        	 	<div style="display: none;" class="mo_no">${list.mo_no}</div>
        	 	${ list.mo_orderNo }</td>
        	 <td width='auto'>
    	    	${ list.c_name }</td>
        	 <td width='auto'>
        		${ list.mo_startTime }</td>
        	 <td width='auto'>
          	 	${ list.mo_endTime }</td>
    	     <td width='auto'>
    	     	${ list.m_name }</td>
     	     <td width='auto'>
     	     	${ list.m_phone }</td>
         	<td width='auto'>
          	 	${ list.mo_cnt }</td>
          	 <td width='auto'>
          	 	${ list.mo_total }</td>
          	<td width='auto'>
          	 	${ list.e_name }</td>  
       </tr>
      </c:forEach>
       <c:if test="${ empty getScheduleList || getScheduleList eq null || getScheduleList eq ''}">
			<tr>
				<td colspan="30" align="center">해당하는 스케쥴이 없습니다.</td>
			</tr>
		</c:if>
      
      
      
         
   </table>


<div align="center">
			<ul class="pagination">
				<c:choose>
					<c:when test="${nowpage <= 0}">
						<li class="disabled"><a href="#">처음</a></li>
					</c:when>
	
					<c:otherwise>
						<li><a href="#" onclick="pagination(0, '${ searchSchedule }', '${ word }', '${ startDate }', '${ endDate }')">처음</a></li>
					</c:otherwise>
				</c:choose>
			
				
				<!--현재 페이지가 0보다 작아질 경우 이전 버튼을 disabled하는 조건문 -->
				<c:choose>
					<c:when test="${nowpage <= 0}">
						<li class="disabled"><a href="#">이전</a></li>
					</c:when>
	
					<c:otherwise>
						<li><a href="#" onclick="pagination(${ nowpage }-1, '${ searchSchedule }', '${ word }', '${ startDate }', '${ endDate }')">이전</a></li>
					</c:otherwise>
				</c:choose>
	
				<!--해당하는 페이지로 갈 수 있는 버튼 -->
				<c:forEach var="i" begin="0" end="${totalpage}">
					<c:if test="${ i eq nowpage }">
						<li class="disabled"><a href="#">${i+1}</a></li>
					</c:if>
					<c:if test="${ i ne nowpage }">
						<li><a href="#" onclick="pagination(${i}, '${ searchSchedule }', '${ word }', '${ startDate }', '${ endDate }')">${i+1}</a></li>
					</c:if>
				
				</c:forEach>
	
				<!--현재 페이지가 totalpage보다 커질 경우 다음 버튼을 disabled하는 조건문 -->
				<c:choose>
					<c:when test="${nowpage >= totalpage}">
						<li class="disabled"><a href="#">다음</a></li>
					</c:when>
	
					<c:otherwise>
						<li><a
							href="#" onclick="pagination(${ nowpage }+1, '${ searchSchedule }', '${ word }', '${ startDate }', '${ endDate }')">다음</a></li>
					</c:otherwise>
				</c:choose>
				
				
				<c:choose>
					<c:when test="${nowpage eq totalpage}">
						<li class="disabled"><a href="#">마지막</a></li>
					</c:when>
					
					<c:otherwise>
						<li><a href="#" onclick="pagination(${ totalpage }, '${ searchSchedule }', '${ word }', '${ startDate }', '${ endDate }')">마지막</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		



</body>
</html>


