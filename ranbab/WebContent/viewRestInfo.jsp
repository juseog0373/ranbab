<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/layout/head.jsp"%>
	<style>
	    .popup {
	      width: 500px;
	      height: 400px;
	    }
  	</style>
	<script>
	  function openMapPopup(address) {
		var url = "map.html?address=" + encodeURIComponent(address);
	    var popup = window.open(url, 'mapPopup', 'width=600,height=500');
	  }
	</script>
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
			
			String restName = request.getParameter("restName");
			
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
				<h2><%=restName %></h2>
			</header>
		</div>
	</section>
	<section id="one" class="style1 special">
	<div class="table_center">
	<div id="map"></div>
		<table style="text-align:center">
			<tr>
				<td><h3>메뉴명</h3></td>
				<td><h3>메뉴가격</h3></td>
			</tr>
		<%
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			request.setCharacterEncoding("UTF-8");
			
			String url = "jdbc:mysql://localhost:3306/ranbab";
			String user = "root"; // 데이터베이스 사용자 이름
		   	String password = "1234"; // 데이터베이스 비밀번호
		   	
			Connection con = DriverManager.getConnection(url, user, password);
			con.setAutoCommit(false);
			
			String restCode = request.getParameter("restCode");
			
			String sql = "SELECT * FROM restTbl_v1 WHERE restCode = ?";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, restCode);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
		%>
			<tr>
				<td><%=rs.getString("menuName")%></td>
				<td><%=rs.getString("menuPrice")%></td>
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