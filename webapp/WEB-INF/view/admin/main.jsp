<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<title>SOP JavaScript Unit TEST: Service population</title>
<script
	src="${ pageContext.request.contextPath }/resources/js/jquery.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/jquery.easing.1.3.js"></script>
<script
	src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=3a8e2503-7364-4259-9624-81dfdd0cb5ff"></script>

<!--Tmap api-->

<script type="text/javascript">

$(document).ready(function(){
	
	$('#each-status').hide();
	$('#each-guName').hide();
	
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/mainInfo",
		type: "POST",
		dataType:"json", 
		success: function(result){
			// 뿌리기
			console.log(result[0].m_gu + "/" + result[0].eo_status);
			console.log(result.length);
			$('#searchGuInfo').val(result.length);		// 총 갯수
			// 대기중 / 출동중 / 해방중 / 해방완료
			
			var waiting=0;
			var going=0;
			var starting=0;
			var success=0;
			
			for(var i=0; i<result.length; i++){
				if(result[i].eo_status == "대기중"){
					waiting++;									// 대기중 갯수
				}else if(result[i].eo_status == "출동중"){
					going++;									// 출동중 갯수
				}else if(result[i].eo_status == "해방중"){
					starting++;									// 해방중 갯수
				}else{
					success++;									// 해방완료 갯수
				}
				$('#waiting').val(waiting);
				$('#going').val(going);
				$('#starting').val(starting);
				$('#success').val(success);
				
				console.log(waiting+"/"+going+"/"+starting+"/"+success);	
			}
			
			
		}
	})
	
	$('#searchGu').click(function(){
		$('#each-status').hide();
		$('#each-guName').show();
	});
	
	
	$('.total').click(function(){
		var eo_status = $(this).prev().val();	
		$('#each-status').show();
	//	$('#each-status2').html("<td><input type='text' value='1111'></td><td><input type='text' value='123'><input type='hidden' value='345'></td>");
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/searchGuInfo",
			type: "POST",
			data: {
					eo_status : eo_status
				},
			dataType:"json", 
			success: function(result){
				console.log(result.length);	
			
				var output = "";
				
				output += "<tr>";
				output += "		<th>진행상태</th>";
				output += "		<th>구</th>";
				output += "		<th style='width:45%'>주문번호</th>";
				output += "</tr>";
				
				
		//		output += "<td> <input type='text' value='" + result[0].eo_status + "'> </td>"
		//		output += "		<td>진행상태</td>";
		//		output += "		<td>구</td>";
				if(result.length == 0){			// 0또는 null
					output = "";
					output += "<tr>";
					output  +=  "<td style='background-color:white'>";
					output += "		<input type='text' value='해당하는 정보가 없습니다.' style='color:red; width:100%;'>";
					output  +=  "</td>";
					output += "</tr>";
					
				}else{
					for(var i=0; i<result.length; i++){
						output += "<tr>";
						output  +=  "<td>";
						output  += "	<input type='text' value='" + result[i].eo_status + "' readonly=readonly></td><td><input type='text' value='" + result[i].m_gu + "'readonly=readonly><input type='hidden' value='" + result[i].mo_no + "'readonly=readonly></td><td><input class='orderNoBtn' style='width:100%' type='text' value='" + result[i].mo_orderNo + "'readonly=readonly></td>";
						output  +=  "</td>";
						output  += "</tr>";
					}
				}
		
				$('#each-status2').html(output);
			}
		})
		
		

	
		
	});
	
	
});

