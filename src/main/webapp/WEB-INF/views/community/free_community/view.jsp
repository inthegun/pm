<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post">
		<div>
			<label>제목</label> <input type="text" name="post_title" value="${view.post_title}" readonly="readonly"/>
		</div>

		<div>
			<label>작성자</label> <input type="text" name="user_id" value="${view.user_id}" readonly="readonly" />
		</div>

		<div>
			<label>작성날짜</label> <fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value="${view.post_date}"/>
		</div>
		
		<div>
			<label>내용</label>
			<textarea rows="5" cols="50" name="post_contact" readonly="readonly">${view.post_contact}</textarea>
		</div>
		
		<div>
			<a href="/community/free_community/update?post_no=${view.post_no}">수정</a><br />
			<a href="/community/free_community/delete?post_no=${view.post_no}">삭제</a>
		</div>
		
	</form>
</body>
</html>