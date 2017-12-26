<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Moderna - Bootstrap 3 flat corporate template</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<!-- css -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="resources/css/jcarousel.css" rel="stylesheet" />
<link href="resources/css/flexslider.css" rel="stylesheet" />
<link href="resources/css/style.css" rel="stylesheet" />


<!-- Theme skin -->
<link href="resources/skins/default.css" rel="stylesheet" />

<!-- =======================================================
    Theme Name: Moderna
    Theme URL: https://bootstrapmade.com/free-bootstrap-template-corporate-moderna/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
	======================================================= -->
<Style>
/* #price {
		background-color : skyblue;
		font : bold;
		font-color : #000000;
		border : 1px-solid-black;
	} */
	#sodok{
	width : 600px;
}
table { border:1px-solid-#000000; width:1000px; text-align : center;}
table th {color:red; background-color:peachpuff; border:1px-solid-#000000; text-align : center;}
table td {border : 1px-solid-#000000; text-align : center;}



#hihihi{
	align:center;
}

#service-call{
	background-color:skyblue;
	text-align:center;
	
}

</Style>
</head>

<body>
	<!-- <div id="wrapper"> -->
		<!-- start header -->
		<header> <jsp:include
			page="/WEB-INF/view/member_include/topmenu.jsp" /> </header>
		<!-- end header -->
		<div id="service-call">
			<h2>해방 서비스</h2>
		</div>
		<section id="content">
		
		<div>
		<table border="1" align="center">
			<caption><h4>가정집</h4></caption>
			<tr>
				<th>적용평수</th>
				<th>6개월 보장형</th>
				<th>1년 보장형</th>
				<th>연계약 정기관리형 (연 4회 방문) (회당)</th>
				<th>소요시간</th>
			</tr>
			<tr>
				<th>10평 이하</th>
				<td>40,000원</td>
				<td>70,000원</td>
				<td>30,000원</td>
				<td>30분</td>
			</tr>
			<tr>
				<th>20평 이하</th>
				<td>60,000원</td>
				<td>100,000원</td>
				<td>45,000원</td>
				<td>30분</td>
			</tr>
			<tr>
				<th>30평 이하</th>
				<td>80,000원</td>
				<td>130,000원</td>
				<td>60,000원</td>
				<td>30분</td>
			</tr>
			<tr>
				<th>50평 이하</th>
				<td>100,000원</td>
				<td>160,000원</td>
				<td>75,000원</td>
				<td>60분</td>
			</tr>
			<tr>
				<th>100평 이하</th>
				<td>130,000원</td>
				<td>230,000원</td>
				<td>100,000원</td>
				<td>120분</td>
			</tr>
			<tr>
				<th>101평 이상</th>
				<td>200,000원</td>
				<td>300,000원</td>
				<td>150,000원</td>
				<td>120분 ~</td>
			</tr>
		</table>
		</div>
		<br/>
		
		<div>
		<table border="1" align="center">
			<caption><h4>사무실, 영업장</h4></caption>
			<tr>
				<th>적용평수</th>
				<th>2개월 보장형</th>
				<th colspan="2">연계약 정기관리형 (연 방문 6회) (회당)</th>
				<th>소요시간</th>
			</tr>
			<tr>
				<th>20평 이하</th>
				<td>60,000원</td>
				<td colspan="2">45,000원</td>
				<td>30분</td>
			</tr>
			<tr>
				<th>30평 이하</th>
				<td>80,000원</td>
				<td colspan="2">60,000원</td>
				<td>30분</td>
			</tr>
			<tr>
				<th>40평 이하</th>
				<td>90,000원</td>
				<td colspan="2">75,000원</td>
				<td>30분</td>
			</tr>
			<tr>
				<th>50평 이하</th>
				<td>100,000원</td>
				<td colspan="2">85,000원</td>
				<td>60분</td>
			</tr>
			<tr>
				<th>51평 이상</th>
				<td>별도 견적</td>
				<td colspan="2">150,000원</td>
				<td>120분</td>
			</tr>
		</table>
		</div>
		<br/>
		<div id="sodok">
		<table border="1" align="center">
			<caption><h4>의무, 공간소독</h4></caption>
			<tr>
				<th>적용평수</th>
				<th>1회 가격</th>
				<th>소요 시간</th>
			</tr>
			<tr>
				<th>50평 이하</th>
				<td>70,000원</td>
				<td>30분</td>
			</tr>
			<tr>
				<th>70평 이하</th>
				<td>80,000원</td>
				<td>30분</td>
			</tr>
			<tr>
				<th>100평 이하</th>
				<td>90,000원</td>
				<td>60분</td>
			</tr>
			<tr>
				<th>200평 이하</th>
				<td>110,000원</td>
				<td>120분</td>
			</tr>
			<tr>
				<th>500평 이하</th>
				<td>120,000원</td>
				<td>120분 ~</td>
			</tr>
			<tr>
				<th>501평 이상</th>
				<td>별도 견적</td>
				<td>120분 ~</td>
				
			</tr>
		</table>
	</div>




		</section> <footer> <jsp:include
			page="/WEB-INF/view/member_include/bottom.jsp" /> </footer>
<!-- 	</div> -->
	<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="resources/js/jquery.js"></script>
	<script src="resources/js/jquery.easing.1.3.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.fancybox.pack.js"></script>
	<script src="resources/js/jquery.fancybox-media.js"></script>
	<script src="resources/js/google-code-prettify/prettify.js"></script>
	<script src="resources/js/portfolio/jquery.quicksand.js"></script>
	<script src="resources/js/portfolio/setting.js"></script>
	<script src="resources/js/jquery.flexslider.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>

</body>

</html>
