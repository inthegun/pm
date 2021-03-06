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

   <form method = "post" accept-charset="UTF-8">
   
   <div class="mb-3">
    <label for="staticEmail" class="col-sm-2 col-form-label">작성자</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" name="user_id" value="${view.user_id }">
    </div>
  </div>
  <div class="mb-3">
  <label for="post_title" class="form-label">제목</label>
  <input type="text" class="form-control" name="post_title" value = "${view.post_title }" placeholder="${view.post_title }">
   </div>
   
    <div class="mb-3">
  <label for="post_contact" class="form-label">내용</label>
  <textarea class="form-control" name="post_contact" rows="5">${view.post_contact }</textarea>
   </div>

   
   <button type = "submit" id = "ok_Btn" class = "btn btn-success">완료</button>
   <script>
   $("#ok_Btn").click(function(){
      alert("저장되었습니다.")
   });
   </script>
   
   <button type="submit" id="back_Btn" class="btn btn-danger">취소</button>
            <script>
               $("#back_Btn").click(function(){
                  alert("취소되었습니다.")
                  history.back();
               });         
            </script>
   </form>

</body>
</html>
<%@include file="../../includes/footer.jsp"%>