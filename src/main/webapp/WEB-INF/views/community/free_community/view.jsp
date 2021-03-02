<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
			<label>제목</label> ${view.post_title }
			<br/>
			<label>작성자</label> ${view.user_id }
			<br/>
			<label>내용</label> ${view.post_contact }

		
		<div>
			<a href="/community/free_community/update?post_no=${view.post_no}">수정</a>
			<a href="/community/free_community/delete?post_no=${view.post_no}">삭제</a>
		</div>
		
</body>
</html>
<%@include file="../../includes/footer.jsp"%>