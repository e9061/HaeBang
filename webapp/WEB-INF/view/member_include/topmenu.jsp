<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    


   <!-- css -->
   <link href="<%= request.getContextPath() %>/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
   <link href="<%= request.getContextPath() %>/bootstrap/css/fancybox/jquery.fancybox.css" rel="stylesheet">
   <link href="<%= request.getContextPath() %>/bootstrap/css/jcarousel.css" rel="stylesheet" />
   <link href="<%= request.getContextPath() %>/bootstrap/css/flexslider.css" rel="stylesheet" />
   <link href="<%= request.getContextPath() %>/bootstrap/css/style.css" rel="stylesheet" />

   <!-- Theme skin -->
   <link href="<%= request.getContextPath() %>/bootstrap/skins/default.css" rel="stylesheet" />
   
   
         <!--  -->
         <div class="navbar navbar-default navbar-static-top">
            <div class="container">
               <div class="navbar-header">
                  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                  <a class="navbar-brand" href="<%= request.getContextPath() %>/index.jsp"><span>H</span>aeBang</a>
               </div>
               <div class="navbar-collapse collapse ">
                  <ul class="nav navbar-nav">
                     <li class="active"><a href="<%= request.getContextPath() %>/index.jsp">Home</a></li>
                     <li><a href="<%= request.getContextPath() %>/portfolio.jsp">신청</a></li>
                     <li><a href="<%= request.getContextPath() %>/pricingbox.jsp">서비스목록</a></li>
                     <!--  -->
                  <c:choose>
                     <c:when test="${ empty MemberVO }">
                        <li><a href="<%= request.getContextPath() %>/WEB-INF/view/member/JoinMemberForm.jsp">회원가입</a></li> 
                           <li><a href="<%= request.getContextPath() %>/WEB-INF/view/member/LoginMember.jsp">로그인</a></li>
                           </c:when>
                     <c:otherwise>
                        <!-- <li><a href="/HaeBang/WEB-INF/view/member/Mypage.jsp">마이페이지</a></li> -->
                        <li class="dropdown">
                        <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Mypage<b class=" icon-angle-down"></b></a>
                        <ul class="dropdown-menu">
                           <li><a href="<%= request.getContextPath() %>/typography.jsp">내 정보 확인</a></li>
                           <li><a href="<%= request.getContextPath() %>/components.jsp">예약 내역</a></li>
                           <li><a href="<%= request.getContextPath() %>/blog.jsp">blog</a></li>
                        </ul>
                     </li>
                            <li><a href="<%= request.getContextPath() %>/WEB-INF/view/member/LogoutMember.jsp">로그아웃</a></li>
                     </c:otherwise>
                  </c:choose>
                  <!--  -->
                     <!-- <li class="dropdown">
                        <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Mypage<b class=" icon-angle-down"></b></a>
                        <ul class="dropdown-menu">
                           <li><a href="typography.jsp">내 정보 확인</a></li>
                           <li><a href="components.jsp">예약 내역</a></li>
                           <li><a href="blog.jsp">blog</a></li>
                        </ul>
                     </li> -->
                  </ul>
               </div>
            </div>
         </div>
         
         
         
         
