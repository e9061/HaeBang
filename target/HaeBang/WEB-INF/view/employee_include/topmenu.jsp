<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function openPop(){
    
    
    var pop_title = "popupOpener" ;
     
    window.open("", pop_title,"left=900, top=430, width=550, height=300, toolbar=no, scrollbars=no, status=no, resizable=no") ;
     
	var frmData = document.formData ;
    frmData.target = pop_title ;
    frmData.action = "/ceo/selectAllCall" ;
     
    frmData.submit() ;


}

window.setTimeout("window.location.reload()",60000*30);
window.onload = function() {
	
    if(document.getElementById("userVo")!=null)
	{
    		$.ajax({
    			url : "${pageContext.request.contextPath}/ceo/selectAllCallAjax",
    			type: "POST",
    			data : {
    				
    			},
    			success : function(result){
				
    				var resultJSON = JSON.parse(result);
    				console.log(resultJSON.length);
    				if(resultJSON.length != 0){
    					openPop();
    				}
    				
    			}
    		})
    	
	
	}
    init();
}



</script>
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
<c:if test="${ not empty userVo }">
<form name=formData method="post">
	<input id="userVo" name="e_no" type="hidden" value="${userVo.e_no}" />
</form></c:if>
			<div class="navbar navbar-default navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
						<a class="navbar-brand" href="${ pageContext.request.contextPath }/ceo"><span>H</span>AEBANG CEO SITE</a>
					</div>
					<div class="navbar-collapse collapse ">
						<ul class="nav navbar-nav">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">해방<b class=" icon-angle-down"></b></a>
								<ul class="dropdown-menu">
									<li><a href="typography.html">해방소개</a></li>
									<li><a href="components.html">해방알고리즘</a></li>
									<li><a href="pricingbox.html">해방 가이드</a></li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">업체관리<b class=" icon-angle-down"></b></a>
								<ul class="dropdown-menu">
									<li><a href="typography.html">스케쥴관리</a></li>
									<li><a href="pricingbox.html">리뷰관리</a></li>
									<li><a href="pricingbox.html">직원관리</a></li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">통계<b class=" icon-angle-down"></b></a>
								<ul class="dropdown-menu">
									<li><a href="typography.html">종합통계</a></li>
									<li><a href="components.html">정산내역</a></li>
									<li><a href="pricingbox.html">별점통계</a></li>
									<li><a href="components.html">예약상세내역</a></li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">고객센터<b class=" icon-angle-down"></b></a>
								<ul class="dropdown-menu">
									<li><a href="${ pageContext.request.contextPath }/ceo/ceoNotice?n_type=o">공지사항</a></li>
									<li><a href="components.html">자주묻는질문</a></li>
									<li><a href="pricingbox.html">서비스약관</a></li>
								</ul>
							</li>
							<c:if test="${ not empty userVo }">
								<li>
								<a href="${ pageContext.request.contextPath }/ceo/info">내 정보</a>
								</li>
							</c:if>
							
						</ul>
					</div>
				</div>

			</div>
 