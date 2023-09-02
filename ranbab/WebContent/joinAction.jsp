<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>

	<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		Class.forName("com.mysql.jdbc.Driver");
		request.setCharacterEncoding("UTF-8");
		
		String url = "jdbc:mysql://localhost:3306/ranbab";
		String user = "root"; // 데이터베이스 사용자 이름
    	String password = "1234"; // 데이터베이스 비밀번호
    	
		Connection con = DriverManager.getConnection(url, user, password);
		con.setAutoCommit(false);
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw"); 		
		String userName = request.getParameter("userName");
		String userTel = request.getParameter("userTel"); 
		
		String sql = "INSERT INTO userTbl_v1(userNum, userId, userPw, userName, userTel, userRegDt) VALUES(null,?,?,?,?,SYSDATE())";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, userId);
		pstmt.setString(2, userPw);
		pstmt.setString(3, userName);
		pstmt.setString(4, userTel);
		
		pstmt.executeUpdate();
		con.commit();
		
		pstmt.close();
		con.close();
	%>
	<script>
		alert("회원가입이 완료되었어요! 랜덤밥스를 이용하러가볼까요?");
		location.href="login.jsp";
	</script>
	</body>
</html>