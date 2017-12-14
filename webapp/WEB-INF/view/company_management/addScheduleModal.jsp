<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css" type="text/css" rel="stylesheet" media="all">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
<script>

$(document).ready(function(){
$("input[type='radio'][name='period-type']").change(function(){
	
    var selected = $("input[type='radio'][name='period-type']:checked").val();

    if(selected == "onetime") {
    	$('#type1').show();
    	$('#type2').hide();
    	
    }else if(selected=="regular"){    	
    	$('#type2').show();
    	$('#type1').hide();
    }
    
});



$("select[name=unit1]").change(function(){	

	
    var selected = $("#unit1 option:selected").val();
    
    if(selected == "week") var opts = [
    	{name:"선택", val:""},
        {name:"1주마다", val:"1"},
        {name:"2주마다", val:"2"},
        {name:"3주마다", val:"3"}
    ];
    
    else if(selected == "month") var opts = [
    	{name:"선택", val:""},
        {name:"1개월마다", val:"1"},
        {name:"2개월마다", val:"2"},
        {name:"3개월마다", val:"3"},
        {name:"4개월마다", val:"4"},
        {name:"5개월마다", val:"5"},
        {name:"6개월마다", val:"6"}
    ];
	
    else if(selected == "") var opts = [
        {name:"단위를 선택해주세요", val:""}     
    ];
    
    $("#cycle").empty();
    $.each(opts, function(k,v){

        $("#cycle").append("<option value='"+v.val+"'>"+v.name+"</option>");

    });
});



var date_input1=$('input[name="date1"]'); 
var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
date_input1.datepicker({
    format: 'yyyy-mm-dd',    
    container: container,
    todayHighlight: true,
    autoclose: true
});



var date_input2=$('input[name="date2"]'); 
var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
date_input2.datepicker({
    format: 'yyyy-mm-dd',    
    container: container,
    todayHighlight: true,
    autoclose: true
});


 
});



    function c_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
            	// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address').value = fullAddr;
                  document.getElementById('address').focus();

	             
                
            }
        }).open();

    }

    
    function inputAddress(address){
		  $.ajax({		
				url: "https://api2.sktelecom.com/tmap/geo/fullAddrGeo",
				type: "GET",
				data: {	
					version : 1,
					fullAddr : address,
					addressFlag : "F00",
					format : "json",
					appKey : "3a8e2503-7364-4259-9624-81dfdd0cb5ff"
				},
				success : function(result)
				{
					
					if(result.coordinateInfo.coordinate.length == '1')
					{
						document.getElementById('lon').value = result.coordinateInfo.coordinate[0].newLon;
						document.getElementById('lat').value = result.coordinateInfo.coordinate[0].newLat;
						document.getElementById('gu').value = result.coordinateInfo.coordinate[0].gu_gun;
					}else
					{
						document.getElementById('lon').value = result.coordinateInfo.coordinate[0].lon;
						document.getElementById('lat').value = result.coordinateInfo.coordinate[0].lat;
						document.getElementById('gu').value = result.coordinateInfo.coordinate[0].gu_gun;
					}
				},
				
		  });
	  }
    
</script>
<style type="text/css">
 
.modal-80p {
    width:80%; 
  }
       
 .ad {
              position: absolute;
              bottom: 70px;
              right: 48px;
              z-index: 992;
              background-color:#f3f3f3;
              position: fixed;
              width: 155px;
              padding:1px;
            }
            
            .ad-btn-hide {
              position: absolute;
              top: -10px;
              left: -12px;
              background: #fefefe;
              background: rgba(240,240,240,0.9);
              border: 0;
              border-radius: 26px;
              cursor: pointer;
              padding: 2px;
              height: 25px;
              width: 25px;
              font-size: 14px;
              vertical-align:top;
              outline: 0;
            }
            
            .carbon-img {
              float:left;
              padding: 10px;
            }
            
            .carbon-text {
              color: #888;
              display: inline-block;
              font-family: Verdana;
              font-size: 11px;
              font-weight: 400;
              height: 60px;
              margin-left: 9px;
              width: 142px;
              padding-top: 10px;
            }
            
            .carbon-text:hover {
              color: #666;
            }
            
            .carbon-poweredby {
              color: #6A6A6A;
              float: left;
              font-family: Verdana;
              font-size: 11px;
              font-weight: 400;
              margin-left: 10px;
              margin-top: 13px;
              text-align: center;
            }
            
            #type2 {
            
              display: none;
            
            }
            
            
