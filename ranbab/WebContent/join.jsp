<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
<%@ include file="/layout/head.jsp"%>
</head>
<%@ include file="/layout/nav.jsp"%>
<body>
	<form action="joinAction.jsp" name="joinForm" method="post">
		<section id="main" class="wrapper">
			<div class="container">
				<header class="major">
					<h2>회원가입</h2>
				</header>
			</div>
		<section>
		<div class="table_center">
			<p>아이디 <input type="text" id="uid" name="userId" placeholder="영문 대소문자+숫자 4~12자"> <br>
			<input type="button" value="중복체크" onclick="openIdCheckPopup();"></p>
			<p>비밀번호 <input type="password" id="pwd" name="userPw" placeholder="영문+숫자+특수문자 8~25자"></p>
			<p>비밀번호 확인 <input type="password" id="repwd" name="userPwChk"></p>
			<p>이름 <input type="text" id="uname" name="userName"></p>
			<p>전화번호 <input type="text" id="mobile" oninput="autoHyphen(this)" name="userTel" placeholder="000-0000-0000" maxlength="13"></p>
			<p>
				<input type="button" value="가입하기" class="button special" onclick="joinformCheck();">
				&nbsp; &nbsp;
				<input type="button" value="돌아가기" onclick="location.href='login.jsp'">
			</p>
		</div>
		</section>
	</form>
</body>
</html>