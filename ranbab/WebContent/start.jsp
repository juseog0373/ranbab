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
				<a href="myPage.jsp"><li><strong><%=uId%></strong></a>님 환영합니다!</li>
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
				<h2>랜덤밥스's PICK</h2>
				<h3 style="font-size: x-large">오늘 점심으로 이건 어때?</h3>
			</header>
		</div>
	</section>
	<section id="one" class="style1 special">
	<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		request.setCharacterEncoding("UTF-8");
		
		String url = "jdbc:mysql://localhost:3306/ranbab";
		String user = "root"; // 데이터베이스 사용자 이름
	   	String password = "1234"; // 데이터베이스 비밀번호
	   	
		Connection con = DriverManager.getConnection(url, user, password);
		
		String sql = "SELECT restType, menuName FROM restTbl_v1 ORDER BY RAND() LIMIT 1";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			String restType = rs.getString("restType");
			String menuName = rs.getString("menuName");
	%>
		<a href="viewRestList.jsp?restType=<%=restType%>&menuName=<%=menuName%>"><h1 style="font-size: xxx-large"><%=menuName %></h1></a>
	<%
		}
		stmt.close();
		con.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
	%>
	<div>
		<input type = "button" value="다시!" onclick="window.location.reload()"> &nbsp;&nbsp;
		<input type = "button" value="카테고리별검색하기" onclick="location.href='search.jsp'">
	</div>
	</section>
</body>
</html>