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
			String uNum = (String) session.getAttribute("userNumSession");
			
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
				<h2>가게정보</h2>
			</header>
		</div>
	</section>
	<section id="one" class="style1 special">
	<div class="table_center">
	<div id="map"></div>
		<table>
		<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			request.setCharacterEncoding("UTF-8");
			
			String url = "jdbc:mysql://localhost:3306/ranbab";
			String user = "root"; // 데이터베이스 사용자 이름
		   	String password = "1234"; // 데이터베이스 비밀번호
		   	
			Connection con = DriverManager.getConnection(url, user, password);
			con.setAutoCommit(false);
			
			String restType = request.getParameter("restType");
			String menuName = request.getParameter("menuName");
			
			String sql = "SELECT * FROM restTbl_v1"+ 
						" GROUP BY restCode"+
						" ORDER BY restNum DESC";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
		%>
			<tr>
				<td>가게번호</td>
				<td>가게타입</td>
				<td>가게코드</td>
				<td>가게이름</td>
				<td>가게위치</td>
				<td>거리</td>
				<td>삭제</td>
			</tr>
		<%
			while(rs.next()) {
				String type="";
				switch(rs.getString("restType")){
					case "as": type = "아시안"; break;
					case "ff": type = "패스트푸드"; break;
					case "we": type = "양식"; break;
					case "kr": type = "한식"; break;
					case "jp": type = "일식"; break;
					case "cn": type = "중식"; break;
				}
		%>
			<tr>
				<td><%=rs.getString("restNum")%></td>
				<td><%=type%></td>
				<td><%=rs.getString("restCode")%></td>
				<td><a href="updateRestInfo.jsp?restCode=<%=rs.getString("restCode")%>"><%=rs.getString("restName")%></a></td>
				<td><%=rs.getString("restLoca")%></td>
				<td><%=rs.getString("restDis")%></td>
				<td><input type="button" value="삭제" onClick="location.href='deleteRestAction.jsp?restCode=<%=rs.getString("restCode")%>'"></td>
			</tr>
			
		<%
			}
			con.commit();
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		%>
			</table>
		</div>
		<div>
			<input type = "button" value="뒤로가기" onclick="window.history.back()">
		</div> 
	</section>
</body>
</html>