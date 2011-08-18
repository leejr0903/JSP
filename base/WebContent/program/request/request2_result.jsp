<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>request2_result.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8"); 
%>
<b>request.getparameter() 메서드 사용</b><br>
url 파라미터 = <%=request.getParameter("url") %><br>
os 파라미터 = <%=request.getParameter("os") %><br>
<p><b>request.getparameterValues() 메서드 사용</b><br>
wp 파라미터 = 
<%
	String[] values = request.getParameterValues("wp");
	if (values != null) {
		for (int i = 0; i < values.length; i++) {
%>
<%=values[i] %>
<%
		}
	}
%>
<p>
<b>request.getParameterNames() 메서드 사용</b><br>
파라미터명 = 
<%
	Enumeration<?> enu = request.getParameterNames();
	while (enu.hasMoreElements()) {
		String name = enu.nextElement().toString();
%>
<%=name %>
<%
	}
%>
<p>
<b>request.getParameterMap() 메서드 사용</b><br>
<%
	Map<?, ?> pMap = request.getParameterMap();
	String[] wpParam = (String[])pMap.get("wp");
	if (wpParam.length >= 2) {
%>
wp 파라미터의 두 번째 값(wpParam[1]) = <%=wpParam[1] %>
<%
	}
%>
</body>
</html>