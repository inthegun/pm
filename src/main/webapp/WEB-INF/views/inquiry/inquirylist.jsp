<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


      <%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1 문의 리스트</title>
</head>
<body>

<c:if test="${userId eq null }">
    잘못된 접근입니다.
</c:if>

<c:if test="${userId ne null }">
<div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">  ${userId } 님 문의 사항입니다.</h6>
                        </div>
                        
                        
          <div class="card-body">
             <div class="table-responsive">
                  <table class="table table-striped table-bordered table-hover" width="100%" cellspacing="0">              
                      <thead style="text-align: center">
                                    <!-- 1.목록이름 -->
                                    <tr>
                                       <th>글번호</th>
                                       <th>문의제목</th>
                                       <th>문의내용</th>
                                       <th>작성일</th>
                                    </tr>
                                    </thead>          
                                	<!-- 테이블내용 -->
                                    <c:forEach items="${inquiryvo }" var = "list">
                                    <c:set var="i" value="${i+1 }"/>
								    <c:set var="enquiry_no" value="${list.enquiry_no }"/>
								    <c:set var="userid" value="${list.user_id }"/>
                                       <tr style="text-align:center; width:100%;">
                                          <td style="width:10%"><c:out value = "${i}" /></td>
                                          <td style="width:50%"><a href="/inquiry/inquiry_view?no=${enquiry_no}&userid=${userid}">${list.enquiry_title }</a></td>
                                          <td style="width:15%"><c:out value = "${list.enquiry_contact }" /></td>
                                          <td style="width:15%"><fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value = "${list.enquiry_date}" /></td>
                                       </tr>
                                    </c:forEach>
                                  </table>
                                  
                                  <button type="button" class="btn btn-info btn-md" onclick="location.href='/inquiry/inquiry_register'" style="float: right;">문의등록</button>
</div>
</div>

   

</c:if>


</body>
<%@include file="../includes/footer.jsp"%>
</html>