<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="utf-8">
<title>해방 사장님 사이트</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />


<style type="text/css">
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}



#calendar {
	max-width: 100%;
	max-height: 100%;
	margin: 0 auto;
}

#calendar ul {
	list-style: none;
}

.menubar a:link {
	color: white;
	text-decoration: none;
}

.menubar a:visited {
	color: white;
	text-decoration: none;
}

.menubar a:hover {
	color: yellow;
	text-decoration: none;
}

table.noticetable td {
	padding: 10px;
	font-size: 15px;
	border-bottom: 1px solid #ccc;
}

table.noticetable a:link {
	color: black;
	text-decoration: none;
}

table.noticetable a:visited {
	color: black;
	text-decoration: none;
}

table.noticetable a:hover {
	color: black;
	text-decoration: none;
}
</style>





<script
	src="${ pageContext.request.contextPath }/resources/js/jquery.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/jquery.easing.1.3.js"></script>

<script
	src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=3a8e2503-7364-4259-9624-81dfdd0cb5ff"></script>

<!--Tmap api-->

<script type="text/javascript">

var map;
var marker;
var markerLayer; 
//var curlonlat;
//var curlonlat = new Tmap.LonLat(127.027606, 37.49462).transform(PR_4326, PR_3857);
var curlon;
var curlat;
var PR_3857;
var PR_4326;
var officeLocation = new Tmap.LonLat("${companyVo.c_lon}", "${companyVo.c_lat}").transform("EPSG:4326", "EPSG:3857");
var curlonlat = new Tmap.LonLat("${companyVo.c_lon}", "${companyVo.c_lat}").transform("EPSG:4326", "EPSG:3857");