function searchBtn(){
	var guName = $('#guName').val();
	
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/searchGuInfo",
		data:{
				m_gu:guName
			},
		type: "POST",
		dataType:"json", 
		success: function(result){
			// 뿌리기
			if(result.length == 0){
				$('#mustHide').show();
				$('#mustHide').html("<tr><td style='background-color:white'><input type='text' value='서비스 정보가 없습니다.' style='border:none; color:red; width:100%; text-align:center'></td></tr>");
				$('#guStatusValue').hide();
			}else{
				var waiting=0;
				var going=0;
				var starting=0;
				var success=0;
				$('#guStatusValue').show();
				$('#mustHide').hide();
				
				for(var i=0; i<result.length; i++){
					if(result[i].eo_status == "대기중"){
						waiting++;									// 대기중 갯수
					}else if(result[i].eo_status == "출동중"){
						going++;									// 출동중 갯수
					}else if(result[i].eo_status == "해방중"){
						starting++;									// 해방중 갯수
					}else{
						success++;									// 해방완료 갯수
					}
					$('#gu_waiting').val(waiting);
					$('#gu_going').val(going);
					$('#gu_starting').val(starting);
					$('#gu_success').val(success);
					// 대기중 / 출동중 / 해방중 / 해방완료
					console.log(waiting+"/"+going+"/"+starting+"/"+success);	
				}
			
			}
			
		}
	})
	
};



var guChung = [

	{
	name : "강남구청", 
	addr : "서울 강남구 학동로 426 (삼성동, 강남구청)",
	gu : "강남구",
	lon : "127.046849",
	lat : "37.517738"

	}, 
	{
	name : "강동구청", 
	addr : "서울 강동구 성내로 25 (성내동, 강동구청)",
	gu : "강동구",
	lon : "127.124007",
	lat : "37.530253"

	}, 
	{
	name : "강북구청", 
	addr : "서울 강북구 도봉로89길 13 (수유동, 강북구청)",
	gu : "강북구",
	lon : "127.025508",
	lat : "37.639682"

	}, 
	{
	name : "강서구청", 
	addr : "서울 강서구 화곡로 302 (화곡동, 강서구청)",
	gu : "강서구",
	lon : "126.849532",
	lat : "37.550965"

	},
	{
	name : "관악구청", 
	addr : "서울 관악구 관악로 145 (봉천동, 관악구청)",
	gu : "관악구",
	lon : "126.951133",
	lat : "37.478469"

	},
	{
	name : "광진구청", 
	addr : "서울 광진구 자양로 117 (자양동, 광진구청)",
	gu : "광진구",
	lon : "127.082379",
	lat : "37.538587"

	},
	{
	name : "구로구청", 
	addr : "서울 구로구 가마산로 245 (구로동, 구로구청)",
	gu : "구로구",
	lon : "126.887484",
	lat : "37.495469"

	},
	{
	name : "금천구청", 
	addr : "서울 금천구 시흥대로63길 91 (시흥동, 금천구청역)",
	gu : "금천구",
	lon : "126.894969",
	lat : "37.455039"

	},
	{
	name : "노원구청", 
	addr : "서울 노원구 노해로 437 (상계동, 노원구청)",
	gu : "노원구",
	lon : "127.056985",
	lat : "37.654583"

	},
	{
	name : "도봉구청", 
	addr : "서울 도봉구 마들로 656 (방학동, 도봉구청)",
	gu : "도봉구",
	lon : "127.047131",
	lat : "37.668716"

	},
	{
	name : "동대문구청", 
	addr : "서울 동대문구 천호대로 145 (용두동, 동대문구청)",
	gu : "동대문구",
	lon : "127.039897",
	lat : "37.574392"

	},
	{
	name : "동작구청", 
	addr : "서울 동작구 장승배기로 161 (노량진동, 동작구청)",
	gu : "동작구",
	lon : "126.939506",
	lat : "37.512458"

	},
	{
	name : "마포구청", 
	addr : "서울 마포구 월드컵로 212 (성산동, 마포구청)",
	gu : "마포구",
	lon : "126.901616",
	lat : "37.566313"

	},
	{
	name : "서대문구청", 
	addr : "서울 서대문구 연희로 248 (연희동, 서대문구청)",
	gu : "서대문구",
	lon : "126.93648",
	lat : "37.579498"

	},
	{
	name : "서초구청", 
	addr : "서울 서초구 남부순환로 2584 (서초동, 서초구청)",
	gu : "서초구",
	lon : "127.033077",
	lat : "37.483513"

	},
	{
	name : "성동구청", 
	addr : "서울 성동구 고산자로 270 (행당동, 성동구청)",
	gu : "성동구",
	lon : "127.036965",
	lat : "37.563422"

	},
	{
	name : "성북구청", 
	addr : "서울 성북구 보문로 168 (삼선동5가, 성북구청)",
	gu : "성북구",
	lon : "127.01685",
	lat : "37.589456"

	},
	{
	name : "송파구청", 
	addr : "서울 송파구 올림픽로 326 (신천동, 송파구청)",
	gu : "송파구",
	lon : "127.10586",
	lat : "37.514477"

	},
	{
	name : "양천구청", 
	addr : "서울 양천구 목동동로 105 (신정동, 양천구청)",
	gu : "양천구",
	lon : "126.866543",
	lat : "37.517075"

	},
	{
	name : "영등포구청", 
	addr : "서울 영등포구 당산로 123 (당산동3가, 영등포구청)",
	gu : "영등포구",
	lon : "126.895986",
	lat : "37.526405"

	},
	{
	name : "용산구청", 
	addr : "서울 용산구 녹사평대로 150 (이태원동, 용산구종합행정타운)",
	gu : "용산구",
	lon : "126.990479",
	lat : "37.532452"

	},
	{
	name : "은평구청", 
	addr : "서울 은평구 가좌로 195 (응암동, 응암보건지소)",
	gu : "은평구",
	lon : "126.919508",
	lat : "37.588035"

	},
	{
	name : "종로구청", 
	addr : "서울 종로구 삼봉로 43 (수송동, 종로구청)",
	gu : "종로구",
	lon : "126.979584",
	lat : "37.572661"

	},
	{
	name : "중구청", 
	addr : "서울 중구 창경궁로 17 (예관동, 중구청)",
	gu : "중구",
	lon : "126.99801",
	lat : "37.56412"

	},
	{
	name : "중랑구청", 
	addr : "서울 중랑구 봉화산로 179 (신내동, 중랑구청)",
	gu : "중랑구",
	lon : "127.092725",
	lat : "37.606564"

	}

	]
	
