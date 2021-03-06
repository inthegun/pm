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
         <label>내용</label> <br/> 
         <img src="${view.gdsImg }" style="width:50%; hegith:auto;"><br>
         ${view.post_contact }
      
      
      
      <br><br><br>
      <c:if test="${sessionScope.userId eq view.user_id }">
      <input type = "button" value = "수정" class = "btn btn-success" 
      onclick="location.href='/community/sitter_community/update?post_no=${view.post_no}'"/>
      

      <input type="button" value = "삭제" id = "del"class="btn btn-danger" 
      onclick="location.href='/community/sitter_community/delete?post_no=${view.post_no}'"/>
      </c:if>
      <script>
      $("#del").click(function(){
       alert("삭제되었습니다.")
      });
      </script>
      
</body>
</html>
<%@include file="../../comment/comment.jsp" %>
<%@include file="../../includes/footer.jsp"%>