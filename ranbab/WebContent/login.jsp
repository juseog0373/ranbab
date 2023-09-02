<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/layout/head.jsp"%>
</head>
<script>
	function loginFormCheck() {
		var id = document.getElementById("uid");
    	var pwd = document.getElementById("pwd");
    	
		if (id.value == "") {
	    	alert("아이디를 입력해주세요!");
	    	id.focus();
	    	return false;
	  	}
		if (pwd.value == "") {
			alert("비밀번호를 입력해주세요!");
			pwd.focus();
			return false;
	  	}
		document.loginForm.submit();
	}
</script>
<body>
	<%@ include file="/layout/nav.jsp"%>
	<form action="loginAction.jsp" name="loginForm" method="post">
		<section id="main" class="wrapper">
			<div class="container">
				<header class="major">
					<h2>로그인</h2>
				</header>
			</div>
		</section>
		<section>
			<div class="table_center">
				아이디
				<input type="text" name="userId" id="uid" autocomplete="off"> <br>
				패스워드
				<input type="password" name="userPw" id="pwd"> <br>
				<input type="button" value="확인" onclick="loginFormCheck();">
				 &nbsp; &nbsp;
				<input type="button" value="회원가입" class="button special" onclick = "location.href='join.jsp'">
			</div>
		</section>
	</form>
</body>
</html>