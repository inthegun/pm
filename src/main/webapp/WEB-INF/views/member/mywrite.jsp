<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../includes/header.jsp" %>
<meta charset="UTF-8">
<title>내가 쓴글</title>
</head>
<body>
<c:if test="${member != null }">
 <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">내가 쓴 글</h6>
                        </div>
                       
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" width="100%" cellspacing="0">
                                
                                
									<thead style="text-align: center">
                                    <!-- 1.목록이름 -->

									<tr>
									       <th>제목</th>
									      <th>작성일</th>
									        <th>조회수</th>
									 </tr>
									 
									 </thead>
        
        <!-- 테이블 내용  -->
        <c:forEach items="${mywrite }" var = "list">
        <tr style="text-align:center; width:100%;">
			<td style="width:60%"><c:if test="${list.comunity_id eq 1 }">
				<a href="/community/free_community/view?post_no=${list.post_no }"><c:out value="${list.post_title }"></c:out></a>
			</c:if>
			<c:if test="${list.comunity_id eq 2 }">
				<a href="/community/tip_community/view?post_no=${list.post_no }"><c:out value="${list.post_title }"></c:out></a>
			</c:if>
			<c:if test="${list.comunity_id eq 3 }">
				<a href="/community/care_community/view?post_no=${list.post_no }"><c:out value="${list.post_title }"></c:out></a>
			</c:if>
			<c:if test="${list.comunity_id eq 4 }">
				<a href="/community/sitter_community/view?post_no=${list.post_no }"><c:out value="${list.post_title }"></c:out></a>
			</c:if>
			<c:if test="${list.comunity_id eq 5 }">
				<a href="/community/parcel_community/view?post_no=${list.post_no }"><c:out value="${list.post_title }"></c:out></a>
			</c:if>
			 </td>
			<td style="width:30%"><fmt:formatDate pattern = "yyyy-MM-dd" value="${list.post_date }"/> </td>
			<td style="width:10%"><c:out value="${list.hit }" ></c:out> </td>
		</tr>
		</c:forEach>
	
</table>
</c:if>

<c:if test="${member == null }">
	잘못된 접근입니다 . 
</c:if>

 <!-- 3.페이징처리 -->
                                <!-- 이전 -->
                                
                   
                        <c:if test = "${pageMaker.prev }">
                                <a href = "/member/mywrite?pageNum=${pageMaker.startPage -1}&amount=${pageMaker.cri.amount}">Previous</a>
                                </c:if>

                        <!-- 번호 -->                                
                                <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                                <a href = "/member/mywrite?pageNum=${num }&amount=${pageMaker.cri.amount}">
                                ${num }</a>
                                   
                                </c:forEach>
                                
                                <!-- 다음 -->
                                <c:if test = "${pageMaker.next }">
                               
                                <a href = "/member/mywrite?pageNum=${pageMaker.endPage+1 }&amount=${pageMaker.cri.amount}">Next</a>
                                                    
                                </c:if>
                   






<%@include file="../includes/footer.jsp"%>
</body>
</html>