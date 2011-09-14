<%@page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<html>
<body>

<%
			Connection connect = null;
			PreparedStatement statement = null;
			ResultSet resultSet = null;
			try {
	        
				Class.forName("oracle.jdbc.driver.OracleDriver");
	        } catch (ClassNotFoundException ce) {
	            System.out.println(ce);
	        }
	        try {
				connect = DriverManager.getConnection("jdbc:oracle:thin:@...::", "", "");
	            statement = connect.prepareStatement("select * from ");
	            resultSet = statement.executeQuery();
				
						
				while(resultSet.next()){
%>
<% String register_yn = resultSet.getString("interpretation_yn"); %>
<%= register_yn %>
ok

<%
				}

	        } catch (SQLException se) {
	            //System.out.println(Utility.getStackTrace(se));
%>

error

<%
				
	        } finally {
	        	if ( resultSet != null ) resultSet.close();
	        	if ( statement != null ) statement.close();
	            if (connect != null) connect.close();
	        }		

%>

</body>
</html>