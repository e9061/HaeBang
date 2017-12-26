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
		
		var dd = new Date(opener.$('#det_mo_startTime').val());
		var dd2 = new Date(opener.$('#det_mo_endTime').val());
		console.log(dd.getHour - dd2.getHour);
		
		console.log(typeof opener.$('#det_mo_startTime').val());								// string
		console.log(typeof $('#date').val() + " : " + $('#date').val());						// string : 2017-12-12
		console.log(typeof $('#startTimeHour').val() + " : " + $('#startTimeHour').val());		// string : 01
		console.log(typeof $('#startTimeMinute').val() + " : " + $('#startTimeMinute').val());	// string : 00
console.log(typeof opener.$('#det_mo_startTime').val() + "opener.$('#det_mo_startTime').val() : "+opener.$('#det_mo_startTime').val());		//  string 2017-11-29 06:30
		
		
		var strDate1 = opener.$('#det_mo_startTime').val();
		var strDate2 = opener.$('#det_mo_endTime').val();
		console.log(strDate1)					// 2017-12-20 01:00		오픈 창에서 받아온 정보
		
	/* 	var year1 = strDate1.split(' ');
		var year2 = strDate2.split(' ');
		
		var years = year1[0].split('-'); // years[0] , [1] , [2]
		var day = year1[1].split(':');	// day[0] , day[1]
		var years2 = year2[0].split('-'); // years2[0] , [1] , [2]
		var day2 = year2[1].split(':');	// day2[0] , day2[1]

		
		var stTime = new Date(years[0], years[1], years[2], day[0], day[1]);
		var edTime = new Date(years2[0], years2[1], years2[2], day2[0], day2[1]);
		console.log(edTime.getTime());
		console.log(edTime.getTime() - stTime.getTime() );			// getTime
		
		console.log(edTime/(60*60));
	 */	
		opener.$('#det_mo_startTime').val($('#date').val() + " " + $('#startTimeHour').val() + ":" + $('#startTimeMinute').val());
		opener.$('#det_mo_endTime').val("구상 중");
		
		var msg = "<button type='button' class='btn btn-modify' id='confirmChangeTime' onclick='confirmChangeTime()'>변경 완료!</button>";
		opener.$('#btns').append(msg);
		opener.$('#cancleService').hide();
		opener.$('#endTime').hide();
		//	opener.$('#cancleService').prev().html(msg);
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
	</div>
				<div style="padding-left:25%">
					<input type="button" class="btn btn-default" value="변경" onclick="changeDate()">
					<input type="button" class="btn btn-default"  value="닫기" onclick="window.close()">
				</div> 
                     
</body>
</html>