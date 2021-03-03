<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../../includes/header.jsp" %>
	           
    <form action='<c:url value='/community/free_community/insert'/>' method="post">
        <div class="form-group">
              <label for="exampleFormControlInput1">제목</label>
            <input type="text" class="form-control" id="post_title" name="post_title" placeholder="제목을 작성해주세요.">
          </div>
        <div class="form-group">
            <label for="exampleFormControlInput1">작성자</label>
            <input type="text" class="form-control" id="user_id" name="user_id" value="${user_id}" readonly="readonly">
          </div>
          <div class="form-group">
            <label for="exampleFormControlTextarea1">내용</label>
            <textarea class="form-control" id="post_contact" name="post_contact" rows="10"></textarea>
          </div>
        <button type="submit" class="btn btn-info">등록하기</button>
        
    </form>

        

<%@include file="../../includes/footer.jsp"%>