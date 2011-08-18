<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>request 내장 객체 - Client/Server 정보 가져오기</title>
</head>
<body>
클라이언트 IP = <%=request.getRemoteAddr() %><br>
요청 정보 길이 = <%=request.getContentLength() %><br>
요청 정보 인코딩 = <%=request.getCharacterEncoding() %><br>
요청 정보 컨텐트 타입 = <%=request.getContentType() %><br>
요청 정보 프로토콜 = <%=request.getProtocol() %><br>
요청 정보 전송 방식 = <%=request.getMethod() %><br>
요청 URI = <%=request.getRequestURI() %><br>
컨텍스트 경로 = <%=request.getContextPath() %><br>
서버 이름 = <%=request.getServerName() %><br>
서버 포트 = <%=request.getServerPort() %>
</body>
</html>