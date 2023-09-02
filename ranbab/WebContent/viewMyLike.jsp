<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/layout/head.jsp"%>
	<script>
	  function openMapPopup(address) {
		var url = "map.html?address="+encodeURIComponent(address);
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
				<h2>내가 찜한 가게</h2>
			</header>
		</div>
	</section>
	<section id="one" class="style1 special">
	<div class="table_center">
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
			
			String userNum = (String) session.getAttribute("userNumSession");
			
			String sql = "SELECT r.restCode, r.restName, r.restLoca"+
						" FROM userTbl_v1 u, userlikeTbl_v1 ul, restTbl_v1 r"+
						" WHERE u.userNum = ul.userNum"+
						" AND r.restCode = ul.restCode"+
						" AND u.userNum = ?"+
						" GROUP BY restName";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userNum);
			
			ResultSet rs = pstmt.executeQuery();
		%>
			<tr>
				<td><h1>가게이름</h1></td>
				<td><h1>가게위치</h1></td>
				<td><h1>찜 삭제</h1></td>
			</tr>
		<%
			while(rs.next()) {
		%>
			<tr>
				<td><a href='viewRestInfo.jsp?restCode=<%=rs.getString("restCode")%>&restName=<%=rs.getString("restName")%>')"><%=rs.getString("restName")%></a></td>
				<td><a onclick="openMapPopup('<%=rs.getString("restLoca")%>')"><%=rs.getString("restLoca")%></a></td>
				<td><input type="button" value="삭제" onClick="location.href='deleteMyLikeAction.jsp?userNum=<%=userNum%>&restCode=<%=rs.getString("restCode")%>'"></td>
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
			<input type = "button" value="뒤로가기" onclick = "window.history.back()">
		</div> 
	</section>
</body>
</html>