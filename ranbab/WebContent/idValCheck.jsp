<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	request.setCharacterEncoding("UTF-8");
	
	String url = "jdbc:mysql://localhost:3306/ranbab";
	String user = "root"; // �����ͺ��̽� ����� �̸�
   	String password = "1234"; // �����ͺ��̽� ��й�ȣ
   	
	Connection con = DriverManager.getConnection(url, user, password);
	
	String userId = request.getParameter("userId");
	
	String sql = "SELECT count(userId) FROM userTbl_v1 WHERE userId = ?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, userId);
	
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		int flag = Integer.parseInt(rs.getString(1));
		
		if(flag > 0){
		%>
			<script>
				alert("�ߺ��� ���̵� �Դϴ�.\n�ٸ� ���̵� ������ּ���.");
				window.close();
			</script>
		<%
		} else {
		%>
			<script>
				alert("��밡���� ���̵� �Դϴ�.");
				window.close();
			</script>
		<%
		}
	}
	pstmt.close();
	con.close();
	
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>