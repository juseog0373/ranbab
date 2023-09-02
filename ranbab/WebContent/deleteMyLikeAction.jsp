<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String userNum = request.getParameter("userNum");
		String restCode = request.getParameter("restCode");

		Class.forName("com.mysql.jdbc.Driver");
		request.setCharacterEncoding("UTF-8");
		
		String url = "jdbc:mysql://localhost:3306/ranbab";
		String user = "root"; // 데이터베이스 사용자 이름
    	String password = "1234"; // 데이터베이스 비밀번호
    	
		Connection con = DriverManager.getConnection(url, user, password);
		con.setAutoCommit(false);
		
		String sql = "DELETE FROM userLikeTbl_v1 WHERE userNum = ? AND restCode = ?";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userNum);
		pstmt.setString(2, restCode);
		
		pstmt.executeUpdate();
		con.commit();
		
		pstmt.close();
		con.close();
	%>
	<script>
		alert("찜이 삭제 되었어요!");
		location.href="viewMyLike.jsp";
	</script>
	</body>
</html>