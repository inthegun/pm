<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script language="javascript">
	function validate() {
		var re = /^[a-zA-Z0-9]{4,12}$/; // 아이디와 패스워드가 적합한지 검사할 정규식
		var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		// 이메일이 적합한지 검사할 정규식
		var re3 = /^[0-9]{11}$/; // 휴대폰번호 숫자만입력가능 중간번호 3~4자리에따라 10자~11자

		var id = document.getElementById("user_id");
		var pw = document.getElementById("user_passwd");
		var pwch = document.getElementById("user_passwd2");
		var name = document.getElementById("user_name");
		var addr = document.getElementById("user_addr");
		var email = document.getElementById("user_email");
		var phone = document.getElementById("user_phone");
		var gender = $('#user_sex1');
		
		if($(':radio[name="user_sex"]:checked').length < 1){ //성별을 선택하지 않은 경우
		    alert('카테고리를 선택해주세요');                        
		    gender.focus();
		    event.preventDefault();
		}
	
		
		
		if (!check(re, id, "아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {	//아이디 형식이 잘못된 경우
			return false;
		}

		if (!check(re, pw, "패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {  //패스워드 형식이 잘못된 경우
			return false;
		}
		if (email.value == "") { 	//이메일을 기입하지 않은 경우
			alert("이메일을 입력해 주세요");
			email.focus();
			email.value = "";
			return false;
		}

		if (!check(re2, email, "적합하지 않은 이메일 형식입니다.")) { //이메일 형식이 잘못된 경우
			
			return false;
		}

		if (pw.value != pwch.value) {	//비밀번호가 다른경우
			alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
			pw.value = "";
			pwch.value = "";
			pw.focus();
			return false;
		}
  
		if (name.value == "") { 	//이름을 기입하지 않은 경우
			alert("이름을 입력해 주세요");
			name.focus();
			name.value = "";
			return false;
		}
		
		if (addr.value == "") { //주소를 기입하지 않은 경우
			alert("주소를 입력해 주세요");
			addr.focus();
			addr.value = "";
			return false;
		}
		
		if (phone.value == "") {  //핸드폰 번호를 기입하지 않은 경우
			alert("핸드폰 번호를 입력해 주세요 -빼고 번호만입력");
			phone.focus();
			phone.value = "";
			return false;
		}
		
        if (!check(re3, phone, " -빼고 번호만입력해주세요")) {    // 휴대폰번호 형식이 잘못된 경우
            return false;
        }
		
		if (gender.value == "") {  //성별을 기입하지 않은 경우
			alert("성별을 선택해 주세요");
			gender.focus();
			return false;
		}
		
		alert('환영합니다'); 

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
	background-color: #17a2b8;
	height: 100vh;
}

#register .container #register-row #register-column #register-box {
	margin-top: 60px;
	max-width: 600px;
	height: 550px;
	border: 1px solid #9C9C9C;
	background-color: #EAEAEA;
	position: absolute;
}

#register .container #register-row #register-column #register-box #register-form
	{
	padding: 20px;
}
</style>


<title>Insert title here</title>
</head>


<body>
<c:if test="${sessionScope.userId ne null}">
    <script type="text/javascript">
    	alert("잘못된 접근입니다.");
    	location.href="/"
    </script>
</c:if>

<c:if test="${sessionScope.userId eq null}">
	<div id="register">
		<h3 class="text-center text-white pt-5">Pick Me Pet Me</h3>
		<form name="register" role="registerForm"
			onsubmit="return validate();" action="/member/register" method="post">
			<div class="container">
				<div id="register-row"
					class="row justify-content-center align-items-center">
					<div id="register-column" class="col-md-6">
						<div id="register-box" class="col-md-6">
							<span class="input-group-addon text-info" id="basic-addon1">
								ID </span> <input type="text" id="user_id" name="user_id"
								class="form-control" placeholder="User ID"
								aria-describedby="basic-addon1"> <span
								class="input-group-addon text-info" id="basic-addon1">PASSWORD</span>
							<input type="password" id="user_passwd" name="user_passwd"
								class="form-control" placeholder="Password"
								aria-describedby="basic-addon1"> <span
								class="input-group-addon text-info" id="basic-addon1">PASSWORD
								CHECK</span> <input type="password" id="user_passwd2"
								name="user_passwd2" class="form-control"
								placeholder="Password Check" aria-describedby="basic-addon1">

							<span class="input-group-addon text-info" id="basic-addon1">NAME</span>
							<input type="text" id="user_name" name="user_name"
								class="form-control" placeholder="Username"
								aria-describedby="basic-addon1"> <span
								class="input-group-addon text-info" id="basic-addon1">ADDRESS</span>
							<input type="text" id="user_addr" name="user_addr"
								class="form-control" placeholder="Address"
								aria-describedby="basic-addon1"> <span
								class="input-group-addon text-info" id="basic-addon1">PRIVATE
								PHONE</span> <input type="text" id="user_phone" name="user_phone"
								class="form-control" placeholder="Private Phone"
								aria-describedby="basic-addon1"> <span
								class="input-group-addon text-info" id="basic-addon1">GENDER</span><br>

							<input type='radio' id="user_sex1" name='user_sex' value='F' />여성
							<input type='radio' id="user_sex2" name='user_sex' value='M' />남성<br>

							<span class="input-group-addon text-info" id="basic-addon1">EMAIL</span>
							<input type="text" id="user_email" name="user_email"
								class="form-control" placeholder="E-mail"
								aria-describedby="basic-addon1"> <span
								class="input-group-addon text-white" id="basic-addon1"> </span><br>

							<button type="submit" class="btn btn-info btn-md">Join</button>
							<button type="reset" class="btn btn-info btn-md">Reset</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	</c:if>
</body>

</html>
