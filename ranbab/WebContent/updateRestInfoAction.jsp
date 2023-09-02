<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/layout/head.jsp"%>
</head>
<body>
<%
try {
	request.setCharacterEncoding("UTF-8");
	
	String restNum = request.getParameter("restNum");
    String restCode = request.getParameter("restCode");
    String restName = request.getParameter("restName");
    String restLoca = request.getParameter("restLoca");
    String restDis = request.getParameter("restDis");
    
    Class.forName("com.mysql.jdbc.Driver");
    request.setCharacterEncoding("UTF-8");

    String url = "jdbc:mysql://localhost:3306/ranbab";
    String user = "root"; // 데이터베이스 사용자 이름
    String password = "1234"; // 데이터베이스 비밀번호

    Connection con = DriverManager.getConnection(url, user, password);
    con.setAutoCommit(false);

    String sql = "UPDATE restTbl_v1 SET restName = ?, restLoca = ?, restDis = ? WHERE restCode = ?";
    
    PreparedStatement updateRestStmt = con.prepareStatement(sql);
    updateRestStmt.setString(1, restName);
    updateRestStmt.setString(2, restLoca);
    updateRestStmt.setString(3, restDis);
    updateRestStmt.setString(4, restCode);
    updateRestStmt.executeUpdate();
    
    con.commit();
    updateRestStmt.close();
    con.close();
   %>
   <script>
   	alert("가게 정보 수정이 완료되었습니다.");
   	location.href="adminViewRestList.jsp";
   </script>
   <%
} catch (Exception e) {
	e.printStackTrace();
	out.println("오류 발생 : " + e.getMessage());
}
%>
</body>
</html>
