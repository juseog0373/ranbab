<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/layout/head.jsp"%>
</head>
<body>
	<header id="header">
		<h1>
			<a href="index.jsp" style="text-decoration-line: none;">랜덤밥스</a>
		</h1>
		<%
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");

			String uId = (String) session.getAttribute("userIdSession");
			
			if(uId == null) {
		%>
			<nav id="nav">
				<ul>
					<li><a href="login.jsp" class="button special">로그인</a></li>
				</ul>
			</nav>
		<%
			}
			
			if(uId != null) {
		%>
			<nav id="nav">
			<ul>
				<a href="myPage.jsp?uId='<%=uId%>'"><li><strong><%=uId%></strong></a>님 환영합니다!</li>
			<%
				if (uId.equals("admin")) {
			%>
					<jsp:include page="/layout/adminNav.jsp"></jsp:include>
			<%
				}
				else {
			%>
					<jsp:include page="/layout/userLoginNav.jsp"></jsp:include>
			<%
				}
			}
			%>
			</ul>
		</nav>
	</header>
	<section id="main" class="wrapper">
		<div class="container">
			<header class="major">
				<h2>카테고리 별 검색하기</h2>
				<h3 style="font-size: x-large">오늘 점심으로 뭐 먹을래?</h3>
			</header>
		</div>
	</section>
	<form action="searchAction.jsp" method="post" name="searchform">
	<section id="one" class="style1 special">
		<div class="table_center" style="text-align: center;">
			<select name="restType" style="text-align: center;">
				<option value="kr">한식</option>
				<option value="cn">중식</option>
				<option value="we">양식</option>
				<option value="jp">일식</option>
				<option value="ff">패스트푸드</option>
				<option value="as">아시안</option>
			</select>
		</div>
		<br>
		<div>
			<input type="submit" value="검색하기" class="button special">
			<input type="button" value="뒤로가기" onclick="window.history.back()">
		</div>
	</section>
	</form>
</body>
</html>