</style>    



<div class="modal fade" id="addScheduleModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-80p">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                       <span aria-hidden="true">×</span>
                       <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    	일정 등록 
                </h4>
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">
              
              
              
    <form action="${ pageContext.request.contextPath }/ceo/addSchedule" name="sform" onsubmit="return checkForm()" method="post" class="form-horizontal">

        <div class="form-group form-group-sm">
        
            <!-- left column -->
            <div class="col-sm-6">
            
            <p class="lead">고객 정보 등록</p>
                <div class="form-group">
                    <label for="new_name" class="col-sm-2 control-label bg-danger">이름</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" name="name" placeholder="고객 이름" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="new_subname" class="col-sm-2 control-label bg-danger">주소</label>
                    <div class="col-sm-10">
                        <input type="text" name ="postcode" id="postcode" class="form-control" style="width:20%; float:left" onkeyup="checkpostcode()"/>
						&nbsp;&nbsp; <input type="button" class="btn btn-info1" onclick="c_execDaumPostcode()" value="우편번호 찾기">
						</div>
					<label for="new_addresssub" class="col-sm-2 control-label" style="color:white;"></label>   						
						<div class="col-sm-10">
						<input type="text" onblur="inputAddress($(this).val())" id="address" name="address" class="form-control" onkeyup="checkpostcode()"/>					
						</div>
					<label for="new_addresssub" class="col-sm-2 control-label" style="color:white;"></label> 
						<div class="col-sm-10"> 
						<input type="text" placeholder="상세주소입력" id="detailAddress" name="detailAddress"class="form-control" />
						</div>
                        <input type="hidden" id="lon" name="lon" />
                        <input type="hidden" id="lat" name="lat" />
                        <input type="hidden" id="gu" name="gu" />
                </div>
                
                
                 <div class="form-group">
                    <label for="new_name" class="col-sm-2 control-label bg-danger">연락처</label>
                    <div class="col-sm-10">
                        <select id="phone1"  class="form-control" name="phone1" style="width:25%; float:left">
					<option value="">선택</option>
					<option value="010">010</option>
					<option value="011">011</option>					
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>					
			</select><span style="float:left;">&nbsp;&nbsp;-&nbsp;&nbsp;</span> 
			<input type="tel"  class="form-control" id="phone2" name="phone2" MaxLength="4" style="width:25%; float:left"/>
			<span style="float:left;">&nbsp;&nbsp;-&nbsp;&nbsp;</span> 
			<input type="tel"  class="form-control" id="phone3" name="phone3" MaxLength="4" style="width:25%; float:left"/>
                    </div>
                </div>
           
            </div>




            <!-- right column -->
             <p class="lead">서비스 정보 등록</p>   
            <div class="col-sm-6">
                <div class="form-group">
                    <label for="new_company_identity" class="col-sm-2 control-label bg-danger">서비스</label>
                    <div class="col-sm-10">
          	           <input type="text" class="form-control" id="service1" name="service1" placeholder="예시: 바퀴 6개월 보장형 등" />                        
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="new_company_identity" class="col-sm-2 control-label bg-danger">종류</label>
                    <div class="col-sm-10">
                        <input type="radio" id="onetime" name="period-type" checked="checked" value="onetime"/>1회 서비스 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" id="regular" name="period-type" value="regular"/>정기 서비스               
                    </div>
                </div>            
                
                <!-- 1회성 -->
                <div id="type1">
                
                    <div class="form-group">
                    <label for="new_company_identity" class="col-sm-2 control-label bg-danger">날짜</label>
                    <div class="col-sm-10">
                     
                     	<div class="input-group date" id="datepicker1">
  					<input class="form-control" id="date1" name="date1" placeholder="MM-DD-YYYY" type="text"/>
  					<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
						</div>
                              
                    </div>
                </div>     
                
        

  			 <div class="form-group">
                    <label for="new_bol_require" class="col-sm-2 control-label bg-danger">시작</label>
                    <div class="col-sm-10">
                    	<select id="startTimeHour1" class="form-control" name="startTimeHour1" style="width:30%; float:left">
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
                        
                        
                        <select id="startTimeMinute1" class="form-control" name="startTimeMinute1" style="width:30%; float:left">
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
                        <select id="endTimeHour1" class="form-control" name="endTimeHour1" style="width:30%; float:left">
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
                        
                         <select id="endTimeMinute1" class="form-control" name="endTimeMinute1" style="width:30%; float:left">
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
			
			
			
			<!-- 정기서비스 -->
			<div id="type2">			
                            
            
             <div class="form-group">
                    <label for="new_bol_require" class="col-sm-2 control-label bg-danger">단위</label>
                    <div class="col-sm-4">
                        <select class="form-control" id="unit1" name="unit1">
                        	<option value="">선택</option>
                            <option value="week">주단위 반복</option>
                            <option value="month">월단위 반복</option>                          
                        </select>
                    </div>
                    
                    <label for="new_pod_require" class="col-sm-2 control-label bg-danger">반복</label>
                    <div class="col-sm-4">
                        <select class="form-control" id="cycle" name="cycle">
                        </select>
                    </div>
                </div>
                
                
                 
                <div class="form-group">
                    <label for="new_company_identity" class="col-sm-2 control-label bg-danger">총 횟수</label>
                    <div class="col-sm-10">
                    	<select id="totalCnt" class="form-control" name="totalCnt">
							<option value="">선택</option>
							<option value="1">1회</option>
							<option value="2">2회</option>
							<option value="3">3회</option>
							<option value="4">4회</option>
							<option value="5">5회</option>
							<option value="6">6회</option>
							<option value="7">7회</option>
							<option value="8">8회</option>
							<option value="9">9회</option>
							<option value="10">10회</option>
							<option value="11">11회</option>
							<option value="12">12회</option>												
						</select>          
                    </div>
                </div>
                
                
            <div class="form-group">
                    <label for="new_company_identity" class="col-sm-2 control-label bg-danger">시작날</label>
                    <div class="col-sm-10">
                     
                    <div class="input-group date" id="datepicker2">
  						<input class="form-control" id="date2" name="date2" placeholder="MM-DD-YYYY" type="text"/>
  						<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
					</div>
                              
                    </div>
                </div>    
                
        

                <div class="form-group">
                    <label for="new_bol_require" class="col-sm-2 control-label bg-danger">시작</label>
                    <div class="col-sm-10">
                       <select id="startTimeHour2" class="form-control" name="startTimeHour2" style="width:30%; float:left">
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
                        
                         <select id="startTimeMinute2" class="form-control" name="startTimeMinute2" style="width:30%; float:left">
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
                        <select id="endTimeHour2" class="form-control" name="endTimeHour2" style="width:30%; float:left">
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
                        
                         <select id="endTimeMinute2" class="form-control" name="endTimeMinute2" style="width:30%; float:left">
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

	      </div>
        </div>


        <!-- End main input boxes, starting a new "row" -->

        <div class="form-group form-group-sm">
            <div class="col-sm-12">
                <div class="form-group">
                    <label for="new_comments" class="col-sm-1 control-label">비고</label>
                    <div class="col-sm-11">
                    	<textarea class="form-control" id="comments" name="comments" rows="3" placeholder="비고사항 입력"></textarea>
                    
                    </div>
                </div>
            </div>
        </div>



      <!-- Modal Footer -->
            <div class="modal-footer">                
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                <input type="submit" class="btn btn-primary" id="add" value="일정 등록"/>
            </div><!-- End Modal Footer -->
            

    </form>
