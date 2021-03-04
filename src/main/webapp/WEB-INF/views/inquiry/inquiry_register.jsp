<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@include file="../includes/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/inquiry/inquiry_register" method="post">
<div class="form-group">
    <label for="exampleFormControlInput1">문의 제목</label>
    <input type="text" class="form-control" id="enquiry_title" name="enquiry_title" placeholder="제목을 작성해주세요.">
</div>
<div class="form-group">
            <label for="exampleFormControlTextarea1">문의 내용</label>
            <textarea class="form-control" id="enquiry_contact" name="enquiry_contact" rows="10"></textarea>
            	
</div>
<button type="submit" class="btn btn-info" >문의 등록 </button>
<button type="button" id="back" class="btn btn-danger">취소</button>
	<script type="text/javascript">
		$("#back").click(function(){
			alert("문의 작성을 취소하였습니다.");
			history.back();
		});
	</script>
</form>

</body>
<%@include file="../includes/footer.jsp"%>
</html>