var map;
var marker;
var lon;
var lat;
var popup;
var markerLayer

// 마커와 팝업을 세팅합니다.
function MarkerPopup(marker, popup) {
	this.marker = marker;
	this.popup = popup;
}


function init() {
	 map = new Tmap.Map({div:'map_div', width:"100%", height:"500px", animation:true}); 
	    // div : 지도가 생성될 div의 id값과 같은 값을 옵션으로 정의 합니다.
	    // Tmap,Map 클래스에 대한 상세 사항은 "JavaScript" 하위메뉴인 "기본 기능" 페이지를 참조 해주세요. 
		map.addControl(new Tmap.Control.KeyboardDefaults());
	    markerLayer = new Tmap.Layer.Markers();
		map.addLayer(markerLayer);
		for(i=0;i<guChung.length;i++){
			onComplete(guChung[i].lon, guChung[i].lat,guChung[i].gu);
		}
		forAjax();
}  

function forAjax(){
	$.ajax({		
		url: "${pageContext.request.contextPath}/admin/selectAllmap",
		type: "GET",
		data: {
			go : "go"
		},
		success: function(result){
			/* ajax success function 시작 */
			// 대기중
			for(i=0;i<result.length;i++){
				if(result[i].eo_status =="대기중")
				{
				$("#"+result[i].m_gu).children().children().children().first().next().children().first().next().html("<strong>"+result[i].cnt+"</strong>");
					
				}else if(result[i].eo_status =="출동중")
				{
				$("#"+result[i].m_gu).children().children().children().first().next().next().children().first().next().html("<strong>"+result[i].cnt+"</strong>");
					
				}else if(result[i].eo_status =="해방중")
				{
				$("#"+result[i].m_gu).children().children().children().first().next().next().next().children().first().next().html("<strong>"+result[i].cnt+"</strong>");
				}else{
					
				$("#"+result[i].m_gu).children().children().children().first().next().next().next().children().first().next().html("<strong>"+result[i].cnt+"</strong>");
				}
			}
			// 
			map.setCenter(new Tmap.LonLat(126.990479, 37.532452).transform("EPSG:4326", "EPSG:3857"),11);//map의 중심좌표를 설정합니다.
	
		}
	});
}

