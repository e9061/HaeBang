<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<title>해방 사장님 사이트</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />


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





<script src="${ pageContext.request.contextPath }/resources/js/jquery.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/js/jquery.easing.1.3.js"></script>

 <script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=3a8e2503-7364-4259-9624-81dfdd0cb5ff"></script>

<!--Tmap api-->

<script type="text/javascript">

var map;
var marker;
var markerLayer;
var curlonlat;  // 긴 형태 
var curlon;
var curlat;
var PR_3857;
var PR_4326;
var officeLocation = new Tmap.LonLat("${companyVo.c_lon}", "${companyVo.c_lat}").transform("EPSG:4326", "EPSG:3857");


function init() {
	 map = new Tmap.Map({div:'map_div', width:"100%", height:"300px", animation:true}); 
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
				curlonlat = new Tmap.LonLat(curlon, curlat).transform(PR_4326, PR_3857); // 짧은 lonlat을 긴 lonlat으로 바꾼다
				var cursize = new Tmap.Size(24, 38);
				var curoffset = new Tmap.Pixel(-(cursize.w / 2), -(cursize.h));
				var curicon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_h.png',cursize, curoffset);
				
				marker = new Tmap.Marker(curlonlat, curicon);
				markerLayer.addMarker(marker);
				
				var curpopup;
				var curcontent ="<div>현재위치</div>";
				curpopup = new Tmap.Popup("cp",curlonlat,new Tmap.Size(155,50),curcontent,onPopupClose);
				curpopup.setBorder("1px solid #8d8d8d");//popup border 조절
				curpopup.autoSize=true;//popup 사이즈 자동 조절	
				map.addPopup(curpopup); // 지도에 팝업을 추가해 줍니다. 
				curpopup.show(); // 팝업을 보여줍니다.
				//팝업창을 닫을수 있는 이벤트 함수
				function onPopupClose(){
					select.unselectAll();
				}
				
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
			for(i=0;i<result.length;i++)
				{
					lon = result[i].m_lon;
					lat = result[i].m_lat;
					
					var m_lonlat = new Tmap.LonLat(lon, lat).transform("EPSG:4326", "EPSG:3857");
					 
					var size = new Tmap.Size(24,38);
					var offset = new Tmap.Pixel(-(size.w/2), -(size.h/2));
					var icon = new Tmap.Icon('https://developers.skplanetx.com/upload/tmap/marker/pin_b_m_a.png', size, offset); 
					     
					marker = new Tmap.Marker(m_lonlat, icon);
					markerLayer.addMarker(marker);
				if(result[i].eo_status =="대기중")
				{	popup = new Tmap.Popup("p1",
									m_lonlat,
			                        new Tmap.Size(150, 200),
			                        "<div>고객명 : "+result[i].m_name+" 고객님</div>"+"<div><span>주소 : </span><span>"+result[i].m_address+"</span></div>"+"<div>담당 해방맨 : "+result[i].e_name+"</div>"+"<div>진행상태 : "+
			                        result[i].eo_status+"</div>"+"<div><a class='btn btn-info1 start' style='width: 50px'>출발</a><input type='hidden' value='"+lon+"'/><input type='hidden' value='"+lat+"'/><input type='hidden' id='"+result[i].mo_no+"' value='"+result[i].mo_no+"'/></div>",
			                        true);
				
				}else if(result[i].eo_status =="출동중")
					{
					popup = new Tmap.Popup("p1",
	                        m_lonlat,
	                        new Tmap.Size(150, 200),
	                        "<div>고객명 : "+result[i].m_name+" 고객님</div>"+"<div><span>주소 : </span><span>"+result[i].m_address+"</span></div>"+"<div>담당 해방맨 : "+result[i].e_name+"</div>"+"<div>진행상태 : "+
	                        result[i].eo_status+"</div>"+"<div><a class='btn btn-info1 try' style='width: 80px'>도전! 해방</a></div>",
	                        true);
					
					}else if(result[i].eo_status =="해방중")
						{
						popup = new Tmap.Popup("p1",
		                        m_lonlat,
		                        new Tmap.Size(150, 200),
		                        "<div>고객명 : "+result[i].m_name+" 고객님</div>"+"<div><span>주소 : </span><span>"+result[i].m_address+"</span></div>"+"<div>담당 해방맨 : "+result[i].e_name+"</div>"+"<div>진행상태 : "+
		                        result[i].eo_status+"</div>"+"<div><a class='btn btn-info1 succeed' style='width: 80px'>해방 성공!</a></div>",
		                        true);
						
						}
				map.addPopup(popup);
				popup.autoSize=true;//popup 사이즈 자동 조절	
				popup.hide();

				
				marker.events.register("mouseover", popup, onMouseMarker);	
				marker.events.register("mouseout", popup, onMouseMarker);	
				popup.events.register("mouseover", popup, onMouseMarker);	
				popup.events.register("mouseout", popup, onMouseMarker);	
				
				}
			
			var lonlat1 = officeLocation;
			 
			var size1 = new Tmap.Size(24,38);
			var offset1 = new Tmap.Pixel(-(size1.w/2), -(size1.h/2)); 
			var icon1 = new Tmap.Icon('${pageContext.request.contextPath }/resources/img/map/laboratory.png', size1); 
			var label = new Tmap.Label("우리회사");     
			marker1 = new Tmap.Markers(lonlat1, icon1, label);
			markerLayer.addMarker(marker1);
			/* marker1.popup.show(); */
			
			
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
}






 




