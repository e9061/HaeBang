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
	name : "강북구청청", 
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
	 map = new Tmap.Map({div:'map_div', width:"100%", height:"300px", animation:true}); 
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


<style type="text/css">
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
					<%-- <c:if test="${ not empty userVo }"> --%>
					<h4>Today's Schedule</h4>
					<div id="map_div"></div>

					<%-- </c:if> --%>
				</article>
			</div>
		</div>
	</div>

	<footer>
		<jsp:include page="../admin_include/bottom.jsp" />
	</footer>
</body>
</html>