function onMouseMarker (evt){
    if(evt.type == "mouseover"){
        this.show();
    } else {
        this.hide();
    }
}


function onComplete(lon,lat,gu){

	var lonlat2 = new Tmap.LonLat(lon, lat).transform("EPSG:4326", "EPSG:3857");//Icon 좌표를 설정합니다.
	var size = new Tmap.Size(24,38);//Icon 크기 설정을 합니다.
	var offset = new Tmap.Pixel(-(size.w/2), -size.h/2);//Icon 중심점을 설정합니다.
	var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_h.png', size, offset);//Icon 설정을 합니다.    
	popup = new Tmap.Popup(gu,
             lonlat2,
             new Tmap.Size(200, 100),
           	 "<div class>"+ gu+"</div>"+
           	 "<div><img  style='width: 40px; height: 50px;'  src='${pageContext.request.contextPath }/resources/img/map/standby.png'/><span><strong>0</strong></span></div>"
           	 +"<div><img  style='width: 40px; height: 50px;'  src='${pageContext.request.contextPath }/resources/img/map/gototheclient.png'/><span><strong>0</strong></span></div>"
           	 +"<div><img  style='width: 40px; height: 50px;'  src='${pageContext.request.contextPath }/resources/img/map/cleaning.png'/><span><strong>0</strong></span></div>"
           	 +"<div><img  style='width: 40px; height: 50px;'  src='${pageContext.request.contextPath }/resources/img/map/success.png'/><span><strong>0</strong></span></div>"
             , true); 
	marker = new Tmap.Markers(lonlat2, icon);
	markerLayer.addMarker(marker);
	popup.autoSize=true;
	map.addPopup(popup);
	popup.hide();
	marker.events.register("mouseover", new MarkerPopup(marker, popup), onOverMarker);//마커 마우스 오버 이벤트 등록
	marker.events.register("mouseout", new MarkerPopup(marker, popup), onOutMarker);//마커 마우스 아웃 이벤트 등록
	/* marker.events.register("click", new MarkerPopup(marker, popup), onClickMarker);//마커 마우스 아웃 이벤트 등록 */
	
	popup.events.register("mouseover", new MarkerPopup(marker, popup), onOverPopup);//마커 마우스 오버 이벤트 등록
	popup.events.register("mouseout", new MarkerPopup(marker, popup), onOutPopup);//마커 마우스 오버 이벤트 등록
	
}

function onOverPopup (evt){
	this.popup.show();
}
function onOutPopup (evt){
	this.popup.hide();
}





// pop에 달린 x 누르면 다시 이 마커에 mouseout 이벤트가 등록됨.

function onOverMarker (evt){
this.popup.show();//팝업 보이기
}
//마커에 마우스가 아웃되었을 때 발생하는 이벤트 함수입니다. 활성화 되면 팝업창이 숨겨집니다.
function onOutMarker(evt){
this.popup.hide();//팝업 숨기기
}


window.onload = function() {
    init();
}
</script>


<style>
#each-status2 input {
	border: none;
	width: 40%;
	text-align: center;
}

#each-status2 th {
	width: 30%;
	text-align: center;
}

.table4_12 table {
	margin:15px 0;
	border:0;
}
.table4_12 th {
	background-color:#50C2FF;
	color:#FFFFFF
}
.table4_12,.table4_12 th,.table4_12 td {
	font-size:0.95em;
	text-align:center;
	padding:4px;
	border-collapse:collapse;
}
.table4_12 th,.table4_12 td {
	border: 1px solid #9bdcfe;
	border-width:1px 0 1px 0
}
.table4_12 tr {
	border: 1px solid #9bdcfe;
}
.table4_12 input {
	border: none;
	width: 17%;
}
.table4_12 tr:nth-child(odd){
	background-color:#c4eafe;
}
.table4_12 tr:nth-child(even){
	background-color:#fdfdfd;
}

