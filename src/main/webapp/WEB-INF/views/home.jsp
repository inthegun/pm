<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<h1> 메인 HOME 페이지 </h1>

<%-- ${login.user_id } login.user_id --%>
<%-- ${sessionScope.member.user_id } member.user_id --%>

 <p align="center">
<c:if test="${login == null }">
<a href='<c:url value="/member/login"/>' role="button">로그인 하기</a>
</c:if>
</p> 

 <c:if test="${login != null }">
<%-- ${login.user_id } 님 환영합니다 싸발 <br> --%>
<%-- ${member.user_id } 유저아이디 --%>
<%-- ${userName } 유저네임 ${userId} 유저 아이디  --%>
<h2>${sessionScope.userName }(${sessionScope.userId })님 환영 이요 </h2>

<p align="center">
	<a href='<c:url value="/member/info"/>' role="button">회원 정보 조회</a>
	<a href='<c:url value="/member/logout"/>' role="button">로그아웃</a>
 </p>
</c:if> 


</body>
</html>
