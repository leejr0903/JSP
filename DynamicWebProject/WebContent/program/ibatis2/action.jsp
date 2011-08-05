<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
    
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

<% // hashmap
SimIba sim2 = new SimIba();
HashMap map = new HashMap();

// 받은 값들 저장
Map parameter = request.getParameterMap();
Iterator it = parameter.keySet().iterator();
Object key = null;
String[] value = null;

while(it.hasNext()){
	key = it.next();
	value = (String[])parameter.get(key); 
	for(int i = 0 ; i < value.length; i++){ 
		map.put(key,value[i]);  
   	} 
}
%>

<% map.put("id",new Integer(9999)); %>
<% sim2.insertRecord(map);  %>



</body>
</html>