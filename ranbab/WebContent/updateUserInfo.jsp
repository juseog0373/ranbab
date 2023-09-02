<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/layout/head.jsp"%>
</head>
<script>
	function updateformCheck() {
		var name = document.getElementById("userName");
		var nameReg = /^[가-힣]{2,15}$/;
		
		if(name.value == "") {
			alert("이름을 입력하세요!");
			name.focus();
    		return false;
    	}
		if(!nameReg.test(name.value)) {
    		alert("이름은 한글만 입력해야합니다!");
    		name.focus();
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
				<h2>회원 정보 수정하기</h2>
			</header>
		</div>
	</section>
	<form action="updateUserInfoAction.jsp" name="updateForm" method="post">
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
			
			String sql = "SELECT userName, userTel FROM userTbl_v1 WHERE userNum = ?";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userNum);
			ResultSet rs = pstmt.executeQuery();
		%>
			<tr>
				<td>회원이름</td>
				<td>회원전화번호</td>
			</tr>
		<%
			while(rs.next()) {
		%>
			<tr>
				<td><input type="text" id="userName" name="userName" value="<%=rs.getString("userName")%>"></td>
				<td><input type="text" oninput="autoHyphen(this)" name="userTel" value="<%=rs.getString("userTel")%>" maxlength="13"></td>
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
			<input type="button" class="button special" value="수정하기" onclick="updateformCheck();">
			&nbsp; &nbsp;
			<input type="button" value="뒤로가기" onclick = "window.history.back()">
		</div> 
	</section>
	</form>
</body>
</html>