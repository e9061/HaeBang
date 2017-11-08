<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>SOP JavaScript Unit TEST: Service population</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
 	<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js">
  	</script>
	<script type="text/javascript" src="https://sgisapi.kostat.go.kr/OpenAPI3/auth/javascriptAuth?consumer_key=f6372e4acfe0495fb475"></script>
</head>
<style type="text/css">
	#divCon {
		margin: 5px 0;
		width: 660px;
		height: 160px;
		overflow-x:hidden;
		overflow-y:auto;
		border: 2px dotted #3388ff;
	}
</style>
<body>
	<header>
		<jsp:include page="include/topmenu.jsp"/>
	</header>
	
	<div id="map" style="width:650px;height:400px"></div>
	<script type="text/javascript">
	
		var map, mapOptions, marker;
		mapOptions = {
			ollehTileLayer: true
		};

		// 지도 생성
//		var map = sop.map("map", mapOptions);
		
/* 		map.setView([953427, 1950827], 5);
		marker = sop.marker([953427, 1950827]);
		marker.addTo(map);
		map.on("zoomend", function (e) {
		  alert("zoomlevel: ", map.getZoom());
		});
		marker.on("click", function (e) {
		  map.zoomIn();
		}); 
*/
		
		// 지도에서 컨트롤러 제거.
		var map = sop.map("map", {
			scale: false, // 축적 컨트롤
			panControl: false, // 지도이동 컨트롤
			zoomSliderControl: false, //줌 컨트롤
			measureControl: false, // 측정 컨트롤 (면적, 길이)
			attributionControl: false // 지도속성 컨트롤
		});
		

		map.setView(sop.utmk(953427, 1950827), 1);

		var attr = sop.control.attribution({
			position:"topleft",
			prefix: "Control Attribution sample"
		});

		attr.addAttribution("<h1>SOP (SGIS Open Platform)</h1>"); // attribution 추가
		attr.addTo(map);
	</script>
	
		<footer>
			<jsp:include page="include/bottom.jsp"/>
		</footer> 
</body>
</html>