</div> <!-- End modal body div -->
      </div> <!-- End modal content div -->
  </div> <!-- End modal dialog div -->
</div> <!-- End modal div -->

<script>

function isNull(obj, msg) {
   if (obj.value == "") {
      alert(msg);
      obj.focus();
      return true;
   }
   return false;
}

function checkpostcode() {	
	alert("우편번호 찾기 버튼을 이용해주세요");	
}

function checkForm(){
             
   var s = document.sform;
   
   if(isNull(s.name, '고객 이름을 입력해 주세요')){
      return false;
   }
   
   if(isNull(s.address, '고객 주소를 입력해 주세요')){
      return false;
   }
   
   if(isNull(s.detailAddress, '고객 상세주소를 입력해 주세요')){
	      return false;
	}
   
   
   if(isNull(s.phone1, '전화번호 앞자리를 선택해 주세요.')){
		return false;
	}
	
	if(isNull(s.phone2, '전화번호 가운데 자리를 입력하세요.')){
		return false;
	}
	
	if(s.phone2.value.length < 3){
		alert('전화번호 가운데 자리는 최소 3자리 이상, 4자리 이하로 입력하셔야 합니다.');
		s.phone2.focus();
		return false;
	}
	
	if(isNull(s.phone3, '전화번호 뒷자리를 입력하세요.')){
		return false;
	}
	
	if(s.phone3.value.length  < 4){
		alert('전화번호 뒷자리는 4자리로 입력하셔야 합니다.');
		s.phone3.focus();
		return false;
	}		

	
	if(isNaN(s.phone2.value)){
		alert("전화번호는 숫자 형식으로 입력하세요.");
		s.phone2.focus();
		return false;
	}
			
	if(isNaN(s.phone3.value)){
		alert("전화번호는 숫자 형식으로 입력하세요.");
		s.phone3.focus();
		return false;
	}	
	
	if(s.phone2.value == "0000" && s.phone3.value == "0000"){
		alert("휴대폰 정보가 올바르지 않습니다.");
		s.phone2.focus();
		return false;
	}
   
   
   if(isNull(s.service, '제공하는 서비스명을 입력해 주세요')){
	      return false;
	   }
   
   var chk_radio = document.getElementsByName('period-type');
	
   
   for(var i=0; i<chk_radio.length; i++){
	   
	   if(chk_radio[0].checked==true){
		   
		   if(isNull(s.date1, '날짜를 선택해 주세요')){
			      return false;
			   }
			   
			if(isNull(s.startTimeHour1, '서비스 시작시간을 입력해 주세요')){
			      return false;
			   }
			   
			if(isNull(s.startTimeMinute1, '서비스 시작시간(분)을 입력해 주세요')){
				      return false;
				}
			
			if(isNull(s.endTimeHour1, '서비스 예상 종료시간을 입력해 주세요')){
			      return false;
			   }
			   
			if(isNull(s.endTimeMinute1, '서비스 예상 종료시간(분)을 입력해 주세요')){
				      return false;
				}
			  
		   
	   }else {
		   
		
		   
		   if(isNull(s.unit, '정기 서비스 반복 단위를 선택해 주세요')){
			      return false;
			   }
			   
			if(isNull(s.cycle, '반복주기를 선택해 주세요')){
			      return false;
			   }
			   
			if(isNull(s.totalCnt, '제공하는 서비스의 총 횟수를 입력해 주세요')){
				      return false;
				}
		   
			   if(isNull(s.date2, '날짜를 선택해 주세요')){
				      return false;
				   }
			   
			   
			if(isNull(s.startTimeHour2, '서비스 시작시간을 입력해 주세요')){
			      return false;
			   }
			   
			if(isNull(s.startTimeMinute2, '서비스 시작시간(분)을 입력해 주세요')){
				      return false;
				}
			
			if(isNull(s.endTimeHour2, '서비스 예상 종료시간을 입력해 주세요')){
			      return false;
			   }
			   
			if(isNull(s.endTimeMinute2, '서비스 예상 종료시간(분)을 입력해 주세요')){
				      return false;
				}
			
			
		   
		   
	   }
	   
	   
   }
   
}

</script>