function init() {
	 map = new Tmap.Map({div:'map_div', width:"100%", height:"420px", animation:true}); 
	    // div : 지도가 생성될 div의 id값과 같은 값을 옵션으로 정의 합니다.
	    // Tmap,Map 클래스에 대한 상세 사항은 "JavaScript" 하위메뉴인 "기본 기능" 페이지를 참조 해주세요. 
		map.addControl(new Tmap.Control.KeyboardDefaults());
	    markerLayer = new Tmap.Layer.Markers();
		map.addLayer(markerLayer);
		
		
		if(navigator.geolocation){
			navigator.geolocation.getCurrentPosition(function(position){
			
				curlat = position.coords.latitude;
				curlon = position.coords.longitude;
				/* alert(curlat); */
				/* WGS84GEO 짧은 lon,lat 형태 */
				/* EPSG3857 긴 lon,lat 형태 */
				
				PR_3857 = new Tmap.Projection("EPSG:3857");  // Google Mercator 좌표계인 EPSG:3857
				PR_4326 = new Tmap.Projection("EPSG:4326");  // WGS84 GEO 좌표계인 EPSG:4326        
				curlonlat = new Tmap.LonLat(127.027606, 37.49462).transform(PR_4326, PR_3857); // 짧은 lonlat을 긴 lonlat으로 바꾼다
				var cursize = new Tmap.Size(52,62);
				var curoffset = new Tmap.Pixel(-(cursize.w / 2), -(cursize.h));
				var curicon = new Tmap.Icon('${pageContext.request.contextPath }/resources/img/map/cleaning.png',cursize, curoffset);
				
				marker = new Tmap.Marker(curlonlat, curicon);
				markerLayer.addMarker(marker);
				
				console.log("curlonlat"+curlonlat);
				
			/* 	var curpopup;
				var curcontent ="<div>현재위치</div>";
				curpopup = new Tmap.Popup("cp",curlonlat,new Tmap.Size(155,50),curcontent,onPopupClose);
				curpopup.setBorder("1px solid #8d8d8d");//popup border 조절
				curpopup.autoSize=true;//popup 사이즈 자동 조절	
				map.addPopup(curpopup); // 지도에 팝업을 추가해 줍니다. 
				//curpopup.show(); // 팝업을 보여줍니다.
				//팝업창을 닫을수 있는 이벤트 함수
				function onPopupClose(){
					select.unselectAll();
				}
				 */
			})
		}
		
	var lon;
	var lat;
	var popup;
	
	$.ajax({		
		url: "${pageContext.request.contextPath}/ceo/selectAllmap",
		type: "GET",
		data: {
			go : "go"
		},
		success: function(result){
			/* ajax success function 시작 */
			console.log("result length : "+result.length);
			console.log("result[] : "+result[0]);
			
				for(i=0;i<result.length;i++){
							lon = result[i].m_lon;
							lat = result[i].m_lat;
							
							var m_lonlat = new Tmap.LonLat(lon, lat).transform("EPSG:4326", "EPSG:3857");
							 
							var size = new Tmap.Size(30,30);
							var offset = new Tmap.Pixel(-(size.w/2), -(size.h/2));
							if(i < 10){
								if(result[i].eo_status=="대기중"){		// 대기중은 색 9가지
									console.log("대기중 :" + i);
									var icon = new Tmap.Icon('${pageContext.request.contextPath }/resources/img/map/ready/no'+(i+1)+'.png', size, offset); 		// 대기
									var label = new Tmap.Label("<input type='hidden' name='label' value='" + result[i].mo_no + "'>");  
								}else if(result[i].eo_status=="출동중"){		// 출동중	사장 입장에서는 여러개 (직원수만큼)
									console.log("출동중 :" + i);
									var icon = new Tmap.Icon('${pageContext.request.contextPath }/resources/img/map/start/no'+(i+1)+'.png', size, offset); 		// 충동
									var label = new Tmap.Label("<input type='hidden' name='label' value='" + result[i].mo_no + "'>");
								}else if(result[i].eo_status=="해방중"){		// 색1가지 	사장 입장에서는 여러개
									console.log("해방중 :" + i);
									var icon = new Tmap.Icon('${pageContext.request.contextPath }/resources/img/map/ing/no'+(i+1)+'.png', size, offset); 		// 해방중
									var label = new Tmap.Label("<input type='hidden' name='label' value='" + result[i].mo_no + "'>");  
								}else {		// 완료
									console.log("완료"+i);
									var icon = new Tmap.Icon('${pageContext.request.contextPath }/resources/img/map/success/no'+(i+1)+'.png', size, offset); 		// 이게 그림
									var label = new Tmap.Label("<input type='hidden' name='label' value='" + result[i].mo_no + "'>");  
								}
							}else{		// 10개 이상 경우
									console.log("10개이상"+i);
								var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_h.png', size, offset); 
								var label = new Tmap.Label("<input type='hidden' name='label' value='" + result[i].mo_no + "'>");  
							}
							     
							console.log("m_name!!" + result[i].m_name);
							marker = new Tmap.Marker(m_lonlat, icon, label);
							markerLayer.addMarker(marker);
						if(result[i].eo_status =="대기중")
						{	popup = new Tmap.Popup("p1",
											m_lonlat,
					                        new Tmap.Size(230, 150),
					                        "<div><center>고객명 : <strong><input style='border:none' type='text' value='"+result[i].m_name+"'></strong></center></div><div><input type='hidden' value='"+result[i].m_lon+"'></div><div><input type='hidden' value='"+result[i].m_lat+"'></div><div><input type='hidden' value='"+result[i].mo_no+"'><srtong><center><font color='red'>대기 중</font></strong>인 스케쥴 입니다.</center><ul style='list-style:none'>담당 해방맨 : <strong><font color='blue'> "+ result[i].e_name +" </font></strong></ul></div><div><center><input type='button' class='start' value='출발'>&nbsp;&nbsp;&nbsp;<input type='button' class='btn-info2' value='정보보기'></center></div> <div><ul style='list-style:none'><strong><font color='blue'> 이동시 클릭 </font></strong> 해주세요.</ul></div>",
					                        false);
																		
						}else if(result[i].eo_status =="출동중")
						{
						popup = new Tmap.Popup("p1",
					                        m_lonlat,
					                        new Tmap.Size(230, 150),
					                        "<div><div id='status'><div><center>고객명 : <strong><input style='border:none' type='text' value='"+result[i].m_name+"'></strong></center></div><div><input type='hidden' value='"+result[i].m_lon+"'></div><div><input type='hidden' value='"+result[i].m_lat+"'></div><div><input type='hidden' value='"+result[i].mo_no+"'><srtong><center><font color='red'>이동 중</font></strong>인 스케쥴 입니다.</center><ul style='list-style:none'>담당 해방맨 : <strong><font color='blue'> "+ result[i].e_name +" </font></strong></ul></div><div><center><input id='"+ result[i].mo_no +"' type='button' class='arrive' value='시작'>&nbsp;&nbsp;&nbsp;<input type='button' class='btn-info2' value='정보보기'></center></div> <div><ul style='list-style:none'><strong><font color='blue'> 서비스 시작시 클릭 </font></strong> 해주세요.</ul></div></div></div>",
					                        false);
						
						}else if(result[i].eo_status =="해방중")
						{
						popup = new Tmap.Popup("p1",
			                        m_lonlat,
			                        new Tmap.Size(230,150),
			                        "<div><div id='status2'><div><center>고객명 : <strong><input style='border:none' type='text' value='"+result[i].m_name+"'></strong></center></div><div><input type='hidden' value='"+result[i].m_lon+"'></div><div><input type='hidden' value='"+result[i].m_lat+"'></div><div><input type='hidden' value='"+result[i].mo_no+"'><srtong><center><font color='red'>해방중</font></strong>인 스케쥴 입니다.</center><ul style='list-style:none'>담당 해방맨 : <strong><font color='blue'> "+ result[i].e_name +" </font></strong></ul></div><div><center><input id='"+ result[i].mo_no +"' type='button' class='conduct' value='GO!'>&nbsp;&nbsp;&nbsp;<input type='button' class='btn-info2' value='정보보기'></center></div> <div><ul style='list-style:none'><strong><font color='blue'> 완료시 버튼을</font></strong> 클릭 해주세요!</ul></div></div></div>",
			                        false);
						}else{
							popup = new Tmap.Popup("p1",
			                        m_lonlat,
			                        new Tmap.Size(230,150),
			                        "<div><div id='status3'><div><center>고객명 : <strong><input style='border:none' type='text' value='"+result[i].m_name+"'></strong></center></div><div><input type='hidden' value='"+result[i].m_lon+"'></div><div><input type='hidden' value='"+result[i].m_lat+"'></div><div><input type='hidden' value='"+result[i].mo_no+"'><srtong><center><font color='red'>해방 완료</font></strong> 스케쥴 입니다.</center><ul style='list-style:none'>담당 해방맨 : <strong><font color='blue'> "+ result[i].e_name +" </font></strong></ul></div><div><center><input id='"+ result[i].mo_no +"' type='button' class='btn-info2' value='정보보기'></center></div> <div><ul style='list-style:none'><strong>수고하셨습니다 <font color='red'>오늘도 해방 !</font></strong></ul></div></div></div>",
			                        false);	
						}
						map.addPopup(popup);
						popup.autoSize=true;//popup 사이즈 자동 조절	
						popup.hide();
		
						
						marker.events.register("mouseover", popup, onMouseMarker);	
						marker.events.register("mouseout", popup, onMouseMarker);	
						popup.events.register("mouseover", popup, onMouseMarker);	
						popup.events.register("mouseout", popup, onMouseMarker);
						
					//	marker.events.register("click",  marker , onClick);	
					//	popup.events.register("mouseout", popup, onMouseMarker);	
					
					}
			
			var lonlat1 = officeLocation;
			 
			var size1 = new Tmap.Size(32,48);
			var offset1 = new Tmap.Pixel(-(size1.w/2), -(size1.h/2)); 
			var icon1 = new Tmap.Icon('${pageContext.request.contextPath }/resources/img/map/cleaning.png', size1); 
			var label1 = new Tmap.Label("<input type='text' id='juhojuho' value='123'>");     
			marker1 = new Tmap.Markers(lonlat1, icon1, label1);
			markerLayer.addMarker(marker1);
			/* marker1.popup.show(); */
			
			marker1 = new Tmap.Markers(lonlat1, icon1, label);
			markerLayer.addMarker(marker1);
		 	console.log("setCenter" + curlonlat);
			map.setCenter(curlonlat,11);
			/* ajax success function 끝 */
			
		}
		
		
	}); 
    
}  


