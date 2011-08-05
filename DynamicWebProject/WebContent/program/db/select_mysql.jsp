<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.*" %>
<%
String URL = "jdbc:mysql://mysql4.hosting.paran.com/leejr0903_db";
String USER = "leejr0903";
String PASS= "password";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
 
try
{
  Class.forName("com.mysql.jdbc.Driver");
  conn = DriverManager.getConnection(URL, USER, PASS);
  stmt = conn.createStatement();
  rs = stmt.executeQuery("SELECT * FROM account");
  while( rs.next() )
  {
	int id = rs.getInt("acc_id");
	String fname = rs.getString("acc_first_name");
	String lname = rs.getString("acc_last_name");
	String email = rs.getString("acc_email");
	
    out.print( " 일련번호 : " + id + "<br>" );
    out.print( " f이름 : " + fname + "<br>" );
    out.print( " l이름 : " + lname + "<br>" );
    out.print( " 이메일: " + email + "<br>" );
    
  
  }
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