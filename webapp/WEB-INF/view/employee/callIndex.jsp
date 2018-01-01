<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 
<!-- css -->
<link
	href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="${ pageContext.request.contextPath }/resources/css/fancybox/jquery.fancybox.css"
	rel="stylesheet">
<link
	href="${ pageContext.request.contextPath }/resources/css/jcarousel.css"
	rel="stylesheet" />
<link
	href="${ pageContext.request.contextPath }/resources/css/flexslider.css"
	rel="stylesheet" />
<link
	href="${ pageContext.request.contextPath }/resources/css/style.css"
	rel="stylesheet" />


<!-- Theme skin -->
<link
	href="${ pageContext.request.contextPath }/resources/skins/default.css"
	rel="stylesheet" />

 

<!-- <style type="text/css">
ul {
	padding-top: 10px;
} /*  상단 여백 10px  */
ul li {
	display: inline; /*  세로나열을 가로나열로 변경 */
	border-bottom: 1px solid #999; /* 각 메뉴의 왼쪽에 "|" 표시(분류 표시) */
	font: bold 12px Dotum; /* 폰트 설정 - 12px의 돋움체 굵은 글씨로 표시 */
	padding: 0 10px; /* 각 메뉴 간격 */
	width : 30px;
}

ul li:first-child {
	border-left: none;
} /* 메뉴 분류중 제일 왼쪽의 "|"는 삭제  */

 .btn-info1:hover {
  color : #003300;
} 
.btn-info1 {
  color : #000000;
  border: 0.5px thin #000000;
  text-decoration:none;
}

</style> -->
<style>

.btn-info1:hover {
  color : #000000;
  font-weight : 700;
  font-size:14px;
}
.btn-info1 {
  color : #000000;
  border: 0.5px thin #000000;
  font-weight: bold;
}

ul li {
	border-bottom: 1px solid #999; /* 각 콜 마다 바텀 "ㅡ" 표시(분류 표시) */
}

 ul li:last-child {
	border-bottom: none;
} 

.callList:hover{
	background: #6DDBA8;
}

</style>

</head>
<body>
	<%-- <div class="form-group" >
		<ul>
			<li>서비스</li>
			<li>보장형/정기형</li>
			<li>서비스 예약시간</li>
			<li>주소</li>
			<li>총횟수</li>
			<li>Total Price</li>
		</ul>
		<div>
		<c:forEach items="${myCall}" var="myCall" varStatus="status" >
		<ul id="${myCall.mo_no }" class="${myCall.mo_orderNo }" >
			<li data-toggle="${myCall.mo_no}" title="aaaaaa">${myCall.s_shortName}</li>
			<li><c:if test="${myCall.mo_total eq 1}">
			보장형
			</c:if>
			<c:if test="${myCall.mo_total ne 1}">
			정기형
			</c:if>
			</li>
			<li data-toggle="${myCall.mo_orderNo}" title="aaaaaa">${myCall.mo_startTime}</li>
			<li data-toggle="${status.count}" title="aaaaaa">${myCall.m_gu}</li>
			<li>
			<c:if test="${myCall.mo_total eq 1}">
			보장형
			</c:if>
			<c:if test="${myCall.mo_total ne 1}">
			${myCall.mo_total}
			</c:if>
			</li>
			<li>${myCall.mo_totalPrice}</li>
			<li><a class="btn btn-info1 accept" 
			href="#"  >수락</a>
			</li>
			<li><a class="btn btn-info1 refuse" href="#">거절</a></li>
			
		</ul>
		</c:forEach>
		</div> --%>
		
		

			<div class="widget">
								<h5 style="margin: 0; padding: 10px 20px 0px;" class="widgetheading">배정 콜 현황</h5>
								<ul class="recent" style="margin: 0; padding: 10px 10px 10px;">
								<c:forEach items="${myCall}" var="myCall" varStatus="status" >
									<div class="callList" style="padding: 10px; background-color: ${myCall.color}; margin-bottom:5px; border-radius: 5px;">
									<li data-toggle="${myCall.mo_no}a" title="aaaaaa"  id="${myCall.mo_no }" class="${myCall.mo_orderNo }" style="margin-bottom: 0px;" >
										<div>
										<c:if test="${myCall.mo_total eq 1}">
										<h6 style="color:white"class="pull-right">보장형</h6>
										</c:if>
										<c:if test="${myCall.mo_total ne 1}">
										<h6 style="color:white" class="pull-right">${myCall.mo_total}회</h6>
										</c:if>
										<h6 style="color:white" data-toggle="${myCall.mo_no}" title="aaaaaa" >${myCall.s_longName }</h6>
										</div>
										<div>
										<h6 style= "color:white; margin-bottom: 5px;" class="pull-right"  >${myCall.mo_totalPrice}</h6>
										<h6 style= "color:white; margin-bottom: 5px;" data-toggle="${status.count}" title="aaaaaa">${myCall.m_gu}</h6>
										</div>
										<div>
										<a class="pull-right btn btn-info1 refuse" style="color:white; border-radius: 4px; padding: 0;">거절</a>
										
										<a class="pull-right btn btn-info1 accept" style="color:white; border-radius: 4px; padding: 0 10px;">수락</a>
										<a data-toggle="${myCall.mo_orderNo}" title="aaaaaa" 
										class="btn btn-info1 " 
										style="padding: 0; color:white;" href='javascript:moveParentWindow("${userVo.e_type }");'>${myCall.mo_startTime}</a>
										
										<%-- <h6 data-toggle="${myCall.mo_orderNo}" title="aaaaaa" onclick="btnClick()">${myCall.mo_startTime}</h6> --%>
										</div>
									</li>
									</div>
								</c:forEach>
								</ul>
							</div>
		
