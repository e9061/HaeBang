<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

[
   <c:forEach var="vo" items="${ list }" varStatus="loop">
      <c:if test="${ loop.index ne 0 }">,</c:if>
      ${ vo.m_id }
   </c:forEach>
]    