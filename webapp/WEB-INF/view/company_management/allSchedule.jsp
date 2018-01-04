<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>해방 사장님 사이트</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />


<link href="${ pageContext.request.contextPath }/resources/fullcalendar-3.7.0/fullcalendar.css" rel="stylesheet"/>
<link href="${ pageContext.request.contextPath }/resources/fullcalendar-3.7.0/fullcalendar.print.css" rel="stylesheet" media="print"/>

<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/fullcalendar-3.7.0/lib/moment.min.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/fullcalendar-3.7.0/lib/jquery.min.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/fullcalendar-3.7.0/fullcalendar.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/fullcalendar-3.7.0/locale-all.js"></script>

<script type="text/javascript">

$(document).ready(function() {
     $.ajax({       
       
       type : "POST",
       url : "${ pageContext.request.contextPath }/ceo/scheduleList",
       dataType : "json",
       contentType : "application/x-www-form-urlencoded; charset=UTF-8",
       error : function(request, status, error){
          alert("code : "+request.status + "\r\nmessage : " + request.reponseText);
             
       },
       success : function(data){
    	   
          setCalendar(data);
          
       }
       
    }); 
     
     
	  $('#mySchedules').click(function(){
		  
		  window.location.href="${ pageContext.request.contextPath}/ceo/schedule"
		  
		  
	  });
	
	  
	  
	  function setCalendar(data){ 
			var jsonData = data;
		    
			   $("#calendar").fullCalendar({
			   	header: {
			           left: 'prev,next today',
			           center: 'title',
			           right: 'month,agendaWeek,agendaDay,listWeek'
			        },
			      editable : true,
			      events: jsonData,
			      locale: 'ko',
			      eventClick:function(event) {
			          if(event.title) {            	   
			       	   $.ajax({
			       		   type : "POST",
			       	    	url : "${ pageContext.request.contextPath }/ceo/scheduleDetail",
			       	    	data : {
			       	    		mo_no : event.id
			       	    	},
			       	    	dataType : "json",
			       	    	contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			       	    	error : function(request, status, error){
			       	    		alert("code : "+request.status + "\r\nmessage : " + request.reponseText);	    		
			       	    	},
			       	    	success : function(data){
			       	    			
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
			              
			              return false;
			              
			              
			          }
			      }
			  });

		}	
	  
	  
	  
	  
	  
     
});
</script>


<style type="text/css">
    body {
        margin :40px 10px;
        padding : 0;
        font-family : "Lucida Grande", Helvetica, Arial, Verdana,sans-serif;
        font-size : 14px;
    }
    #calendar {
        max-width : 65%;
        margin : 0 auto;
    }

</style>

</head>
<body>

   <header>
      <jsp:include page="../employee_include/topmenu.jsp" />
   </header>

<section>
		<div id='calendar'></div>
		<jsp:include page="../company_management/scheduleModify.jsp"></jsp:include>	
		
		<div class="container">
		<div align="right" style="margin-top:15px; margin-bottom:20px;">
		<input type="button" class="btn btn-theme" id="mySchedules" value="나의일정보기" >
		</div>
		<div align="center">
			<a href="#addScheduleModal1" class="trigger-btn" data-toggle="modal">
			<input type="button" class="btn btn-large btn-warning" id="scheduleAdd_btn" value="일정 등록"></a>
		</div>
		</div>
		<br/>
		<br/>
		<br/>

		<jsp:include page="./addScheduleModal.jsp" />
		<jsp:include page="./scheduleDetail.jsp" />
	</section>

   <footer>
      <jsp:include page="../employee_include/bottom.jsp" />
   </footer>


   
</body>
</html>