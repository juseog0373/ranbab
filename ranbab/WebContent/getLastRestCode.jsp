<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection con = null;
	
    try {
        // 데이터베이스 연결
        Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/ranbab";
		String user = "root";
    	String password = "1234";
    	
		con = DriverManager.getConnection(url, user, password);
		con.setAutoCommit(false);
		
		String restType = request.getParameter("restType");

        // SQL 쿼리 실행하여 마지막 가게 코드 조회
        String sql = "SELECT restCode FROM restTbl_v1 WHERE restType = ? ORDER BY restNum DESC LIMIT 1";

        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, restType);
        
       	rs = pstmt.executeQuery();

        String lastRestCode = "";
        
        if (rs.next()) {
            String fullRestCode = rs.getString("restCode");
            lastRestCode = fullRestCode.substring(3);
        }
        // 마지막 가게 코드 응답
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(lastRestCode);
        
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 자원 해제
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (pstmt != null) {
            try {
            	pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
            	con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
