<%@page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import="java.sql.*" %>

<%
Connection connect = null;
PreparedStatement statement = null;
ResultSet resultSet = null;
try {    
	Class.forName("org.gjt.mm.mysql.Driver");
	
} catch (ClassNotFoundException ce) {
	System.out.println(ce);
}
try {
	connect = DriverManager.getConnection("jdbc:mysql://localhost/mysql", "root", "password");

%>ok<%

} catch (SQLException se) {
	            //System.out.println(Utility.getStackTrace(se));
%>error<%
	
} finally {
	if ( resultSet != null ) resultSet.close();
	if ( statement != null ) statement.close();
	if (connect != null) connect.close();
}
%>