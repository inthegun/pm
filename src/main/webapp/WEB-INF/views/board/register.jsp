<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>register Page</h1>

<form role = "registerForm" action="/board/register" method = "post">
id
<input type="text" id="user_id" name="user_id"> <br>
passwd
<input type="text" id="user_passwd" name="user_passwd"> <br>
name
<input type="text" id="user_name" name="user_name"> <br>
addr
<input type="text" id="user_addr" name="user_addr"> <br>
phone
<input type="text" id="user_phone" name="user_phone"> <br>
sex
<input type="text" id="user_sex" name="user_sex"> <br>
email
<input type="text" id="user_email" name="user_email"> <br>

<button type = "submit">Submit Button</button>

</form>
</body>

</html>