function onMouseMarker (evt){
    if(evt.type == "mouseover"){
        this.show();
    } else {
        this.hide();
    }
};


// eo_status update 해주는 곳  -  대기중 -> 출동중
$(document).on("click",".start",function(){				// 출발			-  eo_status 
	if(confirm('추천 이동 경로입니다.')){
		var mo_no = $(this).parents().prev().children().val();
		
		console.log("eo_status update" + mo_no);
	//	getRoute(m_lon,m_lat,'고객님',mo_no);		// 루트 그리기
		$.ajax({
			type : "POST",
			url : "${ pageContext.request.contextPath }/ceo/statusUpdate",
			data: {
				mo_no : mo_no,
				eo_status : '출동중'
			},
			dataType:"json", 
			success: function(result){
					getRoute(result.m_lon, result.m_lat ,result.m_name ,result.mo_no, result.e_name);		// 루트 그리기
					
			}
			
			
		})
		
	//	location.href = "${ pageContext.request.contextPath }/ceo/statusUpdate?mo_no="+mo_no+"&eo_status=출동중";
	}else{
		alert('취소되었습니다.');
	}

});

//eo_status update 해주는 곳  -  출동중 -> 해방중
$(document).on("click",".arrive",function(){				// 서비스 시작		- eo_startTime. eo_status 
	if(confirm('서비스를 진행 하시겠습니까?44')){
		var mo_no = $(this).parents().prev().children().val();
		
		$.ajax({
			type : "POST",
			url : "${ pageContext.request.contextPath }/ceo/statusUpdate",
			data: {
				mo_no : mo_no,
				eo_status : '해방중'
			},
			dataType:"json", 
			success: function(result){
					console.log(result + " 섭스진행 탐 ");
				//	console.log($('#status').parents().html());
					$('#status').parent().html("<div id='status2'><div><center>고객명 : <strong><input style='border:none' type='text' value='"+result.m_name+"'></strong></center></div><div><input type='hidden' value='"+result.m_lon+"'></div><div><input type='hidden' value='"+result.m_lat+"'></div><div><input type='hidden' value='"+result.mo_no+"'><srtong><center><font color='red'>해방중</font></strong>인 스케쥴 입니다.</center><ul style='list-style:none'>담당 해방맨 : <strong><font color='blue'> "+ result.e_name +" </font></strong></ul></div><div><center><input type='button' class='conduct' value='GO!'>&nbsp;&nbsp;&nbsp;<input type='button' class='btn-info2' value='정보보기'></center></div> <div><ul style='list-style:none'><strong><font color='blue'> 완료시 버튼을</font></strong> 클릭 해주세요!</ul></div></div>");
					
					console.log(result + " 섭스진행 탐2 ");
			}
		})
		
		console.log("섭스진행 !!!!!"+mo_no);
		
		
		
	}else{
		alert('취소되었습니다.');
	}
});

