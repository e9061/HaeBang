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

<style>

#scheduleDetail {
	display: none;
    position: fixed;
    height: 72%;
 	bottom: 10%;
 	left: 25%;
 	width: 50%;
	background-color: #f3f3f3;
    z-index: 11;
	}
/*
input[type='text'] {
}
*/	

.service {
	height: 450px;
}

</style>

<script type="text/javascript">

$(document).ready(function() {
	
	$(function(){
		$("#detail-background,#btn-close-detail").click(function () {
			$('#btn-modify-detail').text("수정");
			$('#btn-close-detail').text("닫기");
			$('input').attr("readonly", true);
			$("#scheduleDetail,#detail-background").toggle();
		});
	});
	
	
    $.ajax({    	
    	
    	type : "POST",
    	url : "${ pageContext.request.contextPath }/ceo/scheduleList",
    	dataType : "json",
    	contentType : "application/x-www-form-urlencoded; charset=UTF-8",
    	error : function(request, status, error){
    		alert("code : "+request.status + "\r\nmessage : " + request.reponseText);	    		
    	},
    	success : function(data){
    		alert(data);
    		setCalendar(data);
    	}
    	
    });
    
    
	
	
	function setCalendar(data){
    	
    	  var jsonData = data;
			
    	  console.log(jsonData);		// [{…}, {…}]
    	  
    	 $("#calendar").fullCalendar({
    		header: {
 				left: 'prev,next today',
 				center: 'title',
 				right: 'month,agendaWeek,agendaDay,listWeek'
 			},
           editable : true,
           events: jsonData,
           timeFormat: 'H(:mm)',
           eventClick:function(event) {
               if(event.title) {
            	   alert("ajax");
            	   alert(event.id);
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
            	    	//	console.log(data);
            	    		alert(data.mo_orderNo);
            	 	  		document.getElementById('m_name').value= data.m_name;
            	    		document.getElementById('m_address').value= data.m_address;
            	     		document.getElementById('m_phone').value= data.m_phone;
            	    	//	document.getElementById('s_name').value= data.s_name;
            	    	/* 	
            	    		if(data.s_style == "j"){				// 정기형
            	    			$("#j").prop("checked", true);
            	    			$("#b").prop("checked", false);
	            	    		if(data.mo_freqType == "W"){
	            	    			$("#mo_freqType").val('W').prop("selected", true);
	            	    			document.getElementById('mo_freqCycle').value = data.mo_freqCycle+" 주 단위";
	            	    		}else{
	            	    			$("#mo_freqType").val('M').prop("selected", true);
	            	    			document.getElementById('mo_freqCycle').value = data.mo_freqCycle+" 개월 단위";
	            	    		}
	            	    		document.getElementById('mo_cnt').value= data.mo_cnt;
	            	    		document.getElementById('mo_total').value= data.mo_total;
            	    		}else{									// 보장형
            	    			$("#j").prop("checked", false);
            	    			$("#b").prop("checked", true);
            	    			$("#mo_freqType").val('null').prop("selected", true);
            	    			document.getElementById('mo_freqCycle').value = "-";
	            	    		document.getElementById('mo_cnt').value= "1";
	            	    		document.getElementById('mo_total').value= "-";
            	    		}
						 */
            	    		document.getElementById('mo_orderNo').value= data.mo_orderNo;
            	    		document.getElementById('mo_startTime').value= data.mo_startTime;
            	    		document.getElementById('mo_endTime').value= data.mo_endTime;
            	    		document.getElementById('e_name').value= data.e_name;
            	    		document.getElementById('e_phone').value= data.e_phone; 
            	    		$('#scheduleDetail').toggle();
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
		<jsp:include page="../company_management/scheduleDetail.jsp"></jsp:include>	
		
		<div align="center">
			<a href="#addScheduleModal1" class="trigger-btn" data-toggle="modal">
			<input type="button" class="btn btn-theme" id="scheduleAdd_btn" value="일정 등록"></a>
		</div>
		<br/>
		<br/>
		<br/>

		<jsp:include page="./addScheduleModal.jsp" />
	</section>




	<br/>
	<br/>
	<br/>
		<div id="detail-background"></div>

   <footer>
      <jsp:include page="../employee_include/bottom.jsp" />
   </footer>


   
</body>
</html>