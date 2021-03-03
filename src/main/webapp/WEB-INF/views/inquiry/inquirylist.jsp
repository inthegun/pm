<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
      <%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1 문의 리스트</title>
</head>
<body>

<c:if test="${userId eq null }">
	로그인 해야함 &gt; 추후 수정 &lt;
</c:if>

<c:if test="${userId ne null }">
	${userId } 님 문의 사항입니다.
	<a href="/inquiry/inquiry_register">문의 등록</a>
	
	<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>문의제목</th>
			<th>문의내용</th>
			<th>작성일</th>
		</tr>
	</thead>
	
	<%-- 테이블 내용  --%>
	<c:forEach items="${inquiryvo }" var="list">
	<c:set var="i" value="${i+1 }"/>
	<c:set var="enquiry_no" value="${list.enquiry_no }"/>
		<tr>
		
			<td><c:out value ="${i}" /></td>
            <td><a href="/inquiry/inquiry_view?no=${enquiry_no}">${list.enquiry_title }</a></td>
            <td><c:out value = "${list.enquiry_contact }" /></td>
            <td><fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value = "${list.enquiry_date }" /></td>
		</tr>
	</c:forEach>
	
	</table>
</c:if>


</body>
<%@include file="../includes/footer.jsp"%>
</html>