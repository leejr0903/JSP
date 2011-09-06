<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
    
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>
/*
 var today = new Date();  // 서버의 현재시간
 //var today = new Date(2011,06-1,03); // 현재시간 조절하여 테스트
 var beginDate = new Date(2011,06-1,07,09,0,0);  // 시작시간
 var endDate = new Date(2011,06-1,20,18,0,0); // 마감시간
 
 alert("JavaScript Time Period Test.");
 alert("현재시간은 " + today + " 입니다."); 
 alert("시작시간은 " + beginDate + " 입니다.");
 alert("마감시간은 " + endDate + " 입니다.");
 
 alert("현재시간을 밀리세컨단위로 변환하면 " + today.getTime() + " 입니다."); 
 alert("시작시간을 밀리세컨단위로 변환하면 " + beginDate.getTime() + " 입니다.");
 alert("마감시간을 밀리세컨단위로 변환하면 " + endDate.getTime() + " 입니다.");
 
 // getTime으로 시간을 숫자로 변환
 if(today.getTime() < beginDate.getTime() || today.getTime() > endDate.getTime()){
  alert("이벤트 기간이 아닙니다.");
 }else{
  alert("이벤트 기간입니다.");
 }
*/
</script>

<%
//Date today = new Date(111,5,7,9,0,0); // 현재시간 조절하여 테스트
// 년도의 기준이 1900 이므로 111은 1900+111=2011년도를 나타낸다.
Date cancleDate = new Date(111,8,5,0,0,0); // 취소시간
Date limitDate = new Date(111,8,30,0,0,0); // 마감시간
%>

<h4>JSP Time Period Test</h4>
시작시간은 <%= cancleDate %> 입니다.<br>
마감시간은 <%= limitDate %> 입니다.<br>
-------------------------------------<br>
시작시간을 밀리세컨단위로 변환하면 <%= cancleDate.getTime() %> 입니다.<br>
마감시간을 밀리세컨단위로 변환하면 <%= limitDate.getTime() %> 입니다.<br>

<!-- getTime으로 시간을 숫자로 변환  -->
<%if(cancleDate.getTime() < limitDate.getTime()){%>
50%.<br>
<%}else{%>
No refund.<br>
<%}%>

</body>
</html>

