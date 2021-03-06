<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link
   href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">
<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
   src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <%@include file="../../includes/header.jsp" %>
     <!-- 게시글 제목없으면 작성안되게 유효성검사 -->
<script language="javascript">
	function validate() {
		
		var title = document.getElementById("post_title");
		
		
		if (title.value == "") { //제목를 기입하지 않은 경우
			alert("제목을 입력해 주세요");
			title.focus();
			title.value = "";
			return false;
		}
	}
	function check(re, what, message) {
		if (re.test(what.value)) {
			return true;
		}
		alert(message);
		what.value = "";
		what.focus();
		//return false;
	}
</script>
   
    <form action='<c:url value='/community/care_community/insert'/>' method="post" onsubmit = "return validate();" enctype="multipart/form-data">
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
            
            <div class="select_img"><img src="" /></div>
            <textarea class="form-control" id="post_contact" name="post_contact" rows="10"></textarea>
            	
          </div>
          
          <label for="gdsImg">이미지</label>
 			<input type="file" class = "form-control" id="gdsImg" name="file" />
 		
          
 			
 
 <script>
  $("#gdsImg").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>
</div>
          <%=request.getRealPath("/") %>
        <button type="submit" class="btn btn-info">등록하기</button>
    </form>

        

<%@include file="../../includes/footer.jsp"%>