<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <!-- Footer -->
 <!-- 페이지 맨 마지막 카피라이트 부분 -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; PickMePetMe 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->
    <!-- Scroll to Top Button-->
    <!-- 버튼식 스크롤 오른쪽 하단 -->
    <a class="scroll-to-top rounded" href="#page-top">
    <button></button>
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <!-- 오른쪽 상단 로그아웃 -->
    <c:if test="${member != null }">
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">X</span>
                    </button>
                </div>
                <div class="modal-body">정말 로그아웃 하시겠습니까 ?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="/member/logout">확인</a>
                </div>
            </div>
        </div>
    </div>
    </c:if>
    
    <%-- 로그인 안되어있을때 --%>
    <c:if test="${member == null }">
    	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그인</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">X</span>
                    </button>
                </div>
                <div class="modal-body">로그인 하시겠습니까 ?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="/member/login">확인</a>
                </div>
            </div>
        </div>
    </div>
    </c:if>

    <!-- Bootstrap core JavaScript-->
    <!-- <script src="/resources/vendor/jquery/jquery.min.js"></script> -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/js/demo/datatables-demo.js"></script>
    
    <script>
       $(document).ready(function(){
          $('#dataTables-example').DataTable({
             responsive: true
          });
          $(".sidebar-nav")
          .attr("class","sidebar-nav navbar-collapse collapse")
          .attr("aria-expanded",'false')
          .attr("style","height:1px");
       });
    </script>

</body>

</html>