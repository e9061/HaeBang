<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container1 {
   padding:0 30px 0 50px;
   position:relative;
}

table.type09 {
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
    text-align: center;
}
table.type09 tbody th {
    width: 250px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

input {
    border:none;
    border-right:0px; 
    border-top:0px; 
    boder-left:0px; 
    boder-bottom:0px;
}
input th{
   background-color: #f3f6f7;
    margin: auto;
}




</style>


<!--나눔고딕폰트 불러오기-->
<link href="http://ts.daumcdn.net/custom/blog/0/606/skin/images/nanumgothic.css" rel="stylesheet" type="text/css">
</head>
<body>

	

	<table class="type09">
	<thead>
		<tr>
			<th style="width:auto;">
				선택 
				</th>
			<th style="width:auto;">
					번호 
				</th>
			<th style="width:auto;">
					 업체명 
				</th>
			<th style="width:auto;">
					 사업자명 
				</th>
			<th style="width:auto;">
					주소
				</th>
			<th style="width:auto;">
					 전화번호 
				</th>
			<th style="width:auto;">
					사업자번호
					</th>
			<th style="width:auto;">
					 등록일 
				</th>
			<th style="width:auto;">
					 업체코드 
				</th>
			<th style="width:auto;">
					직원 
				</th>
		</tr>
		</thead>
<tbody>
<c:choose>
	<c:when test="${ list.size() > 0 }">
		<c:forEach items="${list}" var="list" >
		
			<tr>
			<c:choose>
				<c:when test="${ list.c_code ne null }">
					<td style="width:auto;"><input type='checkbox' name='updateCode1' value='${ list.c_code }' class='check'></td>
				</c:when>
				<c:otherwise>
					<td style="width:auto;"><input type='checkbox' name='updateCode1' value='${ list.c_no }${ list.c_phone }' class='check'></td>
				</c:otherwise>
			</c:choose>
			<td style="width:50px;">${ list.c_no }</td>
			<td style="width:150px;">${ list.c_name }</td>
			<td style="width:auto;"><c:choose>
				<c:when test="${ empty list.e_name }">
					 - 
				</c:when>
				<c:otherwise>
					 ${ list.e_name } 
				</c:otherwise>
				</c:choose>
				</td>
			<td style="width:auto;"> ${ list.c_address } </td>
			<td style="width:auto;"> ${ list.c_phone } </td>
			<td style="width:auto;"> ${ list.c_bizNo } </td>
			<td style="width:auto;">
			<c:choose>
				<c:when test="${ empty list.c_regDate }">
					 ${ list.c_signDate } 
				</c:when>
				<c:otherwise>
					 ${ list.c_regDate } 
				</c:otherwise>
				</c:choose>
				</td>
			<td style="width:auto;">
					<c:choose>
				<c:when test="${ empty list.c_code }">
					 - 
				</c:when>
				<c:otherwise>
					 ${ list.c_code } 
				</c:otherwise>
				</c:choose>
				</td>
			<td style="width:auto;">
					<c:choose>
				<c:when test="${ list.c_empCnt == 0 }">
					 - 
				</c:when>
				<c:otherwise>
					 ${ list.c_empCnt } 
				</c:otherwise>
				</c:choose>
				</td>
			</tr>
		</c:forEach>
		</c:when>
		<c:otherwise>
			<td colspan="10">해방업체가 없습니다.</td>
		</c:otherwise>
		</c:choose>
	</tbody>		
	</table>
	
	<div align="center">
				<ul class="pagination">
					<li><a
						href="#" onclick="hcListGo(0)">처음</a></li>
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
							<li><a href="#">${ i+1 }</a></li>
						</c:if>
						<c:if test="${ i ne pageNo }">
							<li><a href="#" onclick="hcListGo(${ i } )">${ i }</a></li>
						</c:if>
						<%-- 					<li><a href="${ pageContext.request.contextPath }/list/&pageNo=${i}&searchCondition=${ titlecontent }&word=${ word }">${i+1}</a></li> --%>
					</c:forEach>

					<!--현재 페이지가 totalpage보다 커질 경우 다음 버튼을 disabled하는 조건문 -->
					<c:choose>
						<c:when test="${pageNo >= endPage}">
							<li class="disabled"><a href="#">다음</a></li>
						</c:when>

						<c:otherwise>
							<li><a
						href="#" onclick="hcListGo(${ pageNo }+1 )">다음</a></li>
							<%-- 							href="${ pageContext.request.contextPath }/list/&pageNo=${pageNo+1}&searchCondition=${ titlecontent }&word=${ word }">다음</a></li> --%>
						</c:otherwise>
					</c:choose>

					<li><a
						href="#" onclick="hcListGo(${ lastPage+1 })">마지막</a></li>
					<%-- 				<li><a href="${ pageContext.request.contextPath }/list/&pageNo=${totalpage}&searchCondition=${ titlecontent }&word=${ word }">마지막</a></li> --%>
				</ul>
			</div>

</body>
</html>