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
   
   
   
   <div class="navbar navbar-default navbar-static-top">
            <div class="container">
               <div class="navbar-header">
                  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                  <a class="navbar-brand" href="<%= request.getContextPath() %>/index.jsp"><span>ㅎ</span>방 사업자 사이트</a>
               </div>
               <div class="navbar-collapse collapse ">
                  <ul class="nav navbar-nav">
                     <li class="active"><a href="<%= request.getContextPath() %>/admin/progress.do">진행현황</a></li>
                     <li><a href="<%= request.getContextPath() %>/admin/schedule.do">스케쥴관리</a></li>
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
                           <li><a href="typography.html">공지사항</a></li>
                           <li><a href="components.html">자주묻는질문</a></li>
                           <li><a href="pricingbox.html">서비스약관</a></li>
                        </ul>
                     </li>
                     
                     
                  </ul>
               </div>
            </div>
         </div>
