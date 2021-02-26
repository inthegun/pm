<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../includes/header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${member != null }">

<h3> 회원 정보 조회</h3>

<table border="1">
	<tr>
		<td>아이디</td>
		<td><c:out value="${UserInfo.user_id }"></c:out> </td>
	</tr>
	<tr>
		<td>이름</td>
		<td><c:out value="${UserInfo.user_name }"></c:out> </td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><c:out value="${UserInfo.user_email }" ></c:out> </td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td><fmt:formatDate value="${UserInfo.user_birth }" type="date"/> </td>
	</tr>
	<tr>
		<td>주소</td>
		<td><c:out value="${UserInfo.user_addr }"></c:out> </td>
	</tr>
	<tr>
		<td>성별</td>
		<td><c:out value="${UserInfo.user_sex }"></c:out> </td>
	</tr>
	
</table>
</c:if>

<c:if test="${member == null }">
	잘못된 접근입니다 . 
</c:if>

<%@include file="../includes/footer.jsp"%>
</body>
</html>