<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/layout/head.jsp"%>
</head>
<script>
	function updateformCheck() {
		
		var restName = document.getElementById("restName");
		var restLoca = document.getElementById("restLoca");
		var restDis = document.getElementById("restDis");

		var menuPriceReg = /^[0-9]+$/;
		var restDisReg = /[\-0-9]+\.[0-9]+/g;
		
		if(restName.value == "") {
			alert("가게명을 입력하세요!");
			restName.focus();
    		return false;
    	}
		if(restLoca.value == "") {
			alert("가게 주소를 입력하세요!");
			restLoca.focus();
    		return false;
    	}
		if(restDis.value == "") {
			alert("거리를 입력하세요!");
			restDis.focus();
    		return false;
    	}
		if(!restDisReg.test(restDis.value)) {
    		alert("소수점 형태로 입력해야합니다!");
    		restDis.focus();
    		return false;
    	}
		
		document.updateForm.submit();
	}
</script>
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
				<li><a href="myPage.jsp"><strong><%=uId%></strong></a>님 환영합니다!</li>
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
				<h2>가게 정보 수정하기</h2>
			</header>
		</div>
	</section>
	<form action="updateRestInfoAction.jsp" name="updateForm" method="post">
	<section id="one" class="style1 special">
	<div class="table_center">
		<table>
		<%
		try {
			String restCode = request.getParameter("restCode");
			
			Class.forName("com.mysql.jdbc.Driver");
			request.setCharacterEncoding("UTF-8");
			
			String url = "jdbc:mysql://localhost:3306/ranbab";
			String user = "root"; // 데이터베이스 사용자 이름
		   	String password = "1234"; // 데이터베이스 비밀번호
		   	
			Connection con = DriverManager.getConnection(url, user, password);
			con.setAutoCommit(false);
			
			String sql = "SELECT * FROM restTbl_v1 WHERE restCode = ?";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, restCode);
			
			ResultSet rs = pstmt.executeQuery();
		%>
			<tr>
				<td>가게타입</td>
				<td>가게명</td>
				<td>가게위치</td>
				<td>거리</td>
			</tr>
		<%
			while(rs.next()) {
		%>
			<tr>
				<td>
					<select name="restType" style="text-align:center;">
						<option value="kr"<% if ("kr".equals(rs.getString("restType"))) { %>selected<% } %>>한식</option>
						<option value="cn"<% if ("cn".equals(rs.getString("restType"))) { %>selected<% } %>>중식</option>
						<option value="we"<% if ("we".equals(rs.getString("restType"))) { %>selected<% } %>>양식</option>
						<option value="jp"<% if ("jp".equals(rs.getString("restType"))) { %>selected<% } %>>일식</option>
						<option value="ff"<% if ("ff".equals(rs.getString("restType"))) { %>selected<% } %>>패스트푸드</option>
						<option value="as"<% if ("as".equals(rs.getString("restType"))) { %>selected<% } %>>아시안</option>
					</select>
				</td>
				<input type="hidden" name="restCode" value="<%=rs.getString("restCode") %>">
				<td><input type="text" id="restName" name="restName" value="<%=rs.getString("restName")%>"></td>
				<td><input type="text" id="restLoca" name="restLoca" value="<%=rs.getString("restLoca")%>"></td>
				<td><input type="text" id="restDis" name="restDis" value="<%=rs.getString("restDis")%>"></td>
			</tr>
		<%
			break;
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
			<input type="button" class="button special" value="수정하기" onclick="updateformCheck();">
			&nbsp; &nbsp;
			<input type="button" value="뒤로가기" onclick="window.history.back()">
		</div>
	</section>
	</form>
</body>
</html>