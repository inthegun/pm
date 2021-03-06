<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<%@include file="../includes/header.jsp"%>

<script language="javascript">
	function validate() {
		var re = /^[a-zA-Z0-9]{4,12}$/; // 아이디와 패스워드가 적합한지 검사할 정규식
		var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		// 이메일이 적합한지 검사할 정규식

		var id = document.getElementById("user_id");
		var pw = document.getElementById("user_passwd");
		var pwch = document.getElementById("user_passwd2");
		var name = document.getElementById("user_name");
		var addr = document.getElementById("user_addr");
		var email = document.getElementById("user_email");
		var phone = document.getElementById("user_phone");
		var gender = $('#user_sex1');

		if (!check(re, id, "아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) { //아이디 형식이 잘못된 경우
			return false;
		}

		if (!check(re, pw, "패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) { //패스워드 형식이 잘못된 경우
			return false;
		}
		if (email.value == "") { //이메일을 기입하지 않은 경우
			alert("이메일을 입력해 주세요");
			email.focus();
			email.value = "";
			return false;
		}

		if (!check(re2, email, "적합하지 않은 이메일 형식입니다.")) { //이메일 형식이 잘못된 경우

			return false;
		}

		if (pw.value != pwch.value) { //비밀번호가 다른경우
			alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
			pw.value = "";
			pwch.value = "";
			pw.focus();
			return false;
		}

		if (addr.value == "") { //주소를 기입하지 않은 경우
			alert("주소를 입력해 주세요");
			addr.focus();
			addr.value = "";
			return false;
		}

		if (phone.value == "") { //핸드폰 번호를 기입하지 않은 경우
			alert("핸드폰 번호를 입력해 주세요");
			phone.focus();
			phone.value = "";
			return false;
		}
	

		alert('변경되었습니다.');

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
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background-color: #ffffff;
	whidth: 300vh;
}

#update .container #update_one {
	whidth: 300px;
}

#update .container #update_btn {
	position: relative;
}
</style>



</head>
<body>
	<form id="updatemember" class="form" action="memberUpdate"
		method="post" onsubmit="return validate();">
		<div class="container">
			<div id="update_one">
				<h3 class="text-center text-info pt-5">
					<c:out value="${User.user_name }"></c:out>
					회원님의 정보 수정
				</h3>
				<div class="form-group">
					<label for="user_ID" class="text-info"></label><br>ID <input
						type="text" name="user_id" id="user_id" value="${User.user_id}"
						readonly="readonly" class="form-control">
				</div>
				<div class="form-group">
					<label for="user_ID" class="text-info"></label><br>Name <input
						type="text" name="user_name" id="user_id"
						value="${User.user_name}" readonly="readonly" class="form-control">
				</div>



				<div class="form-group">
					<label for="user_passwd" class="text-info"></label><br>PassWord
					<input type="password" name="user_passwd" id="user_passwd"
						class="form-control">
				</div>

				<div class="form-group">
					<label for="user_passwd" class="text-info"></label><br>PassWord
					check <input type="password" name="user_passwd2" id="user_passwd2"
						class="form-control">
				</div>
				<!-- 주소 -->
				<div class="form-group">
					<label for="user_addr" class="text-info"></label><br>Address <input
						type="text" name="user_addr" id="user_addr" class="form-control" value="${User.user_addr}">
				</div>

				<!-- 폰 -->
				<div class="form-group">
					<label for="user_phone" class="text-info"></label><br>Private
					Phone <input type="text" name="user_phone" id="user_phone"
						class="form-control" value="${User.user_phone}" maxlength="11">
				</div>

				<!-- 이메일 -->
				<div class="form-group">
					<label for="user_email" class="text-info"></label><br>E-Mail <input
						type="text" name="user_email" id="user_email" class="form-control" value="${User.user_email}">
				</div>

				<div class="update_btn">
					<button class="btn btn-info btn-md" type="submit">수정완료</button>
					<button type="reset" class="btn btn-info btn-md">다시작성</button>
				</div>
			</div>
		</div>
	</form>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>