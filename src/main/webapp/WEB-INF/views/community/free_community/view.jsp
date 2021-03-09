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
          
   <div class="mb-3">
    <label for="staticEmail" class="col-sm-2 col-form-label">작성자</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" name="user_id" value="${view.user_id }">
    </div>
  </div>
  <div class="mb-3">
  <label for="post_title" class="form-label">제목</label>
  <input type="text" class="form-control" name="post_title" value = "${view.post_title }" placeholder="${view.post_title }" readonly="readonly">
   </div>
   
    <div class="mb-3">
    
    <img src="${view.gdsImg }" style="width:30%; hegith:auto;"><br>
    
  <label for="post_contact" class="form-label">내용</label>
  <textarea class="form-control" readonly="readonly" name="post_contact" rows="5">${view.post_contact }</textarea>
   </div>
      
      
      
      <br><br><br>
      
      <c:if test="${sessionScope.userId eq view.user_id }">
      <input type = "button" value = "수정" class = "btn btn-success" 
      onclick="location.href='/community/free_community/update?post_no=${view.post_no}'"/>
      

      <input type="button" value = "삭제" id = "del"class="btn btn-danger" 
      onclick="location.href='/community/free_community/delete?post_no=${view.post_no}'"/>
      
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