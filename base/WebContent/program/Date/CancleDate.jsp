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
 var today = new Date();  // ������ ����ð�
 //var today = new Date(2011,06-1,03); // ����ð� �����Ͽ� �׽�Ʈ
 var beginDate = new Date(2011,06-1,07,09,0,0);  // ���۽ð�
 var endDate = new Date(2011,06-1,20,18,0,0); // �����ð�
 
 alert("JavaScript Time Period Test.");
 alert("����ð��� " + today + " �Դϴ�."); 
 alert("���۽ð��� " + beginDate + " �Դϴ�.");
 alert("�����ð��� " + endDate + " �Դϴ�.");
 
 alert("����ð��� �и����������� ��ȯ�ϸ� " + today.getTime() + " �Դϴ�."); 
 alert("���۽ð��� �и����������� ��ȯ�ϸ� " + beginDate.getTime() + " �Դϴ�.");
 alert("�����ð��� �и����������� ��ȯ�ϸ� " + endDate.getTime() + " �Դϴ�.");
 
 // getTime���� �ð��� ���ڷ� ��ȯ
 if(today.getTime() < beginDate.getTime() || today.getTime() > endDate.getTime()){
  alert("�̺�Ʈ �Ⱓ�� �ƴմϴ�.");
 }else{
  alert("�̺�Ʈ �Ⱓ�Դϴ�.");
 }
*/
</script>

<%
//Date today = new Date(111,5,7,9,0,0); // ����ð� �����Ͽ� �׽�Ʈ
// �⵵�� ������ 1900 �̹Ƿ� 111�� 1900+111=2011�⵵�� ��Ÿ����.
Date cancleDate = new Date(111,8,5,0,0,0); // ��ҽð�
Date limitDate = new Date(111,8,30,0,0,0); // �����ð�
%>

<h4>JSP Time Period Test</h4>
���۽ð��� <%= cancleDate %> �Դϴ�.<br>
�����ð��� <%= limitDate %> �Դϴ�.<br>
-------------------------------------<br>
���۽ð��� �и����������� ��ȯ�ϸ� <%= cancleDate.getTime() %> �Դϴ�.<br>
�����ð��� �и����������� ��ȯ�ϸ� <%= limitDate.getTime() %> �Դϴ�.<br>

<!-- getTime���� �ð��� ���ڷ� ��ȯ  -->
<%if(cancleDate.getTime() < limitDate.getTime()){%>
50%.<br>
<%}else{%>
No refund.<br>
<%}%>

</body>
</html>