#divCon {
	margin: 5px 0;
	width: 660px;
	height: 160px;
	overflow-x: hidden;
	overflow-y: auto;
	border: 2px dotted #3388ff;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../admin_include/topmenu.jsp" />
	</header>

	<div class="container">
		<div class="row">
			<div class="col-lg-8">

				<article>
					<h2>Today's Schedule</h2>
					<div id="map_div"></div>

				</article>
			</div>
			<div class="col-lg-4" style="margin-top:5%">
				<h3>해방 서비스 진행 현황</h3>
				
				<div style="margin-top:5%">
					<h4>전체</h4><h6 style="color:red">확인하고 싶은 정보의 숫자를 클릭해주세요.</h6>
					<table class=table4_12 style="width:100%; height:7%">
						<tr>
							<th>call</th><th>대기중</th><th>출동중</th><th>해방중</th><th>해방완료</th>
						</tr>
						<tr>
							<td><input type="hidden" value="call"><input type="text" id="mo_callFlag" class="total" readonly="readonly"></td>
							<td><input type="hidden" value="대기중"><input type="text" id="waiting" class="total" readonly="readonly"></td>
							<td><input type="hidden" value="출동중"><input type="text" id="going" class="total" readonly="readonly"></td>
							<td><input type="hidden" value="해방중"><input type="text" id="starting" class="total" readonly="readonly"></td>
							<td><input type="hidden" value="해방완료"><input type="text" id="success" class="total" readonly="readonly"></td>
						</tr>
					</table>
				</div>
				
				<!-- 상태 숫자 클릭시 어떤 구들이 해당상태에 있는지  -->
				<div id="each-status" style="margin-top:5%">		
					<h4>진행상태 별</h4> 
					<h6 style="color:red">확인하고 싶은 정보의 주문번호를 클릭해주세요.</h6>
					<table class=table4_12 style="width:100%; height:7%" id='each-status2'>
					</table>
				</div>
				<br/>
				<input type="button" value="구별로 조회" id="searchGu">
				<div id="each-guName" style="margin-top:5%">
					<select id="guName" style="width:30%">
						<option value="">구 선택</option>
						<option value="강남구">강남구</option>
						<option value="강동구">강동구</option>
						<option value="강북구">강북구</option>
						<option value="강서구">강서구</option>
						<option value="관악구">관악구</option>
						<option value="광진구">광진구</option>
						<option value="구로구">구로구</option>
						<option value="금천구">금천구</option>
						<option value="노원구">노원구</option>
						<option value="도봉구">도봉구</option>
						<option value="노원구">노원구</option>
						<option value="동대문구">동대문구</option>
						<option value="동작구">동작구</option>
						<option value="마포구">마포구</option>
						<option value="서대문구">서대문구</option>
						<option value="서초구">서초구</option>
						<option value="성동구">성동구</option>
						<option value="성북구">성북구</option>
						<option value="송파구">송파구</option>
						<option value="양천구">양천구</option>
						<option value="영등포구">영등포구</option>
						<option value="은평구">은평구</option>
						<option value="종로구">종로구</option>
						<option value="중구">중구</option>
						<option value="중랑구">중랑구</option>
					</select>
					&nbsp;&nbsp;
					<input type="button" onclick="searchBtn()" value="검색">
					<br/>
					<div id='mustHide'>
					</div>
						<table class=table4_12 style="width:100%; height:7%" id="guStatusValue">
							<tr>
								<th>call</th><th>대기중</th><th>출동중</th><th>해방중</th><th>해방완료</th>
							</tr>
							<tr>
								<td><input type="hidden" value="call"><input type="text" id="gu_mo_callFlag" readonly="readonly"></td>
								<td><input type="hidden" value="대기중"><input type="text" id="gu_waiting" readonly="readonly"></td>
								<td><input type="hidden" value="출동중"><input type="text" id="gu_going" readonly="readonly"></td>
								<td><input type="hidden" value="해방중"><input type="text" id="gu_starting" readonly="readonly"></td>
								<td><input type="hidden" value="해방완료"><input type="text" id="gu_success" readonly="readonly"></td>
							</tr>
						</table>
				</div>
				
			</div>
		</div>
	</div>

	<footer>
		<jsp:include page="../admin_include/bottom.jsp" />
	</footer>
</body>
</html>
