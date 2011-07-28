<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
    
<%@ page import="java.io.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
//File file = new File(request.getSession().getServletContext().getRealPath("/program/unccd/lodging/data/"), "temp" + ".txt");
File file = new File("D:/JSP/Git/JSP/DynamicWebProject/WebContent/program/File", "temp" + ".txt");

BufferedWriter writer = null;
try{
	writer = new BufferedWriter(new OutputStreamWriter (new FileOutputStream(file),"utf-8"));
	StringBuffer sbBuffer = new StringBuffer();
	sbBuffer.append(request.getParameter("txt1"));
	writer.write(sbBuffer.toString());
} catch(UnsupportedEncodingException ue){
 	out.println("Not supported : ");
} catch(IOException e){
	out.println(e.getMessage());
} finally {
	if ( writer != null )
		writer.close();
}
//response.sendRedirect("FileRead.jsp");
%>
<script>
alert("받은 값 : " + <%=request.getParameter("txt1")%> + "  ==> 입력 성공!!");
location.href = "FileRead.jsp";
</script>

</body>
</html>