//eo_status update 해주는 곳  -  해방중 -> 해방완료
$(document).on("click",".conduct",function(){				// 서비스 완료		- eo_endTime. eo_status 
	var mo_no = $(this).parents().prev().children().val();
	console.log("섭스완료!!!!"+mo_no);
	
	$.ajax({
		type : "POST",
		url : "${ pageContext.request.contextPath }/ceo/statusUpdate",
		data: {
			mo_no : mo_no,
			eo_status : '해방완료'
		},
		dataType:"json", 
		
		success: function(result){
			//console.log($('#status2').parents().html());
			$('#status2').parent().html("<div id='status3'><div><center>고객명 : <strong><input style='border:none' type='text' value='"+result.m_name+"'></strong></center></div><div><input type='hidden' value='"+result.m_lon+"'></div><div><input type='hidden' value='"+result.m_lat+"'></div><div><input type='hidden' value='"+result.mo_no+"'><srtong><center><font color='red'>해방 완료</font></strong> 스케쥴 입니다.</center><ul style='list-style:none'>담당 해방맨 : <strong><font color='blue'> "+ result.e_name +" </font></strong></ul></div><div><center><input type='button' class='btn-info2' value='정보보기'></center></div> <div><ul style='list-style:none'><strong>수고하셨습니다 <font color='red'>오늘도 해방 !</font></strong></ul></div></div>");
			//				success: alert($('#status2').html("<strong>수고하셨습니다 <font color='red'>오늘도 해방 !</font></strong>"))
		}
		
		
	})
	
	
	if(confirm('서비스를 마치셨습니까?')){
	//	location.href = "${ pageContext.request.contextPath }/ceo/statusUpdate?mo_no="+mo_no+"&eo_status=해방완료";
	}else{
		alert('취소되었습니다.');
	}
});	

$(document).on("click",".btn-info2",function(){			// 해당 서비스 정보보기 - mo_no 로 정보 찾아서 팝업 띄우기
	if(confirm('스케쥴 정보를 확인 하시겠습니까?')){
		
		var mo_no = $(this).parents().prev().children().val();
		$.ajax({
			type : "GET",
			url: "${pageContext.request.contextPath}/ceo/getMemberInfoByMono",
			dataType: "json",
			data: {
				mo_no : mo_no
			},
			success: function(data){			// 모달로 보이기
				console.log("스케쥴 정보 입니다.");
				console.log(data);
				$('#det_mo_no').val(data.mo_no);
				$('#det_mo_orderNo').val(data.mo_orderNo);
				$('#det_mo_regDate').val(data.mo_regDate);
				$('#det_mo_startTime').val(data.mo_startTime);
				$('#det_mo_endTime').val(data.mo_endTime);
				$('#det_s_name').val(data.s_name);
				$('#det_s_duration').val(data.s_duration);
				
				if(data.s_type == 'h' || data.s_type == 'H'){
					$('#det_s_type').val("해충 방역");
				}else{
					$('#det_s_type').val("소독");
				}
				console.log("정기/보장 : " + data.s_style);
				
				if(data.s_style == 'J' || data.s_style == 'j'){				// 정기형
					$('#det_s_style').val("정기형");
					$('#det_mo_total').val(data.mo_total);
					$('#det_mo_cnt').val(data.mo_cnt);
					$('#det_mo_freqCycle').val(data.mo_freqCycle);
					if(data.mo_freqType == 'M' || data.mo_freqType == 'm'){
						$('#det_mo_freqTitle').val("개월 마다");
						$('#det_mo_freqType').val(data.mo_freqType);
					}else{
						$('#det_mo_freqTitle').val("주 마다");
						$('#det_mo_freqType').val(data.mo_freqType);
					}
					$('#freq').show();
					$('#cntNow').show();
					$('#totalCnt').show();
				}else{								// 보장형
					$('#det_mo_freqType').val(data.mo_freqType);
					$('#det_s_style').val("보장형");
					$('#freq').hide();
					$('#cntNow').hide();
					$('#totalCnt').hide();
				}

				if(data.mo_memo != null){
					$('#det_mo_memo').val(data.mo_memo);
					$('#memo').show();
				}else{
					$('#memo').hide();
				}
					
				console.log("해방맨 매칭 전 " + data.e_name)
				if(data.e_name != null){
					$('#det_e_name').val(data.e_name);
				//	$('#haebangMan').html("<img src='data:image/jpeg;base64," + ${empPicture} + " style='width: 40px; height: auto;' />");
					$('#det_e_phone').val(data.e_phone);
					$('#phone').show();
				}else{
					$('#det_e_name').val("해방맨 매칭 중입니다.");
					$('#phone').hide();
				}
				
//				$('#myReservDetailModal').modal('show');		모달.. 왜안뜨는지 모르겟음...
			}
			
		});
		
	}else{
		alert('취소되었습니다.');
	}
	
});
 
 
function getRoute(endLon, endLat, m_name, mo_no, e_name) {
		console.log("getRoute");
	 	console.log(mo_no);
		console.log(endLon + "/" + endLat + "/" + m_name + "/" + mo_no + "/" + e_name);
		var startPoint = curlonlat;
		var endPoint = new Tmap.LonLat(endLon, endLat).transform("EPSG:4326", "EPSG:3857");

		var optionObj = {
	             reqCoordType:"EPSG3857", //요청 좌표계 옵셥 설정입니다.
	             resCoordType:"EPSG3857"  //응답 좌표계 옵셥 설정입니다.
	             }
		
		var tData = new Tmap.TData();
		tData.getRoutePlan(startPoint, endPoint, optionObj);
	
		tData.events.register("onError", tData, onError);//데이터 로드가 실패했을 떄 발생하는 이벤트를 등록합니다.
		tData.events.register("onComplete", tData, function(){
		
		var xmlDoc = this.responseXML;
		console.log(xmlDoc);
		
		var time = $(xmlDoc).find('tmap\\:totalTime').html();

		//경로 정보 로드
		var routeFormat = new Tmap.Format.KML({extractStyles:true, extractAttributes:true});
		//KML을 구문 분석(parsing)하기 위한 새로운 파서(parser)를 생성 합니다.
		var urlStr = this.responseXML.URL;
			var prtcl = new Tmap.Protocol.HTTP({
			                                    url: urlStr,//http 요청 url 입니다.
			                                    format:routeFormat//KML을 구문 분석(parsing)하기 위한 새로운 파서
			                                    });
			var routeLayer = new Tmap.Layer.Vector("route", {protocol:prtcl, strategies:[new Tmap.Strategy.Fixed()]});//신규 벡터 레이어(vector layer)를 생성합니다.
			routeLayer.events.register("featuresadded", routeLayer, onDrawnFeatures);
			routeLayer.events.register("click", routeLayer, endLookFor);
			
			//벡터 도형(Feature)들이 트리거 된 후에 추가합니다.
			map.addLayer(routeLayer);//map에 레이어를 추가합니다.
			
			console.log('여기까지 탑니다.');
			
			var m_lonlat = new Tmap.LonLat(endLon, endLat).transform("EPSG:4326", "EPSG:3857");
			//경로 그리기 후 해당영역에 맞게 map을 줌 합니다.
			function onDrawnFeatures(e){
				map.zoomToExtent(this.getDataExtent());//지정된 영역으로 줌(Zoom)
			};
			
			alert("현재위치 부터111 "+m_name+"의 집까지 소요시간 : "+Math.ceil(time/60)+"분");
			
			function endLookFor(e){			// 팝업 창으로 보여주자
				console.log('ㅎㅎ');
				console.log(e);
				console.log('가잣');
			/* 	var popup3;
				popup3 = new Tmap.Popup("p1",
				                        new Tmap.LonLat(endLon, endLat).transform("EPSG:4326", "EPSG:3857"),
				                        new Tmap.Size(230, 150),
				                        "<div><div id='status'><div><center>고객명 : <strong><input style='border:none' type='text' value='"+m_name+"'></strong></center></div><div><input type='hidden' value='"+endLon+"'></div><div><input type='hidden' value='"+endLat+"'></div><div><input type='hidden' value='"+mo_no+"'><srtong><center><font color='red'>이동 중</font></strong>인 스케쥴 입니다.</center><ul style='list-style:none'>담당 해방맨 : <strong><font color='blue'> "+ e_name +" </font></strong></ul></div><div><center><input type='button' class='arrive' value='시작'>&nbsp;&nbsp;&nbsp;<input type='button' class='btn-info2' value='정보보기'></center></div> <div><ul style='list-style:none'><strong><font color='blue'> 서비스 시작시 클릭 </font></strong> 해주세요.</ul></div></div></div>",
					                     false);
										// console.log($(this).parents().prev().children().val());
				popup3.autoSize=true;//popup 사이즈 자동 조절		                         
				map.addPopup(popup3);//map에 popup 추가
				//map.addPopup(popup3); // 지도에 팝업 추가
				popup3.show(); // 팝업 보이기
				

				popup3.events.register("mouseover", popup3, onMouseMarker);	
				popup3.events.register("mouseout", popup3, onMouseMarker); 
				 */
				
				this.destroy();
				map.destroy();	
				init();
				
			/* 	if(confirm("해방 서비스를 11시작 하십니까?")){
				} */
			};
			
			
		function onMouseMarker (evt){
			 if(evt.type == "mouseover"){
		        this.show();
			 }
		//	 	else if(evt.type == "mouseout"){		// 숨겼다가 다시 팝업이 생길경우 html() 이 안먹음.. 이전 popup이 다시 뜸
		//       	this.hide();
		 //   }
		    
		};
			
			
			
		//	endLookFor();
			
		});

	};


