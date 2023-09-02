<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<body>
	<%
	try {
		request.setCharacterEncoding("UTF-8");

		Class.forName("com.mysql.jdbc.Driver");
		request.setCharacterEncoding("UTF-8");
		
		String url = "jdbc:mysql://localhost:3306/ranbab";
		String user = "root"; // 데이터베이스 사용자 이름
    	String password = "1234"; // 데이터베이스 비밀번호
    	
		Connection con = DriverManager.getConnection(url, user, password);
		con.setAutoCommit(false);
		
		String restCode = request.getParameter("restCode");
		
		String sql = "DELETE FROM restTbl_v1 WHERE restCode = ?";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, restCode);
		
		pstmt.executeUpdate();
		con.commit();
		
		pstmt.close();
		con.close();
	%>
		<script>
			alert("가게 정보가 삭제 되었어요!");
			location.href="adminViewRestList.jsp";
		</script>
	<%
	} catch(Exception e){
		e.printStackTrace();
	%>
		<script>
			alert("처리중 오류가 발생하였어요");
			location.href="window.history.back()";
		</script>
	<%
	}
	%>
	</body>
</html>