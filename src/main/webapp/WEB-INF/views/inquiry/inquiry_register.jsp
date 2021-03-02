<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@include file="../includes/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/inquiry/inquiry_register" method="post">
<p>문의 제목 </p> <input type="text" name="enquiry_title">
<p>문의 내용</p> <input type="text" name="enquiry_contact">
<button type="submit">문의 등록 </button>
</form>

</body>
<%@include file="../includes/footer.jsp"%>
</html>