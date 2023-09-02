<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String userNum = request.getParameter("userNum");
		String restCode = request.getParameter("restCode");
		
		if(userNum.equals("null")) {
	%>
		<script>
			alert("찜을 하려면 로그인이 필요해요");
			location.href="login.jsp";
		</script>
	<%
		}
		
		else {
			
			Class.forName("com.mysql.jdbc.Driver");
			request.setCharacterEncoding("UTF-8");
			
			String url = "jdbc:mysql://localhost:3306/ranbab";
			String user = "root"; // 데이터베이스 사용자 이름
	    	String password = "1234"; // 데이터베이스 비밀번호
	    	
			Connection con = DriverManager.getConnection(url, user, password);
			con.setAutoCommit(false);
			
			String sql = "SELECT count(likeNum) FROM userLikeTbl_v1 WHERE userNum = ? AND restCode = ?";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userNum);
			pstmt.setString(2, restCode);
			
			ResultSet rs = pstmt.executeQuery();
			int cnt = 0;
			
			while(rs.next()) {
				cnt = Integer.parseInt(rs.getString(1));
			}	
			rs.close();
			
			if(cnt >= 1){
			%>
				<script>
					alert("이미 찜한 가게입니다");
					window.history.back();
				</script>
		<%
				pstmt.close();
				con.close();
			} else {
				
				String sql2 = "INSERT INTO userLikeTbl_v1(userNum, restCode) VALUES(?,?)";
				PreparedStatement pstmt2 = con.prepareStatement(sql2);
				pstmt2.setString(1, userNum);
				pstmt2.setString(2, restCode);
				
				pstmt2.executeUpdate();
				con.commit();
				pstmt.close();
				con.close();
			%>
				<script>
					alert("찜이 등록 되었어요!");
					window.history.back();
				</script>
			<%
			}
		}
	%>
	</body>
</html>