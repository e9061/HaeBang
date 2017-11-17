<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<script src ="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin`s HaeBang - memeberManagement </title>
<script>
   $(document).ready(function(){
	   
	  // 비회원 ajax
      $("#nMember_btn").click(function(){
         
          $.ajax({         
               url: "${ pageContext.request.contextPath }/admin/nMbList",
               type: "GET",
               success: function(data) {
            	   getMbList(data); 
               }         
            });
      });
      
	  // 회원 ajax
      $("#member_btn").click(function(){
         
          $.ajax({         
               url: "${ pageContext.request.contextPath }/admin/mbList",
               type: "GET",
               success: function(data) {
                  getMbList(data); 
               }         
            });
      });
	  
	  
	  
	  // 전체 조검 검색
	  $("#search_btn").click(function(){
		if($("#search_content").val().trim()==""){
	    	 alert("검색어를 입력해주세요.");
	    	 $("#search_content").val("").focus();
		} else {
			
		  $.ajax({
				url: "${ pageContext.request.contextPath }/admin/mbSearched",
				type: "POST",
				data: {
					type : $("#selectType").val(),
					option : $("#selectBox").val(),
	            	content : $("#search_content").val()	
	            }, 
				success: function(data) {
					getMbList(data);
				}
		  });
		}
	  });
       
       function getMbList(data){
             var list = JSON.parse(data); 
             var output = "";
             
             
			output += " <table style='width:80%;'>";
            output +=	"<tr>";
           		output +=	"<td width='5%'><h4> <strong> 번호  </strong></h4> </td>";
         		output +=	"<td width='10%'><h4>  <strong> 아이디  </strong></h4></td>";
           		output +=	"<td width='10%'><h4>  <strong> 이름  </strong></h4></td>";
           		output +=	"<td width='20%'><h4>  <strong> 주소  </strong></h4></td>";
           		output +=	"<td width='15%'><h4>  <strong> 전화번호  </strong></h4></td>";
           		output +=	"<td width='10%'><h4> <strong> 업체정보  </strong></h4> </td>"
           		output +=	"<td width='15%'><h4>  <strong> 가입 날짜  </strong></h4></td>";
			output +=	"</tr>";
				
             for (var i = 0; i < list.length; i++) {                            
				
            	output += "<tr>";
            	output += "	<td>" +  list[i].m_no + "</td>" ;
				 
				if(list[i].m_id == null){
						output += "	<td> - </td>";  				 
				}else{
						output += "	<td>" +  list[i].m_id+"</td>";  				 
				}
				 output += "	<td>" +  list[i].m_name+"</td>";  				 
				 output += "	<td>" +  list[i].m_address+"</td>";  				 
				 output += "	<td>" +  list[i].m_phone+"</td>";  
				 
				if(list[i].m_owner == null){
						output += "	<td> - </td>";  				 
				}else{
						output += "	<td>" +  list[i].m_owner+"</td>";  				 
				}
				output += "<td width='15%'>" + list[i].m_joinDate+"</td>";
				
				output += "</tr>";
                    
             }   
               output += "</table>";
                    
                 $("#mList").html(output); 
       }
  
});
   
   

</script>

<style type="text/css">

table {
	border:1px solid black;
	height:50px;
	text-align: center;
}
tr {
	border : 1px solid black;
	height:30px;
}
td{
	border : 1px solid black;
}
strong{
	vertical-align: middle;
}

</style>

</head>
<body>
	<header>
		<jsp:include page="../admin_include/topmenu.jsp"/>
	</header>

	<section>
		<div align="center" style="padding-right: 4px;">
		<h1> <span>회원 관리</span> </h1>
			<br/>
			<br/>
	      	
	      	<select id='selectType'class="btn btn-theme">
				<option value='m' selected> 정회원  </option>
				<option value='b'> 비회원 </option>
				<option value='x'> 탈퇴회원 </option>
			</select>
			<span style="margin-right: 5px"></span>
			<select id='selectBox'class="btn btn-theme" >
				<option value='m_no' selected> 회원번호  </option>
				<option value='m_id' > 아이디  </option>
				<option value='m_name'> 이름 </option>
				<option value='m_phone'> 전화번호 </option>
			</select>
			<span style="margin-right: 10px"></span>
            <input type='text' id='search_content' placeholder="검색어를 입력해주세요." style="width:15%;"/>
            <input type='button' id='search_btn' value='조건 검색' class="btn btn-theme"/>
	      	
            
            <span style="margin-right: 40px;"></span>
      		<input type="button" id="member_btn" value="해방회원 조회" class="btn btn-theme"/>
      		<span style="margin-right: 5px"></span>
      		<input type="button" id="nMember_btn" value="비회원 조회" class="btn btn-theme"/>
			<br/>
			<br/>
			<br/>
			<br/>
				<table id="mList" style="width:80%">
				</table>
			<br/>
			<br/>
			<br/>
			<br/>
		</div>
		
		
		
		
		
	</section>	
	
	<footer>
		<jsp:include page="../admin_include/bottom.jsp"/>
	</footer>
	
</body>
</html>