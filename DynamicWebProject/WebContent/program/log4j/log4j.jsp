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
	log.fatal("log4j test 가장 크리티컬한 에러가 났을때");
	log.error("log4j test 일반 에러가 일어 났을 때 사용");
	log.warn("log4j test 에러는 아니지만 주의할 필요가 있을 때 사용");
	log.info("log4j test 일반 정보를 나타낼 때 사용");
	log.debug("log4j test 일반 정보를 상세히 나타낼 때 사용");
	}
}
%>


</body>
</html>