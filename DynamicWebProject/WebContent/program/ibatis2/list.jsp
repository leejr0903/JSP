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


<% // bean 출력
List list = SimIba.selectAllAccounts();

for (int i=0;i<list.size();i++) {
	Account pp = (Account)list.get(i);
%>
<%=pp.getFirstName()%><br />
<%=pp.getLastName()%><br />
<%=pp.getEmailAddress()%><br />
<%} %>



<% // hashmap 출력
List list2 = SimIba.selectAll();
for (int i=0;i<list2.size();i++) {
	HashMap res = (HashMap) list2.get(i);
%>
<%=res.get("acc_first_name") %><br />
<%=res.get("acc_last_name") %><br />
<%=res.get("acc_email") %><br />
<%} %>



</body>
</html>