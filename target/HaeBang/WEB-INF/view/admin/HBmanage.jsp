<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
<style>
#content {
	text-align: center;
}

table {
	text-align: center;
}

tr {
	text-align: center;
}

td {
	text-align: center;
}
</style>
<script type="text/javascript">
	function doAction() {
		location.href = "${ pageContext.request.contextPath }/qna/write";

	}

	function preBlock(bowBlock, pageNo) {
		document.total.nowBlock.value = nowBlock;
		document.total.pageNo.value = pageNo;
		total.submit();
	}

	function prePage(nowBlock, pageNo) {
		document.total.nowBlock.value = nowBlock;
		document.total.pageNo.value = pageNo;
		total.submit();
	}

	function afterBlock(nowBlock, pageNo) {
		document.total.nowBlock.value = nowBlock();
		document.total.pageNo.value = pageNo();
		total.submit();
	}
	
	// 조건 검색 ajax
	  $("#searchBtn").click(function(){
		  if($("#searchContent").val().trim()==""){
		    	 alert("검색어를 입력해주세요.");
		    	 $("#searchContent").val("").focus();
			} else {
				
				 $.ajax({
					url:  "${ pageContext.request.contextPath }/admin/searchCompany",
					type: "POST",
					data: {
						type : $("#comType").val(),
						vo : $("#search").val(),
						content	: $("#searchContent").val()			
					},
					success: function(data){
						getHbCompanyList(data);
					}  
				 });
				 
			}
	  });
	  
    
 });
 
 function confir(){
	   
	   window.onload = function(){
		   
		   var input_value = confirm("선택한 업체에 코드를 부여하시겠습니까?");
		   var input_type = typeof(input_value);
		   
		   document.body.innerHTML = input_type;
		   alert("부여하였습니다.");
		   
	   }
	   
 }

	
</script>
</head>

