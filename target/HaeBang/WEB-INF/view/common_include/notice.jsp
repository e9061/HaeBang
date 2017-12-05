<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src ="http://code.jquery.com/jquery-3.2.1.min.js"></script>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
  <%
  	request.setCharacterEncoding("UTF-8");
    String path = request.getParameter("path");
    if (path != null) {
  %>
  
	<script>
	
		function doAction(boardNo,viewCnt) {
			location.href = "${ pageContext.request.contextPath }<%= path %>Detail?no=" + boardNo + "&n_viewCnt="+viewCnt;
	
		}
	</script>
  
	<div class="container">
	
		<div align="right">
			<form action="${ pageContext.request.contextPath }<%= path %>" method="get">
				<select name="searchCondition">
					<option value="titlecontent">제목+내용</option>
				</select> 
				<input type="hidden" value="${ n_type }" name="n_type" />
				<input type="text" name="word" value="${ word }" />
				<input class="btn btn-theme" type="submit" value="검색" />
			</form>
		</div>
		
		
		<div align="center">
			<hr>
			<h2>
				<strong>
					<c:choose>
						<c:when test="${ n_type eq 'o' }">
							사업자 공지사항
						</c:when>
						<c:otherwise>
							소비자 공지사항						
						</c:otherwise>
					</c:choose>
				</strong>
			</h2>
			<hr>
		</div>



		<table class="table table-striped table-bordered table-hover" style="width: 1120px;">
			<thead>
				<tr>
					<th width="7%">번호</th>
					<th>제목</th>
					<th width="7%">조회수</th>
					<th width="15%">등록일</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${ noticelist }" var="board" varStatus="loop">
					<tr>
						<td>${ board.n_no }</td>
						<td>
							<a href="javascript:doAction(${ board.n_no }, ${ board.n_viewCnt })"> 
								<c:out value="${ board.n_title }" />
							</a>
						</td>
						<td>${ board.n_viewCnt }</td>
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

		
		<div align="center">
			<ul class="pagination">
				<li><a href="${ pageContext.request.contextPath }<%= path %>?n_type=${ n_type }&nowpage=0&searchCondition=${ titlecontent }&word=${ word }">처음</a></li>
	
				<!--현재 페이지가 0보다 작아질 경우 이전 버튼을 disabled하는 조건문 -->
				<c:choose>
					<c:when test="${nowpage <= 0}">
						<li class="disabled"><a href="#">이전</a></li>
					</c:when>
	
					<c:otherwise>
						<li><a
							href="${ pageContext.request.contextPath }<%= path %>?n_type=${ n_type }&nowpage=${nowpage -1}&searchCondition=${ titlecontent }&word=${ word }">이전</a></li>
					</c:otherwise>
				</c:choose>
	
				<!--해당하는 페이지로 갈 수 있는 버튼 -->
				<c:forEach var="i" begin="0" end="${totalpage}">
					<li><a href="${ pageContext.request.contextPath }<%= path %>?n_type=${ n_type }&nowpage=${i}&searchCondition=${ titlecontent }&word=${ word }">${i+1}</a></li>
				</c:forEach>
	
				<!--현재 페이지가 totalpage보다 커질 경우 다음 버튼을 disabled하는 조건문 -->
				<c:choose>
					<c:when test="${nowpage >= totalpage}">
						<li class="disabled"><a href="#">다음</a></li>
					</c:when>
	
					<c:otherwise>
						<li><a
							href="${ pageContext.request.contextPath }<%= path %>?n_type=${ n_type }&nowpage=${nowpage+1}&searchCondition=${ titlecontent }&word=${ word }">다음</a></li>
					</c:otherwise>
				</c:choose>
	
				<li><a href="${ pageContext.request.contextPath }<%= path %>?n_type=${ n_type }&nowpage=${totalpage}&searchCondition=${ titlecontent }&word=${ word }">마지막</a></li>
			</ul>
		</div>
	</div>
<%
    }
%>