$(document).on("click",".start",function(){
	
	getRoute($(this).next().val(), $(this).next().next().val(), $(this).parents().prev().prev().prev().prev().html());
	
	$.ajax({
		url : "${ pageContext.request.contextPath }/ceo/updateEOrderStatus",
		type : "POST",
		data : {
			mo_no : $(this).next().next().next().val(),
		},
		success : changeStatus 
	});
	
	function changeStatus(result){
		console.log(result);
		$(document.getElementById(result.mo_no)).parents().prev()[0].innerHTML ="진행상태 : "+result.eo_status;
		$(document.getElementById(result.mo_no)).parents().children().first().html('도전! 해방');
		$(document.getElementById(result.mo_no)).parents().children().first().attr('class','btn btn-info1 try');
	}
})

function getRoute(endLon, endLat, endName) {

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
			
			//경로 그리기 후 해당영역에 맞게 map을 줌 합니다.
			function onDrawnFeatures(e){
				map.zoomToExtent(this.getDataExtent());//지정된 영역으로 줌(Zoom)
			}
			function endLookFor(e){
				alert("현재위치부터 "+endName+"의 집까지 소요시간 : "+time/60+"분");
				this.destroy();
			}
			
			
			
			
		});

	}


//데이터 로드중 발생하는 이벤트 함수입니다.
function onProgress(){
	//alert("onComplete");
}
//데이터 로드시 에러가 발생시 발생하는 이벤트 함수입니다.
function onError(){
	alert("onError");
}










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
  color : #000000;
  border: 1px solid #000000;
}
.btn-info1 {
  color : #000000;
  border: 0.5px thin #000000;
}



</style>


