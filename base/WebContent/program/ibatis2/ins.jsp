<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
    
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="kr.co.iacts.ibatis.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>Insert title here</title>
</head>
<body>


<% // bean
SimIba sim = new SimIba();

Account account = new Account();
account.setId(1);
account.setEmailAddress("e");
account.setFirstName("first");
account.setLastName("last");
sim.insertAccount(account);
%>


<% // hashmap
SimIba sim2 = new SimIba();
HashMap map = new HashMap();
map.put("id", new Integer(1));
map.put("firstName","");
map.put("lastName","");
map.put("emailAddress","");
sim2.insertRecord(map);
%>





</body>
</html>