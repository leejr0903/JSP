<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>out 내장 객체의 메서드</title>
</head>
<body>
<h1>out 내장 객체의 메서드</h1>
<hr>
<% out.print("print"); %><br>
<% out.println("println"); %><br>
<% out.newLine(); %>
1. isAutoFlush() : <%=out.isAutoFlush() %><br>
2. getBufferSize() : <%=out.getBufferSize() %><br>
3. getRemaining() : <%=out.getRemaining() %><br>
4. flush() : <% out.flush(); %><br>
5. getRemaining() : <%=out.getRemaining() %><br>
6. clear() : <% out.clear(); %><br>
7. getRemaining() : <%=out.getRemaining() %><br>
8. close() : <% out.close(); %><br>
9. getRemaining() : <%=out.getRemaining() %>
</body>
</html>