<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
    
<%@ page import="org.apache.log4j.Category" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<% new LogTest().go(); %>
<%!
public class LogTest {
	Category log = Category.getInstance(LogTest.class.getName()); 
	public LogTest(){}
 
	public void go(){
	log.fatal("log4j test ���� ũ��Ƽ���� ������ ������");
	log.error("log4j test �Ϲ� ������ �Ͼ� ���� �� ���");
	log.warn("log4j test ������ �ƴ����� ������ �ʿ䰡 ���� �� ���");
	log.info("log4j test �Ϲ� ������ ��Ÿ�� �� ���");
	log.debug("log4j test �Ϲ� ������ ���� ��Ÿ�� �� ���");
	}
}
%>


</body>
</html>