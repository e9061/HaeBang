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
table { border:1px-solid-#000000; width:1000px; text-align : center;}
table th {color:red; background-color:peachpuff; border:1px-solid-#000000; text-align : center;}
table td {border : 1px-solid-#000000; text-align : center;}

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
			<h3>바퀴벌레 해방!</h3>
		</div>
		<div>
		<table border="1" align="right-center">
			<caption><h4>가정집</h4></caption>
			<tr>
				<th>적용평수</th>
				<th>6개월 보장형</th>
				<th>1년 보장형</th>
				<th>연계약 정기관리형 (연 4회 방문)</th>
			</tr>
			<tr>
				<th>30평 이하</th>
				<td>80,000원</td>
				<td>130,000원</td>
				<td>초기금액 80,000원. 2개월당 1회방문시 40,000원</td>
			</tr>
			<tr>
				<th>50평 이하</th>
				<td>100,000원</td>
				<td>160,000원</td>
				<td>초기금액 100,000원. 2개월당 1회방문시 50,000원</td>
			</tr>
			<tr>
				<th>100평 이하</th>
				<td>130,000원</td>
				<td>230,000원</td>
				<td>초기금액 130,000원. 2개월당 1회방문시 70,000원</td>
			</tr>
			<tr>
				<th>101평 이상</th>
				<td>평당 1,300원</td>
				<td>별도 금액</td>
				<td>별도 금액</td>
			</tr>
		</table>
		</div>
		<br/>
		
		<div>
		<table border="1" align="right-center">
			<caption><h4><Strong>사무실, 영업장</Strong></h4></caption>
			<tr>
				<th>적용평수</th>
				<th>2개월 보장형</th>
				<th colspan="2">연계약 정기관리형 (연 방문 6 ~ 12회)</th>
			</tr>
			<tr>
				<th>30평 이하</th>
				<td>80,000원</td>
				<td colspan="2">초기금액 80,000원. 2개월당 1회방문시 40,000원</td>
			</tr>
			<tr>
				<th>50평 이하</th>
				<td>100,000원</td>
				<td colspan="2">초기금액 100,000원. 2개월당 1회방문시 50,000원</td>
			</tr>
			<tr>
				<th>100평 이하</th>
				<td>130,000원</td>
				<td colspan="2">초기금액 130,000원. 2개월당 1회방문시 70,000원</td>
			</tr>
			<tr>
				<th>101평 이상</th>
				<td>평당 1,300원</td>
				<td colspan="2">별도 금액</td>
			</tr>
		</table>
		<br/>
		<br/>
		<hr/>
		<hr/>
		<br/>
		<div>
			<h3>개미 해방!</h3>
		</div>
		<div>
		<table border="1" align="right-center">
			<caption><h4>가정집</h4></caption>
			<tr>
				<th>적용평수</th>
				<th>6개월 보장형</th>
				<th>1년 보장형</th>
				<th>연계약 정기관리형 (연 4회 방문)</th>
			</tr>
			<tr>
				<th>30평 이하</th>
				<td>80,000원</td>
				<td>130,000원</td>
				<td>초기금액 80,000원. 2개월당 1회방문시 40,000원</td>
			</tr>
			<tr>
				<th>50평 이하</th>
				<td>100,000원</td>
				<td>160,000원</td>
				<td>초기금액 100,000원. 2개월당 1회방문시 50,000원</td>
			</tr>
			<tr>
				<th>100평 이하</th>
				<td>130,000원</td>
				<td>230,000원</td>
				<td>초기금액 130,000원. 2개월당 1회방문시 70,000원</td>
			</tr>
			<tr>
				<th>101평 이상</th>
				<td>평당 1,300원</td>
				<td>별도 금액</td>
				<td>별도 금액</td>
			</tr>
		</table>
		</div>
		<br/>
		<div>
		<table border="1" align="right-center">
			<caption><h4>사무실, 영업장</h4></caption>
			<tr>
				<th>적용평수</th>
				<th>2개월 보장형</th>
				<th colspan="2">연계약 정기관리형 (연 방문 6 ~ 12회)</th>
			</tr>
			<tr>
				<th>30평 이하</th>
				<td>80,000원</td>
				<td colspan="2">초기금액 80,000원. 2개월당 1회방문시 40,000원</td>
			</tr>
			<tr>
				<th>50평 이하</th>
				<td>100,000원</td>
				<td colspan="2">초기금액 100,000원. 2개월당 1회방문시 50,000원</td>
			</tr>
			<tr>
				<th>100평 이하</th>
				<td>130,000원</td>
				<td colspan="2">초기금액 130,000원. 2개월당 1회방문시 70,000원</td>
			</tr>
			<tr>
				<th>101평 이상</th>
				<td>평당 1,300원</td>
				<td colspan="2">별도 금액</td>
			</tr>
		</table>
		</div>
		<br/>
		<hr/>
		<br/>
		
		<div>
			<h3>쥐 해방!</h3>
		</div>
		
		<div>
		<table border="1" align="right-center">
			<caption><h4>가정집</h4></caption>
			<tr>
				<th>적용평수</th>
				<th>2개월 보장형</th>
				<th colspan="2">연계약 정기관리형 (연 방문 4회)</th>
			</tr>
			<tr>
				<th>30평 이하</th>
				<td>80,000원</td>
				<td colspan="2">초기금액 80,000원. 2개월당 1회방문시 40,000원</td>
			</tr>
			<tr>
				<th>50평 이하</th>
				<td>100,000원</td>
				<td colspan="2">초기금액 100,000원. 2개월당 1회방문시 50,000원</td>
			</tr>
			<tr>
				<th>100평 이하</th>
				<td>130,000원</td>
				<td colspan="2">초기금액 130,000원. 2개월당 1회방문시 70,000원</td>
			</tr>
			<tr>
				<th>101평 이상</th>
				<td>평당 1,300원</td>
				<td colspan="2">별도 금액</td>
			</tr>
		</table>
		</div>
		<br/>
		<br/>
		<div>
		<table border="1" align="right-center">
			<caption><h4>사무실, 영업장</h4></caption>
			<tr>
				<th>적용평수</th>
				<th>2개월 보장형</th>
				<th colspan="2">연계약 정기관리형 (연 방문 6 ~ 12회)</th>
			</tr>
			<tr>
				<th>30평 이하</th>
				<td>80,000원</td>
				<td colspan="2">초기금액 80,000원. 2개월당 1회방문시 40,000원</td>
			</tr>
			<tr>
				<th>50평 이하</th>
				<td>100,000원</td>
				<td colspan="2">초기금액 100,000원. 2개월당 1회방문시 50,000원</td>
			</tr>
			<tr>
				<th>100평 이하</th>
				<td>130,000원</td>
				<td colspan="2">초기금액 130,000원. 2개월당 1회방문시 70,000원</td>
			</tr>
			<tr>
				<th>101평 이상</th>
				<td>평당 1,300원</td>
				<td colspan="2">별도 금액</td>
			</tr>
		</table>
		</div>
		<br/>
		<br/>
		
		<div>
			<h3>기타해충 해방!</h3>
		</div>
		<div>
		<table border="1" align="right-center">
			<caption><h4>가정집, 사무실, 영업장 (공용)</h4></caption>
			<tr>
				<th>적용평수</th>
				<th>1회성</th>
				<th>2개월 보장형</th>
				<th>연계약 정기관리형 (연 4회 방문)</th>
			</tr>
			<tr>
				<th>30평 이하</th>
				<td>120,000원</td>
				<td>160,000원</td>
				<td>초기금액 160,000원. 2개월당 1회방문시 90,000원</td>
			</tr>
			<tr>
				<th>50평 이하</th>
				<td>140,000원</td>
				<td>180,000원</td>
				<td>초기금액 180,000원. 2개월당 1회방문시 100,000원</td>
			</tr>
			<tr>
				<th>100평 이하</th>
				<td>170,000원</td>
				<td>200,000원</td>
				<td>초기금액 200,000원. 2개월당 1회방문시 120,000원</td>
			</tr>
			<tr>
				<th>101평 이상</th>
				<td>평당 1,700원</td>
				<td>평당 2,000원</td>
				<td>별도 금액</td>
			</tr>
		</table>
		</div>
		<br/>
		<br/>
		<hr/>
		<br/>
		<div>
			<h3>해방 의무소독</h3>
		</div>
		
			<div>
		<table border="1" align="right-center">
			<caption><h4>의무소독 단가표</h4></caption>
			<tr>
				<th>관리평수</th>
				<th>1회당 가격</th>
				<th>관리평수</th>
				<th>1회당 가격</th>
			</tr>
			<tr>
				<th>200평 이하</th>
				<td>90,000원</td>
				<th>4,000평 이하</th>
				<td>320,000원</td>
			</tr>
			<tr>
				<th>300평 이하</th>
				<td>120,000원</td>
				<th>6,000평 이하</th>
				<td>350,000원</td>
			</tr>
			<tr>
				<th>500평 이하</th>
				<td>150,000원</td>
				<th>8,000평 이하</th>
				<td>420,000원</td>
			</tr>
			<tr>
				<th>1,000평 이하</th>
				<td>200,000원</td>
				<th>10,000평 이하</th>
				<td>460,000원</td>
			</tr>
			<tr>
				<th>2,000평 이하</th>
				<td>250,000원</td>
				<th>10,001평 이상</th>
				<td>460,000 + 추가 평수당 + 50원</td>
			</tr>
		</table>
		</div>

		<br/>
		<br/>
		<hr/>
		<br/>
		
		<div>
			<h3>해방 공간소독</h3>
		</div>
		
		<div>
		<table border="1" align="right-center">
			<caption><h4>공간소독 단가표</h4></caption>
			<tr>
				<th>평수</th>
				<th>단가</th>
				<th colspan="2">비고</th>
			</tr>
			<tr>
				<th>50평 이하</th>
				<td>70,000원</td>
				<td colspan="2" rowspan="2">가정집만 적용<br/> &lt;추가비용 없음&gt; </td>
			</tr>
			<tr>
				<th>100평 이하</th>
				<td>90,000원</td>
			</tr>
			<tr>
				<th>500평 이하</th>
				<td>120,000원</td>
				<td colspan="2" rowspan="4">&lt;추가요금 적용&gt;<br/>
평일야간(18:00이후) 30,000원<br/>
주말(토요일) 50,000원<br/>
주말(일요일) 50,000원</td>
			</tr>
			<tr>
				<th>1,000평 이하</th>
				<td>150,000원</td>
			</tr>
			<tr>
				<th>1,500평 이하</th>
				<td>200,000원</td>
			</tr>
			<tr>
				<th>2,000평 이하</th>
				<td>250,000원</td>
			</tr>
			<tr>
				<th>2,001평 이상</th>
				<td>평당 150원</td>
				<td colspan="2" rowspan="3">&lt;추가요금 없음&gt;</td>
			</tr>
			<tr>
				<th>5,000평 이상</th>
				<td>평당 140원</td>
			</tr>
			<tr>
				<th>10,000평 이상</th>
				<td>평당 130원</td>
			</tr>
			
		</table>
		</div>
		
		<br/>
		<br/>
		<hr/>
		<div>
			<h3>집먼지 진드기 방제!</h3>
		</div>
		<div>
		<table border="1" align="right-center">
			<caption><h4>집먼지 진드기 방제</h4></caption>
			<tr>
				<th colspan="5">먼지다듬이 방제(일반/천연)</th>
			</tr>
			<tr>
				<th>적용 평수</th>
				<th>1회성</th>
				<th>2개월 보장형</th>
				<th>정기관리/회당</th>
				<th>보장기간 이후(회당)</th>
			</tr>
			<tr>
				<th>원룸</th>
				<td>11/14</td>
				<td>18/23</td>
				<td>7</td>
				<td>8</td>
			</tr>
			<tr>
				<th>30평 이하</th>
				<td>12/15</td>
				<td>20/25</td>
				<td>8</td>
				<td>9</td>
			</tr>
			<tr>
				<th>50평 이하</th>
				<td>14/17</td>
				<td>25/30</td>
				<td>9</td>
				<td>10</td>
			</tr>
			<tr>
				<th>100평 이하</th>
				<td>17/21</td>
				<td>30/35</td>
				<td>10</td>
				<td>12</td>
			</tr>
			<tr>
				<th>101평 이상</th>
				<td colspan="4">별도 견적</td>
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
