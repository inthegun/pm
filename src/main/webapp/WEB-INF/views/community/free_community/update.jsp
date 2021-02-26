<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../../includes/header.jsp" %>

<html>
<head>
<title></title>
</head>
<body>

	<form method="post">
	
		<input type="hidden" name="post_no" value="${view.post_no}" />
	
		<div>
			<label>제목</label> <input type="text" name="post_title" value="${view.post_title}" />
		</div>

		<div>
			<label>작성자</label> <input type="text" name="user_id" value="${view.user_id}" readonly="readonly" />
		</div>

		<div>
			<label>작성날짜</label> 
			<%-- <fmt:formatDate value="${view.regDate}" pattern="yyyy-MM-dd" />  --%>
			
			<input type="text" name="post_date"
					value="<fmt:formatDate value="${view.post_date}" pattern="yyyy-MM-dd" />" readonly="readonly" />
		</div>
		
		<div>
			<label>내용</label>
			<textarea rows="5" cols="50" name="post_contact" >${view.post_contact}</textarea>
		</div>
		
		<div>
			<button type="submit">수정</button>
		</div>
		
		
	</form>

</body>
</html>
<%@include file="../../includes/footer.jsp"%>