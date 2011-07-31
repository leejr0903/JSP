<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.*" %>
<%
String URL = "jdbc:mysql://localhost/mysql";
String USER = "root";
String PASS= "password";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
 
try
{
  Class.forName("com.mysql.jdbc.Driver");
  conn = DriverManager.getConnection(URL, USER, PASS);
  stmt = conn.createStatement();
  rs = stmt.executeQuery("SELECT * FROM help_category LIMIT 0 , 30");
  while( rs.next() )
  {
	int help_category_id = rs.getInt("help_category_id");
	String name = rs.getString("name");
    out.print( " 일련번호 : " + help_category_id + "이름 : " + name + "<br><br>" );  }
}
catch( SQLException e )
{
  out.print( e.getMessage() );
}
finally
{
  if( rs != null ) try { rs.close(); } catch( SQLException ex ) {}
  if( stmt != null ) try { stmt.close(); } catch( SQLException ex ) {}
  if( conn != null ) try { conn.close(); } catch( SQLException ex ) {}
}
%>