</body>

	<script src="${ pageContext.request.contextPath }/resources/js/jquery.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/jquery.easing.1.3.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
  	<script src="//code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

window.setTimeout("window.location.reload()",60000*3);
$(document).tooltip();
	
$(document).ready(function(){
	
	$.ajax({
		url : "${pageContext.request.contextPath}/ceo/selectAllCallAjax",
		type: "POST",
		data : {
			
		},
		success : function(result){
			
			var resultJSON = JSON.parse(result);
			if(resultJSON.length==0){
				window.close();	
			}
			
			
			
			console.log(resultJSON.length);
			for(i=0;i<resultJSON.length;i++){
    				$('[data-toggle="'+(i+1)+'"]').tooltip({
    				content : resultJSON[i].m_address

    				});
    				$('[data-toggle="'+resultJSON[i].mo_no+'"]').tooltip({
        				content : resultJSON[i].s_name

        				});
    				$('[data-toggle="'+resultJSON[i].mo_no+'a"]').tooltip({
        				content : "콜 해방맨 : "+resultJSON[i].e_name

        				});
    				
    				
    				
    				$.ajax({
    					url : "${pageContext.request.contextPath}/ceo/selectAllStartTimes",
    					type: "POST",
    					data : {
    						mo_orderNo : resultJSON[i].mo_orderNo
    					},
    					success : function(resultSecond){
    						var resultSecondJSON = JSON.parse(resultSecond)
    						var msg ="";
    						for(j=0;j<resultSecondJSON.length;j++){
    							msg += (j+1)+"회차 : "+resultSecondJSON[j].mo_startTime+"</br>"
    						}
    	    				$('[data-toggle="'+resultSecondJSON[0].mo_orderNo+'"]').tooltip({
    	        				content : msg

    	        				});
    					}
    				})
			}
			
			
			
			
		}
	
	})

    $('[data-toggle="tooltipp"]').tooltip({
    	
    });   
});


$(document).on("click",".accept", function(){

	
	if(confirm('수락하시겠습니까?'))
	{
	$.ajax({
		url:"${pageContext.request.contextPath}/ceo/acceptMyCall",
		type:"post",
		data : {
			mo_no : $(this).parent().parent().attr('id'),
			mo_orderNo : $(this).parent().parent().attr('class')
			
		},
		success: function(result){
			var resultJSON = JSON.parse(result);
			console.log(resultJSON);

			if(resultJSON.length ==0){
				//창 닫기
				if("${userVo.e_type}"=="사장"|| "${userVo.e_type}"=="O"){
					window.opener.location.href="${pageContext.request.contextPath}/ceo/allSchedule";
				}
				else{
					window.opener.location.href="${pageContext.request.contextPath}/ceo/schedule";
				}
				
				window.close();
			}else{
				if("${userVo.e_type}"=="사장"|| "${userVo.e_type}"=="O"){
					window.opener.location.href="${pageContext.request.contextPath}/ceo/allSchedule";
				}
				else{
					window.opener.location.href="${pageContext.request.contextPath}/ceo/schedule";
				}
			window.location.reload();
			}
			

		},
		error : function(){
			alert('종료된 콜입니다.');
		}
		
	})
	}
})


$(document).on("click", ".refuse", function(){

	if(confirm('거절하시겠습니까?'))
	{
	
		$.ajax({
		url : "${pageContext.request.contextPath}/ceo/refuseMyCall",
		type : "post",
		data : {
			mo_no : $(this).parent().parent().attr('id'),
			mo_orderNo : $(this).parent().parent().attr('class')
			
		},
		success : function(result){
			
			var resultJSON = JSON.parse(result);
			console.log(resultJSON);
			if(resultJSON.length ==0){
				//창 닫기
				//창 닫기 전에 스케줄러 페이지로 이동시켜준다.
				/* window.opener.location.href="${pageContext.request.contextPath}/ceo/schedule"; */
				window.close();
			}else{
				
			window.location.reload();
			}
			
			/* else{
				for(i=0;i<resultJSON.length;i++){
					
					msg += "<ul id='"+resultJSON[i].mo_no+"' class='"+resultJSON[i].mo_orderNo+"'>";
					msg += "<li>"+resultJSON[i].s_shortName+"</li>";
					msg += "<li>";
					if(resultJSON[i].mo_total == 1){
						msg +="보장형";
					}else{
						msg +="정기형";
					}
					msg += "</li>";
					msg += "<li>"+resultJSON[i].mo_startTime+"</li>";
					msg += "<li>"+resultJSON[i].m_gu+"</li>";
					msg += "<li>"+resultJSON[i].mo_total+"</li>";
					msg += "<li>"+resultJSON[i].mo_totalPrice+"</li>";
					msg += "<li><a class='btn btn-info1 accept' href='#'  >수락</a></li>";
					msg += "<li><a class='btn btn-info1 refuse' href='#'>거절</a></li>";
					msg += "</ul>"
					
					
				}
				$('.form-group').children().last().html(msg);
				// div form-group next에 다가 집어 넣자. 코드짜서
			} */
		
		},
		error : function(){
			alert('종료된 콜입니다.');
		}
		

		})
	
	
	}
	else{
		return false;
	}
})

	/* window.setTimeout("window.location.reload()",10000); */


	function moveParentWindow(e_type){
		if(e_type =="O" || e_type == "사장"){
			
			window.opener.location.href="${pageContext.request.contextPath}/ceo/allSchedule";
			
		}else{
			window.opener.location.href="${pageContext.request.contextPath}/ceo/schedule";
		}
	}

</script>


</html>