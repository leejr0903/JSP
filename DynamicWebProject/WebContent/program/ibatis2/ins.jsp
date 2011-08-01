<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="kr.co.iacts.ibatis.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


<%--
SimIba sim = new SimIba();

Account account = new Account();
account.setId(1);
account.setEmailAddress("e");
account.setFirstName("first");
account.setLastName("last");
sim.insertAccount(account);
--%>


<%
SimIba sim = new SimIba();
HashMap map = new HashMap();
map.put("id","id");
map.put("firstName","firstName");
map.put("lastName","lastName");
map.put("emailAddress","emailAddress");
sim.insertAccount(map);

%>





</body>
</html>