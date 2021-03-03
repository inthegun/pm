<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>고객문의 글 보기</title>
</head>
<body>
			<label>제목</label> ${view.enquiry_title }
			<br/>
			<label>작성자</label> ${view.user_id }
			<br/>
			<label>내용</label> ${view.enquiry_contact }
			

		
		
		
</body>
</html>
<%@include file="../includes/footer.jsp"%>