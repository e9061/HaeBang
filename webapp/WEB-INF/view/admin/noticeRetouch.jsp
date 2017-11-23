<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin`s HaeBang - OwnerNotice </title>
<script>
	function validate(){
		if($('#title').val().trim()==""){
			alert("공지사항 제목을 입력해 주세요.");
			$("#title").val("").focus();
			return false;
		}else{
			if($('#content').val().trim()==""){
				alert("내용을 입력해 주세요");
				$('#content').val("").focus();
				return false;
			}else{
				if(confirm("글을 등록 하시겠습니까?")){
					return true;
				}else{
					return false;
				}
			}
		}
	}
</script>
</head>
<body>
	
	<header>
		<jsp:include page="../admin_include/topmenu.jsp"/>
	</header>
	
	<section>
	<div class="container">
		<div align="center">
			<hr>
				<h2>
					<strong>
								공지사항 글 등록
					</strong>
				</h2>
			<hr>
		</div>
	</div>
	<div class="container" style="margin: auto;">
		<form:form action="${ pageContext.request.contextPath }/admin/adminRetouch" commandName="noticeRetouch" method="POST" onsubmit="return validate()">
			<table style="width: 1120px;" class="table table-striped table-bordered table-hover">
		        	<tbody align="center">
				        	<tr>
				                <td width="10%">분류</td>
				                <td> 
									<form:hidden path="n_no"/>
									<form:hidden path="n_writer"/>
				                	<form:radiobutton path="n_type" value="m" label="소비자"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                	<form:radiobutton path="n_type" value="o" label="사업자"/>
				                </td>
				        	</tr>
				            <tr>
				                <td>제목</td>
				                <td>
				                	<form:input style="width: 95%; height: 35px; font-size:16px;" path="n_title" placeholder=" 제목을 입력해 주세요. " id="title"/>
				                </td>
				            </tr>
				            <tr>
				                <td>내용</td>
				                <td>
				                	<form:textarea style="width: 95%; height: 300px; padding: 0; font-size:16px;" path="n_content"  placeholder=" 내용을 입력해 주세요." id="content"></form:textarea>
				                </td>
				            </tr>
				            <tr>
				                <td>첨부파일</td>
				                <td>
				                    <label>
								        <input type="file" multiple="multiple">
								    </label>
								 <!--    	<input type="text" readonly="readonly" title="File Route"> -->
				                </td>
				            </tr>
		        	</tbody>
	   	 	</table>
	   	 					<div  style="float: right;">
									<a href="${ pageContext.request.contextPath }/admin/adminNoticeDetail? no=${noticeRetouch.n_no}">
									<input type="button" value="이전" class="btn btn-theme">
									</a>
					            	<input type="submit" value="수정 완료" class="btn btn-theme">
	   	 					</div>
		</form:form>
	</div>

		<br/>
		<br/>
		<br/>
	</section>
	
	<footer>
		<jsp:include page="../admin_include/bottom.jsp"/>
	</footer>
</body>
</html>