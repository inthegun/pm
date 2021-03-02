<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../../includes/header.jsp" %>

<%
 
    request.setCharacterEncoding("UTF-8");
 
%>

<html>
<head>
<meta charset = "UTF-8">
<title>게시물 목록</title>
</head>
<body>

	<form method = "post" accept-charset="utf-8">
	<label>제목</label>
	<input type = "text" name = "post_title" value = "${view.post_title }"/><br/>
	
	<label>작성자</label>
	<input type = "text" name = "user_id" value = "${view.user_id }" readonly="readonly"/><br/>
	
	<label>내용</label>
	<textarea cols = "200" rows = "10"name = "post_contact">"${view.post_contact }"</textarea><br/>
	
	<button type = "submit">완료</button>
	<button type="submit" id="back_Btn">취소</button>
				
				<script>
					$("#back_Btn").click(function(){
						history.back();
					});			
				</script>
	</form>

</body>
</html>
<%@include file="../../includes/footer.jsp"%>