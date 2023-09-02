<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		Class.forName("com.mysql.jdbc.Driver");
		
		String url = "jdbc:mysql://localhost:3306/ranbab";
		String user = "root";
    	String password = "1234";
    	
		Connection con = DriverManager.getConnection(url, user, password);
		con.setAutoCommit(false);
		
		String restType = request.getParameter("restType");
		String restName = request.getParameter("restName");
		String restCode = request.getParameter("restCode");
		String[] menuNames = request.getParameterValues("menuName");
		String[] menuPrices = request.getParameterValues("menuPrice");
		String restLoca = request.getParameter("restLoca");
		float restDis = Float.parseFloat(request.getParameter("restDis"));
		
		PreparedStatement pstmt = null;
		
        List<String> menuList = new ArrayList<>();
        try {
        	for (int i = 0; i < menuNames.length; i++) {
                if (!menuNames[i].isEmpty() && !menuPrices[i].isEmpty()) {
                	
                    String menu = menuNames[i] + "," + menuPrices[i];
                    menuList.add(menu);
                }
            }
            for (String menu : menuList) {
            	String[] menuData = menu.split(",");
                String menuName = menuData[0];
                int menuPrice = Integer.parseInt(menuData[1]);

                String sql = "INSERT INTO restTbl_v1(restNum, restType, restCode, restName, menuName, menuPrice, restLoca, restDis) VALUES(null,?,?,?,?,?,?,?)";
                pstmt = con.prepareStatement(sql);
                
                pstmt.setString(1, restType);
                pstmt.setString(2, restCode);
                pstmt.setString(3, restName);
                pstmt.setString(4, menuName);
                pstmt.setInt(5, menuPrice);
                pstmt.setString(6, restLoca);
                pstmt.setFloat(7, restDis);
                
                pstmt.executeUpdate();
            }
            con.commit();
    		pstmt.close();
    		con.close();
    	} catch(Exception e){
    		e.printStackTrace();
    	}
	%>
	<script>
		alert("가게 정보가 추가 되었어요!");
		location.href="adminViewRestList.jsp";
	</script>
	</body>
</html>