//데이터 로드중 발생하는 이벤트 함수입니다.
function onProgress(){
	//alert("onComplete");
};
//데이터 로드시 에러가 발생시 발생하는 이벤트 함수입니다.
function onError(){
	alert("onError");
};










</script>



<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5a0aa9aa198bd56b8c03afe2/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->

<style type="text/css">
.btn-info1:hover {
	color: #000000;
	border: 1px solid #000000;
}

.btn-info1 {
	color: #000000;
	border: 0.5px thin #000000;
}

.menubar {
	float: left;
	margin-top: 30px;
	font-size: 20px;
	margin-left: 100px;
	margin-right: 100px;
}
</style>


</head>
<body>
	<div id="wrapper">
		<header>
			<jsp:include page="../employee_include/topmenu.jsp" />
		</header>
		<jsp:include page="../company_main/scheduleInfoDetail.jsp"></jsp:include>
		<!--  모달 -->
		<jsp:include page="../employee_include/loginModal.jsp" />



		<div class="wrap main">

			<!-- 롤링 메인 배너 + 로그인 -->
			<div class="main_rolling">

				<div class="owl-carousel">
					<div class="item">
						<div class="bg_in bg_cover" style="width: 100%;">
							<div class="align">
								<img
									src="${pageContext.request.contextPath}/resources/img/companyMain.jpg"
									style="width: 100%;" />
							</div>
						</div>
					</div>

					<!--       <div class="item">
                <div class="bg_in bg_cover" style="background:url('https://image.goodchoice.kr/images/newad/roll_bg_01.png') 0 0 no-repeat;">
                    <div class="align">
                        <img src="https://image.goodchoice.kr/images/newad/roll_txt_01.png" alt="이용자 수, 제휴점 수, 만족도 1위! 왜 여기어때는 선택이 아닌 필수여야 하는가. 마케팅! 어디서부터, 어떻게 시작할지 막막하신가요? 왜 '여기어때' 를 선택해야 하는지 자세히 알려드립니다." />
                        <a href="/service/ciYeogi" style="top:203px;width:124px"><span>자세히 보기</span></a>
                    </div>
                </div>
            </div> -->

				</div>
			</div>
		</div>


		<section id="inner-headline">
			<!-- <div class="container"> -->
			<div class="row">
				<div
					style="text-align: center; width: 100%; height: 80px; background-color: #1b7fb5; display: table;">
					<div style="display: inline-block; vertical-align: middle;">

						<div class="menubar">
							<c:if test="${ empty userVo }">
								<a href="#myModal" data-toggle="modal"> <i
									class="fa fa-calculator" aria-hidden="true"
									style="padding-right: 10px;"></i> 정산관리
								</a>
							</c:if>
							<c:if test="${ not empty userVo }">
								<a href="#"> <i class="fa fa-calculator" aria-hidden="true"
									style="padding-right: 10px;"></i> 정산관리
								</a>
							</c:if>
						</div>


						<div class="menubar">
							<c:if test="${ empty userVo }">
								<a href="#myModal" data-toggle="modal"> <i
									class="fa fa-calendar-check-o" aria-hidden="true"
									style="padding-right: 10px;"></i> 스케쥴관리
								</a>
							</c:if>
							<c:if test="${ not empty userVo }">
								<a href="${ pageContext.request.contextPath }/ceo/schedule">
									<i class="fa fa-calendar-check-o" aria-hidden="true"
									style="padding-right: 10px;"></i> 스케쥴관리
								</a>
							</c:if>
						</div>

						<div class="menubar">
							<c:if test="${ empty userVo }">
								<a href="#myModal" data-toggle="modal"> <i
									class="fa fa-line-chart" aria-hidden="true"
									style="padding-right: 10px;"></i> 종합통계
								</a>
							</c:if>
							<c:if test="${ not empty userVo }">
								<a href="#"> <i class="fa fa-line-chart" aria-hidden="true"
									style="padding-right: 10px;"></i> 종합통계
								</a>
							</c:if>
						</div>

						<div class="menubar">
							<c:if test="${ empty userVo }">
								<a href="#myModal" data-toggle="modal"> <i
									class="fa fa-search-plus" aria-hidden="true"
									style="padding-right: 10px;"></i> 예약상세보기
								</a>
							</c:if>
							<c:if test="${ not empty userVo }">
								<a href="#"> <i class="fa fa-search-plus" aria-hidden="true"
									style="padding-right: 10px;"></i> 예약상세보기
								</a>
							</c:if>
						</div>

					</div>
				</div>
			</div>
		</section>

		<div class="container">
			<div class="row">
				<div class="col-lg-8">

					<article>
						<c:if test="${ not empty userVo }">
							<h4>Today's Schedule</h4>
							<div id="map_div"></div>
							<ul style="margin-top: 2%">
								<li style="width: 70%"><span class="fc-event-dot"
									style="background-color: rgb(68, 193, 195);"></span>&nbsp;&nbsp;<input
									style='border: none; width: 20%' type="text" value="대기중">
									<span class="fc-event-dot"
									style="background-color: rgb(255, 153, 153);"></span>&nbsp;&nbsp;<input
									style='border: none; width: 20%' type="text" value="출동중">
									<span class="fc-event-dot"
									style="background-color: rgb(178, 255, 102);"></span>&nbsp;&nbsp;<input
									style='border: none; width: 20%' type="text" value="해방중">
									<span class="fc-event-dot"
									style="background-color: rgb(224, 224, 224);"></span>&nbsp;&nbsp;<input
									style='border: none; width: 20%' type="text" value="해방완료">
								</li>
							</ul>
						</c:if>
					</article>

					<c:choose>
						<c:when test="${ empty userVo }">


							<article>

								<h4>
									<strong>공지사항</strong>
								</h4>
								<br />



								<table class="noticetable" style="width: 680px;">


									<tbody>
										<c:forEach items="${ mainNoticelist }" var="board"
											varStatus="loop">
											<tr>
												<td><a
													href="javascript:doAction(${ board.n_no }, ${ board.n_viewCnt })">
														<c:out value="${ board.n_title }" />
												</a></td>
												<td style="width: 15%;">${ board.n_regDate }</td>
											</tr>
										</c:forEach>

										<c:if test="${ count eq 0 }">
											<tr>
												<td colspan="6" align="center">게시글이 없습니다.</td>
											</tr>
										</c:if>
									</tbody>
								</table>
							</article>
							<br />
							<br />



						</c:when>
						<c:otherwise>


							<h4>
								<strong>공지사항</strong>
							</h4>
							<br />



							<table class="noticetable" style="width: 800px;">


								<tbody>
									<c:forEach items="${ mainNoticelist }" var="board"
										varStatus="loop">
										<tr>
											<td><a
												href="javascript:doAction(${ board.n_no }, ${ board.n_viewCnt })">
													<c:out value="${ board.n_title }" />
											</a></td>
											<td style="width: 15%;">${ board.n_regDate }</td>
										</tr>
									</c:forEach>

									<c:if test="${ count eq 0 }">
										<tr>
											<td colspan="6" align="center">게시글이 없습니다.</td>
										</tr>
									</c:if>
								</tbody>
							</table>
							</article>
							<br />
							<br />


						</c:otherwise>
					</c:choose>
					
					<br />
					<br />
					

					<article>
					<div style="width:700px;">
						<div class="post-slider">
							<div class="post-heading">
								<h4>Tips</h4>
								<h3>
									<a href="#">우리 업체 필증 발급, 정확하게 하고있나요?</a>
								</h3>
							</div>
							<!-- start flexslider -->
							<img
								src="${ pageContext.request.contextPath }/resources/img/pestcontrol.jpg"
								alt="" width="700px" height="300px" />
							<%-- <ul class="slides">
											<li>
												<img src="${ pageContext.request.contextPath }/resources/img/pestcontrol.jpg" alt="" width="700px" height="300px" />
											</li>
											<li>
												<img src="${ pageContext.request.contextPath }/resources/img/dummies/blog/img2.jpg" alt="" />
											</li>
											<li>
												<img src="${ pageContext.request.contextPath }/resources/img/dummies/blog/img3.jpg" alt="" />
											</li>
										</ul>
									</div> --%>
							<!-- end flexslider -->
						</div>
						<p>소독필증은 대상시설물 교부용1부,보건소신고용1부,회사보관용1부 총3부를 작성하여 소독실시후 소독회사는
							반드시 소독실시 대상시설물에 1부를 교부하고, 시설물 소재지 관할 보건소에 소독신고서와 같이 1부를 제출하고 나머지
							1부는 소독회사에서 보관합니다.</p>
						<div class="bottom-article">
							<ul class="meta-post">
								<li><i class="icon-calendar"></i><a href="#"> 2018년 1월 2일,
										</a></li>
								<li><i class="icon-user"></i><a href="#"> 관리자</a></li>
								<li><i class="icon-folder-open"></i><a href="#"> Tips</a></li>
								<li><i class="icon-comments"></i><a href="#">댓글 4개</a></li>
							</ul>
							<a href="#" class="pull-right">더보기 <i
								class="icon-angle-right"></i></a>
						</div>
						</div>
					</article>






				</div>
				<div class="col-lg-4">
					<aside class="right-sidebar">
						<div class="widget">
							<c:if test="${ empty userVo }">
								<div style="margin-top: 30px; margin-bottom: 40px;">
									<h4>CEO Login</h4>
								</div>
								<form:form name="lform"
									action="${ pageContext.request.contextPath }/ceo"
									commandName="employeeVo" onsubmit="return checkForm()"
									method="post">

									<form:input class="form-control" placeholder="아이디" type="text"
										size="20" name="e_id" id="e_id" path="e_id"
										style="margin-bottom:10px; height:45px;" />


									<form:input class="form-control" placeholder="비밀번호"
										type="password" size="20" name="e_password" id="e_password"
										path="e_password" style="margin-bottom:10px; height:45px;" />
									<span style="color: red;">${errorMessage }</span>


								<div align="center" style="margin-top:20px;">
									<span style="font-size: small; text-align: right;"><a
										href="${ pageContext.request.contextPath }/ceo/forgotmyid">아이디</a>
										/ <a
										href="${ pageContext.request.contextPath }/ceo/forgotmypassword">비밀번호</a> 찾기</span> | 
										<a href="${ pageContext.request.contextPath }/ceo/register/join">회원가입</a>
										<br/>
								</div>

									<input type="submit" class="btn btn-theme"
										style="margin-top: 10px; width: 320px; background-color: #019ad2; height: 60px; font-size: large;"
										id="login_btn" value="로그인">&nbsp;										
							
								</form:form>

								

							</c:if>
							<c:if test="${ not empty userVo }">
			${ userVo.e_name }&nbsp; ${ userVo.e_type }님 환영합니다. <br />

								<div align="right">
									<a href="${ pageContext.request.contextPath }/logout">로그아웃</a>
								</div>
							</c:if>
						</div>
						

						<c:if test="${ not empty userVo }">
							<div class="widget">
								<h5 class="widgetheading">오늘의 스케쥴</h5>
								<input type="hidden" id="scheduleOpen"
									value="${ userVo.e_type } ">
								<div id='calendar'>
									<div>
										<ul style="margin-top: 2%">
											<li style="width: 80%"><span class="fc-event-dot"
												style="background-color: rgb(68, 193, 195);"></span>&nbsp;&nbsp;<input
												style='border: none; width: 40%' type="text" value="대기중">
												<span class="fc-event-dot"
												style="background-color: rgb(255, 153, 153);"></span>&nbsp;&nbsp;<input
												style='border: none; width: 40%' type="text" value="출동중">
											</li>
											<li style="width: 80%"><span class="fc-event-dot"
												style="background-color: rgb(178, 255, 102);"></span>&nbsp;&nbsp;<input
												style='border: none; width: 40%' type="text" value="해방중">
												<span class="fc-event-dot"
												style="background-color: rgb(224, 224, 224);"></span>&nbsp;&nbsp;<input
												style='border: none; width: 40%' type="text" value="해방완료">
											</li>
										</ul>
									</div>
								</div>
							</div>
						</c:if>
						
						
						
												
						<br/>
						<br/>
						<br/>
						
						<div class="widget">
						<input type="button" class="btn btn-theme"
										style="margin-top: 10px; width: 320px; box-shadow: 4px 4px 10px 0px rgba(0,0,0,0.75); border: 1px solid darkgray; background-color: white; height: 40px; color: #3B3B3B; font-size: normal;"
										 value="1:1문의하기 >">
						<input type="button" class="btn btn-theme"
										style="margin-top: 10px; width: 320px; box-shadow: 4px 3px 10px 0px rgba(0,0,0,0.75); border: 1px solid darkgray; background-color: white; height: 40px; color: #3B3B3B;  font-size: normal;"
										 value="자주묻는질문">
						
						</div>
						
						
						
						
						
					</aside>
				</div>
			</div>
		</div>
		
		<footer >
			<jsp:include page="../employee_include/bottom.jsp" />
		</footer>
	</div>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
