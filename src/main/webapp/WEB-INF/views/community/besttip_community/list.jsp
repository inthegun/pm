<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
   href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">
<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
   src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<%@include file="../../includes/header.jsp" %>

</head>

<body>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Best Tip</h6>                                                      
                        </div>
                       
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" width="100%" cellspacing="0">
                                


<c:out value = "${frre_list.post_no }" />

                                    <thead style="text-align: center">
                                    <!-- 1.목록이름 -->
                                    <tr>
                                       <th>글번호</th>
                                       <th>제목</th>
                                       <th>작성자</th>
                                       <th>작성일</th>
                                       <th>조회수</th>
                                    </tr>
                                    </thead>
                                    
                                    <!-- 테이블내용 -->
                                    <c:forEach items="${tip_list }" var = "list">
                                    	<c:set var="i" value="${i+1 }"></c:set>
                                       <tr style="text-align:center; width:100%;">
                                           <td style="width:10%"><c:out value = "${i}" /></td>
                                          <td style="width:50%"><a href="/community/tip_community/view?post_no=${list.post_no }">${list.post_title }</a></td>
                                          <td style="width:15%"><c:out value = "${list.user_id }" /></td>
                                          <td style="width:15%"><fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value = "${list.post_date }" /></td>
                                          <td style="width:10%"><c:out value = "${list.hit}" /></td>
                                       </tr>
                                    </c:forEach>
                                  </table>
                                <!-- 3.페이징처리 -->
                                
                  
                     
                        
                        <br>
                        
                            </div>
                        </div>
                    </div>   

                
                <!-- /.container-fluid -->

            
            <!-- End of Main Content -->
</body>
 

<%@include file="../../includes/footer.jsp"%>
</html>