<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../includes/header.jsp" %>
<meta charset="UTF-8">
<title>내가 쓴글</title>
</head>
<body>
<c:if test="${member != null }">

<h3> 내가 쓴글 </h3>

<table border="1">

<tr>
       <th>제목</th>
      <th>작성일</th>
        <th>조회수</th>
 </tr>
        
        <c:forEach items="${mywrite }" var = "list">
        <tr>
			<td><c:if test="${list.comunity_id eq 1 }">
				<a href="/community/free_community/view?post_no=${list.post_no }"><c:out value="${list.post_title }"></c:out></a>
			</c:if>
			<c:if test="${list.comunity_id eq 2 }">
				<a href="/community/tip_community/view?post_no=${list.post_no }"><c:out value="${list.post_title }"></c:out></a>
			</c:if>
			 </td>
			<td><fmt:formatDate pattern = "yyyy-MM-dd" value="${list.post_date }"/> </td>
			<td><c:out value="${list.hit }" ></c:out> </td>
		</tr>
		</c:forEach>
	
</table>
</c:if>

<c:if test="${member == null }">
	잘못된 접근입니다 . 
</c:if>

<%@include file="../includes/footer.jsp"%>
</body>
</html>