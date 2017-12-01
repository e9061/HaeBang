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
    	url : "${ pageContext.request.contextPath }/ceo/schedulelist",
    	dataType : "json",
    	contentType : "application/x-www-form-urlencoded; charset=UTF-8",
    	error : function(request, status, error){
    		alert("code : "+request.status + "\r\nmessage : " + request.reponseText);	    		
    	},
    	success : function(data){
    		alert("왔니?1");
    		setCalendar(data);
    		
    	}
    	
    });
    
    
	
	
	function setCalendar(data){
    	
    	  var date = new Date();
    	  var d = date.getDate();
    	  var m = date.getMonth();
    	  var y = date.getFullYear();
    	  var jsonData = data;

    	  alert(jsonData);
    	  
    	 $("#calendar").fullCalendar({
    		header: {
 				left: 'prev,next today',
 				center: 'title',
 				right: 'month,agendaWeek,agendaDay,listWeek'
 			},
           editable : true,
           events: [jsonData],
           timeFormat: 'H(:mm)',
           eventClick:function(event) {
               if(event.title) {
                   alert(event.title + "\n", "wicked", "width=700,height=600");
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
        max-width : 900px;
        margin : 0 auto;
    }

</style>

</head>
<body>

   <header>
      <jsp:include page="../employee_include/topmenu.jsp" />
   </header>


<div id='calendar'></div>

   
   <footer>
      <jsp:include page="../employee_include/bottom.jsp" />
   </footer>


   
</body>
</html>