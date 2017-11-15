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
	   
	  // 일반업체 ajax
      $("#cList_btn").click(function(){
         
          $.ajax({         
               url: "/admin/nCompanyManage",
               type: "GET",
               success: function(data) {
                  getCompanyList(data); 
               }         
            });
      });
      
	  // 해방업체 ajax
      $("#hcList_btn").click(function(){
         
          $.ajax({         
               url: "/admin/hbCompanyManage",
               type: "GET",
               success: function(data) {
                  getHbCompanyList(data); 
               }        
            });
      });
      
      
	  // 조건 검색 ajax
	  $("#searchBtn").click(function(){
		  if($("#searchContent").val().trim()==""){
		    	 alert("검색어를 입력해주세요.");
		    	 $("#searchContent").val("").focus();
			} else {
				
				 $.ajax({
					url:  "/admin/searchCompany",
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
	  
	  
       function getCompanyList(data){
             var list = JSON.parse(data);         
             var output = "";
             
 			output += " <table style='border:1px soild red; width:100%'>"
 	            output +=	"<tr>";
 	           		output +=	"<td width='10%'><h4><strong> 업체명 </strong></h4></td>";
 	           		output +=	"<td width='25%'><h4><strong> 주소   </strong></h4></td>";
 	           		output +=	"<td width='10%'><h4><strong> 전화번호  </strong></h4></td>";
 	           		output +=	"<td width='20%'><h4><strong> 가입일  </strong></h4></td>";
 	           		output +=	"<td width='20%'><h4><strong> 사업자번호  </strong></h4></td>";
				output +=	"</tr>";
				
             for (var i = 0; i < list.length; i++) {                            
                    output += "<tr>";
                   for (var key in list[i]) {                      
                       if(key == 'c_name'){
                    	   output += "<td width='10%'>" + list[i].c_name + "</td>" ;          
                       }else if(key == 'c_phone'){
                          	output += "<td width='10%'>" + list[i].c_phone + "</td>" ;
                       }else if(key == 'c_address'){                          
                         output += "<td width='35%'>" + list[i].c_address+"</td>";                                    
                       }else if(key == 'c_bizNo'){                          
                         output += "<td width='20%'>" + list[i].c_bizNo+"</td>";                                    
                       }else if(key == 'c_signDate'){                          
                         output += "<td width='20%'>" + list[i].c_signDate+"</td>";                                    
                       }
                   }
                    output += "</tr>"
                    output += "</table>"
             };
                 $("#cList").html(output); 
       }
       
       
       function getHbCompanyList(data){
             var list = JSON.parse(data); 
             var output = "";
             
			output += " <table style='width:100%; border:1px soild red' text-align='center'>"
            output +=	"<tr>";
         		output +=	"<td width='10%'><h4> <strong> 업체명  </strong></h4></td>";
           		output +=	"<td width='20%'><h4> <strong> 주소  </strong></h4></td>";
           		output +=	"<td width='15%'><h4> <strong> 전화번호  </strong></h4></td>";
           		output +=	"<td width='10%'><h4> <strong> 등록일  </strong></h4></td>";
           		output +=	"<td width='15%'><h4> <strong> 사업자번호  </strong></h4></td>";
           		output +=	"<td width='10%'><h4> <strong> 업체코드  </strong></h4></td>";
           		output +=	"<td width='5%'><h4> <strong> 직원 </strong></h4></td>";
           		output +=	"<td width='10%'><h4> <strong> 사장명  </strong></h4></td>";
           		output +=	"<td width='5%'><h4> <strong> 평점  </strong></h4></td>";
			output +=	"</tr>";
				
             for (var i = 0; i < list.length; i++) {                            
                    output += "<tr>";
                   for (var key in list[i]) {                      
                       if(key == 'c_code'){
                    	   output += "<td width='10%'>" + list[i].c_code + "</td>" ;          
                   	   }else if(key == 'c_name'){
                          output += "<td width='10%'>" + list[i].c_name + "</td>" ;
                       }else if(key == 'c_address'){
                          output += "<td width='20%'>" + list[i].c_address + "</td>" ;
                       }else if(key == 'c_name'){ // 사장명 들어가야함                         
                         output += "<td width='10%'>" + list[i].c_name+"</td>";                                    
                       }else if(key == 'c_phone'){                          
                         output += "<td width='15%'>" + list[i].c_phone+"</td>";                                    
                       }else if(key == 'c_regDate'){
                    	   if(list[i].c_regDate == null){
	                         output += "<td width='10%'>" + list[i].c_signDate+"</td>";                                    
                    	   }else{
	                         output += "<td width='10%'>" + list[i].c_regDate+"</td>";                                    
                    	   }
                       }else if(key == 'c_bizNo'){   
                    	   if(list[i].c_bizNo == null){
 	                         	output += "<td width='10%'> - </td>"; 
                    	   }else{
                         		output += "<td width='15%'>" + list[i].c_bizNo+"</td>";  
                    	   }
                       }else if(key == 'c_name'){     // 평균 별점  들어가야함                
                         output += "<td width='5%'>" + list[i].c_name+"</td>";                                    
                       }else if(key == 'c_empCnt'){  
                    	   if(list[i].c_empCnt == null){
  	                         	output += "<td width='10%'> - </td>";                                    
                      	   }else{
		                        output += "<td width='5%'>" + list[i].c_empCnt+"</td>";                                    
                      	   }
                       }
                   }
                    output += "</tr>"
             };
                 $("#cList").html(output); 
       }
   });
   
   

</script>

<style type="text/css">

table {
	height:50px;
	magin:auto;
	text-align: center;
}

</style>

</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/view/admin_include/topmenu.jsp"/>
	</header>

	<section>
		<h1> <span>회원 관리 페이지</span> </h1>
      	<input type="button" id="hcList_btn" value="해방업체 조회"/>
      	<input type="button" id="cList_btn" value="일반업체 조회"/>
      	<select id='comType'>
      		<option value="h" selected> 해방 업체 </option>
      		<option value="n"> 일반 업체</option>
      	</select>
      	<select id='search'>
      		<option value="c_code" selected> 업체코드 </option>
      		<option value="c_name"> 업체명 </option>
      		<option value="c_address"> 주소 </option>
      		<option value="c_bizNo"> 사업자등록번호 </option>
      	</select>
      	<input type="text" id="searchContent"/>
      	<input type="button" id="searchBtn" value="조건 검색"/>
      	
		<br/>
		<br/>
		<br/>
		<br/>
		
			<table id="cList" style="width:80%">
			</table>
			
		<br/>
		<br/>
		<br/>
		<br/>
		
		
		
	</section>	
	
	<footer>
		<jsp:include page="/WEB-INF/view/admin_include/bottom.jsp"/>
	</footer>
	
</body>
</html>