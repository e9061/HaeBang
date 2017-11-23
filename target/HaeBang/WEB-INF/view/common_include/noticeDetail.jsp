<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src ="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getParameter("path");
	if(path != null) {
%>
<script>
	$(document).ready(function(){
		$('#goBack').click(function(){
			location.href="${ pageContext.request.contextPath }<%= path %>/adminNotice?n_type=${noticeDetail.n_type}"
		});
		
		$('#retouch').click(function(){
			location.href="${ pageContext.request.contextPath }<%= path %>/adminRetouch?n_no=${noticeDetail.n_no}"
		});
		
		$('#delete').click(function(){
			location.href="${ pageContext.request.contextPath }<%= path %>/noticeDelete?n_no=${noticeDetail.n_no}&n_type=${noticeDetail.n_type}"
		});
	});
	
</script>

	<div class="container">
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
	</div>		
       
  <div class="container" style="margin: auto;">
  	
   <table class="table table-striped table-bordered table-hover" style="width: 1120px;">       
         <tr>
            <th style="width:10%; height:10%; text-align:center;">제목</th>
            <td><c:out value="${ noticeDetail.n_title }"/></td>
         </tr>
         <tr>
            <th style="width:10%; height:10%; text-align:center;">작성자</th>
            <td><c:out value="${ noticeDetail.n_writer }"/></td>
         </tr>
         
         <tr>
            <th style="text-align:center;">내용</th>
            <td style="width: 95%; height: 300px; font-size:16px;">
            <c:out value="${ noticeDetail.n_content }"/></td>
         </tr>  
         <tr>
            <th style="width:10%; height:10%; text-align:center;">첨부파일</th>
            <td>
            <c:forEach items="${ fileList }" var="file">
               <a href="${ pageContext.request.contextPath }/upload/${ file.fileSaveName }" target="_blank"> 
               ${ file.fileOriName }
               </a>
               (${ file.fileSize } byte(s)) <br/> <!-- 파일이 여러개(0~2개) 이므로.. -->
               <img style="width:500px;"src="<%= request.getContextPath() %>/upload/${ file.fileSaveName }" />
               <br/>
            </c:forEach>            
            </td>
         </tr>
         <tr>
            <th style="width:10%; height:10%; text-align:center;">등록일</th>
            <td>${ noticeDetail.n_regDate }</td>
         </tr>
   
      </table>
      
      <button class="btn btn-theme" id="retouch">수정</button>
      <button class="btn btn-theme" id="delete">삭제</button>
      <button class="btn btn-theme" id="goBack">뒤로가기</button>
      <br/>
      <br/>
  </div>
  
  
	<%
		}
	%>
	
