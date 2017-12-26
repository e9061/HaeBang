<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<script src ="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>해방 관리자 페이지</title>
<script>

function doAction(type) {
	
	var now = new Date();
	var nowYear=now.getFullYear();
	var nowMonth=now.getMonth()+1;
	var nowDate=now.getDate();	
	var NowTime=nowYear+'-'+nowMonth+'-'+nowDate;
	
	switch(type){	
	
	case 'today':
		$('#startDate').val(NowTime);	
		$('#endDate').val(NowTime);	
		break;
		
	case '1week':		
		$('#startDate').val(NowTime);
		var date2 = new Date();	
		var endYear=date2.getFullYear();
		var endMonth=date2.getMonth()+1;
		var endDate=date2.getDate()+7;	
		
		var endTime=endYear;
		if(10>endMonth){
			endTime += "-"+"0"+endMonth;
		}else{
			endTime += "-"+""+endMonth;
		}
		
		if(10>endDate){
			endTime +="-"+"0"+endDate;			
		}else{
			endTime +="-"+""+endDate;
		}		
		$('#endDate').val(endTime);		
		
		break;
		
	case '1month': 
		$('#startDate').val(NowTime);
		var date2 = new Date();
		var end=new Date(date2.getFullYear(),date2.getMonth()+2,date2.getDate());
		var endTime = end.getFullYear();
		if(10>end.getMonth()){
			endTime += "-"+"0"+end.getMonth();
		}else{
			endTime += "-"+""+end.getMonth();
		}
		
		if(10>end.getDate()){
			endTime +="-"+"0"+end.getDate();			
		}else{
			endTime +="-"+""+end.getDate();
		}
		
		$('#endDate').val(endTime);	
		
		break;
		
	case '3month': 
		$('#startDate').val(NowTime);
		var date2 = new Date();
		var end=new Date(date2.getFullYear(),date2.getMonth()+4,date2.getDate());
		var endTime = end.getFullYear();
		if(10>end.getMonth()){
			endTime += "-"+"0"+end.getMonth();
		}else{
			endTime += "-"+""+end.getMonth();
		}
		
		if(10>end.getDate()){
			endTime +="-"+"0"+end.getDate();			
		}else{
			endTime +="-"+""+end.getDate();
		}
		
		$('#endDate').val(endTime);	
		
		break;
	
	}
	
}


$(document).ready(function(){
	
    $("#search_btn").click(function(){ 
    	
    	if($('#searchSchedule').val()==""){
    		alert('분류를 선택해주세요');
    		$('#searchSchedule').focus();
    		return false;    		
    	}
    	
    	var format = /^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
        var startDate = $('#startDate').val();
       	var endDate = $('#endDate').val();
    	
    	if($('#startDate').val()=="" || !format.test(startDate)) {
         alert("시작일은 2010-02-01 형식으로 입력해야합니다.\r\n(1970-01-01부터 2099-12-31까지 검색 가능합니다.)");
         $('#startDate').focus();
         return false;
        }
        else if($('#endDate').val()=="" || !format.test(endDate)) {
         alert("종료일은 2010-02-01 형식으로 입력해야합니다.\r\n(1970-01-01부터 2099-12-31까지 검색 가능합니다.)");
         $('#endDate').focus();
         return false;
        }
    	
    	var selected = $("#searchSchedule option:selected").val();
    	
    	if(selected == "e_id"){
 			
    		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    		var word = $('#word').val();
    		if(!regExp.test(word)){
    			alert("직원 아이디는 이메일 형식입니다.");
    			return false;
    		}
    		
    		
    	} 
    	
       if($("#word").val().trim()==""){
          alert("검색어를 입력하세요.");
          $("#word").val("").focus();
       }else{
          $.ajax({         
             url: "${ pageContext.request.contextPath}/admin/findSchedule",
             type: "GET",
             data: {
                searchSchedule: $("#searchSchedule").val(),
                word: $("#word").val(),
                startDate: $("#startDate").val(),
                endDate: $("#endDate").val() 
             },
             success: function(data) {               
                $('#content').html(data);
                $('td').css({'font-size':'13px'});
                $('th').css({'background-color':'#5D9CEC', 'color':'white'});              
                
             }         
          })
       }
          
    });
    

    
  
/*     var date_input1=$('input[name="startDate"]'); 
    var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
    date_input1.datepicker({
        format: 'yyyy-mm-dd',    
        container: container,
        todayHighlight: true,
        autoclose: true
    });



    var date_input2=$('input[name=""]'); 
    var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
    date_input2.datepicker({
        format: 'yyyy-mm-dd',    
        container: container,
        todayHighlight: true,
        autoclose: true
    });
 */

});



</script>
<style type="text/css">
select{


    margin-left:35px;
    border:1px solid #d7d7d7;
    padding:5px;
    border-radius:2px;
}
select:hover{
    background:#cde4f7;
    border:1px solid #41c9ff;
}

select:focus {
        -webkit-box-shadow: 0 0 3px 1px #7cdaff;
        -moz-box-shadow: 0 0 3px 1px #7cdaff;
        box-shadow: 0 0 3px 1px #7cdaff;
    }
    select:before{
        content: "▼";
    }
option{
    background:#fff;
    border-color:#41c9ff;
    border-radius:2px;
    line-height: 18px;
    outline:none;
    -webkit-box-shadow: 0 0 3px 1px #c00;
    -moz-box-shadow: 0 0 3px 1px #c00;
    box-shadow: 0 0 3px 1px #c00;
}
option:focus{
    -webkit-box-shadow: 0 0 3px 1px #7cdaff;
        -moz-box-shadow: 0 0 3px 1px #7cdaff;
        box-shadow: 0 0 3px 1px #7cdaff;
}
</style>
</head>
<body>
	
	<header>
		<jsp:include page="../admin_include/topmenu.jsp"/>
	</header>
	
	<section>
	
	<div class="container">
	
		<div id="search" align="center" style="padding:10px; height:70px; display:table-cell; vertical-align:middle;">
				분류<span style="padding-right:10px;">
				<select id="searchSchedule" name="searchSchedule" >
					<option value="">선택</option>
					<option value="orderNo">주문번호</option>
					<option value="m_phone">고객핸드폰</option>
					<option value="c_code">회사코드</option>
					<option value="e_id">직원아이디</option>
				</select></span><span style="padding-right:10px;">
				검색<input type="text" name="word" id="word" /></span> 
				시작날짜<span style="padding-right:10px;"><input type="text" placeholder="YYYY-MM-DD" name="startDate" id="startDate" /></span>~
				종료날짜<span style="padding-right:10px;"><input type="text" placeholder="YYYY-MM-DD" name="endDate" id="endDate"/></span>
				
				<input type="button" class="btn btn-warning" id="today" name="today" value="오늘" onclick="doAction('today')"/>
				<input type="button" class="btn btn-warning" id="1week" name="1week" value="1주" onclick="doAction('1week')"/>
				<input type="button" class="btn btn-warning" id="1month" name="1month" value="1개월" onclick="doAction('1month')"/>
				<input type="button" class="btn btn-warning" id="3month" name="3month" value="3개월" onclick="doAction('3month')"/>
				
				<input type="button" class="btn btn-large btn-primary" id="search_btn" value="검색" />
		</div>
		
		
		<div id="content">
			<table height="30%">
				<tr>
					<td></td>
				</tr>
			</table>
		</div>



	</div>	
	</section>
	
	<footer>
		<jsp:include page="../admin_include/bottom.jsp"/>
	</footer>
</body>
</html>