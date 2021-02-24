<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../../includes/header.jsp" %>
	
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Board List Page</h6>
                            <button id='regBtn' type ="button" class ="btn btn-xs pull-right">Register New Board</button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" width="100%" cellspacing="0">


<%-- <c:out value = "${free_list.post_no }" /> --%>
                                    <thead>
                                    <!-- 1.목록이름 -->
                                    <tr>
                                    	<th>#번호</th>
                                    	<th>제목</th>
                                    	<th>내용</th>
                                    	<th>작성자</th>
                                    	<th>작성일</th>
                                    </tr>
                                    </thead>
                                    
                                    <!-- 테이블내용 -->
                                    <c:forEach items="${free_list }" var = "list">
                                    	<tr>
                                    		<td><c:out value = "${list.post_no }" /></td>
                                    		<td><c:out value = "${list.post_title }" /></td>
                                    		<td><c:out value = "${list.post_contact }" /></td>
                                    		<td><c:out value = "${list.user_id }" /></td>
                                    		<td><fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value = "${list.post_date }" /></td>
                                    	</tr>
                                    </c:forEach>
                                  </table>
                                
                                <!-- 3.페이징처리 -->
								<c:if test = "${pageMaker.prev }">
                                <a href = "/board/list?pageNum=${pageMaker.startPage -1}&amount=${pageMaker.cri.amount}">Previous</a>
                                </c:if>
                                
                                <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                                <a href = "/board/list?pageNum=${num }&amount=${pageMaker.cri.amount}">
                                ${num }</a>
                                	
                                </c:forEach>
                                
                                <c:if test = "${pageMaker.next }">
                               
                                <a href = "/board/list?pageNum=${pageMaker.endPage+1 }&amount=${pageMaker.cri.amount}">Next</a>
							                               
                                </c:if>
							
								<br>
								<!-- 4.검색 -->
								<form id = "searchForm" action="/board/list" method="get">
								<select name = 'type'>
								<option value=""></option>
								<option value =""></option>
								<option value =""></option>
								<option value =""></option>
								<option value =""></option>
								<option value =""></option>
								
								</select>
								
								<input type = "text" name = "keyword">
								<input type = "submit" value ="Search">
								
								</form>
                            </div>
                        </div>
                    </div>	

                
                <!-- /.container-fluid -->

            
            <!-- End of Main Content -->

           

<%@include file="../../includes/footer.jsp"%>