</head>
<body>
	<div id="wrapper">
		<header>
			<jsp:include page="../employee_include/topmenu.jsp" />
		</header>
		
		<jsp:include page="../employee_include/loginModal.jsp" />

 		<section id="inner-headline">
			<div class="container">
				<div class="row" >
				<div width="100%" height="300px">
					<div class="col-lg-12">
						<br /> <br /> <br />
					</div>
				</div>
			</div>
		</section>
		
			<div class="container">
				<div class="row">
					<div class="col-lg-8">
	
						<article> <c:if test="${ not empty userVo }">
							<h4>Today's Schedule</h4>
						<div id="map_div"></div>
							
						</c:if> </article>
	
						<c:choose>
						<c:when test="${ empty userVo }">
						
												
						<article>
	
						<h4>
							<strong>공지사항</strong>
						</h4>
						<br/>				
	
	
	
					<table style="width: 800px;">
						
	
						<tbody>
							<c:forEach items="${ mainNoticelist }" var="board" varStatus="loop">
								<tr>
									<td><a href="javascript:doAction(${ board.n_no }, ${ board.n_viewCnt })"> 
									<c:out value="${ board.n_title }" />
									</a></td>
									<td>${ board.n_regDate }</td>
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
					<br/> <br/>
	
					<article>
					<h4>Quick Menu</h4>
					<c:if test="${ empty userVo }">
						<a href="#myModal" class="trigger-btn" data-toggle="modal"> <img
							src="${ pageContext.request.contextPath }/resources/img/calculate.jpg"
							width="160px" />
						</a>
					</c:if> <c:if test="${ not empty userVo }">
						<a href="#"> <img
							src="${ pageContext.request.contextPath }/resources/img/calculate.jpg"
							width="160px" />
						</a>
					</c:if> &nbsp;&nbsp;&nbsp; <c:if test="${ empty userVo }">
						<a href="#myModal" class="trigger-btn" data-toggle="modal"> <img
							src="${ pageContext.request.contextPath }/resources/img/schedule.jpg"
							width="160px" />
						</a>
					</c:if> <c:if test="${ not empty userVo }">
						<a href="#"> <img
							src="${ pageContext.request.contextPath }/resources/img/schedule.jpg"
							width="160px" />
						</a>
					</c:if> &nbsp;&nbsp;&nbsp; <c:if test="${ empty userVo }">
						<a href="#myModal" class="trigger-btn" data-toggle="modal"> <img
							src="${ pageContext.request.contextPath }/resources/img/statistics.jpg"
							width="180px" />
						</a>
					</c:if> <c:if test="${ not empty userVo }">
						<a href="#"> <img
							src="${ pageContext.request.contextPath }/resources/img/statistics.jpg"
							width="180px" />
						</a>
					</c:if> &nbsp;&nbsp;&nbsp; <c:if test="${ empty userVo }">
						<a href="#myModal" class="trigger-btn" data-toggle="modal"> <img
							src="${ pageContext.request.contextPath }/resources/img/revdetail.jpg"
							width="160px" />
						</a>
					</c:if> <c:if test="${ not empty userVo }">
						<a href="#"> <img
							src="${ pageContext.request.contextPath }/resources/img/revdetail.jpg"
							width="160px" />
						</a>
					</c:if> </article>
	
	</c:when>
	<c:otherwise>
	
	<article>
					<h4>Quick Menu</h4>
					<c:if test="${ empty userVo }">
						<a href="#myModal" class="trigger-btn" data-toggle="modal"> <img
							src="${ pageContext.request.contextPath }/resources/img/calculate.jpg"
							width="160px" />
						</a>
					</c:if> <c:if test="${ not empty userVo }">
						<a href="#"> <img
							src="${ pageContext.request.contextPath }/resources/img/calculate.jpg"
							width="160px" />
						</a>
					</c:if> &nbsp;&nbsp;&nbsp; <c:if test="${ empty userVo }">
						<a href="#myModal" class="trigger-btn" data-toggle="modal"> <img
							src="${ pageContext.request.contextPath }/resources/img/schedule.jpg"
							width="160px" />
						</a>
					</c:if> <c:if test="${ not empty userVo }">
						<a href="#"> <img
							src="${ pageContext.request.contextPath }/resources/img/schedule.jpg"
							width="160px" />
						</a>
					</c:if> &nbsp;&nbsp;&nbsp; <c:if test="${ empty userVo }">
						<a href="#myModal" class="trigger-btn" data-toggle="modal"> <img
							src="${ pageContext.request.contextPath }/resources/img/statistics.jpg"
							width="180px" />
						</a>
					</c:if> <c:if test="${ not empty userVo }">
						<a href="#"> <img
							src="${ pageContext.request.contextPath }/resources/img/statistics.jpg"
							width="180px" />
						</a>
					</c:if> &nbsp;&nbsp;&nbsp; <c:if test="${ empty userVo }">
						<a href="#myModal" class="trigger-btn" data-toggle="modal"> <img
							src="${ pageContext.request.contextPath }/resources/img/revdetail.jpg"
							width="160px" />
						</a>
					</c:if> <c:if test="${ not empty userVo }">
						<a href="#"> <img
							src="${ pageContext.request.contextPath }/resources/img/revdetail.jpg"
							width="160px" />
						</a>
					</c:if> </article>
					
					<article>
	
						<h4>
							<strong>공지사항</strong>
						</h4>
						<br/>				
	
	
	
					<table style="width: 800px;">
						
	
						<tbody>
							<c:forEach items="${ mainNoticelist }" var="board" varStatus="loop">
								<tr>
									<td><a href="javascript:doAction(${ board.n_no }, ${ board.n_viewCnt })"> 
									<c:out value="${ board.n_title }" />
									</a></td>
									<td>${ board.n_regDate }</td>
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
					<br/> <br/>
	
	
	</c:otherwise>
						</c:choose>
	
					<article>
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
					<p>소독필증은 대상시설물 교부용1부,보건소신고용1부,회사보관용1부 총3부를 작성하여 소독실시후 소독회사는 반드시
						소독실시 대상시설물에 1부를 교부하고, 시설물 소재지 관할 보건소에 소독신고서와 같이 1부를 제출하고 나머지 1부는
						소독회사에서 보관합니다.</p>
					<div class="bottom-article">
						<ul class="meta-post">
							<li><i class="icon-calendar"></i><a href="#"> Mar 23,
									2013</a></li>
							<li><i class="icon-user"></i><a href="#"> Admin</a></li>
							<li><i class="icon-folder-open"></i><a href="#"> Blog</a></li>
							<li><i class="icon-comments"></i><a href="#">4 Comments</a></li>
						</ul>
						<a href="#" class="pull-right">Continue reading <i
							class="icon-angle-right"></i></a>
					</div>
					</article>
	
	
	
	
	
	
					<article>
					<div class="post-quote">
						<div  class="post-heading">
							<h3>
								<a href="#">Nice example of quote post format below</a>
							</h3>
						</div>
						<blockquote>
							<i class="icon-quote-left"></i> Lorem ipsum dolor sit amet, ei
							quod constituto qui. Summo labores expetendis ad quo, lorem
							luptatum et vis. No qui vidisse signiferumque...
						</blockquote>
					</div>
					<div class="bottom-article">
						<ul class="meta-post">
							<li><i class="icon-calendar"></i><a href="#"> Mar 23,
									2013</a></li>
							<li><i class="icon-user"></i><a href="#"> Admin</a></li>
							<li><i class="icon-folder-open"></i><a href="#"> Blog</a></li>
							<li><i class="icon-comments"></i><a href="#">4 Comments</a></li>
						</ul>
						<a href="#" class="pull-right">Continue reading <i
							class="icon-angle-right"></i></a>
					</div>
					</article>
					<article>
					<div class="post-video">
						<div class="post-heading">
							<h3>
								<a href="#">Amazing video post format here</a>
							</h3>
						</div>
						<div class="video-container">
							<iframe
								src="http://player.vimeo.com/video/30585464?title=0&amp;byline=0">
							</iframe>
						</div>
					</div>
					<p>Qui ut ceteros comprehensam. Cu eos sale sanctus eligendi, id
						ius elitr saperet, ocurreret pertinacia pri an. No mei nibh
						consectetuer, semper laoreet perfecto ad qui, est rebum nulla
						argumentum ei. Fierent adipisci iracundia est ei, usu timeam
						persius ea. Usu ea justo malis, pri quando everti electram ei.</p>
					<div class="bottom-article">
						<ul class="meta-post">
							<li><i class="icon-calendar"></i><a href="#"> Mar 23,
									2013</a></li>
							<li><i class="icon-user"></i><a href="#"> Admin</a></li>
							<li><i class="icon-folder-open"></i><a href="#"> Blog</a></li>
							<li><i class="icon-comments"></i><a href="#">4 Comments</a></li>
						</ul>
						<a href="#" class="pull-right">Continue reading <i
							class="icon-angle-right"></i></a>
					</div>
					</article>
					<div id="pagination">
						<span class="all">Page 1 of 3</span> <span class="current">1</span>
						<a href="#" class="inactive">2</a> <a href="#" class="inactive">3</a>
					</div>
				</div>
				<div class="col-lg-4">
					<aside class="right-sidebar">
					<div class="widget">
						<h4>Login</h4>
						<c:if test="${ empty userVo }">
							<form:form name="lform"	action="${ pageContext.request.contextPath }/ceo"
								commandName="employeeVo" onsubmit="return checkForm()"
								method="post"> 
					Username&nbsp;<form:input class="form-control" placeholder="아이디"
									type="text" size="20" name="e_id" id="e_id" path="e_id" />
								<br />
					
					Password&nbsp;<form:input class="form-control" placeholder="비밀번호"
									type="password" size="20" name="e_password" id="e_password"
									path="e_password" />
								<span style="color: red;">${errorMessage }</span>
								<br />						
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span style="font-size:small; text-align:right;"><a href="${ pageContext.request.contextPath }/ceo/forgotmyid">아이디</a> / <a href="${ pageContext.request.contextPath }/ceo/forgotmypassword">비밀번호</a>가 기억나지 않아요!</span><br/>
								 <br/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="submit" class="btn btn-theme" id="login_btn"
									value="로그인">&nbsp;
										
							<a href="${ pageContext.request.contextPath }/ceo/register/join"><input class="btn btn-theme" type="button" id="register_btn" value="회원가입"></a>
							</form:form>
						</c:if>
						<c:if test="${ not empty userVo }">
			${ userVo.e_name }&nbsp; ${ userVo.e_type }님 환영합니다. <br />
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="${ pageContext.request.contextPath }/logout">로그아웃</a>
	
						</c:if>
					</div>
					<div class="widget">
						<h5 class="widgetheading">해방 가이드</h5>
						<div id='calendar'></div>
					</div>
					<div class="widget">
						<h5 class="widgetheading">Popular tags</h5>
						<ul class="tags">
							<li><a href="#">Web design</a></li>
							<li><a href="#">Trends</a></li>
							<li><a href="#">Technology</a></li>
							<li><a href="#">Internet</a></li>
							<li><a href="#">Tutorial</a></li>
							<li><a href="#">Development</a></li>
						</ul>
					</div>
					</aside>
				</div>
			</div>
		</div>
	
	<footer> 
		<jsp:include page="../employee_include/bottom.jsp" />
	</footer>
	</div>
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
</body>

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
 				right: 'agendaDay,month,agendaWeek,'
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