</body>

<link
	href="${ pageContext.request.contextPath }/resources/fullcalendar-3.7.0/fullcalendar.css"
	rel="stylesheet" />
<link
	href="${ pageContext.request.contextPath }/resources/fullcalendar-3.7.0/fullcalendar.print.css"
	rel="stylesheet" media="print" />

<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/fullcalendar-3.7.0/lib/moment.min.js"></script>
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/fullcalendar-3.7.0/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/fullcalendar-3.7.0/fullcalendar.js"></script>
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/fullcalendar-3.7.0/locale-all.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	if($('#scheduleOpen').val()) {			// 이게 뭐야
	    $.ajax({    	
	    	
	    	type : "POST",
	    	url : "${ pageContext.request.contextPath }/ceo/myScheduleList",
	    	dataType : "json",
	    	contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	    	error : function(request, status, error){
	    		alert("code : "+request.status + "\r\nmessage : " + request.reponseText);	    		
	    	},
	    	success : function(data){
	    		setCalendar(data);
	    		
	    	}
	    	
	    });
	    
		
		function setCalendar(data){
	    	
	    	  var jsonData = data;
	
	    	  console.log(jsonData);
	    	  
	    	 $("#calendar").fullCalendar({
	    		header: {
	 				left: 'title',
	 				right: 'month,listWeek'	 				
	 			},
	 			defaultView: 'listWeek',
	           editable : false,
	           events: jsonData,
	           locale: 'ko',
	           timeFormat: 'H(:mm)',
	           eventClick:function(event) {
	        	   
	        	   console.log(event);
	        	   console.log("m_lon 값 넘어옴 :"+event.m_lon);
	        	   console.log("e_name 값 넘어옴 :"+event.e_name);
	        	   console.log("mo_no 값 넘어옴 :"+event.mo_no);
	        	   console.log("startDay 값 넘어옴 :"+event.startDay);
	        	   
	        	   var st_date = new Date().toISOString().substr(0, 10).replace('T', ' ');
	        	   console.log(st_date);
	        	   
		        	 if(event.startDay == st_date){
		        		 
				        	   if(event.color == 'rgb(68,193,195)'){
				        		   if(confirm("해당 스케쥴로 이동 하시겠습니까 ?")){
					        		   console.log('대기중 클릭됨!');
					        		   alert('대기중 클릭됨 -> 출동으로 변환!');
						        	   getRoute(event.m_lon, event.m_lat, event.m_name, event.mo_no, event.e_name);				// 클릭 된 고객의 m_lon,m_lat,m_name 
				        		   }
				        	   }else if(event.color == "rgb(255,153,153)"){
				        		   if(confirm("해방 진행 하시겠습니까?")){
				        			   
				        			   var mo_no = event.mo_no;
					        		   console.log('출동중 클릭됨!');
					        		   
					        		   $('#'+mo_no).click();
					        		   alert('출동중 클릭됨 -> 해방중으로 변환!');
				        		   }
				        	   }else if(event.color == "rgb(178,255,102)"){
				        		   if(confirm("해방 진행 하시겠습니까?")){
				        			   var mo_no = event.mo_no;
				        			   $('#'+mo_no).click();
					        		   console.log('해방중 클릭됨!');
				        		   }
				        	   }else{
				        		   var mo_no = event.mo_no;
			        			   $('#'+mo_no).click();
				        		   alert("해당 스케쥴은 완료상태 입니다. ");
				        	   }
		        		
		        		 
		        	 }else{
		        		 if(confirm("해당 스케쥴은 오늘 일정이 아닙니다. 이동경로를  확인 하시겠습니까 ?")){
					        	   getRoute(event.m_lon, event.m_lat, event.m_name, event_mo_no, event.e_name );				// 클릭 된 고객의 m_lon,m_lat,m_name 
		        			 
		        	 	 }
		           	 }
	           }
	        	 
	        	 
	       });
	
		};
	 
	}

	
	
	
	
	
	
	
});



</script>



<script>
    function isNull(obj, msg) {
    	if (obj.value == "") {
    		alert(msg);
    		obj.focus();
    		return true;
    	}
    	return false;
    }

    
    function checkForm(){
    	    		
    	var f = document.lform;
    	
    	if(isNull(f.e_id, '아이디를 입력해 주세요')){
    		return false;
    	}
    	
    	if(isNull(f.e_password, '패스워드를 입력해 주세요')){
    		return false;
    	}
    }

    function doAction(boardNo,n_viewCnt) {
		location.href = "${ pageContext.request.contextPath }/ceo/ceoNoticeDetail?no=" + boardNo + "&n_viewCnt=" + n_viewCnt;

	}
    
    
  </script>
</html>
