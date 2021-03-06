<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../includes/header.jsp"%>
<meta charset="UTF-8">


<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background-color: #ffffff;
	height: 100vh;
}

#info .container #info-row #info-box {
	margin-top: 60px;
	position: relative;
}

#info .container #info-row  #info-box #info-form {
	padding: 20px;
}
</style>


<title>Insert title here</title>
</head>
<body>
	<c:if test="${member != null }">

	
		<div id="info">
			<form name="info" class = "form" action = "alter" method = "post" >
				<div class="container">
					<div id="info-row"
						class="row justify-content-center align-items-center">
						<div id="info-box"
							class="row justify-content-center align-items-center">
								<h3>
			<c:out value="${UserInfo.user_name }"></c:out>
			회원님의 정보 조회
		</h3><br>							
							<table class="table table-striped">
								<tr>
									<td>아이디</td>
									<td><c:out value="${UserInfo.user_id }"></c:out></td>
								</tr>
								<tr>
									<td>이름</td>
									<td><c:out value="${UserInfo.user_name }"></c:out></td>
								</tr>
								<tr>
									<td>이메일</td>
									<td><c:out value="${UserInfo.user_email }"></c:out></td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td><c:out value="${UserInfo.user_phone }"></c:out></td>
								</tr>
								<tr>
									<td>주소</td>
									<td><c:out value="${UserInfo.user_addr }"></c:out></td>
								</tr>
								<tr>
									<td>성별</td>
									<c:if test="${UserInfo.user_sex eq 'M' }">									
										<td>남자</td>
									</c:if>
									<c:if test="${UserInfo.user_sex eq 'F' }">									
										<td>여자</td>
									</c:if>
								</tr>
							</table>
							 <div id="updatelink" class="text-right">
							<button type="submit" class="btn btn-info btn-md">정보변경</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</c:if>



	<c:if test="${member == null }">
	잘못된 접근입니다 . 
</c:if>

	<%@include file="../includes/footer.jsp"%>
</body>
</html>