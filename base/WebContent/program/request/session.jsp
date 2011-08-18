<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>session 예제</title>
</head>
<body>
<h1>session 예제</h1>
<hr>
<%
	if (session.isNew()) {
		out.println("세션을 생성합니다.");
		session.setAttribute("name", "홍길동");
	}
%>
<li><%=session.getAttribute("name") %>님 안녕하세요.
<li>세션 ID : <%=session.getId() %>
<li>세션 유지 시간 : <%=session.getMaxInactiveInterval() %>
</body>
</html>