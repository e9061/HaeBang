<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css" type="text/css" rel="stylesheet" media="all">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<script src ="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

<script type="text/javascript">

	function changeDate(){
		var startTime = $('#startTimeHour').val() + ":" + $('#startTimeMinute').val();
		var endTime = $('#endTimeHour').val() + ":" + $('#endTimeMinute').val();
		
		opener.$('#mod_date').val($('#date').val());
		opener.$('#mod_startTime').val(startTime);
		opener.$('#mod_endTime').val(endTime);
		window.close();
	}
	
$(document).ready(function(){
	
		var date_input=$('input[name="date"]'); 
		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		date_input.datepicker({
		    format: 'yyyy-mm-dd',    
		    container: container,
		    todayHighlight: true,
		    autoclose: true
		});
		

});
</script>

</head>
<body>
	<div style="margin-top: 25%">
			<div class="form-group">
				<div class="col-sm-10">
					<label for="new_company_identity" class="col-sm-2 control-label bg-danger">시작날</label>
					<div class="input-group date" id="datepicker2">
						<input class="form-control" id="date" name="date" placeholder="MM-DD-YYYY" type="text"/>
						<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
					</div>
				</div>
			</div>    
                
        

                <div class="form-group">
                    <div class="col-sm-10">
                    <label for="new_bol_require" class="col-sm-2 control-label bg-danger">시작</label>
                       <select id="startTimeHour" class="form-control" name="startTimeHour" style="width:30%; float:left">
							<option value="">선택</option>
							<option value="00">00</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
						</select>
                        
                        <span style="float:left;">&nbsp;&nbsp;:&nbsp;&nbsp;</span>
                        
                         <select id="startTimeMinute" class="form-control" name="startTimeMinute" style="width:30%; float:left">
							<option value="">선택</option>
							<option value="00">00</option>
							<option value="05">05</option>
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
							<option value="25">25</option>
							<option value="30">30</option>
							<option value="35">35</option>
							<option value="40">40</option>
							<option value="45">45</option>
							<option value="50">50</option>
							<option value="55">55</option>													
						</select>
                    </div>
                   </div>
                   
                   
                   
                   <div class="form-group">
                    <label for="new_pod_require" class="col-sm-2 control-label bg-danger">종료</label>
                    <div class="col-sm-10">
                        <select id="endTimeHour" class="form-control" name="endTimeHour" style="width:30%; float:left">
							<option value="">선택</option>
							<option value="00">00</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
						</select>
                        
                         <span style="float:left;">&nbsp;&nbsp;:&nbsp;&nbsp;</span>
                        
                         <select id="endTimeMinute" class="form-control" name="endTimeMinute" style="width:30%; float:left">
							<option value="">선택</option>
							<option value="00">00</option>
							<option value="05">05</option>
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
							<option value="25">25</option>
							<option value="30">30</option>
							<option value="35">35</option>
							<option value="40">40</option>
							<option value="45">45</option>
							<option value="50">50</option>
							<option value="55">55</option>													
						</select>
                    </div>
                </div> 
                
                
	</div>
				<div style="padding-left:25%">
					<input type="button" class="btn btn-default" value="변경" onclick="changeDate()">
					<input type="button" class="btn btn-default"  value="닫기" onclick="window.close()">
				</div> 
                     
</body>
</html>