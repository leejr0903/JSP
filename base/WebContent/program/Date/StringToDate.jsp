<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	try {
		// "2007-07-22" �̶� ���ڿ��� 2007�� 7�� 22���� ������ ���� Date��ü�� ������
		String textDate = "2007-07-22";

		// �Է��� ��¥�� ���ڿ��� yyyy-MM-dd �����̹Ƿ� �ش� �������� �����͸� �����Ѵ�.
		java.text.SimpleDateFormat format = new java.text.SimpleDateFormat(
				"yyyy-MM-dd");


		//SimpleDateFormat.parse()�޼ҵ带 ���� Date��ü�� �����Ѵ�.
		//SimpleDateFormat.parse()�޼ҵ�� �Է��� ���ڿ� ������ ��¥��
		//���˰� �ٸ���� java.text.ParseException�� �߻��Ѵ�.
		
		// �Ϻ� ������ �ȵǴ� �κ��� �߻��ϹǷ� �ٸ� ����� ����ϱ⸦ �ٶ� 
		java.util.Date date = format.parse(textDate);

		//������ ���� date��ü�� ���� 7��22������ Ȯ�� �غ���.
		java.text.SimpleDateFormat format1 = new java.text.SimpleDateFormat(
				"yyyy��MM��dd�� HH��mm��ss��");
		String dateString = format1.format(date);
		//Date��ü�� ���ڸ� Ȯ���Ѵ�..  ��� : 2007��07��22�� 00��00��00��
		System.out.println(dateString);
		out.println(dateString);
	} catch (java.text.ParseException ex) {
		ex.printStackTrace();
	}
%>



</body>
</html>