<body>
	<div id="wrapper">
		<header> 		<jsp:include page="../admin_include/topmenu.jsp"/>
 </header>
		<section>
		<div align="center" style="padding-right: 4px;">
	<form action="${ pageContext.request.contextPath }/admin/updateCode" method=post>
		<h1> <span>업체 관리</span></h1>
		<br/>
		<br/>
      	<select id='comType' class="btn btn-theme">
      		<option value="h" selected> 해방 업체 </option>
      		<option value="n"> 일반 업체</option>
      	</select>
      	<span style="margin-right: 5px"></span>
      	<select id='search' class="btn btn-theme">
      		<option value="c_name" selected> 업체명 </option>
      		<option value="c_code"> 업체코드 </option>
      		<option value="c_address"> 주소 </option>
      		<option value="c_bizNo"> 사업자등록번호 </option>
      	</select>
      	<span style="margin-right: 10px"></span>
      	<input type="text" id="searchContent" placeholder="검색어를 입력해주세요." style="width:15%;"/>
      	<input type="button" id="searchBtn" value="조건 검색" class="btn btn-theme"/>
      	
      	<span style="margin-right: 40px;"></span>
      	<input type="button" id="hcList_btn" onclick="hcListGo()" value="해방업체 조회" class="btn btn-theme"/>
      	<span style="margin-right: 5px"></span>
      	<input type="button" id="cList_btn" value="일반업체 조회" class="btn btn-theme"/>
      	
		<br/>
		<br/>
		<br/>
		<br/>
		
		
			<table style='width: 90%;'>
		<tr>
			<td><h4>
					<strong> 선택 </strong>
				</h4></td>
			<td><h4>
					<strong> 번호 </strong>
				</h4></td>
			<td><h4>
					<strong> 업체명 </strong>
				</h4></td>
			<td><h4>
					<strong> 사업자명 </strong>
				</h4></td>
			<td><h4>
					<strong> 주소 </strong>
				</h4></td>
			<td><h4>
					<strong> 전화번호 </strong>
				</h4></td>
			<td><h4>
					<strong> 사업자번호 </strong>
				</h4></td>
			<td><h4>
					<strong> 등록일 </strong>
				</h4></td>
			<td><h4>
					<strong> 업체코드 </strong>
				</h4></td>
			<td><h4>
					<strong> 직원 </strong>
				</h4></td>
			<!-- <td width='5%'><h4>
					<strong> 평점 </strong>
				</h4></td> -->
		</tr>


		<c:forEach items="${ list }" var="list" >
		
			<tr>
				<td width='auto'><input type='checkbox' name='updateCode1' value='${ list.c_code }' class='check'></td>
			<td width='auto'><h4>
					<strong> ${ list.c_no } </strong>
				</h4></td>
			<td width='auto'><h4>
					<strong> ${ list.c_name } </strong>
				</h4></td>
			<td width='auto'><h4>
					<c:choose>
				<c:when test="${ empty list.e_name }">
					<strong> - </strong>
				</c:when>
				<c:otherwise>
					<strong> ${ list.e_name } </strong>
				</c:otherwise>
				</c:choose>
				</h4></td>
			<td width='auto'><h4>
					<strong> ${ list.c_address } </strong>
				</h4></td>
			<td width='auto'><h4>
					<strong> ${ list.c_phone } </strong>
				</h4></td>
			<td width='auto'><h4>
					<strong> ${ list.c_bizNo } </strong>
				</h4></td>
			<td width='auto'><h4>
			<c:choose>
				<c:when test="${ empty list.c_regDate }">
					<strong> ${ list.c_signDate } </strong>
				</c:when>
				<c:otherwise>
					<strong> ${ list.c_regDate } </strong>
				</c:otherwise>
				</c:choose>
				</h4></td>
			<td width='auto'><h4>
					<c:choose>
				<c:when test="${ empty list.c_code }">
					<strong> - </strong>
				</c:when>
				<c:otherwise>
					<strong> ${ list.c_code } </strong>
				</c:otherwise>
				</c:choose>
				</h4></td>
			<td width='auto'><h4>
					<c:choose>
				<c:when test="${ list.c_empCnt == 0 }">
					<strong> - </strong>
				</c:when>
				<c:otherwise>
					<strong> ${ list.c_empCnt } </strong>
				</c:otherwise>
				</c:choose>
				</h4></td>
			</tr>
		</c:forEach>
			
	</table>
			
			
			
			<br/>
						<div align="center" id = "codeInsert">
				<input type="submit" class="btn btn-theme" id="comcom" value="code 생성">
			</div>
			</form>

	<div align="center">
				<ul class="pagination">
					<li><a
						href="#" onclick="hcListGo(1)">처음</a></li>
					<%-- 				<li><a href="${ pageContext.request.contextPath }/list/&pageNo=0&searchCondition=${ titlecontent }&word=${ word }">처음</a></li>
 --%>
					<!--현재 페이지가 0보다 작아질 경우 이전 버튼을 disabled하는 조건문 -->
					<c:choose>
						<c:when test="${pageNo <= 0}">
							<li class="disabled"><a href="#">이전</a></li>
						</c:when>

						<c:otherwise>
							<li><a
						href="#" onclick="hcListGo(${ pageNo }-1 )">이전</a></li>
							<%-- 							href="${ pageContext.request.contextPath }/list/&pageNo=${pageNo -1}&searchCondition=${ titlecontent }&word=${ word }">이전</a></li> --%>
						</c:otherwise>
					</c:choose>

					<!--해당하는 페이지로 갈 수 있는 버튼 -->
					<c:forEach var="i" begin="${beginPage-1 }" end="${lastPage-1}">
						<c:if test="${ i eq pageNo }">
							<li><a href="#">${ i + 1 }</a></li>
						</c:if>
						<c:if test="${ i ne pageNo }">
							<li><a href="#" onclick="hcListGo(${ i } )">${ i +1 }</a></li>
						</c:if>
						<%-- 					<li><a href="${ pageContext.request.contextPath }/list/&pageNo=${i}&searchCondition=${ titlecontent }&word=${ word }">${i+1}</a></li> --%>
					</c:forEach>

					<!--현재 페이지가 totalpage보다 커질 경우 다음 버튼을 disabled하는 조건문 -->
					<c:choose>
						<c:when test="${pageNo >= endPage-1}">
							<li class="disabled"><a href="#">다음</a></li>
						</c:when>

						<c:otherwise>
							<li><a
						href="#" onclick="hcListGo(${ pageNo }+1 )">다음</a></li>
							<%-- 							href="${ pageContext.request.contextPath }/list/&pageNo=${pageNo+1}&searchCondition=${ titlecontent }&word=${ word }">다음</a></li> --%>
						</c:otherwise>
					</c:choose>

					<li><a
						href="#" onclick="hcListGo(${ lastPage }-1 )">마지막</a></li>
					<%-- 				<li><a href="${ pageContext.request.contextPath }/list/&pageNo=${totalpage}&searchCondition=${ titlecontent }&word=${ word }">마지막</a></li> --%>
				</ul>
	</div>
			</div>		</section>
		<br /> <br /> <br />
		<footer> 		<jsp:include page="../admin_include/bottom.jsp"/>
 </footer>
	</div>
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
