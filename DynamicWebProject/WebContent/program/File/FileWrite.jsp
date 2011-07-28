<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.io.*" %>
/*
동작을 안함
*/

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
String txt1 = request.getParameter("id");

if(true)return;

File file = new File(request.getSession().getServletContext().getRealPath("/program/unccd/lodging/data/"), "temp" + ".txt");
BufferedWriter writer = null;
try{
	writer = new BufferedWriter(new OutputStreamWriter (new FileOutputStream(file),"utf-8"));
	StringBuffer sbBuffer = new StringBuffer();
	sbBuffer.append(txt1);
	sbBuffer.append(txt1);
	writer.write(sbBuffer.toString());
} catch(UnsupportedEncodingException ue){
 	out.println("Not supported : ");
} catch(IOException e){
	out.println(e.getMessage());
} finally {
	if ( writer != null )
		writer.close();
}

%>


</body>
</html>